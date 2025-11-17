import 'package:http/http.dart' as http;

class ProductRemoteDataSource {
  final String remoteUrl;

  ProductRemoteDataSource({required this.remoteUrl});

  Future<String> fetchRemoteJson() async {
    final response = await http.get(Uri.parse(remoteUrl));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception(
        "Failed to fetch remote mock JSON (status: ${response.statusCode})",
      );
    }
  }
}
