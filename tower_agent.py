from scaii.env.sky_rts.env.scenarios.tower_example import TowerExample
import numpy as np

env = TowerExample()

for i in range(0, 2):
    print("episode", i)

    s = env.reset()

    print("first action")
    act = env.new_action()
    act.attack_quadrant(2)

    s = env.act(act)

    print("second action...")

    while not s.is_terminal():
        noop = env.new_action()
        s = env.act(noop)

        if s.is_terminal():
            print("Reward is:", s.reward)
