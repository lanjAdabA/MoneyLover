import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Addpage extends StatefulWidget {
  const Addpage({super.key});

  @override
  State<Addpage> createState() => _AddpageState();
}

class _AddpageState extends State<Addpage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(child: Text("add")),
    );
  }
}
