import numpy as np
from gym import utils
from gym.envs.mujoco import mujoco_env

#hamada added
import os

GYM_ASSET_PATH = os.path.join(os.path.dirname(__file__), 'assets')
class CartPoleEnv(mujoco_env.MujocoEnv, utils.EzPickle):
    def __init__(self,file_path=os.path.join(GYM_ASSET_PATH,'inverted_pendulum.xml'),max_step=1000):
        #hamada added
        self.time = 0
        self.num_step = 0
        self.max_step = max_step  # maximum number of time steps for one episod
        # until here
        mujoco_env.MujocoEnv.__init__(self,file_path , 1) #defalt 5
        utils.EzPickle.__init__(self)
        self.skip = self.frame_skip  ####different from before


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
        pendulum_angle = observations[:, 1]
        ##added hamada for mpe of inverted pendulum
        if str(type(actions.shape)) == "<class 'tuple'>":
            actions = actions.reshape(-1, 1)
            # print((type(actions.shape)))
            # print("hello {}".format(actions.shape))

        # calc rew
        self.reward_dict['actions'] = np.sum(np.square(actions), axis=1)
        self.reward_dict['stable'] = np.abs(pendulum_angle)
        self.reward_dict['r_allive'] = np.array(10)
        self.reward_dict[
            'ac_weight'] = 0.00  # 4#0#server0.004# np.array(10 - 50 * (np.abs(difference_posx) + np.abs(difference_posy)))
        self.reward_dict['r_total'] = self.reward_dict['r_allive'] - 50 * (
                    self.reward_dict['stable'] + self.reward_dict['ac_weight'] * self.reward_dict['actions'])
        # print("mod_rew")
        # check if done
        dones = np.zeros((observations.shape[0],))
        #dones[np.abs(pendulum_angle1) > 360] = 1

        # return
        if not batch_mode:
            return self.reward_dict['r_total'][0], dones[0]
        return self.reward_dict['r_total'], dones

    def get_score(self, obs):
        pendulum_angle = np.abs(obs[1]) + np.abs(obs[2])
        return pendulum_angle

    def step(self, action):
        self.num_step += 1
        self.do_simulation(action, self.frame_skip)
        ob = self._get_obs()
        rew, done = self.get_reward(ob, action)
        score = self.get_score(ob)

        # return
        env_info = {'time': self.time,
                    'obs_dict': self.obs_dict,
                    'rewards': self.reward_dict,
                    'score': score}
        return ob, rew, done, env_info


    def _get_obs(self):
        self.obs_dict = {}
        self.obs_dict['joints_pos'] = self.sim.data.qpos.flat.copy()
        self.obs_dict['joints_vel'] = self.sim.data.qvel.flat.copy()
        #np.clip(self.sim.data.qvel, -10, 10),
        #np.clip(self.sim.data.qfrc_constraint, -10, 10)

        return np.concatenate([
            self.obs_dict['joints_pos'],  # 2
            self.obs_dict['joints_vel'],  # 2
        ])

    def do_reset(self, reset_pose, reset_vel, reset_goal=None):

        #reset
        self.set_state(reset_pose, reset_vel)

        #return
        return self._get_obs()

    def reset_model(self):
        self.num_step = 0

        # set reset pose/vel
        self.reset_pose = self.init_qpos + self.np_random.uniform(
            low=-.01, high=.01, size=self.model.nq)
        self.reset_vel = self.init_qvel + self.np_random.uniform(size=self.model.nv, low=-0.01, high=0.01)

        # reset the env to that pose/vel
        return self.do_reset(self.reset_pose.copy(), self.reset_vel.copy())


    def viewer_setup(self):
        v = self.viewer
        v.cam.trackbodyid = 0
        v.cam.distance = self.model.stat.extent

        ##$$added by hamada fpr perturb
    def perturb_joint(self, force=0.01):
            self.data.qfrc_applied[:] = np.asarray([0, force])

    def perturb_pendulum(self, fx=25, fy=0, fz=0, tx=0, ty=0, tz=0):
            # Function to apply an external force to the center of gravity of
            # the pendulum. If a mass is added at the end of the pendulum/pole,
            # the external force is applied to the center of gravity of that mass
            # instead.
            # f : External forces along the three axes.
            # t : External torques along the three axes.
            force = [fx, fy, fz, tx, ty, tz]
            all_dim = np.zeros([6, 6])
            all_dim[-1, :] = force

            self.data.xfrc_applied[:] = all_dim

    def remove_all_perturbation(self):
        #self.data.qfrc_applied[:] = np.zeros([2, 1])
        self.data.qfrc_applied[:] = np.zeros([2])
        self.data.xfrc_applied[:] = np.zeros([3, 6])


