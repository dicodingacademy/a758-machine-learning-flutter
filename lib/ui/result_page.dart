import 'package:flutter/material.dart';
import 'package:submission/widget/classification_item.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Result Page'),
      ),
      body: SafeArea(child: const _ResultBody()),
    );
  }
}

class _ResultBody extends StatefulWidget {
  const _ResultBody();

  @override
  State<_ResultBody> createState() => _ResultBodyState();
}

class _ResultBodyState extends State<_ResultBody> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      // todo-02: run the inference model based on user picture
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 8,
      children: [
        Expanded(
          child: Center(
            child: Image.network(
              "https://github.com/dicodingacademy/assets/raw/refs/heads/main/flutter_ml/assets/nasi-lemak.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          // todo-03: show the inference result (food name and the confidence score)
          child: ClassificationItem(item: "Nasi Lemak", value: "89.58%"),
        ),
      ],
    );
  }
}
