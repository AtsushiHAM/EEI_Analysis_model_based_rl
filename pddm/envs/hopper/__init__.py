from gym.envs.registration import register

register(
    id='pddm_hopper-v0',
    entry_point='pddm.envs.hopper.hopper:HopperEnv',
    max_episode_steps=1000,
)

