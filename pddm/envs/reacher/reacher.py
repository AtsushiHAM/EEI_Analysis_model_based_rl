import numpy as np
from gym import utils
from gym.envs.mujoco import mujoco_env
import tensorflow as tf
import os
import numpy as np

#GYM_ASSET_PATH2=os.path.join(os.getcwd(),'assets')
#GYM_ASSET_PATH=os.path.abspath(os.path.join(os.path.dirname( __file__ ), '..', 'assets'))
GYM_ASSET_PATH = os.path.join(os.path.dirname(__file__), 'assets')
PI=3.14159265359

class ReacherEnv(mujoco_env.MujocoEnv, utils.EzPickle):
    def __init__(self, file_path=os.path.join(GYM_ASSET_PATH, "reacher.xml"), max_step=1000):
        self.time = 0
        self.num_step = 0
        self.max_step = max_step  # maximum number of time steps for one episode
        self.switch_timing=0

        mujoco_env.MujocoEnv.__init__(self, os.path.join(file_path), 2)
        utils.EzPickle.__init__(self)
        self.skip = self.frame_skip  # #maximum number of time steps for one episode

    def get_reward(self, observations, actions):

        """get rewards of a given (observations, actions) pair

        Args:
            observations: (batchsize, obs_dim) or (obs_dim,)
            actions: (batchsize, ac_dim) or (ac_dim,)

        Return:
            r_total: (batchsize,1) or (1,), reward for that pair
            done: (batchsize,1) or (1,), True if reaches terminal state
        """

        # initialize and reshape as needed, for batch mode
        self.reward_dict = {}
        if len(observations.shape) == 1:
            observations = np.expand_dims(observations, axis=0)
            actions = np.expand_dims(actions, axis=0)
            batch_mode = False
        else:
            batch_mode = True

        # get vars
        difference_posx= observations[:, 8]
        difference_posy = observations[:, 9]

        # calc rew
        # self.reward_dict['actions'] = -0.1 * np.sum(np.square(actions), axis=1)
        # self.reward_dict['stable'] = np.cos(pendulum_angle)
        #self.reward_dict['goal_difference'] = 10 - 50 * np.linalg.norm(tip_pos-self.obs_dict['goal_pos'])
        self.reward_dict['actions'] = np.sum(np.square(actions), axis=1)
        self.reward_dict['goal_difference'] = np.sqrt((difference_posx) ** 2 + (difference_posy) ** 2)
        self.reward_dict['r_allive'] = np.array(10)  # np.array(10 - 50 * (np.abs(difference_posx) + np.abs(difference_posy)))
        self.reward_dict['r_total'] =self.reward_dict['r_allive']- 50 *(self.reward_dict['goal_difference'] +0.01*self.reward_dict['actions'])

        # check if done
        dones = np.zeros((observations.shape[0],))
        dones[(np.abs(difference_posx)+np.abs(difference_posy)) > 36000000] = 1

        # return
        if not batch_mode:
            return self.reward_dict['r_total'][0], dones[0]
        return self.reward_dict['r_total'], dones

    def get_score(self, obs):
        goal_difference=abs(obs[8]) + abs(obs[9])
        return goal_difference

    def step(self, action):
        self.num_step += 1

        self.do_simulation(action, self.frame_skip)
        if self.num_step <=  100 or self.num_step > 200 and self.num_step <= 300 or self.num_step > 400 and self.num_step <= 500:
            self.switch_timing=0
        elif self.num_step >  100 and self.num_step <=  200 or self.num_step <= 400 and self.num_step > 300 :
            self.switch_timing=1
        else :
            self.switch_timing = 0
        ob = self._get_obs()
        rew, done = self.get_reward(ob, action)
        score = self.get_score(ob)

        # return
        env_info = {'time': self.time,
                    'obs_dict': self.obs_dict,
                    'rewards': self.reward_dict,
                    'score': score}
        return ob, rew, done, env_info

    def viewer_setup(self):
        self.viewer.cam.trackbodyid = 0

    def reset_model(self):
        self.num_step = 0
        self.reset_pose =  self.np_random.uniform(low=-0.1, high=0.1, size=self.model.nq) + self.init_qpos
        while True:
            self.goal = self.np_random.uniform(low=-.2, high=.2, size=2)#np.array([1,0])#self.np_random.uniform(low=-.2, high=.2, size=2)
            if np.linalg.norm(self.goal) < 2:
                break
        self.reset_pose[-2:] = self.init_qpos[-2:]#self.goal
        self.reset_vel = self.init_qvel + self.np_random.uniform(low=-.005, high=.005, size=self.model.nv)
        self.reset_vel[-2:] = 0
        #self.set_state(qpos, qvel)
        return self.do_reset(self.reset_pose.copy(), self.reset_vel.copy())

    def _get_obs(self):
        theta = self.sim.data.qpos.flat[:2]
        self.obs_dict = {}
        self.obs_dict['cos'] = np.cos(theta).copy()
        self.obs_dict['sin'] = np.sin(theta).copy()
        self.obs_dict['joints_pos'] = self.sim.data.qpos.flat[:2].copy()
        self.obs_dict['joints_vel'] = self.sim.data.qvel.flat[:2].copy()
        if self.switch_timing == 0:
            #print("hey0")
            self.obs_dict['diferrence_pos'] = self.get_body_com("fingertip")[:2] - self.get_body_com("target")[:2]
        elif self.switch_timing == 1:
            #print("hey1")
            self.obs_dict['diferrence_pos'] = self.get_body_com("fingertip")[:2] - self.get_body_com("target1")[:2]
        # self.sim.data.qpos.flat[2:].copy()#self.get_body_com("fingertip") - self.get_body_com("target").copy()
        #self.obs_dict['goal_vel'] = self.sim.data.qvel.flat[2:].copy()
        #theta = self.sim.data.qpos.flat[:2]
        return np.concatenate([
            #np.cos(theta),
            #np.sin(theta),
            #self.model.data.qpos.flat[2:],
            #self.sim.data.qvel.flat[:2],
            #self.get_body_com("target"),
            #self.get_body_com("fingertip") - self.get_body_com("target")
            self.obs_dict['cos'] , ##01
            self.obs_dict['sin'] ,##23
            self.obs_dict['joints_pos'],##45
            self.obs_dict['joints_vel'],##67
            self.obs_dict['diferrence_pos'] , ##89
        ])

    def do_reset(self, reset_pose, reset_vel, reset_goal=None):

        #reset
        self.set_state(reset_pose, reset_vel)

        #return
        return self._get_obs()

