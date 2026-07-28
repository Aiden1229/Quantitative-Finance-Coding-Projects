import math
import random
import matplotlib.pyplot as plt
from statistics import NormalDist

def main():

    length    = 1000        # Length of each path (observations in a year)
    delta_t   = 1 / length  # Time increment (0.001)
    S0        = 100         # Starting price of the stock
    mu        = 0.08        # Annual expected return
    sigma     = 0.20        # Annual volatility
    num_paths = 1000        # Number of simulations

    final_prices = []  # Creates a list to hold final prices of each simulation

    for i in range(num_paths):


        current_s = S0  # Set the beginning stock price each path to the original S0

        # Now simulate the daily price movements for one whole year (1000 steps)
        for j in range(length):
            epsilon = random.random()
            delta_w = NormalDist(mu=0, sigma=math.sqrt(delta_t)).inv_cdf(epsilon)
            delta_s = (current_s * mu * delta_t) + (current_s * sigma * delta_w)
            current_s = current_s + delta_s
        final_prices.append(current_s)

    plt.hist(final_prices, bins=15)
    plt.title("Distribution of Final Stock Prices (1-Year GBM Simulation)")
    plt.xlabel("Final Simulated Stock Price")
    plt.ylabel("Frequency")
    plt.show()
main()
