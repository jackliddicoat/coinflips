import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

trials = []
for i in range(500):
    if i % 100 == 0:
        step = 0
        trials.append(step)
    else:
        step = trials[-1]
        num = np.random.randint(0, 2)
        if num == 0:
            trials.append(step + 1)
        else:
            trials.append(step - 1)
    # print(">" + str(i) + " " + str(trials[i]))

random_walks = np.array(trials).reshape(5, 100)
df = pd.DataFrame({'1': random_walks[0, :], '2': random_walks[1, :],
                  '3': random_walks[2, :], '4': random_walks[3, :], 
                  '5': random_walks[4, :]})

df.plot(y = ['1', '2', '3', '4', '5'], use_index=True)
plt.title("Random walk using coinflip probability")
plt.legend(title = "Trial Number")
plt.show()
