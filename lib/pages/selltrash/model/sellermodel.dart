class sellerData {
  String name;
  String number;

  sellerData({required this.name, required this.number});

  factory sellerData.fromJson(Map<String, dynamic> json) =>
      new sellerData(name: json["name"], number: json["number"]);

  Map<String, dynamic> toJson() => {"name": name, "number": number};
}
