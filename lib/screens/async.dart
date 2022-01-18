import 'package:flutter/material.dart';
import 'package:home_task/common/api.dart' as api;
import 'package:home_task/common/const.dart';
import 'package:home_task/model/photo.dart';
import 'package:home_task/screens/base_screen.dart';

class AsyncScreen extends StatefulWidget {
  const AsyncScreen({Key? key}) : super(key: key);

  @override
  _AsyncScreenState createState() => _AsyncScreenState();
}

class _AsyncScreenState extends State<AsyncScreen> {
  Future<List<Photo>>? _futureList;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: Center(
        child: FutureBuilder<List<Photo>>(
          future: _futureList,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('An error has occurred!');
            } else if (snapshot.hasData) {
              List<Photo> photos = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16.0),
                  itemCount: photos.length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Stack(
                        fit: StackFit.passthrough,
                        alignment: Alignment.bottomCenter,
                        children: [
                          Image.network(
                            photos[index].url,
                            height: MediaQuery.of(context).size.height / 3,
                            fit: BoxFit.none,
                          ),
                          Container(
                            color: Colors.blue,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0, bottom: 8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(photos[index].title,
                                        style: expandedFont),
                                  ),
                                  SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 4)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              );
            } else {
              return const Text('Press button to load the data');
            }
          },
        ),
      ),
      title: title4,
      onFabPressed: () {
        _fetchData();
      },
    );
  }

  void _fetchData() {
    setState(() {
      _futureList = api.fetchPhotos();
    });
  }
}
