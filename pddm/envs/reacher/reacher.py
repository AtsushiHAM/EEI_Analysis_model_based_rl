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

        mujoco_env.MujocoEnv.__init__(self, os.path.join(file_path), 1)
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
        goal_pos = observations[:, -1]

        # calc rew
        # self.reward_dict['actions'] = -0.1 * np.sum(np.square(actions), axis=1)
        # self.reward_dict['stable'] = np.cos(pendulum_angle)
        self.reward_dict['goal_difference'] = 10 - 50 * np.abs(goal_pos)
        self.reward_dict['r_total'] = self.reward_dict['goal_difference']  # self.reward_dict['actions'] + self.reward_dict['stable']

        # check if done
        dones = np.zeros((observations.shape[0],))
        dones[np.abs(goal_pos) > 360] = 1

        # return
        if not batch_mode:
            return self.reward_dict['r_total'][0], dones[0]
        return self.reward_dict['r_total'], dones

    def get_score(self, obs):
        goal_difference = obs[-1]
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
        self.viewer.cam.trackbodyid = 0

    def reset_model(self):
        self.num_step = 0
        self.reset_pose = self.np_random.uniform(low=-0.1, high=0.1, size=self.model.nq) + self.init_qpos
        while True:
            self.goal = self.np_random.uniform(low=-.2, high=.2, size=2)
            if np.linalg.norm(self.goal) < 2:
                break
        self.reset_pose[-2:] = self.goal
        self.reset_vel = self.init_qvel + self.np_random.uniform(low=-.005, high=.005, size=self.model.nv)
        self.reset_vel[-2:] = 0
        #self.set_state(qpos, qvel)
        return self.do_reset(self.reset_pose.copy(), self.reset_vel.copy())

    def _get_obs(self):
        self.obs_dict = {}
        self.obs_dict['joints_pos'] = self.sim.data.qpos.flat[:2].copy()
        self.obs_dict['joints_vel'] = self.sim.data.qvel.flat[:2].copy()
        self.obs_dict['goal_pos'] = self.sim.data.qpos.flat[2:].copy()#self.get_body_com("fingertip") - self.get_body_com("target").copy()
        self.obs_dict['goal_vel'] = self.sim.data.qvel.flat[2:].copy()
        #theta = self.sim.data.qpos.flat[:2]
        return np.concatenate([
            #np.cos(theta),
            #np.sin(theta),
            #self.model.data.qpos.flat[2:],
            #self.sim.data.qvel.flat[:2],
            #self.get_body_com("target"),
            #self.get_body_com("fingertip") - self.get_body_com("target")
            self.obs_dict['joints_pos'],
            self.obs_dict['joints_vel'],
            #self.obs_dict['goal_pos'],
            #self.obs_dict['goal_vel']

        ])

    def do_reset(self, reset_pose, reset_vel, reset_goal=None):

        #reset
        self.set_state(reset_pose, reset_vel)

        #return
        return self._get_obs()
