import 'package:todo_app/pages/newtask.dart';

class CardRow{
  String numberOfTasks;
  String typeOfTask;
  int colour;
  double number;

  CardRow(this.numberOfTasks,this.typeOfTask,this.colour,this.number);
}

List<CardRow> cards = cardData.map(
      (item) => CardRow(
          item['numberOfTasks'] as String,
          item['typeOfTask'] as String,
          item['colour'] as int,
          item['number'] as double,

      ),

).toList();
var cardData = [
  {
  "numberOfTasks": "$numberOfBusiness tasks",
  "typeOfTask": "Business",
    "colour": 0xFF1E1E99,
    "number": 0.5,

},
  {
    "numberOfTasks": "$numberOfPersonal tasks",
    "typeOfTask": "Personal",
    "colour": 0xFFFF70A3,
    "number": 0.2,
  },

];