class CartPoleEnv1_0(mujoco_env.MujocoEnv, utils.EzPickle):
    def __init__(self,file_path=os.path.join(GYM_ASSET_PATH,'inverted_pendulum.xml'),max_step=1000):
        #hamada added
        self.time = 0
        self.num_step = 0
        self.max_step = max_step  # maximum number of time steps for one episod
        # until here
        mujoco_env.MujocoEnv.__init__(self,file_path , 1) #defalt 5
        utils.EzPickle.__init__(self)
        self.skip = self.frame_skip  ####different from before


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
        pendulum_angle = observations[:, 1]
        ##added hamada for mpe of inverted pendulum
        if str(type(actions.shape)) == "<class 'tuple'>":
            actions = actions.reshape(-1, 1)
            # print((type(actions.shape)))
            # print("hello {}".format(actions.shape))

        # calc rew
        self.reward_dict['actions'] = np.sum(np.square(actions), axis=1)
        self.reward_dict['stable'] = np.abs(pendulum_angle)
        self.reward_dict['r_allive'] = np.array(10)
        self.reward_dict[
            'ac_weight'] = 0.00  # 4#0#server0.004# np.array(10 - 50 * (np.abs(difference_posx) + np.abs(difference_posy)))
        self.reward_dict['r_total'] = self.reward_dict['r_allive'] - 50 * (
                    self.reward_dict['stable'] + self.reward_dict['ac_weight'] * self.reward_dict['actions'])
        # print("mod_rew")
        # check if done
        dones = np.zeros((observations.shape[0],))
        #dones[np.abs(pendulum_angle1) > 360] = 1

        # return
        if not batch_mode:
            return self.reward_dict['r_total'][0], dones[0]
        return self.reward_dict['r_total'], dones

    def get_score(self, obs):
        pendulum_angle = np.abs(obs[1]) + np.abs(obs[2])
        return pendulum_angle

    def step(self, action):
        self.num_step += 1
        self.do_simulation(action, self.frame_skip)
        ob = self._get_obs()
        rew, done = self.get_reward(ob, action)
        score = self.get_score(ob)

        # return
        env_info = {'time': self.time,
                    'obs_dict': self.obs_dict,
                    'rewards': self.reward_dict,
                    'score': score}
        return ob, rew, done, env_info


    def _get_obs(self):
        self.obs_dict = {}
        self.obs_dict['joints_pos'] = self.sim.data.qpos.flat.copy()
        self.obs_dict['joints_vel'] = self.sim.data.qvel.flat.copy()
        self.obs_dict['joints_force'] = np.asarray( [self.data.sensordata[0]]).flat.copy()
        #np.clip(self.sim.data.qvel, -10, 10),
        #np.clip(self.sim.data.qfrc_constraint, -10, 10)

        return np.concatenate([
            self.obs_dict['joints_pos'],  # 2
            self.obs_dict['joints_vel'],  # 2
            self.obs_dict['joints_force']
        ])

    def do_reset(self, reset_pose, reset_vel, reset_goal=None):

        #reset
        self.set_state(reset_pose, reset_vel)

        #return
        return self._get_obs()

    def reset_model(self):
        self.num_step = 0

        # set reset pose/vel
        self.reset_pose = self.init_qpos + self.np_random.uniform(
            low=-.01, high=.01, size=self.model.nq)
        self.reset_vel = self.init_qvel + self.np_random.uniform(size=self.model.nv, low=-0.01, high=0.01)

        # reset the env to that pose/vel
        return self.do_reset(self.reset_pose.copy(), self.reset_vel.copy())


    def viewer_setup(self):
        v = self.viewer
        v.cam.trackbodyid = 0
        v.cam.distance = self.model.stat.extent

        ##$$added by hamada fpr perturb
    def perturb_joint(self, force=0.01):
            self.data.qfrc_applied[:] = np.asarray([0, force])

    def perturb_pendulum(self, fx=25, fy=0, fz=0, tx=0, ty=0, tz=0):
            # Function to apply an external force to the center of gravity of
            # the pendulum. If a mass is added at the end of the pendulum/pole,
            # the external force is applied to the center of gravity of that mass
            # instead.
            # f : External forces along the three axes.
            # t : External torques along the three axes.
            force = [fx, fy, fz, tx, ty, tz]
            all_dim = np.zeros([6, 6])
            all_dim[-1, :] = force

            self.data.xfrc_applied[:] = all_dim

    def remove_all_perturbation(self):
        #self.data.qfrc_applied[:] = np.zeros([2, 1])
        self.data.qfrc_applied[:] = np.zeros([2])
        self.data.xfrc_applied[:] = np.zeros([3, 6])


