import 'package:flutter/material.dart';

import 'bloc/alert_cubit.dart';
import 'constants/height_constant.dart';

class AlertWidget extends StatelessWidget {
  const AlertWidget({
    Key? key,
    required this.alertData,
  }) : super(key: key);

  final AlertData alertData;
  @override
  Widget build(BuildContext context) {
    final statusbarHeight = MediaQuery.of(context).padding.top;
    return Material(
      child: Ink(
        color: alertData.backgroundColor,
        height: kAlertHeight + statusbarHeight,
        child: Column(
          children: [
            SizedBox(height: statusbarHeight),
            Expanded(
              child: Row(
                children: [
                  const SizedBox(width: 28.0),
                  IconTheme(
                    data: const IconThemeData(
                      color: Colors.white,
                      size: 36,
                    ),
                    child: Icon(alertData.leading),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: DefaultTextStyle(
                      style: const TextStyle(color: Colors.white),
                      child: Text(alertData.child),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 28.0),
          ],
        ),
      ),
    );
  }
}
