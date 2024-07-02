from battery_revenue import calc_interval_discharge


def test_interval_revenue():
    # all positive
    assert calc_interval_discharge(24, 48) == 3

    # zero or negative
    assert calc_interval_discharge(0, 0) == 0
    assert calc_interval_discharge(-24, -24) == 0
    assert calc_interval_discharge(-24, 0) == 0

    # ramp from negtive to positive
    assert calc_interval_discharge(0, 24) == 1
    assert calc_interval_discharge(-24, 24) == .5
    assert calc_interval_discharge(-12, 24) == calc_interval_discharge(24, -12)

    # from real case
    assert calc_interval_discharge(1.13012, 0) == 0.047088333333333336