class CartPoleEnv1_4(mujoco_env.MujocoEnv, utils.EzPickle):
    def __init__(self,file_path=os.path.join(GYM_ASSET_PATH,'inverted_pendulum.xml'),max_step=1000):
        #hamada added
        self.time = 0
        self.num_step = 0
        self.max_step = max_step  # maximum number of time steps for one episod
        # until here
        mujoco_env.MujocoEnv.__init__(self,file_path , 1) #defalt 5
        utils.EzPickle.__init__(self)
        self.skip = self.frame_skip  ####different from before


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
        pendulum_angle = observations[:, 1]
        ##added hamada for mpe of inverted pendulum
        if str(type(actions.shape)) == "<class 'tuple'>":
            actions = actions.reshape(-1, 1)
            # print((type(actions.shape)))
            # print("hello {}".format(actions.shape))

        # calc rew
        self.reward_dict['actions'] = np.sum(np.square(actions), axis=1)
        self.reward_dict['stable'] = np.abs(pendulum_angle)
        self.reward_dict['r_allive'] = np.array(10)
        self.reward_dict[
            'ac_weight'] = 0.00  # 4#0#server0.004# np.array(10 - 50 * (np.abs(difference_posx) + np.abs(difference_posy)))
        self.reward_dict['r_total'] = self.reward_dict['r_allive'] - 50 * (
                    self.reward_dict['stable'] + self.reward_dict['ac_weight'] * self.reward_dict['actions'])
        # print("mod_rew")
        # check if done
        dones = np.zeros((observations.shape[0],))
        #dones[np.abs(pendulum_angle1) > 360] = 1

        # return
        if not batch_mode:
            return self.reward_dict['r_total'][0], dones[0]
        return self.reward_dict['r_total'], dones

    def get_score(self, obs):
        pendulum_angle = np.abs(obs[1]) + np.abs(obs[2])
        return pendulum_angle

    def step(self, action):
        self.num_step += 1
        self.do_simulation(action, self.frame_skip)
        ob = self._get_obs()
        rew, done = self.get_reward(ob, action)
        score = self.get_score(ob)

        # return
        env_info = {'time': self.time,
                    'obs_dict': self.obs_dict,
                    'rewards': self.reward_dict,
                    'score': score}
        return ob, rew, done, env_info


    def _get_obs(self):
        self.obs_dict = {}
        self.obs_dict['joints_pos'] = self.sim.data.qpos.flat.copy()
        self.obs_dict['joints_vel'] = self.sim.data.qvel.flat.copy()
        self.obs_dict['joints_force'] = np.asarray( [self.data.sensordata[4]]).flat.copy()
        #np.clip(self.sim.data.qvel, -10, 10),
        #np.clip(self.sim.data.qfrc_constraint, -10, 10)

        return np.concatenate([
            self.obs_dict['joints_pos'],  # 2
            self.obs_dict['joints_vel'],  # 2
            self.obs_dict['joints_force']
        ])

    def do_reset(self, reset_pose, reset_vel, reset_goal=None):

        #reset
        self.set_state(reset_pose, reset_vel)

        #return
        return self._get_obs()

    def reset_model(self):
        self.num_step = 0

        # set reset pose/vel
        self.reset_pose = self.init_qpos + self.np_random.uniform(
            low=-.01, high=.01, size=self.model.nq)
        self.reset_vel = self.init_qvel + self.np_random.uniform(size=self.model.nv, low=-0.01, high=0.01)

        # reset the env to that pose/vel
        return self.do_reset(self.reset_pose.copy(), self.reset_vel.copy())


    def viewer_setup(self):
        v = self.viewer
        v.cam.trackbodyid = 0
        v.cam.distance = self.model.stat.extent

        ##$$added by hamada fpr perturb
    def perturb_joint(self, force=0.01):
            self.data.qfrc_applied[:] = np.asarray([0, force])

    def perturb_pendulum(self, fx=25, fy=0, fz=0, tx=0, ty=0, tz=0):
            # Function to apply an external force to the center of gravity of
            # the pendulum. If a mass is added at the end of the pendulum/pole,
            # the external force is applied to the center of gravity of that mass
            # instead.
            # f : External forces along the three axes.
            # t : External torques along the three axes.
            force = [fx, fy, fz, tx, ty, tz]
            all_dim = np.zeros([6, 6])
            all_dim[-1, :] = force

            self.data.xfrc_applied[:] = all_dim

    def remove_all_perturbation(self):
        #self.data.qfrc_applied[:] = np.zeros([2, 1])
        self.data.qfrc_applied[:] = np.zeros([2])
        self.data.xfrc_applied[:] = np.zeros([3, 6])


