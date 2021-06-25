import 'dart:io';

class PizzaBot {
  final pos = [0, 0];

  void moveNorth() => stdout.write('N');

  void moveSouth() => stdout.write('S');

  void moveEast() => stdout.write('E');

  void moveWest() => stdout.write('W');

  void dropPizza() => stdout.write('D');
}
