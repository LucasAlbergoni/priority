import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'alert_messenger.dart';
import 'bloc/alert_cubit.dart';

void main() => runApp(const AlertPriorityApp());

class AlertPriorityApp extends StatelessWidget {
  const AlertPriorityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Priority',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        iconTheme: const IconThemeData(size: 16.0, color: Colors.white),
        elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
            minimumSize: MaterialStatePropertyAll(Size(110, 40)),
          ),
        ),
      ),
      home: BlocProvider<AlertCubit>(
        create: (context) => AlertCubit(),
        child: Builder(builder: (context) {
          final alertCubit = BlocProvider.of<AlertCubit>(context);

          return AlertMessenger(
            child: Scaffold(
              backgroundColor: Colors.grey[200],
              appBar: AppBar(
                title: const Text('Alerts'),
                centerTitle: true,
              ),
              body: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: BlocBuilder<AlertCubit, AlertData?>(
                          builder: (context, alertDataState) {
                        return Center(
                          child: Text(
                            alertDataState?.child ?? 'No Alert',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 16.0,
                            ),
                          ),
                        );
                      }),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    alertCubit.showAlert(
                                      alert: const AlertData(
                                        backgroundColor: Colors.red,
                                        leading: Icons.error,
                                        priority: AlertPriority.error,
                                        child:
                                            'Oops, ocorreu um erro. Pedimos desculpas.',
                                      ),
                                    );
                                  },
                                  style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.red),
                                  ),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.error),
                                      SizedBox(width: 4.0),
                                      Text('Error'),
                                    ],
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    alertCubit.showAlert(
                                      alert: const AlertData(
                                        backgroundColor: Colors.amber,
                                        leading: Icons.warning,
                                        priority: AlertPriority.warning,
                                        child: 'Atenção! Você foi avisado.',
                                      ),
                                    );
                                  },
                                  style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.amber),
                                  ),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.warning_outlined),
                                      SizedBox(width: 4.0),
                                      Text('Warning'),
                                    ],
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    alertCubit.showAlert(
                                      alert: const AlertData(
                                        backgroundColor: Colors.green,
                                        leading: Icons.info,
                                        priority: AlertPriority.info,
                                        child:
                                            'Este é um aplicativo escrito em Flutter.',
                                      ),
                                    );
                                  },
                                  style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Colors.lightGreen),
                                  ),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.info_outline),
                                      SizedBox(width: 4.0),
                                      Text('Info'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24.0,
                                vertical: 16.0,
                              ),
                              child: ElevatedButton(
                                onPressed: alertCubit.hideAlert,
                                child: const Text('Hide alert'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
