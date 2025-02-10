import 'dart:convert';

import 'package:http/http.dart' as http;

class QueueDataModel {
  List<dynamic> queue_datas = [];
  final String first_name;
  final String last_name;
  final String phone;
  final String type;
  final int queue_status;
  final int queue_number;

  QueueDataModel(
      {required this.first_name,
      required this.last_name,
      required this.phone,
      required this.type,
      required this.queue_status,
      required this.queue_number});

  String get fullname{ //สร้างเมท็อด เพื่อใช้ในการเชื่อมต่อข้อความได้
    return '${this.first_name} ${this.last_name}';
  }

  static Future<List<QueueDataModel>> getData() async {
    print('fetchData');
    const String url = 'https://www.your-auction-services.com/queue-mini-project/api/v1/queue';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['queue'] as List<dynamic>;

    final transforms = results.map((e) {
      return QueueDataModel(
          first_name: e['first_name'],
          last_name: e['last_name'],
          phone: e['phone'],
          type: e['type'],
          queue_status: e['queue_status'],
          queue_number: e['queue_number']
      );
    },).toList();

    print(json['status']);
    return transforms;
  }
}