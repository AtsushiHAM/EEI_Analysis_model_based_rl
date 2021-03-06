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
    id='pddm_furuta_inverted_pendulum_fs5-v0',
    entry_point='pddm.envs.furuta_inverted_pendulum_force_fs5.IP_env:InvertedPendulumEnv_Fs5',
    max_episode_steps=1000,
)

register(
    id='pddm_furuta_inverted_pendulum_force_fs5-v1',
    entry_point='pddm.envs.furuta_inverted_pendulum_force_fs5.IP_env:InvertedPendulumEnv1_Fs5',
    max_episode_steps=1000,
)

register(
    id='pddm_furuta_inverted_pendulum_force_fs5-v2',
    entry_point='pddm.envs.furuta_inverted_pendulum_force_fs5.IP_env:InvertedPendulumEnv2_Fs5',
    max_episode_steps=1000,
)

register(
    id='pddm_furuta_inverted_pendulum_force_fs5-v3',
    entry_point='pddm.envs.furuta_inverted_pendulum_force_fs5.IP_env:InvertedPendulumEnv3_Fs5',
    max_episode_steps=1000,
)