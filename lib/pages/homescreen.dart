import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/cards/card_column.dart';
import 'package:todo_app/cards/card_row.dart';
import 'newtask.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = true;
  double radius = 0;
  bool isTapped = false;
  int selected = 100;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: Colors.grey[100],
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isDrawerOpen
                      ? IconButton(
                          icon: const Icon(Icons.drag_handle),
                          onPressed: () {
                            setState(() {
                              isDrawerOpen = false;
                              xOffset = 300;
                              yOffset = 85;
                              scaleFactor = 0.85;
                              radius = 40;
                            });
                          },
                          iconSize: 35,
                        )
                      : IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            setState(() {
                              isDrawerOpen = true;
                              xOffset = 0;
                              yOffset = 0;
                              scaleFactor = 1;
                              radius = 0;
                            });
                          },
                          iconSize: 35,
                        ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.search_outlined),
                        onPressed: () {},
                        iconSize: 35,
                      ),
                      IconButton(
                        icon: const Icon(Icons.notifications_none_outlined),
                        onPressed: () {},
                        iconSize: 35,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 750,
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "What's up Joy!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              fontFamily: 'Raleway'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'CATEGORIES',
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 15,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.only(
                            left: 18, right: 6, bottom: 10),
                        itemCount: cards.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 15),
                            height: 160,
                            width: 230,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                            ),
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  top: 35,
                                  left: 20,
                                  child: Text(
                                    cards[index].numberOfTasks,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black38),
                                  ),
                                ),
                                Positioned(
                                    top: 60,
                                    left: 20,
                                    child: Text(
                                      cards[index].typeOfTask,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    )),
                                Positioned(
                                    top: 120,
                                    left: 20,
                                    child: SizedBox(
                                      width: 200,
                                      height: 5,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(2)),
                                        child: LinearProgressIndicator(
                                          value: cards[index].number,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Color(cards[index].colour)),
                                          backgroundColor: Colors.grey[100],
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      'TODAY\'S TASKS',
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      height: 400,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          padding: const EdgeInsets.all(10),
                          itemCount: cardList.length,
                          itemBuilder: (context, index) {
                            return Dismissible(
                              background: Container(
                                  padding: EdgeInsets.only(right: 25),
                                  alignment: Alignment.centerRight,
                                  child: const Icon(Icons.delete)),
                              key: Key(cardList[index].task.toString()),
                              onDismissed: (direction) {
                                setState(() {
                                  cardList.removeAt(index);
                                });
                              },
                              child: SelectableWidgetItem(CardColumn(
                                  cardList[index].task,
                                  cardList[index].colour)),
                            );
                          })),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.only(right: 15, bottom: 40),
              child: FloatingActionButton(
                backgroundColor: Colors.blue[20],
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NewTaskScreen()),
                  ).then((value) => {setState(() {})});
                },
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
