import click
import pandas as pd
from battery_revenue import calc_interval_discharge, calc_interval_charge


@click.command()
@click.argument("csv_file", type=click.Path(exists=True))
def main(csv_file):
    """Calculate discharge revenue for given CSV."""
    df = pd.read_csv(csv_file, header=0)

    # total discharged
    calc_revenue = lambda row: calc_interval_discharge(
        row["INITIALMW"], row["TARGETMW"]
    )
    df["discharge_power"] = df.apply(calc_revenue, axis=1)

    # total charged
    calc_charge = lambda row: calc_interval_charge(
        row['INITIALMW'], row['TARGETMW']
    )
    df['charge_power'] = df.apply(calc_charge, axis=1)

    # calculate revenue
    df["revenue"] = df["RRP"] * df["discharge_power"]
    total_revenue = sum(df["revenue"])
    print(f"The total revenue in 1 Apr 2024 is ${total_revenue:.2f}")

    total_discharged = sum(df['discharge_power'])
    total_charged = sum(df['charge_power'])
    conversion_rate = total_discharged / total_charged
    conversion_loss_rate = (1 - conversion_rate) * 100
    conversion_rate *= 100
    print(f'The battery conversion rate is {conversion_rate:.2f}%, the conversion loss is {conversion_loss_rate:.2f}%')


if __name__ == "__main__":
    main()
