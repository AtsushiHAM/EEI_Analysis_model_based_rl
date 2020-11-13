#####################################
#
# Written by Chai Jiazheng
# E-mail: chai.jiazheng.q1@dc.tohoku.ac.jp
#
# 01/07/2019
#
#######################################

import os
import numpy as np
from gym import utils
from gym.envs.mujoco import mujoco_env


#GYM_ASSET_PATH2=os.path.join(os.getcwd(),'assets')
GYM_ASSET_PATH=xml_path = os.path.join(os.path.dirname(__file__), 'assets')
#GYM_ASSET_PATH=os.path.abspath(os.path.join(os.path.dirname( __file__ ), '..', 'assets'))

PI=3.14159265359

class InvertedPendulumEnv(mujoco_env.MujocoEnv, utils.EzPickle):
    def __init__(self,file_path=os.path.join(GYM_ASSET_PATH,"default_ip.xml"),max_step=1000):
        self.time = 0
        self.num_step =0
        self.max_step=max_step #maximum number of time steps for one episod


        mujoco_env.MujocoEnv.__init__(self, os.path.join(file_path), 2)
        utils.EzPickle.__init__(self)
        self.skip = self.frame_skip####different from before

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

        # calc rew
        self.reward_dict['actions'] = -0.1*(1-(np.abs(pendulum_angle))**(1))* np.sum(np.square(actions), axis=1)#0.1 * np.sum(np.square(actions), axis=1)
        #self.reward_dict['stable'] = np.cos(pendulum_angle)
        self.reward_dict['stable'] = 10-50*np.abs(pendulum_angle)
        self.reward_dict['r_total'] = self.reward_dict['stable']#+self.reward_dict['actions']#
        #print("mod_rew")

        # check if done
        dones = np.zeros((observations.shape[0],))
        dones[np.abs(pendulum_angle) > 360] = 1

        # return
        if not batch_mode:
            return self.reward_dict['r_total'][0], dones[0]
        return self.reward_dict['r_total'], dones

    def get_reward1(self, observations, actions):

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

        # calc rew
        self.reward_dict['actions'] = -0.1 * np.sum(np.square(actions), axis=1)
        #self.reward_dict['stable'] = np.cos(pendulum_angle)
        self.reward_dict['stable'] = 10-50*np.abs(pendulum_angle)
        self.reward_dict['r_total'] = self.reward_dict['stable']+self.reward_dict['actions'] #self.reward_dict['actions'] + self.reward_dict['stable']

        # check if done
        dones = np.zeros((observations.shape[0],))
        dones[np.abs(pendulum_angle) > 360] = 1

        # return
        if not batch_mode:
            return self.reward_dict['r_total'][0], dones[0]
        return self.reward_dict['r_total'], dones

    def get_score(self, obs):
        pendulum_angle_after = obs[1]
        return pendulum_angle_after


        #self.data.sensordata  # Gives array of all sensorvalues
    def step(self, action):
        self.num_step+=1
        #print("frame skip {}".format(self.frame_skip))
        self.do_simulation(action, self.frame_skip)
        #theta_support_after = self.data.qpos[1]
        theta_support_after = self.data.qpos[0]

        ob = self._get_obs()
        rew, done = self.get_reward(ob, action)
        #print("hello")
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

        return np.concatenate([
            self.obs_dict['joints_pos'], #2
            self.obs_dict['joints_vel'], #2

        ])

    def reset_model(self):
        self.num_step=0

        # set reset pose/vel
        self.reset_pose = self.init_qpos + self.np_random.uniform(
                        low=-.01, high=.01, size=self.model.nq)
        self.reset_vel = self.init_qvel + self.np_random.uniform(size=self.model.nv, low=-0.01, high=0.01)

        #reset the env to that pose/vel
        return self.do_reset(self.reset_pose.copy(), self.reset_vel.copy())

        # Function to apply an external force to the joint of the pendulum.

    def do_reset(self, reset_pose, reset_vel, reset_goal=None):

        #reset
        self.set_state(reset_pose, reset_vel)

        #return
        return self._get_obs()


    def viewer_setup(self):
        self.viewer.cam.distance = self.model.stat.extent * 2
        self.viewer.cam.elevation = -10#-35
        self.viewer.cam.azimuth =180
        #print("hello")
        #self.viewer.cam.pose = 0
        #self.viewer.cam.camid = 0




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

        # Funtion to remove all perturbations.

    def remove_all_perturbation(self):
        #self.data.qfrc_applied[:] = np.zeros([2, 1])
        self.data.qfrc_applied[:] = np.zeros([2])

        self.data.xfrc_applied[:] = np.zeros([6, 6])


