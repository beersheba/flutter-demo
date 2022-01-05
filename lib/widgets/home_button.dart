import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const HomeButton({required this.text, this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          const Icon(
            Icons.arrow_forward_outlined,
            size: 20,
          )
        ],
      ),
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).primaryColor,
        onPrimary: Colors.black,
        elevation: 0,
      ),
      onPressed: onPressed,
    );
  }
}
