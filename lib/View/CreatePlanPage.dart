import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trainsmarter/View/AddExercisePage.dart';

class CreatePlanPage extends StatefulWidget {
  const CreatePlanPage({super.key});

  @override
  State<StatefulWidget> createState() => _CreatePlanState();
}

class _CreatePlanState extends State<CreatePlanPage> {
  final PlanNameController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    PlanNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsetsGeometry.only(right: 8),
        actions: [
          TextButton(
            onPressed: null,
            child: Center(
              child: Text(
                "Save",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          iconSize: 20,
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: ListView(
            children: [
              Text(
                "New Plan",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(height: 8),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Plan Name",
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Exercises",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 8),
              Table(

              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) => AddExercisePage(),
                    )
                  );
                },
                child: Center(
                  child: Text(
                    "Add Exercise",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
