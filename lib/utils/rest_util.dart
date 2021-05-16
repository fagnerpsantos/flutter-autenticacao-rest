
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'secure_storage_util.dart';

class RestUtil {
  static String urlBase = '10.0.2.2:5000';

  static Future<http.Response> addData(String uri, Map<String, Object> data) async {
    String token = StorageUtil.getString("access_token");
    final response = await http.post(
    Uri.http(urlBase, uri),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + token
      },
      body: jsonEncode(data),
    );
    return response;
  }

  static Future<http.Response> postData(String uri, Map<String, Object> data) async {
    final response = await http.post(
      Uri.http(urlBase, uri),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    return response;
  }

  static Future<http.Response> getData(String uri) async {
    String token = StorageUtil.getString("access_token");
    print(token);
    final response = await http.get(
      Uri.http(urlBase, uri),
      headers: <String, String> {
        'Authorization': 'Bearer ' + token.toString()
      },
    );
    return response;
  }

  static Future<http.Response> getDataId(String uri, String id) async {
    String token = StorageUtil.getString("access_token");
    final response = await http.get(
      Uri.http(urlBase, uri + '/' + id),
      headers: <String, String> {
        'Authorization': 'Bearer ' + token.toString()
      },
    );
    return response;
  }

  static Future<http.Response> removeDataId(String uri, String id) async {
    String token = StorageUtil.getString("access_token");
    final response = await http.delete(
      Uri.http(urlBase, uri + '/' + id),
      headers: <String, String> {
        'Authorization': 'Bearer ' + token.toString()
      },
    );
    return response;
  }

  static Future<http.Response> editData(String uri, Map<String, Object> data,
      String id) async {
    String token = StorageUtil.getString("access_token");
    final response = await http.put(
      Uri.http(urlBase, uri + '/' + id),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + token.toString()
      },
      body: jsonEncode(data),
    );
    return response;
  }

}