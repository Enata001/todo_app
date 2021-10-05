import 'package:flutter/material.dart';
import 'package:todo_app/cards/card_column.dart';

int numberOfBusiness=0;
int numberOfPersonal=0;

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  _NewTaskScreenState createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  final myController = TextEditingController();
  int colorTask = 0xFFFF70A3;
  bool taskType = false;




  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 60),
            child: Column(children: <Widget>[
              Container(
                margin: const EdgeInsets.only(right: 15),
                alignment: Alignment.topRight,
                child: OutlinedButton(
                    child: const Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(
                        context,
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(15.0),
                    )),
              ),

              const SizedBox(height: 200),
              Container(
                  margin: const EdgeInsets.only(left: 40),
                  height: 120,
                  child: TextFormField(
                    style: const TextStyle(
                      fontFamily: 'Open Sans',
                      color: Color(0xFF455A64),
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                    ),
                    expands: true,
                    maxLines: null,
                    minLines: null,
                    controller: myController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter new task',
                      hintStyle: TextStyle(
                        fontFamily: 'Open Sans',
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontSize: 25,
                      ),
                    ),
                  )),
              Container(
                  padding: const EdgeInsets.only(left: 70),
                  child: Row(
                    children: [
                      OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.grey,
                          size: 25,
                        ),
                        label: const Text(
                          "Today",
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        ),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        ),
                      ),
                      const SizedBox(width: 5),

                      OutlinedButton(
                        child:  Icon(
                            Icons.radio_button_checked_outlined,
                            color:taskType? Colors.blue : Colors.pinkAccent),

                        onPressed: ()  {

                          setState(() {
                            taskType=!taskType;
                            colorTask =  taskType?0xFF003DAE:0xFFFF70A3;


                          });


                        },
                            style: OutlinedButton.styleFrom(
                            shape: const CircleBorder(),

                            padding: const EdgeInsets.all(20.0),

                          ),

                      ),
                    ],
                  )),
              const SizedBox(height: 100),
              Container(
                  padding: const EdgeInsets.only(left: 100),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.folder_open_sharp)),
                      const SizedBox(width: 30),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.flag_outlined)),
                      const SizedBox(width: 30),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.check)),
                    ],
                  )),
              const SizedBox(height: 100),
              Container(
                margin: const EdgeInsets.only(right: 30),
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade700,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.shade200,
                        spreadRadius: 0.1,
                        blurRadius: 2,
                        offset: const Offset(-0.5, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.only(left: 35),
                  child: Row(
                    children: [
                      RawMaterialButton(
                        onPressed: () {

                          setState(() {

                            String userInput = myController.text;
                            if (userInput == ""){}
                            else {
                              cardList.add(
                                CardColumn(userInput, colorTask),
                              );
                              taskType? numberOfBusiness++ : numberOfPersonal++;
                            }
                            Navigator.pop(context);

                          });
                        },
                        child: const Text(
                          'New Task',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.keyboard_arrow_up,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}
