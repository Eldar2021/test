import 'package:dio/dio.dart';
import 'package:test_app/model/test_model.dart';
// import 'package:http/http.dart' as http;

class TestRepo {
  final Dio dio = Dio();

  Future<List<HydraMember>?> fetchTests() async {
    try {
      final response = await dio.get(
        "https://test-docs.stores.kg/api/categories.json",
      );
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => HydraMember.fromJson(e))
            .toList();
      }
    } catch (e) {
      print("Error _fetching posts el $e");
    }
  }
}
