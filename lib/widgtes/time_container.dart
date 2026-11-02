import 'package:flutter/material.dart';

class TimeContainer extends StatelessWidget {
  final bool isTimeOnLeft;
  final TimeOfDay? time;
  final VoidCallback onPressed;
  final String label;

  const TimeContainer(
    this.time, {
    super.key,
    this.isTimeOnLeft = true,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    Widget buildTimeContent(TimeOfDay? time) {
      if (time == null) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Toque no relógio",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.6),
            ),
          ),
        );
      }

      final hours = time.hour.toString().padLeft(2, '0');
      final minutes = time.minute.toString().padLeft(2, '0');

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$hours:$minutes",
            style: TextStyle(
              fontSize: 44,
              fontWeight: FontWeight.w900,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.8),
            ),
          ),
        ],
      );
    }

    return SizedBox(
      width: double.infinity,
      height: 130,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 130,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 15,
                  spreadRadius: 2,
                  offset: const Offset(4, 4),
                ),
              ],
            ),
            child: Align(
              alignment: isTimeOnLeft
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: SizedBox(
                width: 120,
                child: Center(
                  child: IconButton(
                    onPressed: onPressed,
                    iconSize: 42,
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white.withValues(alpha: 0.5),
                      padding: const EdgeInsets.all(12),
                    ),
                    icon: Icon(
                      Icons.watch_later_outlined,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ),
          ),

          Align(
            alignment: isTimeOnLeft
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.12),
                    blurRadius: 15,
                    spreadRadius: 1,
                    offset: Offset(isTimeOnLeft ? 4 : -4, 4),
                  ),
                ],
              ),
              width: 230,
              height: 130,
              child: Center(child: buildTimeContent(time)),
            ),
          ),
        ],
      ),
    );
  }
}
