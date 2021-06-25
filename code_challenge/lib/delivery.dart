import 'pizza_bot.dart';

class Delivery {
  PizzaBot pizzaBot;
  List<List<int>> coordinates;

  Delivery(this.pizzaBot, this.coordinates);

  void startDelivery() {
    for (var i = 0; i < coordinates.length; i++) {
      for (var j = 0; j < 2; j++) {
        for (var k = 0; k < (pizzaBot.pos[j] - coordinates[i][j]).abs(); k++) {
          if (pizzaBot.pos[j] < coordinates[i][j]) {
            if (j == 0) {
              pizzaBot.moveEast();
            } else {
              pizzaBot.moveNorth();
            }
          } else {
            if (j == 0) {
              pizzaBot.moveWest();
            } else {
              pizzaBot.moveSouth();
            }
          }
        }
        pizzaBot.pos[j] = coordinates[i][j];
      }
      pizzaBot.dropPizza();
    }
    print('');
  }
}
