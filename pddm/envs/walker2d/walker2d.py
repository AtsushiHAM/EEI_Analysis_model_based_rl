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

class Walker2dEnv(mujoco_env.MujocoEnv, utils.EzPickle):
    def __init__(self, file_path=os.path.join(GYM_ASSET_PATH, "walker2d.xml"), max_step=1000):

        self.time = 0
        self.num_step = 0
        self.max_step = max_step  # maximum number of time steps for one episode
        self.startup = True
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
        velx= observations[:, 6]
        height = observations[:, 1]
        ang= observations[:, 2]
        s = self.state_vector()

        # calc rew
        self.reward_dict['actions'] = np.sum(np.square(actions), axis=1)
        self.reward_dict['run'] = velx
        self.reward_dict['height'] = height#np.array(10 - 50 * (np.abs(difference_posx) + np.abs(difference_posy)))
        self.reward_dict['r_total'] =self.reward_dict['run']-  +0.1*self.reward_dict['actions']-3.0*(self.reward_dict['height']-1.3)**2

        # check if done
        dones = np.zeros((observations.shape[0],))
        dones[((height > 1000.7))] = 1

        # return
        if not batch_mode:
            return self.reward_dict['r_total'][0], dones[0]
        return self.reward_dict['r_total'], dones

    def get_score(self, obs):
        goal_difference = abs(obs[8]) + abs(obs[9])
        return goal_difference

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

    def viewer_setup(self):
        self.viewer.cam.trackbodyid = 2
        self.viewer.cam.distance = self.model.stat.extent * 0.5
        self.viewer.cam.lookat[2] = 1.15
        self.viewer.cam.elevation = -20

    def reset_model(self):
        self.num_step = 0
        # set reset pose/vel
        self.reset_pose = self.init_qpos + self.np_random.uniform(low=-.005, high=.005, size=self.model.nq)
        self.reset_vel = self.init_qvel + self.np_random.uniform(size=self.model.nv, low=-.005, high=.005)
        #self.set_state(qpos, qvel)
        return self.do_reset(self.reset_pose.copy(), self.reset_vel.copy())

    def _get_obs(self):

        np.clip(self.sim.data.qvel.flat, -10, 10)
        #theta = self.sim.data.qpos.flat[:2]
        self.obs_dict = {}
        self.obs_dict['pos'] = self.sim.data.qpos.flat.copy()
        self.obs_dict['vel'] = np.clip(self.sim.data.qvel.flat, -10, 10).copy()
        # self.sim.data.qpos.flat[2:].copy()#self.get_body_com("fingertip") - self.get_body_com("target").copy()
        #self.obs_dict['goal_vel'] = self.sim.data.qvel.flat[2:].copy()
        #theta = self.sim.data.qpos.flat[:2]
        return np.concatenate([
            self.obs_dict['pos'],
            self.obs_dict['vel'],##23
        ])

    def do_reset(self, reset_pose, reset_vel, reset_goal=None):

        #reset
        self.set_state(reset_pose, reset_vel)

        #return
        return self._get_obs()

