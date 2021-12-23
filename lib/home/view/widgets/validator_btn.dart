import 'package:flutter/material.dart';

class ValidatorButton extends StatelessWidget {
  final bool enabled;
  final String text;
  final Function? onPressed;
  const ValidatorButton({
    Key? key,
    this.enabled = false,
    this.text = '',
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: enabled ? onPressed as void Function() : null,
      child: Text(
        'Validate CPF',
        style: TextStyle(
          color: enabled ? Colors.black : Colors.grey[300],
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          enabled ? Colors.white : Colors.grey[500],
        ),
      ),
    );
  }
}