class ReacherEnv1_2(mujoco_env.MujocoEnv, utils.EzPickle):
    def __init__(self, file_path=os.path.join(GYM_ASSET_PATH, "reacher.xml"), max_step=1000):
        self.time = 0
        self.num_step = 0
        self.max_step = max_step  # maximum number of time steps for one episode
        self.switch_timing=0

        mujoco_env.MujocoEnv.__init__(self, os.path.join(file_path), 2)
        utils.EzPickle.__init__(self)
        self.skip = self.frame_skip  # #maximum number of time steps for one episode

    def get_reward(self, observations, actions):

        """get rewards of a given (observations, actions) pair

        Args:
            observations: (batchsize, obs_dim) or (obs_dim,)
            actions: (batchsize, ac_dim) or (ac_dim,)

        Return:
            r_total: (batchsize,1) or (1,), reward for that pair
            done: (batchsize,1) or (1,), True if reaches terminal state
        """

        # initialize and reshape as needed, for batch mode
        self.reward_dict = {}
        if len(observations.shape) == 1:
            observations = np.expand_dims(observations, axis=0)
            actions = np.expand_dims(actions, axis=0)
            batch_mode = False
        else:
            batch_mode = True

        # get vars
        difference_posx= observations[:, 8]
        difference_posy = observations[:, 9]

        # calc rew
        # self.reward_dict['actions'] = -0.1 * np.sum(np.square(actions), axis=1)
        # self.reward_dict['stable'] = np.cos(pendulum_angle)
        #self.reward_dict['goal_difference'] = 10 - 50 * np.linalg.norm(tip_pos-self.obs_dict['goal_pos'])
        self.reward_dict['actions'] = np.sum(np.square(actions), axis=1)
        self.reward_dict['goal_difference'] = np.sqrt((difference_posx) ** 2 + (difference_posy) ** 2)
        self.reward_dict['r_allive'] = np.array(10)  # np.array(10 - 50 * (np.abs(difference_posx) + np.abs(difference_posy)))
        self.reward_dict['r_total'] =self.reward_dict['r_allive']- 50 *(self.reward_dict['goal_difference'] +0.01*self.reward_dict['actions'])

        # check if done
        dones = np.zeros((observations.shape[0],))
        dones[(np.abs(difference_posx)+np.abs(difference_posy)) > 36000000] = 1

        # return
        if not batch_mode:
            return self.reward_dict['r_total'][0], dones[0]
        return self.reward_dict['r_total'], dones

    def get_score(self, obs):
        goal_difference=abs(obs[8]) + abs(obs[9])
        return goal_difference

    def step(self, action):
        self.num_step += 1

        self.do_simulation(action, self.frame_skip)
        if self.num_step <=  100 or self.num_step > 200 and self.num_step <= 300 or self.num_step > 400 and self.num_step <= 500:
            self.switch_timing=0
        elif self.num_step >  100 and self.num_step <=  200 or self.num_step <= 400 and self.num_step > 300 :
            self.switch_timing=1
        else :
            self.switch_timing = 0
        ob = self._get_obs()
        rew, done = self.get_reward(ob, action)
        score = self.get_score(ob)

        # return
        env_info = {'time': self.time,
                    'obs_dict': self.obs_dict,
                    'rewards': self.reward_dict,
                    'score': score}
        return ob, rew, done, env_info

    def viewer_setup(self):
        self.viewer.cam.trackbodyid = 0

    def reset_model(self):
        self.num_step = 0
        self.reset_pose = self.np_random.uniform(low=-0.1, high=0.1, size=self.model.nq) + self.init_qpos
        while True:
            self.goal = self.np_random.uniform(low=-.2, high=.2, size=2)#np.array([1,0])#self.np_random.uniform(low=-.2, high=.2, size=2)
            if np.linalg.norm(self.goal) < 2:
                break
        self.reset_pose[-2:] = self.init_qpos[-2:]#self.goal
        self.reset_vel = self.init_qvel + self.np_random.uniform(low=-.005, high=.005, size=self.model.nv)
        self.reset_vel[-2:] = 0
        #self.set_state(qpos, qvel)
        return self.do_reset(self.reset_pose.copy(), self.reset_vel.copy())

    def _get_obs(self):
        theta = self.sim.data.qpos.flat[:2]
        self.obs_dict = {}
        self.obs_dict['cos'] = np.cos(theta).copy()
        self.obs_dict['sin'] = np.sin(theta).copy()
        self.obs_dict['joints_pos'] = self.sim.data.qpos.flat[:2].copy()
        self.obs_dict['joints_vel'] = self.sim.data.qvel.flat[:2].copy()
        if self.switch_timing == 0:
            #print("hey0")
            self.obs_dict['diferrence_pos'] = self.get_body_com("fingertip")[:2] - self.get_body_com("target")[:2]
        elif self.switch_timing == 1:
            #print("hey1")
            self.obs_dict['diferrence_pos'] = self.get_body_com("fingertip")[:2] - self.get_body_com("target1")[:2]
        self.obs_dict['joints_force'] = np.asarray([self.data.sensordata[2]]).flat.copy()
        # self.sim.data.qpos.flat[2:].copy()#self.get_body_com("fingertip") - self.get_body_com("target").copy()
        #self.obs_dict['goal_vel'] = self.sim.data.qvel.flat[2:].copy()
        #theta = self.sim.data.qpos.flat[:2]
        return np.concatenate([
            #np.cos(theta),
            #np.sin(theta),
            #self.model.data.qpos.flat[2:],
            #self.sim.data.qvel.flat[:2],
            #self.get_body_com("target"),
            #self.get_body_com("fingertip") - self.get_body_com("target")
            self.obs_dict['cos'] , ##01
            self.obs_dict['sin'] ,##23
            self.obs_dict['joints_pos'],##45
            self.obs_dict['joints_vel'],##67
            self.obs_dict['diferrence_pos'] , ##89
            self.obs_dict['joints_force'],


        ])

    def do_reset(self, reset_pose, reset_vel, reset_goal=None):

        #reset
        self.set_state(reset_pose, reset_vel)

        #return
        return self._get_obs()

