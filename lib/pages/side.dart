import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';


class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.only(top: 100,left:25, bottom: 50),
      color: const Color.fromRGBO(22, 40, 122, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  CircularStepProgressIndicator(
                    totalSteps: 100,
                    currentStep: 44,
                    stepSize: 5,
                    selectedColor: Colors.pinkAccent,
                    unselectedColor: Colors.grey,
                    width: 160,
                    height: 160,
                    selectedStepSize: 15,
                    roundedCap: (_, __) => true,
                    child: const CircleAvatar(maxRadius: 80,
                      backgroundImage: AssetImage('assets/images/man.jpg'),
                    ),
                  ),
                  ],
              ),
              const SizedBox(height:15),
              const Text("Joy", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30 ),),
              const SizedBox(height: 10,),
              const Text("Mitchell",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white ,fontSize: 35),),
              const SizedBox(height: 15,),
              RawMaterialButton(
                child: Row(
                  children: [
                    Icon(Icons.bookmark_border,
                        color: Colors.blueAccent[400]!.withOpacity(0.3)),
                    const SizedBox(width: 10,),
                    const Text("Templates",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white60 ,fontSize: 20),),
                  ],
                ),
                onPressed: (){},
              ),
              const SizedBox(height:15),
              RawMaterialButton(
                child: Row(
                  children: [
                    Icon(Icons.widgets_outlined,
                        color: Colors.blueAccent[400]!.withOpacity(0.3)),
                    const SizedBox(width: 10,),
                    const Text("Categories",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white60 ,fontSize: 20),),
                  ],
                ),
                onPressed: (){},
              ),
              const SizedBox(height:15),
              RawMaterialButton(
                child: Row(
                  children: [
                    Icon(Icons.timer,
                        color: Colors.blueAccent[400]!.withOpacity(0.3)),
                    const SizedBox(width: 10,),
                    const Text("Analytics",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white60 ,fontSize: 20),),
                  ],
                ),
                onPressed: (){},
              ),
              const SizedBox(height:15),
              RawMaterialButton(
                child: Row(
                  children: [
                    Icon(Icons.settings_outlined,
                        color: Colors.blueAccent[400]!.withOpacity(0.3)),
                    const SizedBox(width: 10,),
                    const Text("Setting",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white60 ,fontSize: 20),),
                  ],
                ),
                onPressed: (){},
              ),

            ],
          ),

          Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Good",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueAccent[400]!.withOpacity(0.3) ,fontSize: 20),),
              const Text("Consistency",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white70 ,fontSize: 20),),


            ],
          )


        ],
      ),
    );
  }
}
