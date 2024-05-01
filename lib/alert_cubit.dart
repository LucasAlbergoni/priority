import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlertData {
  final Color backgroundColor;
  final String child;
  final IconData leading;
  final AlertPriority priority;

  const AlertData({
    required this.backgroundColor,
    required this.child,
    required this.leading,
    required this.priority,
  });
}

enum AlertPriority {
  error(2),
  warning(1),
  info(0);

  const AlertPriority(this.value);
  final int value;
}

class AlertCubit extends Cubit<AlertData?> {
  AlertCubit() : super(null);

  final alertList = <AlertData>[];

  AlertData? get firstAlert => alertList.isNotEmpty ? alertList.first : null;
  void showAlert({required AlertData alert}) {
    if (alertList.contains(alert)) {
      return;
    }
    alertList.add(alert);

    alertList.sort((a, b) => a.priority.index.compareTo(b.priority.index));
    emit(firstAlert);
  }

  void hideAlert() {
    if (alertList.isNotEmpty) {
      alertList.removeAt(0);
    }
    emit(firstAlert);
  }
}
