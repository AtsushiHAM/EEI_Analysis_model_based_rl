#####################################
# Codes from:
#
# https://shizenkarasuzon.hatenablog.com/entry/2018/08/27/002812
#
# Modified by Chai Jiazheng
# E-mail: chai.jiazheng.q1@dc.tohoku.ac.jp
#
# 01/07/2019
#
#######################################
PI=3.14159265359
import numpy as np

class PID:
    def __init__(self, P=200, I=0.1, D=0.5,delta_time=0.04,target_pos=0):
        self.Kp = P # P-gain (Cartesian space)
        self.Ki = I # D-gain (joint space)
        self.Kd = D # Link 2 length [m]

        self.l1 = 0.1
        self.l2 = 0.1
        self.targetPos = target_pos
        self.delta_time=delta_time #Smallest timestep of the simulation
        self.clear()
        #print(delta_time)

    def clear(self):
        self.PTerm = 0
        self.ITerm = 0
        self.DTerm = 0
        self.last_error = 0

        # Windup Guard
        self.windup_guard = 20.0
        self.output = 0.0

    def update(self, feedback_value):

        # Feedback value takes the target position as its reference.
        # For example, if target position is 0, then when the pole
        # tilts towards the rightside of the z-axis, its value is positive.
        # Else, its value is negative.

        # Extract values
        c1 = feedback_value[0]  # cos(theta1)
        c2 = feedback_value[1]  # cos(theta2)
        s1 = feedback_value[2]  # sin(theta1)
        s2 = feedback_value[3]  # sin(theta2)
        c12 = c1 * c2 - s1 * s2  # cos(theta1 + theta2)
        s12 = s1 * c2 + c1 * s2  # sin(theta1 + theta2)
        v = feedback_value[6:8]  # joint angular velocity
        e = feedback_value[8:10]  # tracking error in the Cartesian space

        # Calculate hand-tip force command
        f_ref = -self.Kp * e

        # Compute joint torque command
        tau_ref = np.zeros(2)
        tau_ref[0] = f_ref[0] * self.l2 * (-s1 - s12) + f_ref[1] * self.l2 * (c1 + c12)
        tau_ref[1] = f_ref[0] * self.l1 * (-s12) + f_ref[1] * self.l1 * c12

        # Add a friction term
        tau_ref -= self.Kd * v



        #if feedback_value>PI:
        #    feedback_value=-(PI-feedback_value%PI)


        self.output = tau_ref #self.PTerm + (self.Ki * self.ITerm) + (self.Kd * self.DTerm)

        #if self.output >0.2:
         #   self.output = 0.2
        #elif self.output <-0.2:
           # self.output = -0.2


        return  -self.output,feedback_value

    def setTargetPosition(self, targetPos):
        self.targetPos = targetPos