class InvertedPendulumEnv1(mujoco_env.MujocoEnv, utils.EzPickle):
    def __init__(self,file_path=os.path.join(GYM_ASSET_PATH,"default_ip.xml"),max_step=1000):
        self.time = 0
        self.num_step =0
        self.max_step=max_step #maximum number of time steps for one episode



        mujoco_env.MujocoEnv.__init__(self, os.path.join(file_path), 2)
        utils.EzPickle.__init__(self)
        self.skip = self.frame_skip####different from before

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

        # calc rew
        self.reward_dict['actions'] = -0.1 * np.sum(np.square(actions), axis=1)
        # self.reward_dict['stable'] = np.cos(pendulum_angle)
        self.reward_dict['stable'] = 10 - 50 * np.abs(pendulum_angle)
        self.reward_dict['r_total'] = self.reward_dict['stable']  # self.reward_dict['actions'] + self.reward_dict['stable']

        # check if done
        dones = np.zeros((observations.shape[0],))
        dones[np.abs(pendulum_angle) > 360] = 1

        # return
        if not batch_mode:
            return self.reward_dict['r_total'][0], dones[0]
        return self.reward_dict['r_total'], dones

    def get_reward1(self, observations, actions):

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

        # calc rew
        self.reward_dict['actions'] = -0.1 * np.sum(np.square(actions), axis=1)
        #self.reward_dict['stable'] = np.cos(pendulum_angle)
        self.reward_dict['stable'] = 10-50*np.abs(pendulum_angle)
        self.reward_dict['r_total'] = self.reward_dict['stable']+self.reward_dict['actions'] #self.reward_dict['actions'] + self.reward_dict['stable']

        # check if done
        dones = np.zeros((observations.shape[0],))
        dones[np.abs(pendulum_angle) > 360] = 1

        # return
        if not batch_mode:
            return self.reward_dict['r_total'][0], dones[0]
        return self.reward_dict['r_total'], dones

    def get_score(self, obs):
        pendulum_angle_after = obs[1]
        return pendulum_angle_after


        #self.data.sensordata  # Gives array of all sensorvalues
    def step(self, action):
        self.num_step+=1
        #print("frame skip {} step {}".format(self.frame_skip, self.dt))
        self.do_simulation(action, self.frame_skip)
        #theta_support_after = self.data.qpos[1]
        theta_support_after = self.data.qpos[0]

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
        self.obs_dict['joints_force'] = np.asarray(
            [self.data.sensordata[0]]).flat.copy()
        return np.concatenate([
            self.obs_dict['joints_pos'], #2
            self.obs_dict['joints_vel'], #2
            self.obs_dict['joints_force']
            #np.asarray(self.data.sensordata[1]),
        ])

    def reset_model(self):
        self.num_step=0

        # set reset pose/vel
        self.reset_pose = self.init_qpos + self.np_random.uniform(
                        low=-.01, high=.01, size=self.model.nq)
        self.reset_vel = self.init_qvel + self.np_random.uniform(size=self.model.nv, low=-0.01, high=0.01)

        #reset the env to that pose/vel
        return self.do_reset(self.reset_pose.copy(), self.reset_vel.copy())

        # Function to apply an external force to the joint of the pendulum.

    def do_reset(self, reset_pose, reset_vel, reset_goal=None):

        #reset
        self.set_state(reset_pose, reset_vel)

        #return
        return self._get_obs()


    def viewer_setup(self):
        self.viewer.cam.distance = self.model.stat.extent * 2
        self.viewer.cam.elevation = -10  # -35
        self.viewer.cam.azimuth = 180



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

        self.data.xfrc_applied = all_dim

        # Funtion to remove all perturbations.

    def remove_all_perturbation(self):
        #self.data.qfrc_applied[:] = np.zeros([2, 1])
        self.data.qfrc_applied[:] = np.zeros([2])
        self.data.xfrc_applied[:] = np.zeros([6, 6])



