# Tennis Game

## Assumption
1. Tennis gama have maximum 3 rounds, and it's a two out of three sets match.
2. If one player win first two rounds, he win the whole game, and 3rd round will not be helds  
3. In each round, here are 3 results: player1 win, draw, player2 win, each result's possibility is equal

## Question
What's the possibility game finish in 2 rounds?

## Answer
The the possibility game finish in 2 rounds is 2/23.

Firstly consider the full combinations for 3 rounds, here are 3*3*3=27 cases.

In 27 combintions, below six cases will only have 2 rounds due to one of the player smashed in first two rounds:
```
player1 win, player1 win, player1 win
player1 win, player1 win, draw
player1 win, player1 win, player2 win
player2 win, player2 win, player1 win
player2 win, player2 win, draw
player2 win, player2 win, player2 win
```
Here are only two cases game will finish in 2 rounds:
```
player1 win, player1 win
player2 win, player2 win
```
So the possibility game finish in 2 rounds is 2/(27-6+2) == 2/23

## Programing Demonstrate
- Code:
```
two_rounds_count=0
three_rounds_count=0
options=('p1','draw','p2')
for round1 in options:
    for round2 in options:
        if round1==round2 and round1 in ('p1','p2'):
            print(round1,round2)
            two_rounds_count+=1
            continue
        for round3 in options:
            print(round1,round2,round3)
            three_rounds_count+=1
print('Game ends in 2 rounds possibility is',two_rounds_count,'/',two_rounds_count+three_rounds_count)
```
- output:
```
p1 p1
p1 draw p1
p1 draw draw
p1 draw p2
p1 p2 p1
p1 p2 draw
p1 p2 p2
draw p1 p1
draw p1 draw
draw p1 p2
draw draw p1
draw draw draw
draw draw p2
draw p2 p1
draw p2 draw
draw p2 p2
p2 p1 p1
p2 p1 draw
p2 p1 p2
p2 draw p1
p2 draw draw
p2 draw p2
p2 p2
Game ends in 2 rounds possibility is 2 / 23
```