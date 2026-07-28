import math
from statistics import NormalDist

def N(x):
    # Define the Standard Normal CDF function globally or keep it inside the main function
    return NormalDist(mu=0, sigma=1).cdf(x)

def calculate_black_scholes():
    # Gather primary inputs
    S       = float(input("Enter the stock price (S): "))
    X       = float(input("Enter the strike price (X): "))
    r       = float(input("Enter the risk-free rate (r) as a decimal (e.g., 0.05): "))
    vol     = float(input("Enter the volatility (vol) as a decimal (e.g., 0.20): "))
    T       = float(input("Enter the time to expiration in years (T): "))
    Optype  = int(input("Enter Option type (1 = Call, 2 = Put): "))
    DivType = int(input("Enter Dividend type (0 = no dividend, 1 = continuous, 2 = discrete): "))

    S_adj = S  # Default adjusted stock price

    # Handle Dividends
    if DivType == 1:
        delta = float(input("Enter the continuous proportional dividend rate (as a decimal): "))
        S_adj = S * math.exp(-delta * T)

    elif DivType == 2:
        num_divs = int(input("Enter the number of dividend payments: "))
        div_amt  = float(input("Enter the amount of each dividend payment: "))
        npv_divs = 0.0

        for i in range(num_divs):
            div_time = float(input(f"Enter the date (in years from today) for dividend {i + 1}: "))
            if div_time <= T:
                npv_divs += div_amt * math.exp(-r * div_time)

        S_adj = S - npv_divs

    # Calculate d1 and d2
    d1 = (math.log(S_adj / X) + (r + (vol ** 2) / 2) * T) / (vol * math.sqrt(T))
    d2 = d1 - vol * math.sqrt(T)

    # Calculate and output the final option price
    if Optype == 1:
        call_price = S_adj * N(d1) - X * math.exp(-r * T) * N(d2)
        print(f"\nThe Black-Scholes Call Option Price is: ${call_price:.4f}")
    elif Optype == 2:
        put_price = X * math.exp(-r * T) * N(-d2) - S_adj * N(-d1)
        print(f"\nThe Black-Scholes Put Option Price is: ${put_price:.4f}")
    else:
        print("\nError: Invalid Option Type selected.")

# This acts as the standard entry point for the script
if __name__ == "__main__":
    calculate_black_scholes()