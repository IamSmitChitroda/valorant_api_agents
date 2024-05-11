import 'dart:developer';

import 'package:valorant_api_agents/headers.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  ApiHelper() {
    getDataFromAPi();
  }

  ApiHelper._();
  static final ApiHelper apiHelper = ApiHelper._();

  String valorantAgent = "https://valorant-api.com/v1/agents";

  // Future<List<Agents>> getDataFromAPi() async {
  Future<List> getDataFromAPi() async {
    log('api start');
    List<Agents> allData = [];
    List data = [];
    http.Response response = await http.get(Uri.parse(valorantAgent));

    if (response.statusCode == 200) {
      log('status code : 200');
      Map map = jsonDecode(response.body);
      log('map done');

      data = map["data"];
      log('map to list done');

      // allData = data
      //     .map(
      //       (element) => Agents.fromJson(element),
      //     )
      //     .toList();

      log('');

      // data.forEach(
      //   (element) {
      //     log('data added to list');
      //
      //     allData.add(
      //        Agents.fromJson(element),
      //      );
      //    },
      //  );
      log('all data added');
    } //if

    // return allData;
    return data;
  }
}
