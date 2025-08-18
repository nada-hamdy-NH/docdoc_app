import 'package:flutter/material.dart';

class CustomNumberStepper extends StatelessWidget {
  const CustomNumberStepper({
    super.key,
    required this.stepCount,
    required this.activeStep,
    this.onStepReached,
    this.stepRadius = 16.0,
    this.lineLength = 40.0,
    this.lineThickness = 2.0,
    this.completedColor = Colors.green,
    this.currentColor = const Color(0xFF0A63D8), // example blue
    this.futureColor = const Color(0xFFBDBDBD), // example gray
    this.numberTextStyle,
  });

  final int stepCount;
  final int activeStep; // 0-based
  final ValueChanged<int>? onStepReached;
  final double stepRadius;
  final double lineLength;
  final double lineThickness;
  final Color completedColor;
  final Color currentColor;
  final Color futureColor;
  final TextStyle? numberTextStyle;

  @override
  Widget build(BuildContext context) {
    final clampedActive = activeStep.clamp(0, stepCount - 1);

    List<Widget> children = [];
    for (var i = 0; i < stepCount; i++) {
      // Step circle
      final bool isCompleted = i < clampedActive;
      final bool isCurrent = i == clampedActive;
      final bgColor = isCompleted
          ? completedColor
          : (isCurrent ? currentColor : futureColor);
      final textColor =
          (isCompleted || isCurrent) ? Colors.white : Colors.black87;

      children.add(
        GestureDetector(
          onTap: onStepReached == null ? null : () => onStepReached!(i),
          child: Container(
            width: stepRadius * 2,
            height: stepRadius * 2,
            decoration: BoxDecoration(
              color: bgColor,
              shape: BoxShape.circle,
              border:
                  isCurrent ? Border.all(color: Colors.white, width: 2) : null,
            ),
            alignment: Alignment.center,
            child: Text(
              '${i + 1}',
              style: numberTextStyle ??
                  TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
            ),
          ),
        ),
      );

      // Line between steps (not after last)
      if (i != stepCount - 1) {
        final lineColor = i < clampedActive ? completedColor : futureColor;
        children.add(Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 16.0, top: 16.0),
          child: SizedBox(
              width: lineLength,
              child: Center(
                child: Container(
                  height: lineThickness,
                  color: lineColor,
                ),
              )),
        ));
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }
}