class ReacherEnv1_5(mujoco_env.MujocoEnv, utils.EzPickle):
    def __init__(self, file_path=os.path.join(GYM_ASSET_PATH, "reacher.xml"), max_step=1000):
        self.time = 0
        self.num_step = 0
        self.max_step = max_step  # maximum number of time steps for one episode
        self.switch_timing=0

        mujoco_env.MujocoEnv.__init__(self, os.path.join(file_path), 2)
        utils.EzPickle.__init__(self)
        self.skip = self.frame_skip  # #maximum number of time steps for one episode

    def get_reward(self, observations, actions):

        """get rewards of a given (observations, actions) pair

        Args:
            observations: (batchsize, obs_dim) or (obs_dim,)
            actions: (batchsize, ac_dim) or (ac_dim,)

        Return:
            r_total: (batchsize,1) or (1,), reward for that pair
            done: (batchsize,1) or (1,), True if reaches terminal state
        """

        # initialize and reshape as needed, for batch mode
        self.reward_dict = {}
        if len(observations.shape) == 1:
            observations = np.expand_dims(observations, axis=0)
            actions = np.expand_dims(actions, axis=0)
            batch_mode = False
        else:
            batch_mode = True

        # get vars
        difference_posx= observations[:, 8]
        difference_posy = observations[:, 9]

        # calc rew
        # self.reward_dict['actions'] = -0.1 * np.sum(np.square(actions), axis=1)
        # self.reward_dict['stable'] = np.cos(pendulum_angle)
        #self.reward_dict['goal_difference'] = 10 - 50 * np.linalg.norm(tip_pos-self.obs_dict['goal_pos'])
        self.reward_dict['actions'] = np.sum(np.square(actions), axis=1)
        self.reward_dict['goal_difference'] = np.sqrt((difference_posx) ** 2 + (difference_posy) ** 2)
        self.reward_dict['r_allive'] = np.array(10)  # np.array(10 - 50 * (np.abs(difference_posx) + np.abs(difference_posy)))
        self.reward_dict['r_total'] =self.reward_dict['r_allive']- 50 *(self.reward_dict['goal_difference'] +0.01*self.reward_dict['actions'])

        # check if done
        dones = np.zeros((observations.shape[0],))
        dones[(np.abs(difference_posx)+np.abs(difference_posy)) > 36000000] = 1

        # return
        if not batch_mode:
            return self.reward_dict['r_total'][0], dones[0]
        return self.reward_dict['r_total'], dones

    def get_score(self, obs):
        goal_difference=abs(obs[8]) + abs(obs[9])
        return goal_difference

    def step(self, action):
        self.num_step += 1

        self.do_simulation(action, self.frame_skip)
        if self.num_step <=  100 or self.num_step > 200 and self.num_step <= 300 or self.num_step > 400 and self.num_step <= 500:
            self.switch_timing=0
        elif self.num_step >  100 and self.num_step <=  200 or self.num_step <= 400 and self.num_step > 300 :
            self.switch_timing=1
        else :
            self.switch_timing = 0
        ob = self._get_obs()
        rew, done = self.get_reward(ob, action)
        score = self.get_score(ob)

        # return
        env_info = {'time': self.time,
                    'obs_dict': self.obs_dict,
                    'rewards': self.reward_dict,
                    'score': score}
        return ob, rew, done, env_info

    def viewer_setup(self):
        self.viewer.cam.trackbodyid = 0

    def reset_model(self):
        self.num_step = 0
        self.reset_pose =  self.np_random.uniform(low=-0.1, high=0.1, size=self.model.nq) + self.init_qpos
        while True:
            self.goal = self.np_random.uniform(low=-.2, high=.2, size=2)#np.array([1,0])#self.np_random.uniform(low=-.2, high=.2, size=2)
            if np.linalg.norm(self.goal) < 2:
                break
        self.reset_pose[-2:] = self.init_qpos[-2:]#self.goal
        self.reset_vel = self.init_qvel + self.np_random.uniform(low=-.005, high=.005, size=self.model.nv)
        self.reset_vel[-2:] = 0
        #self.set_state(qpos, qvel)
        return self.do_reset(self.reset_pose.copy(), self.reset_vel.copy())

    def _get_obs(self):
        theta = self.sim.data.qpos.flat[:2]
        self.obs_dict = {}
        self.obs_dict['cos'] = np.cos(theta).copy()
        self.obs_dict['sin'] = np.sin(theta).copy()
        self.obs_dict['joints_pos'] = self.sim.data.qpos.flat[:2].copy()
        self.obs_dict['joints_vel'] = self.sim.data.qvel.flat[:2].copy()
        if self.switch_timing == 0:
            #print("hey0")
            self.obs_dict['diferrence_pos'] = self.get_body_com("fingertip")[:2] - self.get_body_com("target")[:2]
        elif self.switch_timing == 1:
            #print("hey1")
            self.obs_dict['diferrence_pos'] = self.get_body_com("fingertip")[:2] - self.get_body_com("target1")[:2]
        self.obs_dict['joints_force'] = np.asarray([self.data.sensordata[5]]).flat.copy()
        # self.sim.data.qpos.flat[2:].copy()#self.get_body_com("fingertip") - self.get_body_com("target").copy()
        #self.obs_dict['goal_vel'] = self.sim.data.qvel.flat[2:].copy()
        #theta = self.sim.data.qpos.flat[:2]
        return np.concatenate([
            #np.cos(theta),
            #np.sin(theta),
            #self.model.data.qpos.flat[2:],
            #self.sim.data.qvel.flat[:2],
            #self.get_body_com("target"),
            #self.get_body_com("fingertip") - self.get_body_com("target")
            self.obs_dict['cos'] , ##01
            self.obs_dict['sin'] ,##23
            self.obs_dict['joints_pos'],##45
            self.obs_dict['joints_vel'],##67
            self.obs_dict['diferrence_pos'] , ##89
            self.obs_dict['joints_force'],


        ])

    def do_reset(self, reset_pose, reset_vel, reset_goal=None):

        #reset
        self.set_state(reset_pose, reset_vel)

        #return
        return self._get_obs()


