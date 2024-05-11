import 'dart:developer';

import 'package:valorant_api_agents/headers.dart';

class AgentsController with ChangeNotifier {
  AgentsController() {
    log('AgentsController');
    getAgents();
  }

  List allData = [];
  // List<Agents> allData = [];

  Future<void> getAgents() async {
    allData = await ApiHelper.apiHelper.getDataFromAPi();
    notifyListeners();
  }

  List<Color> getColors({required int index}) {
    List<Color> colors = [];
    // for (int i = 0; i < allData[i]['backgroundGradientColors']; i++) {
    //   colors.add(
    //     Color(
    //       int.parse("${'0xff' + allData[i]['backgroundGradientColors'][i]}"),
    //     ),
    //   );
    // }

    allData[index]['backgroundGradientColors'].forEach((element) {
      colors.add(
        Color(
          int.parse(
            "${'0xff' + element}" ?? '0xffffffff',
          ),
        ),
      );
    });

    return colors;
  }
}