class InvertedPendulumEnv2(mujoco_env.MujocoEnv, utils.EzPickle):
    def __init__(self,file_path=os.path.join(GYM_ASSET_PATH,"default_ip.xml"),max_step=1000):
        self.time = 0
        self.num_step =0
        self.max_step=max_step #maximum number of time steps for one episode



        mujoco_env.MujocoEnv.__init__(self, os.path.join(file_path), 2)
        utils.EzPickle.__init__(self)
        self.skip = self.frame_skip####different from before

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

        # calc rew
        self.reward_dict['actions'] = -0.1 * np.sum(np.square(actions), axis=1)
        # self.reward_dict['stable'] = np.cos(pendulum_angle)
        self.reward_dict['stable'] = 10 - 50 * np.abs(pendulum_angle)
        self.reward_dict['r_total'] = self.reward_dict['stable']
        #print("mod_rew")

        # check if done
        dones = np.zeros((observations.shape[0],))
        dones[np.abs(pendulum_angle) > 360] = 1

        # return
        if not batch_mode:
            return self.reward_dict['r_total'][0], dones[0]
        return self.reward_dict['r_total'], dones

    def get_reward1(self, observations, actions):

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

        # calc rew
        self.reward_dict['actions'] = -0.1 * np.sum(np.square(actions), axis=1)
        #self.reward_dict['stable'] = np.cos(pendulum_angle)
        self.reward_dict['stable'] = 10-50*np.abs(pendulum_angle)
        self.reward_dict['r_total'] = self.reward_dict['stable']+self.reward_dict['actions'] #self.reward_dict['actions'] + self.reward_dict['stable']

        # check if done
        dones = np.zeros((observations.shape[0],))
        dones[np.abs(pendulum_angle) > 360] = 1

        # return
        if not batch_mode:
            return self.reward_dict['r_total'][0], dones[0]
        return self.reward_dict['r_total'], dones

    def get_score(self, obs):
        pendulum_angle_after = obs[1]
        return pendulum_angle_after


        #self.data.sensordata  # Gives array of all sensorvalues
    def step(self, action):
        self.num_step+=1
        #print("frame skip {} step {}".format(self.frame_skip, self.dt))
        self.do_simulation(action, self.frame_skip)
        #theta_support_after = self.data.qpos[1]
        theta_support_after = self.data.qpos[0]

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
        self.obs_dict['joints_force'] = np.asarray(
            [self.data.sensordata[0], self.data.sensordata[2]]).flat.copy()
        return np.concatenate([
            self.obs_dict['joints_pos'], #2
            self.obs_dict['joints_vel'], #2
            self.obs_dict['joints_force']
            #np.asarray(self.data.sensordata[1]),
        ])

    def reset_model(self):
        self.num_step=0

        # set reset pose/vel
        self.reset_pose = self.init_qpos + self.np_random.uniform(
                        low=-.01, high=.01, size=self.model.nq)
        self.reset_vel = self.init_qvel + self.np_random.uniform(size=self.model.nv, low=-0.01, high=0.01)

        #reset the env to that pose/vel
        return self.do_reset(self.reset_pose.copy(), self.reset_vel.copy())

        # Function to apply an external force to the joint of the pendulum.

    def do_reset(self, reset_pose, reset_vel, reset_goal=None):

        #reset
        self.set_state(reset_pose, reset_vel)

        #return
        return self._get_obs()


    def viewer_setup(self):
        self.viewer.cam.distance = self.model.stat.extent * 2
        self.viewer.cam.elevation = -10  # -35
        self.viewer.cam.azimuth = 180



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

        self.data.xfrc_applied = all_dim

        # Funtion to remove all perturbations.

    def remove_all_perturbation(self):
        #self.data.qfrc_applied[:] = np.zeros([2, 1])
        self.data.qfrc_applied[:] = np.zeros([2])
        self.data.xfrc_applied[:] = np.zeros([6, 6])


