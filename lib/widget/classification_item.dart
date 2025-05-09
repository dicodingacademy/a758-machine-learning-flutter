import 'package:flutter/material.dart';

class ClassificationItem extends StatelessWidget {
  final String item;
  final String value;

  const ClassificationItem({
    super.key,
    required this.item,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Text(item, style: Theme.of(context).textTheme.headlineMedium),
          const Spacer(),
          Text(value, style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}

class ClassificationItemShimmer extends StatelessWidget {
  const ClassificationItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          ColoredBox(
            color: Colors.black,
            child: Text(
              "Food name",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          const Spacer(),
          ColoredBox(
            color: Colors.black,
            child: Text(
              "34%",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ],
      ),
    );
  }
}
