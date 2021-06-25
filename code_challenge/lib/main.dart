import 'delivery.dart';
import 'dart:io';
import 'pizza_bot.dart';

void main(List<String> arguments) {
  // Input: 5x5 (1, 3) (4, 4)
  // Output: ENNNDEEEND
  // Input: 5x5 (0, 0) (1, 3) (4, 4) (4, 2) (4, 2) (0, 1) (3, 2) (2, 3) (4, 1)
  // Output: DENNNDEEENDSSDDWWWWSDEEENDWNDEESSD

  print('Enter input string:');
  var readLine = stdin.readLineSync();
  var line = readLine!.replaceAll(')', '').split(' (');
  var size = line[0].split('x').map(int.parse).toList();

  var coordinates = <List<int>>[];
  var points = line.sublist(1);
  for (var i = 0; i < points.length; i++) {
    var point =
        points[i].split(',').map((e) => e.trim()).map(int.parse).toList();
    if (point[0] >= size[0] ||
        point[0] < 0 ||
        point[1] >= size[1] ||
        point[1] < 0) {
      throw Exception('Wrong coordinates.');
    }
    coordinates.add(point);
  }

  var pizzaBot = PizzaBot();

  var delivery = Delivery(pizzaBot, coordinates);
  delivery.startDelivery();
}
