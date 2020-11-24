from gym.envs.registration import register

register(
    id='pddm_walker2d-v0',
    entry_point='pddm.envs.walker2d.walker2d:Walker2dEnv',
    max_episode_steps=1000,
)

