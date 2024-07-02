from battery_revenue import calc_interval_revenue


def test_interval_revenue():
    # all positive
    assert calc_interval_revenue(24, 48, 100) == 300
    # zero or nagtive
    assert calc_interval_revenue(0, 0, 100) == 0
    assert calc_interval_revenue(-24, -24, 100) == 0
    assert calc_interval_revenue(-24, 0, 100) == 0

    # ramp from negtive to positive
    assert calc_interval_revenue(0, 24, 100) == 100
    assert calc_interval_revenue(-24, 24, 100) == 50
    assert calc_interval_revenue(-12, 24, 100) == calc_interval_revenue(24, -12, 100)

    # from real case
    assert calc_interval_revenue(1.13012, 0, 85.27446) == 4.015432197300001
