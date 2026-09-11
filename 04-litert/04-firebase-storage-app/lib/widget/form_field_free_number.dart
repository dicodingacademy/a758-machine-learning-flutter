import 'package:flutter/material.dart';

class FormFieldFreeNumber extends StatelessWidget {
  final String titleField;
  final TextEditingController? controller;
  final Color primaryColor = Colors.grey.shade300;
  final Color secondaryColor = Colors.black;

  FormFieldFreeNumber({super.key, required this.titleField, this.controller});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  titleField,
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(color: secondaryColor),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: TextField(
                controller: controller,
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: secondaryColor),
                decoration: InputDecoration(
                  fillColor: primaryColor,
                  filled: true,
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide.none,
                  ),
                  suffixText: "sqft",
                  hintText: "0",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
