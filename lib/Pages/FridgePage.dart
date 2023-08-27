import 'package:flutter/material.dart';
import 'package:fridge_expiry/Components/FridgeList.dart';

class FridgePage extends StatefulWidget {
  const FridgePage({super.key});
  @override
  State<FridgePage> createState() => _FridgePageState();
}

class _FridgePageState extends State<FridgePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FridgeList(),
    );
  }
}
