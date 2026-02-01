# Name : Nenavath Dhanush Rathod
# BT23ECE120

import math
from scipy.stats import norm

def hypothesis_test_cv(mu, xbar, sigma, n, alpha=0.05, tail=1):
    # Standard error
    se = sigma / math.sqrt(n)

    # TWO-TAILED
    if tail == 1:
        zc = norm.ppf(1 - alpha/2)
        LCV = mu - zc * se
        UCV = mu + zc * se

        decision = (
            "Fail to Reject H0"
            if LCV <= xbar <= UCV
            else "Reject H0"
        )

        return {
            "Test": "Two-tailed",
            "z_critical": zc,
            "LCV": LCV,
            "UCV": UCV,
            "xbar": xbar,
            "Decision": decision
        }

    # RIGHT-TAILED 
    elif tail == 2:
        zc = norm.ppf(1 - alpha)
        UCV = mu + zc * se

        decision = (
            "Fail to Reject H0"
            if xbar <= UCV
            else "Reject H0"
        )

        return {
            "Test": "Right-tailed",
            "z_critical": zc,
            "UCV": UCV,
            "xbar": xbar,
            "Decision": decision
        }

    # LEFT-TAILED 
    elif tail == 3:
        zc = norm.ppf(1 - alpha)
        LCV = mu - zc * se

        decision = (
            "Fail to Reject H0"
            if xbar >= LCV
            else "Reject H0"
        )

        return {
            "Test": "Left-tailed",
            "z_critical": zc,
            "LCV": LCV,
            "xbar": xbar,
            "Decision": decision
        }

    else:
        raise ValueError("tail must be 1 (two), 2 (right), or 3 (left)")

# Example: Critical Value Test

# Suppose we have:
# Population mean μ0 = 50
# Population std σ = 5
# Sample mean x̄ = 52
# Sample size n = 25
# Significance level α = 0.05
# Two-tailed test (H1: μ ≠ μ0)

mu = 50
xbar = 52
sigma = 5
n = 25
alpha = 0.05
tail = 1  # Two-tailed

result = hypothesis_test_cv(mu, xbar, sigma, n, alpha, tail)

print("Hypothesis Testing using Critical Value Method\n")
for k, v in result.items():
    print(f"{k}: {v}")
