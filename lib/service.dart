import 'dart:async';
import 'dart:convert';

import 'package:food_pics/models/photo.dart';
import 'package:food_pics/models/photo_info.dart';
import 'package:http/http.dart';

class FlickrService {
  static const String _url = 'https://api.flickr.com/services/rest';
  static const String _format = 'json';
  static const String _lang = 'en-us';
  static const String _tags = 'food';
  static const String _apiKey = 'fd1a5a3813eea90c0f07df7680501dd2';
  static const String _noJsonCallback = '1';
  static const String _photosMethod = 'flickr.photos.search';
  static const String _getInfoMethod = 'flickr.photos.getinfo';
  static const String _perPage = '10';

  static Future<List<Photo>> getImages([int page = 1]) async {
    List<Photo> list = <Photo>[];
    Response response = await get(Uri.parse(
        '$_url?format=$_format&lang=$_lang&api_key=$_apiKey&nojsoncallback=$_noJsonCallback&method=$_photosMethod&tags=$_tags&per_page=$_perPage&page=${page.toString()}'));
    if (response.statusCode == 200) {
      List body = jsonDecode(response.body)['photos']['photo'];

      for (var e in body) {
        list.add(Photo.fromJson(e));
      }
    }
    return list;
  }

  static Future<PhotoInfo> getInfo(
      {required String photoSecret, required String photoId}) async {
    Response response = await get(Uri.parse(
        '$_url?format=$_format&lang=$_lang&api_key=$_apiKey&nojsoncallback=$_noJsonCallback&method=$_getInfoMethod&photo_id=$photoId&secret=$photoSecret'));
    if (response.statusCode == 200) {
      print('200');
      final body = jsonDecode(response.body)['photo'];
      return PhotoInfo.fromJson(body);
    } else {
      return PhotoInfo();
    }
  }
}
