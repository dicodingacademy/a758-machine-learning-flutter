import 'package:flutter/material.dart';

final Color primaryTextColor = Colors.grey.shade300;
final Color secondaryTextColor = Colors.black;

class FormFieldCounter extends StatelessWidget {
  final String titleField;
  final num number;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;

  const FormFieldCounter({
    super.key,
    required this.titleField,
    required this.number,
    this.onIncrement,
    this.onDecrement,
  });

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
                  ).textTheme.titleMedium?.copyWith(color: secondaryTextColor),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  _ActionButton(
                    icon: Icons.remove,
                    onPressed: onDecrement,
                    side: _ButtonSide.left,
                  ),
                  Expanded(
                    child: ColoredBox(
                      color: primaryTextColor,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          number.toStringAsFixed(2),
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: secondaryTextColor),
                        ),
                      ),
                    ),
                  ),
                  _ActionButton(
                    icon: Icons.add,
                    onPressed: onIncrement,
                    side: _ButtonSide.right,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final _ButtonSide side;

  const _ActionButton({
    required this.icon,
    required this.onPressed,
    required this.side,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadiusDirectional.horizontal(
            start: side.isLeft ? Radius.circular(100) : Radius.zero,
            end: side.isLeft ? Radius.zero : Radius.circular(100),
          ),
          color: primaryTextColor,
        ),
        child: Icon(icon, color: secondaryTextColor),
      ),
    );
  }
}

enum _ButtonSide {
  left,
  right;

  bool get isLeft => this == _ButtonSide.left;
}
