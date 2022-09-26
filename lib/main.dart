import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stepper/custom_stepper.dart';
import 'package:stepper/models/step_model.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stepper',
      home: Scaffold(
        appBar: AppBar(title: const Text('Stepper')),
        body: const Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _index = 0;
  List<StepModel> _stepsData = [];

  static const platform = MethodChannel('com.example.stepper/stepper_data');
  Future<void> _getStepperData() async {
    String? data;
    try {
      data = await platform.invokeMethod('getStepperData') as String;
    } on PlatformException catch (_) {}

    if (data != null) {
      setState(() {
        _stepsData = (jsonDecode(data!) as List<dynamic>)
            .map<StepModel>(
              (json) => StepModel.fromJson(json as Map<String, dynamic>),
            )
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final amountOfSteps = _stepsData.length;
    if (_stepsData.isEmpty) {
      _getStepperData();
      return const CircularProgressIndicator();
    } else {
      return CustomStepper(
        currentStep: _index,
        onStepBack: () {
          if (_index > 0) {
            setState(() => _index--);
          }
        },
        onStepContinue: () {
          if (_index <= amountOfSteps - 2) {
            setState(() => _index++);
          }
        },
        onStepTapped: (index) => setState(() => _index = index),
        steps: _stepsData.map((step) {
          return CustomStep(
            title: step.title ?? '',
            body: step.content ?? '',
            subtitle: step.subtitle,
          );
        }).toList(),
      );
    }
  }
}
