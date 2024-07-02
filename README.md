# Battery Trading Revenue

## Challenge

Refer [this doc](Coding_practice_python_developer.docx)

## Quick Answer

### 1.SQL Challenge

- [Question 1 answer](sql/q1.sql)
- [Question 2 answer](sql/q2.sql)
- [Question 3 answer](sql/q3.sql)

### 2.Battery Trading Revenue

- Total revenue is $8530.08
- Battery conversion rate is 80.96%

### 3. Tennis Game Issue in Interview
The chance for game finished in 2 rounds is 2/23, please check [detail here](tennis_game.md).

## How to install and run

### Setup environment

```shell
# checkout repo
git clone git@github.com:lorne-luo/battery_trading_revenue.git
cd battery_trading_revenue

# create virtual env and activate
python3 -m venv venv
. venv/bin/activate 

# install dependencies
pip install -r requirements
```

### Execute main.py to process csv file

 ```
 python main.py coding_practice_python_battery_dispatch_dataset.csv
 ```

### Run prototype jupyter notebook

```
jupyter-notebook battery_revenue.ipynb
```

## How to test

Simply run `pytest`

```
 pytest
```