class CartPoleEnv2(mujoco_env.MujocoEnv, utils.EzPickle):
    def __init__(self,file_path=os.path.join(GYM_ASSET_PATH,'inverted_pendulum.xml'),max_step=1000):
        #hamada added
        self.time = 0
        self.num_step = 0
        self.max_step = max_step  # maximum number of time steps for one episod
        # until here
        mujoco_env.MujocoEnv.__init__(self,file_path , 1) #defalt 5
        utils.EzPickle.__init__(self)
        self.skip = self.frame_skip  ####different from before


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
        pendulum_angle = observations[:, 1]
        ##added hamada for mpe of inverted pendulum
        if str(type(actions.shape)) == "<class 'tuple'>":
            actions = actions.reshape(-1, 1)
            # print((type(actions.shape)))
            # print("hello {}".format(actions.shape))

        # calc rew
        self.reward_dict['actions'] = np.sum(np.square(actions), axis=1)
        self.reward_dict['stable'] = np.abs(pendulum_angle)
        self.reward_dict['r_allive'] = np.array(10)
        self.reward_dict[
            'ac_weight'] = 0.00  # 4#0#server0.004# np.array(10 - 50 * (np.abs(difference_posx) + np.abs(difference_posy)))
        self.reward_dict['r_total'] = self.reward_dict['r_allive'] - 50 * (
                    self.reward_dict['stable'] + self.reward_dict['ac_weight'] * self.reward_dict['actions'])
        # print("mod_rew")
        # check if done
        dones = np.zeros((observations.shape[0],))
        #dones[np.abs(pendulum_angle1) > 360] = 1

        # return
        if not batch_mode:
            return self.reward_dict['r_total'][0], dones[0]
        return self.reward_dict['r_total'], dones

    def get_score(self, obs):
        pendulum_angle = np.abs(obs[1]) + np.abs(obs[2])
        return pendulum_angle

    def step(self, action):
        self.num_step += 1
        self.do_simulation(action, self.frame_skip)
        ob = self._get_obs()
        rew, done = self.get_reward(ob, action)
        score = self.get_score(ob)

        # return
        env_info = {'time': self.time,
                    'obs_dict': self.obs_dict,
                    'rewards': self.reward_dict,
                    'score': score}
        return ob, rew, done, env_info


    def _get_obs(self):
        self.obs_dict = {}
        self.obs_dict['joints_pos'] = self.sim.data.qpos.flat.copy()
        self.obs_dict['joints_vel'] = self.sim.data.qvel.flat.copy()
        self.obs_dict['joints_force'] = np.asarray( [self.data.sensordata[1],self.data.sensordata[4]]).flat.copy()
        #np.clip(self.sim.data.qvel, -10, 10),
        #np.clip(self.sim.data.qfrc_constraint, -10, 10)

        return np.concatenate([
            self.obs_dict['joints_pos'],  # 2
            self.obs_dict['joints_vel'],  # 2
            self.obs_dict['joints_force']
        ])

    def do_reset(self, reset_pose, reset_vel, reset_goal=None):

        #reset
        self.set_state(reset_pose, reset_vel)

        #return
        return self._get_obs()

    def reset_model(self):
        self.num_step = 0

        # set reset pose/vel
        self.reset_pose = self.init_qpos + self.np_random.uniform(
            low=-.01, high=.01, size=self.model.nq)
        self.reset_vel = self.init_qvel + self.np_random.uniform(size=self.model.nv, low=-0.01, high=0.01)

        # reset the env to that pose/vel
        return self.do_reset(self.reset_pose.copy(), self.reset_vel.copy())


    def viewer_setup(self):
        v = self.viewer
        v.cam.trackbodyid = 0
        v.cam.distance = self.model.stat.extent

        ##$$added by hamada fpr perturb
    def perturb_joint(self, force=0.01):
            self.data.qfrc_applied[:] = np.asarray([0, force])

    def perturb_pendulum(self, fx=25, fy=0, fz=0, tx=0, ty=0, tz=0):
            # Function to apply an external force to the center of gravity of
            # the pendulum. If a mass is added at the end of the pendulum/pole,
            # the external force is applied to the center of gravity of that mass
            # instead.
            # f : External forces along the three axes.
            # t : External torques along the three axes.
            force = [fx, fy, fz, tx, ty, tz]
            all_dim = np.zeros([6, 6])
            all_dim[-1, :] = force

            self.data.xfrc_applied[:] = all_dim

    def remove_all_perturbation(self):
        #self.data.qfrc_applied[:] = np.zeros([2, 1])
        self.data.qfrc_applied[:] = np.zeros([2])
        self.data.xfrc_applied[:] = np.zeros([3, 6])