from gym.envs.registration import register

register(
    id='pddm_v4reacher-v0',
    entry_point='pddm.envs.v4reacher.vreacher:VReacherEnv',
    max_episode_steps=1000,
)
register(
    id='pddm_v4reacher-v11',
    entry_point='pddm.envs.v4reacher.vreacher:VReacherEnv1_1',
    max_episode_steps=1000,
)
register(
    id='pddm_v4reacher-v14',
    entry_point='pddm.envs.v4reacher.vreacher:VReacherEnv1_4',
    max_episode_steps=1000,
)
register(
    id='pddm_v4reacher-v214',
    entry_point='pddm.envs.v4reacher.vreacher:VReacherEnv2',
    max_episode_steps=1000,
)
register(
    id='pddm_v4reacher-v4',
    entry_point='pddm.envs.v4reacher.vreacher:VReacherEnv4',
    max_episode_steps=1000,
)



register(
    id='pddm_v4reacher_ngr-v0',
    entry_point='pddm.envs.v4reacher.vreacher_ngr:VReacherEnv',
    max_episode_steps=1000,
)
register(
    id='pddm_v4reacher_ngr-v11',
    entry_point='pddm.envs.v4reacher.vreacher_ngr:VReacherEnv1_1',
    max_episode_steps=1000,
)
register(
    id='pddm_v4reacher_ngr-v14',
    entry_point='pddm.envs.v4reacher.vreacher_ngr:VReacherEnv1_4',
    max_episode_steps=1000,
)
register(
    id='pddm_v4reacher_ngr-v214',
    entry_point='pddm.envs.v4reacher.vreacher_ngr:VReacherEnv2',
    max_episode_steps=1000,
)
register(
    id='pddm_v4reacher_ngr-v4',
    entry_point='pddm.envs.v4reacher.vreacher_ngr:VReacherEnv4',
    max_episode_steps=1000,
)

