import random
import matplotlib.pyplot as plt
def main():
    price = 0
    numStep = eval(input('Please enter the number of realizations you would like in this random walk: '))
    samplePath = []
    obsNumber = []
    samplePath.append(price)
    obsNumber.append(0)
    for i in range(1, numStep + 1):
        random_shock = random.randint(0, 1)
        if random_shock == 0:
            shock = -1
        elif random_shock == 1:
            shock = 1
        price = price + shock
        samplePath.append(price)
        obsNumber.append(i)
    plt.plot(obsNumber, samplePath)
    plt.show()
main()