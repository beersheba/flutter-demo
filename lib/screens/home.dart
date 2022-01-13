import 'package:flutter/material.dart';
import 'package:home_task/common/const.dart';
import 'package:home_task/widgets/home_button.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text(
          titleMain,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(0, 5),
                blurRadius: 9,
                color: Colors.black26,
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HomeButton(
                text: title1,
                onPressed: () {
                  Navigator.pushNamed(context, tilesScreenRoute);
                },
              ),
              HomeButton(
                text: title2,
                onPressed: () {
                  Navigator.pushNamed(context, colorListScreenRoute);
                },
              ),
              HomeButton(
                text: title3,
                onPressed: () {
                  Navigator.pushNamed(context, codelabScreenRoute);
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
      ),
    );
  }
}
