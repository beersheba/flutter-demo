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
  late Future<List<Photo>> _futureList;

  @override
  void initState() {
    super.initState();
    _futureList = api.fetchPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: Center(
        child: FutureBuilder<List<Photo>>(
          future: _futureList,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('An error has occurred!'),
              );
            } else if (snapshot.hasData) {
              List<Photo> photos = snapshot.data!;
              return ListView.builder(
                itemCount: photos.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Stack(
                        fit: StackFit.passthrough,
                        alignment: Alignment.bottomCenter,
                        children: [
                          Image.network(photos[index].url,
                              height: MediaQuery.of(context).size.height / 3,
                              fit: BoxFit.none),
                          Container(
                            height: MediaQuery.of(context).size.height / 12,
                            color: Colors.blue,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                photos[index].title,
                                style: biggerFont,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
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
