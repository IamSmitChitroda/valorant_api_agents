import 'package:valorant_api_agents/headers.dart';

class SizeController with ChangeNotifier {
  double h = 0;
  double w = 0;

  Size() {
    h = 0;
    w = 0;
    setSize(height: h, width: w);
  }

  void setSize({required double height, required double width}) {
    Future.delayed(
      const Duration(milliseconds: 10),
      () {
        if (h == height && w == width) {
          h += 1;
          w += 1;
        }
        notifyListeners();
      },
    );
  }
}
