from gym.envs.registration import register

register(
    id='pddm_reacher-v0',
    entry_point='pddm.envs.reacher.reacher:ReacherEnv',
    max_episode_steps=1000,
)
register(
    id='pddm_reacher-v12',
    entry_point='pddm.envs.reacher.reacher:ReacherEnv1_2',
    max_episode_steps=1000,
)
register(
    id='pddm_reacher-v15',
    entry_point='pddm.envs.reacher.reacher:ReacherEnv1_5',
    max_episode_steps=1000,
)
register(
    id='pddm_reacher-v225',
    entry_point='pddm.envs.reacher.reacher:ReacherEnv2',
    max_episode_steps=1000,
)
register(
    id='pddm_reacher-v6',
    entry_point='pddm.envs.reacher.reacher:ReacherEnv6',
    max_episode_steps=1000,
)

