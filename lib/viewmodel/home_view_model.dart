import 'package:flutter/material.dart';

class HomeViewModel {
  final int OFFICE_HOURS_IN_MINUTES = 8 * 60;
  final int MIN_CLOSING_TIME_IN_MINUTES = 17 * 60;

  TimeOfDay? initTime;
  TimeOfDay? lunchTime;

  String? returnTime;

  void calculateReturnTime(BuildContext context) {
    if (initTime == null || lunchTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Selecione os horários de entrada e almoço primeiro!'),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    final entryInMinutes = (initTime!.hour * 60) + initTime!.minute;
    final breakInMinutes = (lunchTime!.hour * 60) + lunchTime!.minute;

    final workedMinutes = breakInMinutes - entryInMinutes;

    final remainingMinutes = OFFICE_HOURS_IN_MINUTES - workedMinutes;

    int returnInMinutes = MIN_CLOSING_TIME_IN_MINUTES - remainingMinutes;

    if (returnInMinutes < breakInMinutes + 60) {
      returnInMinutes = breakInMinutes + 60;
    }

    final returnHour = (returnInMinutes ~/ 60).toString().padLeft(2, '0');
    final returnMinute = (returnInMinutes % 60).toString().padLeft(2, '0');

    returnTime = "$returnHour:$returnMinute";
  }

  Future<void> selectInitTime(BuildContext context) async {
    final picked = await selectTime(context, initTime);
    if (picked != null) {
      initTime = picked;
    }
  }

  Future<void> selectLunchTime(BuildContext context) async {
    if (initTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Selecione o horário de entrada primeiro!'),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    final picked = await selectTime(context, lunchTime);

    if (picked != null) {
      final int initTotalMinutes = (initTime!.hour * 60) + initTime!.minute;
      final int lunchTotalMinutes = (picked.hour * 60) + picked.minute;

      if (lunchTotalMinutes <= initTotalMinutes) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('A pausa pro almoço deve ser DEPOIS da entrada!'),
            backgroundColor: Colors.redAccent,
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }

      lunchTime = picked;
    }
  }

  Future<TimeOfDay?> selectTime(
    BuildContext context,
    TimeOfDay? initialTime,
  ) async {
    final Future<TimeOfDay?> selectedTime = showTimePicker(
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Directionality(textDirection: TextDirection.rtl, child: child!);
      },
    );
    return selectedTime;
  }
}
