class Agents {
  String displayName;
  String fullPortrait;
  List<String> backgroundGradientColors;

  Agents({
    required this.displayName,
    required this.fullPortrait,
    required this.backgroundGradientColors,
  });

  factory Agents.fromJson(Map<String, dynamic> json) => Agents(
        displayName: json["displayName"],
        fullPortrait: json["fullPortrait"],
        backgroundGradientColors:
            List<String>.from(json["backgroundGradientColors"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "displayName": displayName,
        "fullPortrait": fullPortrait,
        "backgroundGradientColors":
            List<dynamic>.from(backgroundGradientColors.map((color) => color)),
      };
}