class ReacherEnv2(mujoco_env.MujocoEnv, utils.EzPickle):
    def __init__(self, file_path=os.path.join(GYM_ASSET_PATH, "reacher.xml"), max_step=1000):
        self.time = 0
        self.num_step = 0
        self.max_step = max_step  # maximum number of time steps for one episode
        self.switch_timing=0

        mujoco_env.MujocoEnv.__init__(self, os.path.join(file_path), 2)
        utils.EzPickle.__init__(self)
        self.skip = self.frame_skip  # #maximum number of time steps for one episode

    def get_reward(self, observations, actions):

        """get rewards of a given (observations, actions) pair

        Args:
            observations: (batchsize, obs_dim) or (obs_dim,)
            actions: (batchsize, ac_dim) or (ac_dim,)

        Return:
            r_total: (batchsize,1) or (1,), reward for that pair
            done: (batchsize,1) or (1,), True if reaches terminal state
        """

        # initialize and reshape as needed, for batch mode
        self.reward_dict = {}
        if len(observations.shape) == 1:
            observations = np.expand_dims(observations, axis=0)
            actions = np.expand_dims(actions, axis=0)
            batch_mode = False
        else:
            batch_mode = True

        # get vars
        difference_posx= observations[:, 8]
        difference_posy = observations[:, 9]

        # calc rew
        # self.reward_dict['actions'] = -0.1 * np.sum(np.square(actions), axis=1)
        # self.reward_dict['stable'] = np.cos(pendulum_angle)
        #self.reward_dict['goal_difference'] = 10 - 50 * np.linalg.norm(tip_pos-self.obs_dict['goal_pos'])
        self.reward_dict['actions'] = np.sum(np.square(actions), axis=1)
        self.reward_dict['goal_difference'] = np.sqrt((difference_posx) ** 2 + (difference_posy) ** 2)
        self.reward_dict['r_allive'] = np.array(10)  # np.array(10 - 50 * (np.abs(difference_posx) + np.abs(difference_posy)))
        self.reward_dict['r_total'] =self.reward_dict['r_allive']- 50 *(self.reward_dict['goal_difference'] +0.01*self.reward_dict['actions'])

        # check if done
        dones = np.zeros((observations.shape[0],))
        dones[(np.abs(difference_posx)+np.abs(difference_posy)) > 36000000] = 1

        # return
        if not batch_mode:
            return self.reward_dict['r_total'][0], dones[0]
        return self.reward_dict['r_total'], dones

    def get_score(self, obs):
        goal_difference=abs(obs[8]) + abs(obs[9])
        return goal_difference

    def step(self, action):
        self.num_step += 1

        self.do_simulation(action, self.frame_skip)
        if self.num_step <=  100 or self.num_step > 200 and self.num_step <= 300 or self.num_step > 400 and self.num_step <= 500:
            self.switch_timing=0
        elif self.num_step >  100 and self.num_step <=  200 or self.num_step <= 400 and self.num_step > 300 :
            self.switch_timing=1
        else :
            self.switch_timing = 0
        ob = self._get_obs()
        rew, done = self.get_reward(ob, action)
        score = self.get_score(ob)

        # return
        env_info = {'time': self.time,
                    'obs_dict': self.obs_dict,
                    'rewards': self.reward_dict,
                    'score': score}
        return ob, rew, done, env_info

    def viewer_setup(self):
        self.viewer.cam.trackbodyid = 0

    def reset_model(self):
        self.num_step = 0
        self.reset_pose = self.np_random.uniform(low=-0.1, high=0.1, size=self.model.nq) + self.init_qpos
        while True:
            self.goal = self.np_random.uniform(low=-.2, high=.2, size=2)#np.array([1,0])#self.np_random.uniform(low=-.2, high=.2, size=2)
            if np.linalg.norm(self.goal) < 2:
                break
        self.reset_pose[-2:] = self.init_qpos[-2:]#self.goal
        self.reset_vel = self.init_qvel + self.np_random.uniform(low=-.005, high=.005, size=self.model.nv)
        self.reset_vel[-2:] = 0
        #self.set_state(qpos, qvel)
        return self.do_reset(self.reset_pose.copy(), self.reset_vel.copy())

    def _get_obs(self):
        theta = self.sim.data.qpos.flat[:2]
        self.obs_dict = {}
        self.obs_dict['cos'] = np.cos(theta).copy()
        self.obs_dict['sin'] = np.sin(theta).copy()
        self.obs_dict['joints_pos'] = self.sim.data.qpos.flat[:2].copy()
        self.obs_dict['joints_vel'] = self.sim.data.qvel.flat[:2].copy()
        if self.switch_timing == 0:
            #print("hey0")
            self.obs_dict['diferrence_pos'] = self.get_body_com("fingertip")[:2] - self.get_body_com("target")[:2]
        elif self.switch_timing == 1:
            #print("hey1")
            self.obs_dict['diferrence_pos'] = self.get_body_com("fingertip")[:2] - self.get_body_com("target1")[:2]
        self.obs_dict['joints_force'] = np.asarray([self.data.sensordata[2],self.data.sensordata[5]]).flat.copy()
        # self.sim.data.qpos.flat[2:].copy()#self.get_body_com("fingertip") - self.get_body_com("target").copy()
        #self.obs_dict['goal_vel'] = self.sim.data.qvel.flat[2:].copy()
        #theta = self.sim.data.qpos.flat[:2]
        return np.concatenate([
            #np.cos(theta),
            #np.sin(theta),
            #self.model.data.qpos.flat[2:],
            #self.sim.data.qvel.flat[:2],
            #self.get_body_com("target"),
            #self.get_body_com("fingertip") - self.get_body_com("target")
            self.obs_dict['cos'] , ##01
            self.obs_dict['sin'] ,##23
            self.obs_dict['joints_pos'],##45
            self.obs_dict['joints_vel'],##67
            self.obs_dict['diferrence_pos'] , ##89
            self.obs_dict['joints_force'],


        ])

    def do_reset(self, reset_pose, reset_vel, reset_goal=None):

        #reset
        self.set_state(reset_pose, reset_vel)

        #return
        return self._get_obs()


