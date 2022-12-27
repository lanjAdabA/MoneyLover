import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PlanningPage extends StatefulWidget {
  const PlanningPage({super.key});

  @override
  State<PlanningPage> createState() => _PlanningPageState();
}

class _PlanningPageState extends State<PlanningPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text("Planning"),
      ),
    );
  }
}
