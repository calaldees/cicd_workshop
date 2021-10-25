def add(a, b):
    """
    >>> add(1, 2)
    3
    >>> add(1, -2)
    -1
    >>> add(1000000000000000000, 2)
    1000000000000000002
    """
    return a + b


def multiply(a, b):
    """
    >>> multiply(1, 2)
    2
    >>> multiply(2, 3)
    6
    """
    return a * b


def combine(a, b):
    """
    >>> combine(1, 2)
    6
    >>> combine(0, 1)
    -2
    >>> combine(2, 3)
    22
    """
    return (
        multiply(
            add(a, b),
            add(b, a),
        )
        - 3
    )


if __name__ == "__main__":
    import random

    numbers = tuple(
        combine(
            random.randint(0, 100),
            random.randint(0, 100),
        )
        for i in range(10)
    )
    from pprint import pprint

    pprint(numbers)
