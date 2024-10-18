from math import sinh, log2, atan, exp


def exp_x(x, terms):
    s = 1.0  
    term = 1.0  
    for n in range(1, terms):
        term *= x / n  
        s += term
    return f"Through the row: e^x = {s}"


def task_4(x, a):
    return f"sinh({x}) - {a} = {sinh(x) - a}"


def task_3(a):
    return f"arctan(1/log2({a})) = {atan(1 / log2(a))}"


if __name__ == "__main__":
    print(exp_x(3, 12))
    print(f"e^x = {exp(3)}")
    print(task_3(3))
    print(task_4(3, 1))
