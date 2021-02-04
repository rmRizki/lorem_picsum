import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lorem_picsum/src/models/photo.dart';

class LoremPicsum {
  final String _baseUrl = 'picsum.photos';

  Future<dynamic> _getRequest(String url, {Map<String, String> query}) async {
    var uri = Uri.https(_baseUrl, url, query);
    var response = await http.get('$uri');
    if (response.statusCode == 200) {
      print('response : ${response.body}');
      return response.body;
    } else {
      throw Exception('Request failed with status: ${response.statusCode}.');
    }
  }

  /// Get a list of photos.
  ///
  /// The API will return 30 items per page by default.
  /// To request another page, use the [page] parameter.
  /// To change the amount of items per page, use the [limit] parameter.
  Future<List<Photo>> getImageList({int page = 1, int limit = 30}) async {
    var url = '/v2/list';
    var query = {'page': '$page', 'limit': '$limit'};
    var response = await _getRequest(url, query: query);

    var photoList = <Photo>[];
    List json = jsonDecode(response);
    json.forEach((e) {
      var photo = Photo.fromJson(e);
      photoList.add(photo);
    });

    return photoList;
  }

  /// Get detailed information about a specific image by providing [id].
  Future<Photo> getImageDetail(int id) async {
    var url = '/id/$id/info';
    var response = await _getRequest(url);
    return Photo.fromJson(jsonDecode(response));
  }

  /// get random image.
  ///
  /// to apply grayscale effect, set [grayscale] to `true`.
  /// to apply blur effect, provide an `integer` between `1` and `10`.
  String getImage(int width, int height, {bool grayscale = false, int blur}) {
    var url = '/$width/$height';
    var query = {
      if (grayscale) 'grayscale': '',
      if (blur != null) 'blur': '$blur'
    };
    var uri = Uri.https(_baseUrl, url, query);
    return uri.toString();
  }

  /// get specific image by providing [id].
  ///
  /// to apply grayscale effect, set [grayscale] to `true`.
  /// to apply blur effect, provide an `integer` between `1` and `10`.
  String getSpecificImage(int id, int width, int height,
      {bool grayscale = false, int blur}) {
    var url = '/id/$id/$width/$height';
    var query = {
      if (grayscale) 'grayscale': '',
      if (blur != null) 'blur': '$blur'
    };
    var uri = Uri.https(_baseUrl, url, query);
    return uri.toString();
  }

  /// Get the same random image every time based on a seed, by providing [seed].
  ///
  /// to apply grayscale effect, set [grayscale] to `true`.
  /// to apply blur effect, provide an `integer` between `1` and `10`.
  String getStaticImage(String seed, int width, int height,
      {bool grayscale = false, int blur}) {
    var url = '/seed/$seed/$width/$height';
    var query = {
      if (grayscale) 'grayscale': '',
      if (blur != null) 'blur': '$blur'
    };
    var uri = Uri.https(_baseUrl, url, query);
    return uri.toString();
  }
}
