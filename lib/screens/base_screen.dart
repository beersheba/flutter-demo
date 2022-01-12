import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  final Widget? body;
  final String title;
  final VoidCallback? onFabPressed;

  const BaseScreen(
      {required this.body, required this.title, this.onFabPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_outlined),
              onPressed: () => Navigator.pop(context),
            );
          },
        ),
        title: Text(title),
      ),
      body: body,
      floatingActionButton: onFabPressed != null
          ? FloatingActionButton(
              child: const Icon(Icons.edit_outlined),
              onPressed: onFabPressed,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
            )
          : null,
    );
  }
}
