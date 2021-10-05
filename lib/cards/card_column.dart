
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/pages/homescreen.dart';

class SelectableWidgetItem extends StatefulWidget {
  final CardColumn _listItem;

  const SelectableWidgetItem(this._listItem);

  @override
  _SelectableWidgetItemState createState() => _SelectableWidgetItemState();
}

class _SelectableWidgetItemState extends State<SelectableWidgetItem> {
  String get _task => widget._listItem.task;
  int get _colour => widget._listItem.colour;

  bool get _isSelected => widget._listItem.isSelected;
  @override
  Widget build(BuildContext context) {
          return Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.only(top: 10),
            height: 80,
            width: 400,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 0.5,
                  blurRadius: 0.5,
                  offset: const Offset(0, 4),
                ),
              ],
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
            ),
            child: ListTile(
              key:  Key(_task.toString()),
              onTap: () {
                setState(() {
                  widget._listItem.isSelected = !_isSelected;
                });
              },
              leading: Icon(
                _isSelected
                    ? Icons.check_circle
                    : Icons.radio_button_off,
                color: _isSelected
                    ? Color(_colour)
                    .withOpacity(0.4)
                    : Color(_colour),
                size: 25,
              ),
              title: Text(
                _task,
                style: _isSelected
                    ? const TextStyle(
                    fontSize: 20,
                    decoration:
                    TextDecoration.lineThrough)
                    : const TextStyle(fontSize: 20),
              ),
            ),
          );

  }
}


class CardColumn extends HomeScreen{
  String task;
  int colour;
  bool isSelected;
  
   CardColumn(this.task, this.colour,{this.isSelected= false});
}
List<CardColumn> cardList=[];

/*
* ListView.builder(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(10),
        itemCount: cardList.length,
        itemBuilder: (context, index) {
          return Dismissible(
            background: Icon(Icons.delete),
            key: Key(cardList[index].task.toString()),
            onDismissed: (direction) {
              setState(() {
                selected = index;
                cardList.removeAt(index);
                selected=100;
              });
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.only(top: 10),
              height: 80,
              width: 220,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 0.5,
                    blurRadius: 0.5,
                    offset: const Offset(0, 4),
                  ),
                ],
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              child: ListTile(
                key:  Key(cardList[index].task.toString()),
                onTap: () {
                  setState(() {
                    selected = index;
                    isTapped=!isTapped;
                  });
                },
                leading: Icon(
                  selected==index
                      ? Icons.check_circle
                      : Icons.radio_button_off,
                  color: selected==index
                      ? Color(cardList.elementAt(index).colour)
                      .withOpacity(0.4)
                      : Color(cardList[index].colour),
                  size: 25,
                ),
                title: Text(
                  cardList.elementAt(index).task,
                  style: selected==index
                      ? const TextStyle(
                      fontSize: 20,
                      decoration:
                      TextDecoration.lineThrough)
                      : const TextStyle(fontSize: 20),
                ),
              ),
            ),
          );
        });*/
