import 'package:flutter/material.dart';
import 'package:home_task/const.dart';
import 'package:home_task/widgets/home_button.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HomeButton(
              text: title1,
              onPressed: () {
                //todo task 2
              },
            ),
            HomeButton(
              text: title2,
              onPressed: () {
                //todo task 3
              },
            ),
            HomeButton(
              text: title3,
              onPressed: () {
                //todo task 4
              },
            ),
            HomeButton(
              text: title4,
              onPressed: () {
                //todo task 5
              },
            ),
          ],
        ),
      ),
    );
  }
}
