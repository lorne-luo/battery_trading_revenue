import click
import pandas as pd

from battery_revenue import calc_interval_revenue


@click.command()
@click.argument('csv_file', type=click.Path(exists=True))
def main(csv_file):
    """Calculate discharge revenue for given CSV."""
    df = pd.read_csv(csv_file, header=0)

    calc_revenue = lambda row: calc_interval_revenue(row['INITIALMW'], row['TARGETMW'], row['RRP'])

    df['revenue'] = df.apply(calc_revenue, axis=1)

    total_revenue = sum(df['revenue'])

    print(f'The total revenue in 1 Apr 2024 is ${total_revenue:.2f}')


if __name__ == '__main__':
    main()
