import 'package:flutter/material.dart';

class CustomStep {
  const CustomStep({
    required this.title,
    this.subtitle,
    required this.body,
  });

  final String title;
  final String? subtitle;
  final String body;
}

class CustomStepper extends StatefulWidget {
  const CustomStepper({
    super.key,
    required this.steps,
    this.currentStep = 0,
    this.onStepTapped,
    this.onStepContinue,
    this.onStepBack,
  }) : assert(
          currentStep >= 0 && currentStep < steps.length,
          'currentStep must be inside a valid range',
        );

  final List<CustomStep> steps;
  final int currentStep;
  final void Function(int)? onStepTapped;
  final VoidCallback? onStepContinue;
  final VoidCallback? onStepBack;

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper>
    with TickerProviderStateMixin {
  late List<GlobalKey> _keys;

  @override
  void initState() {
    super.initState();
    _keys = List.generate(widget.steps.length, (_) => GlobalKey());
  }

  bool _isLast(int index) => index == widget.steps.length - 1;

  Widget _line(bool isVisible) {
    return Container(
      width: 1,
      height: 18,
      color: isVisible ? Colors.grey.withOpacity(0.7) : Colors.transparent,
    );
  }

  Widget _circle(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: 24,
      height: 24,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: widget.currentStep >= index
              ? Colors.blue
              : Colors.grey.withOpacity(0.7),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: (widget.currentStep > index)
              ? const Icon(Icons.check, color: Colors.white, size: 18)
              : Text(
                  '${index + 1}',
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                ),
        ),
      ),
    );
  }

  Widget _buttons() {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: widget.onStepContinue,
            child: const Text('CONTINUE'),
          ),
          TextButton(
            onPressed: widget.onStepBack,
            child: Text(
              'BACK',
              style: TextStyle(
                color: widget.currentStep == widget.steps.length - 1
                    ? Colors.blueAccent
                    : Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _header(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Column(
            children: [
              _line(index != 0),
              _circle(index),
              _line(!_isLast(index)),
            ],
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsetsDirectional.only(start: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.steps[index].title,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  if (widget.steps[index].subtitle != null)
                    Container(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        widget.steps[index].subtitle!,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _body(int index) {
    return Stack(
      children: [
        Positioned(
          left: 24,
          top: 0,
          bottom: 0,
          child: SizedBox(
            width: 24,
            child: Center(
              child: SizedBox(
                width: _isLast(index) ? 0 : 1,
                child: Container(color: Colors.grey.withOpacity(0.7)),
              ),
            ),
          ),
        ),
        AnimatedCrossFade(
          firstChild: Container(height: 0),
          secondChild: Container(
            padding: const EdgeInsetsDirectional.only(
              start: 60,
              end: 24,
              bottom: 24,
            ),
            child: Column(
              children: [
                Text(widget.steps[index].body),
                _buttons(),
              ],
            ),
          ),
          firstCurve: Curves.fastOutSlowIn,
          secondCurve: Curves.fastOutSlowIn,
          sizeCurve: Curves.fastOutSlowIn,
          crossFadeState: widget.currentStep == index
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 300),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.steps.length,
      itemBuilder: (_, idx) => Column(
        key: _keys[idx],
        children: [
          InkWell(
            onTap: () {
              Scrollable.ensureVisible(
                _keys[idx].currentContext!,
                curve: Curves.bounceIn,
                duration: const Duration(milliseconds: 300),
              );
              widget.onStepTapped?.call(idx);
            },
            child: _header(idx),
          ),
          _body(idx),
        ],
      ),
    );
  }
}
