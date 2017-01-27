Tic-Tac-Toe Kata
====================

Business logic for a game of tic-tac-toe in Ruby

Usage
-----------
Clone repo and open in REPL:
```
git clone git@github.com:cjcoops/tic-tac-toe.git
$ cd tic-tac-toe
$ pry
```                                                                                           
In REPL, start a new game:
```                                                                                       
> require './lib/game'
> g = Game.new
```
Claim a field (board is a 3x3 array so top middle is (0,1), bottom right is (2,2) etc..)
```
> g.claim(1,0)
=> "Player O's turn"
> g.claim(1,0)
RuntimeError: Try again, Player O's turn
> g.claim(1,1)
=> "Player X's turn"

...

> g.claim(2,0)
=> "Player X wins"
```

Test
------------
```
git clone git@github.com:cjcoops/tic-tac-toe.git
$ cd tic-tac-toe
$ rspec
```