class InvertedPendulumEnv3(mujoco_env.MujocoEnv, utils.EzPickle):
    def __init__(self,file_path=os.path.join(GYM_ASSET_PATH,"default_ip.xml"),max_step=1000):
        self.time = 0
        self.num_step =0
        self.max_step=max_step #maximum number of time steps for one episode



        mujoco_env.MujocoEnv.__init__(self, os.path.join(file_path), 2)
        utils.EzPickle.__init__(self)
        self.skip = self.frame_skip####different from before

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

        # calc rew
        self.reward_dict['actions'] = -0.1 * np.sum(np.square(actions), axis=1)
        # self.reward_dict['stable'] = np.cos(pendulum_angle)
        self.reward_dict['stable'] = 10 - 50 * np.abs(pendulum_angle)
        self.reward_dict['r_total'] = self.reward_dict['stable']

        # check if done
        dones = np.zeros((observations.shape[0],))
        dones[np.abs(pendulum_angle) > 360] = 1

        # return
        if not batch_mode:
            return self.reward_dict['r_total'][0], dones[0]
        return self.reward_dict['r_total'], dones

    def get_reward1(self, observations, actions):

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

        # calc rew
        self.reward_dict['actions'] = -0.1 * np.sum(np.square(actions), axis=1)
        #self.reward_dict['stable'] = np.cos(pendulum_angle)
        self.reward_dict['stable'] = 10-50*np.abs(pendulum_angle)
        self.reward_dict['r_total'] = self.reward_dict['stable']+self.reward_dict['actions'] #self.reward_dict['actions'] + self.reward_dict['stable']

        # check if done
        dones = np.zeros((observations.shape[0],))
        dones[np.abs(pendulum_angle) > 360] = 1

        # return
        if not batch_mode:
            return self.reward_dict['r_total'][0], dones[0]
        return self.reward_dict['r_total'], dones

    def get_score(self, obs):
        pendulum_angle_after = obs[1]
        return pendulum_angle_after


        #self.data.sensordata  # Gives array of all sensorvalues
    def step(self, action):
        self.num_step+=1
        #print("frame skip {} step {}".format(self.frame_skip, self.dt))
        self.do_simulation(action, self.frame_skip)
        #theta_support_after = self.data.qpos[1]
        theta_support_after = self.data.qpos[0]

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
        self.obs_dict['joints_force'] = np.asarray([self.data.sensordata[0],self.data.sensordata[2],self.data.sensordata[1]]).flat.copy()
        return np.concatenate([
            self.obs_dict['joints_pos'], #2
            self.obs_dict['joints_vel'], #2
            self.obs_dict['joints_force']
        ])

    def reset_model(self):
        self.num_step=0

        # set reset pose/vel
        self.reset_pose = self.init_qpos + self.np_random.uniform(
                        low=-.01, high=.01, size=self.model.nq)
        self.reset_vel = self.init_qvel + self.np_random.uniform(size=self.model.nv, low=-0.01, high=0.01)

        #reset the env to that pose/vel
        return self.do_reset(self.reset_pose.copy(), self.reset_vel.copy())

        # Function to apply an external force to the joint of the pendulum.

    def do_reset(self, reset_pose, reset_vel, reset_goal=None):

        #reset
        self.set_state(reset_pose, reset_vel)

        #return
        return self._get_obs()


    def viewer_setup(self):
        self.viewer.cam.distance = self.model.stat.extent * 2
        self.viewer.cam.elevation = -10  # -35
        self.viewer.cam.azimuth = 180



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

        self.data.xfrc_applied = all_dim

        # Funtion to remove all perturbations.

    def remove_all_perturbation(self):
        #self.data.qfrc_applied[:] = np.zeros([2, 1])
        self.data.qfrc_applied[:] = np.zeros([2])
        self.data.xfrc_applied[:] = np.zeros([6, 6])






