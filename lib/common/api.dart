import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:home_task/model/photo.dart';
import 'package:http/http.dart' as http;

const PHOTOS_URL = 'https://jsonplaceholder.typicode.com/photos';

Future<List<Photo>> fetchPhotos() async {
  final response = await http.get(Uri.parse(PHOTOS_URL));
  if (response.statusCode == 200) {
    return compute(_parsePhotos, response.body);
  } else {
    throw Exception('Failed to fetch photos');
  }
}

List<Photo> _parsePhotos(String body) {
  final parsed = jsonDecode(body) as List;
  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}
