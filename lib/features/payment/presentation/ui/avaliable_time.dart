import 'package:docdoc/features/payment/presentation/ui/time_container.dart';
import 'package:flutter/material.dart';

class AvailableTimeGrid extends StatelessWidget {
  final List<String> availableTimes; // <-- بقت List
  final int selectedContainer;
  final ValueChanged<int> onSelect;

  const AvailableTimeGrid({
    super.key,
    required this.availableTimes,
    required this.selectedContainer,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(
        availableTimes.length, // هنا بقى عدد الـ slots
        (index) => Padding(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () => onSelect(index),
            child: TimeContainer(
              selectedContainer: selectedContainer,
              availableTime: availableTimes[index], // مرر وقت محدد
              index: index,
            ),
          ),
        ),
      ),
    );
  }
}
