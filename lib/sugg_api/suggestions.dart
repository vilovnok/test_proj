import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

String token =
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZGZhZTYxOTZlZTJmNjhiNDg3YjdlMTQxZDBjNDc3MWI0ZDIwOTEzMWRiNGI4NTllYjc4NzY5NjlhMjEwMTM2NWQ4MzI3NWQ3N2Q2MjUyYzgiLCJpYXQiOjE2NTM1NjczMTksIm5iZiI6MTY1MzU2NzMxOSwiZXhwIjoxNjg1MTAzMzE5LCJzdWIiOiIxMTgiLCJzY29wZXMiOltdfQ.Jsmx3DohloUrH_VTH-F7P-NAhFjiFsCHX2jxUXKtiL278WfnyBfngZBfEGpIblnRxcbYtb0Z9O9xGTKPAjKKHV_k_sSMiJU5VCTpwo6KB49kpXh8TPd2azJR8UutuOIVjAuyF6VDlXa6HS2ZW4Ir0LWblrtuojynexnjznm2q1GVIsopDJvbA1nbBkn3k78nv2RED1ui7Zy-DErh9GiNR9mJDt2XbUtFJdjnOpDNhoQ-15t34pzR71vHE-h_f7VBkTmkgYuuc_arCHVzRkCSZA9kV9Wpi9tpWhnjNxrXS3lGF7iKv9BM2ZMELQvTkKOHGSEzinjGdwnmXohvwpq3AcHa0znPafDy5HrOE-EoU8J2AvFnDOKJxZ4Xl_gQNtJ3dRLK42busbFOWMHYVHc-C3uD6rqqCeSCWuAGxj_Te8zrxOnAEo4SvklRxQwW0esxyCdeRze40HCUWXeE3Zq3PNfZILlv4-YqC9rXEtJRRo2CJ8LC-qz5ocAp-t5IzZtsKfNyvNIBPuBmPXJgX5fmFG2ZfEoqyxuj8CVRdLsLKrU_ccRzq6wKCOLXEti5PDqhW0hhnaQG7cmrc9EVkDKEExmJeRwCvF0SiUI3zWu4QEzy80CJZfO3-5xQjh_G2BAhS8Nl2Ke-NZRrGmNXaTQahyHWS8VT5y7bjtF2hWHQWXs';

class SuggList {
  List<Sugg> suggestions;
  SuggList({required this.suggestions});

  factory SuggList.fromJson(Map<String, dynamic> json) {
    var sugList = json['suggestions'] as List;

    List<Sugg> sList = sugList.map((i) => Sugg.fromJson(i)).toList();

    return SuggList(suggestions: sList);
  }
}

class Sugg {
  final String? title;
  final int? status_id;
  final String? positive_effect;
  final Map<String,dynamic>? author;

  Sugg(
      {required this.positive_effect,
      required this.status_id,
      required this.title,
      required this.author});

  factory Sugg.fromJson(Map<String, dynamic> json) {
    return Sugg(
      positive_effect: json['positive_effect'] as String,
      status_id: json['status_id'] as int,
      title: json['title'] as String,
      author: json['author']
    );
  }
}

Future<SuggList> getDataSugg() async {
  const url = 'http://msofter.com/rosseti/public/api/suggestions/index';
  final response = await http.get(
    Uri.parse(url),
    headers: {"Authorization": "Bearer $token", "Accept": "application/json"},
  );
  if (response.statusCode == 200) {
    return SuggList.fromJson(json.decode(response.body));
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}
