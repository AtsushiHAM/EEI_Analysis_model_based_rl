# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

from gym.envs.registration import register

register(
    id='pddm_furuta_inverted_pendulum-v0',
    entry_point='pddm.envs.furuta_inverted_pendulum_force.IP_env:InvertedPendulumEnv',
    max_episode_steps=1000,
)

register(
    id='pddm_furuta_inverted_pendulum_force-v1',
    entry_point='pddm.envs.furuta_inverted_pendulum_force.IP_env:InvertedPendulumEnv1',
    max_episode_steps=1000,
)

register(
    id='pddm_furuta_inverted_pendulum_force-v11',
    entry_point='pddm.envs.furuta_inverted_pendulum_force.IP_env:InvertedPendulumEnv1_1',
    max_episode_steps=1000,
)

register(
    id='pddm_furuta_inverted_pendulum_force-v12',
    entry_point='pddm.envs.furuta_inverted_pendulum_force.IP_env:InvertedPendulumEnv1_2',
    max_episode_steps=1000,
)

register(
    id='pddm_furuta_inverted_pendulum_force-v2',
    entry_point='pddm.envs.furuta_inverted_pendulum_force.IP_env:InvertedPendulumEnv2',
    max_episode_steps=1000,
)

register(
    id='pddm_furuta_inverted_pendulum_force-v3',
    entry_point='pddm.envs.furuta_inverted_pendulum_force.IP_env:InvertedPendulumEnv3',
    max_episode_steps=1000,
)

register(
    id='pddm_furuta_inverted_pendulum_force-v5',
    entry_point='pddm.envs.furuta_inverted_pendulum_force.IP_env:InvertedPendulumEnv5',
    max_episode_steps=1000,
)

register(
    id='pddm_furuta_inverted_pendulum_force-v3124',
    entry_point='pddm.envs.furuta_inverted_pendulum_force.IP_env:InvertedPendulumEnv3_124',
    max_episode_steps=1000,
)