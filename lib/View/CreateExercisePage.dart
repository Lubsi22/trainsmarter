import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/multi_dropdown.dart';

class CreateExercisePage extends StatefulWidget {
  const CreateExercisePage({super.key});

  @override
  State<StatefulWidget> createState() => _CreatePageState();

}

class _CreatePageState extends State<CreateExercisePage>{

  @override
  Widget build(BuildContext context) {

    var Muscles = [
      DropdownItem(label: 'Chest', value: null),
      DropdownItem(label: 'Back', value: null),
      DropdownItem(label: 'Biceps', value: null),
      DropdownItem(label: 'Triceps', value: null),
      DropdownItem(label: 'Shoulders', value: null),
      DropdownItem(label: 'Quadriceps', value: null),
      DropdownItem(label: 'Hamstrings', value: null),
      DropdownItem(label: 'Calves', value: null),

    ];

    var equipment = [
      DropdownItem(label: 'Barbell', value: null),
      DropdownItem(label: 'Dumbell', value: null),
      DropdownItem(label: 'Body weight', value: null),
      DropdownItem(label: 'Other', value: null),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("New Exercise", style: TextStyle(
           fontWeight: FontWeight.bold, fontSize: 24
        ),),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          iconSize: 20,
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      body: SafeArea(
          child: Padding(
              padding: EdgeInsetsGeometry.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Exercise Name", style: TextStyle( fontWeight: FontWeight.bold, fontSize: 20),),
                  SizedBox(height: 8,),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),

                  SizedBox(height: 16,),
                  Text("Primary Muscle", style: TextStyle( fontWeight: FontWeight.bold, fontSize: 20),),


                ],
              ),
          )
      ),
    );
  }

}