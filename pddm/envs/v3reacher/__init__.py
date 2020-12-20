from gym.envs.registration import register

register(
    id='pddm_vreacher-v0',
    entry_point='pddm.envs.vreacher.vreacher:VReacherEnv',
    max_episode_steps=1000,
)
register(
    id='pddm_vreacher-v11',
    entry_point='pddm.envs.vreacher.vreacher:VReacherEnv1_1',
    max_episode_steps=1000,
)
register(
    id='pddm_vreacher-v14',
    entry_point='pddm.envs.vreacher.vreacher:VReacherEnv1_4',
    max_episode_steps=1000,
)
register(
    id='pddm_vreacher-v214',
    entry_point='pddm.envs.vreacher.vreacher:VReacherEnv2',
    max_episode_steps=1000,
)
register(
    id='pddm_vreacher-v6',
    entry_point='pddm.envs.vreacher.vreacher:VReacherEnv6',
    max_episode_steps=1000,
)

