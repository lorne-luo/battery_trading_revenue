def calc_interval_discharge(initial, target):
    """calculate discharged power in 5 mins interval"""
    # the ramp are under 0, indicate it's charing in whole interval, no revenue generated
    if initial <= 0 and target <= 0:
        return 0

    # the ramp above 0, calculate as trapezoid area
    if initial >= 0 and target >= 0:
        # (initial + target) / 12 / 2
        # / 12 for MWh in 5 mins
        # / 2 for  trapezoid area formula
        return (initial + target) / 24

    # the ramp across zero, only calculate the above 0 area
    charge_rate = max(initial, target)
    charge_ratio = abs(charge_rate) / (abs(initial) + abs(target))
    return charge_rate / 24 * charge_ratio


def calc_interval_charge(initial, target):
    """
    calculate charged power in 5 mins interval
    here reused calc_interval_discharge
    """

    return calc_interval_discharge(initial * -1, target * -1)