class ReacherEnv6(mujoco_env.MujocoEnv, utils.EzPickle):
    def __init__(self, file_path=os.path.join(GYM_ASSET_PATH, "reacher.xml"), max_step=1000):
        self.time = 0
        self.num_step = 0
        self.max_step = max_step  # maximum number of time steps for one episode
        self.switch_timing=0

        mujoco_env.MujocoEnv.__init__(self, os.path.join(file_path), 2)
        utils.EzPickle.__init__(self)
        self.skip = self.frame_skip  # #maximum number of time steps for one episode

    def get_reward(self, observations, actions):

        """get rewards of a given (observations, actions) pair

        Args:
            observations: (batchsize, obs_dim) or (obs_dim,)
            actions: (batchsize, ac_dim) or (ac_dim,)

        Return:
            r_total: (batchsize,1) or (1,), reward for that pair
            done: (batchsize,1) or (1,), True if reaches terminal state
        """

        # initialize and reshape as needed, for batch mode
        self.reward_dict = {}
        if len(observations.shape) == 1:
            observations = np.expand_dims(observations, axis=0)
            actions = np.expand_dims(actions, axis=0)
            batch_mode = False
        else:
            batch_mode = True

        # get vars
        difference_posx= observations[:, 8]
        difference_posy = observations[:, 9]

        # calc rew
        # self.reward_dict['actions'] = -0.1 * np.sum(np.square(actions), axis=1)
        # self.reward_dict['stable'] = np.cos(pendulum_angle)
        #self.reward_dict['goal_difference'] = 10 - 50 * np.linalg.norm(tip_pos-self.obs_dict['goal_pos'])
        self.reward_dict['actions'] = np.sum(np.square(actions), axis=1)
        self.reward_dict['goal_difference'] = np.sqrt((difference_posx) ** 2 + (difference_posy) ** 2)
        self.reward_dict['r_allive'] = np.array(10)  # np.array(10 - 50 * (np.abs(difference_posx) + np.abs(difference_posy)))
        self.reward_dict['r_total'] =self.reward_dict['r_allive']- 50 *(self.reward_dict['goal_difference'] +0.01*self.reward_dict['actions'])

        # check if done
        dones = np.zeros((observations.shape[0],))
        dones[(np.abs(difference_posx)+np.abs(difference_posy)) > 36000000] = 1

        # return
        if not batch_mode:
            return self.reward_dict['r_total'][0], dones[0]
        return self.reward_dict['r_total'], dones

    def get_score(self, obs):
        goal_difference=abs(obs[8]) + abs(obs[9])
        return goal_difference

    def step(self, action):
        self.num_step += 1

        self.do_simulation(action, self.frame_skip)
        if self.num_step <=  100 or self.num_step > 200 and self.num_step <= 300 or self.num_step > 400 and self.num_step <= 500:
            self.switch_timing=0
        elif self.num_step >  100 and self.num_step <=  200 or self.num_step <= 400 and self.num_step > 300 :
            self.switch_timing=1
        else :
            self.switch_timing = 0
        ob = self._get_obs()
        rew, done = self.get_reward(ob, action)
        score = self.get_score(ob)

        # return
        env_info = {'time': self.time,
                    'obs_dict': self.obs_dict,
                    'rewards': self.reward_dict,
                    'score': score}
        return ob, rew, done, env_info

    def viewer_setup(self):
        self.viewer.cam.trackbodyid = 0

    def reset_model(self):
        self.num_step = 0
        self.reset_pose = self.np_random.uniform(low=-0.1, high=0.1, size=self.model.nq) + self.init_qpos
        while True:
            self.goal = self.np_random.uniform(low=-.2, high=.2, size=2)#np.array([1,0])#self.np_random.uniform(low=-.2, high=.2, size=2)
            if np.linalg.norm(self.goal) < 2:
                break
        self.reset_pose[-2:] = self.init_qpos[-2:]#self.goal
        self.reset_vel = self.init_qvel + self.np_random.uniform(low=-.005, high=.005, size=self.model.nv)
        self.reset_vel[-2:] = 0
        #self.set_state(qpos, qvel)
        return self.do_reset(self.reset_pose.copy(), self.reset_vel.copy())

    def _get_obs(self):
        theta = self.sim.data.qpos.flat[:2]
        self.obs_dict = {}
        self.obs_dict['cos'] = np.cos(theta).copy()
        self.obs_dict['sin'] = np.sin(theta).copy()
        self.obs_dict['joints_pos'] = self.sim.data.qpos.flat[:2].copy()
        self.obs_dict['joints_vel'] = self.sim.data.qvel.flat[:2].copy()
        if self.switch_timing == 0:
            #print("hey0")
            self.obs_dict['diferrence_pos'] = self.get_body_com("fingertip")[:2] - self.get_body_com("target")[:2]
        elif self.switch_timing == 1:
            #print("hey1")
            self.obs_dict['diferrence_pos'] = self.get_body_com("fingertip")[:2] - self.get_body_com("target1")[:2]
        self.obs_dict['joints_force'] = np.asarray([self.data.sensordata[0],self.data.sensordata[1],self.data.sensordata[2],
                                                    self.data.sensordata[3],self.data.sensordata[4],self.data.sensordata[5]]).flat.copy()
        # self.sim.data.qpos.flat[2:].copy()#self.get_body_com("fingertip") - self.get_body_com("target").copy()
        #self.obs_dict['goal_vel'] = self.sim.data.qvel.flat[2:].copy()
        #theta = self.sim.data.qpos.flat[:2]
        return np.concatenate([
            #np.cos(theta),
            #np.sin(theta),
            #self.model.data.qpos.flat[2:],
            #self.sim.data.qvel.flat[:2],
            #self.get_body_com("target"),
            #self.get_body_com("fingertip") - self.get_body_com("target")
            self.obs_dict['cos'] , ##01
            self.obs_dict['sin'] ,##23
            self.obs_dict['joints_pos'],##45
            self.obs_dict['joints_vel'],##67
            self.obs_dict['diferrence_pos'] , ##89
            self.obs_dict['joints_force'],


        ])

    def do_reset(self, reset_pose, reset_vel, reset_goal=None):

        #reset
        self.set_state(reset_pose, reset_vel)

        #return
        return self._get_obs()
