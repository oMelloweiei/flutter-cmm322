class trashData {
  String type;
  int kg;

  trashData({required this.type, required this.kg});

  factory trashData.fromJson(Map<String, dynamic> json) =>
      new trashData(type: json["type"], kg: json["kg"]);

  Map<String, dynamic> toJson() => {"type": type, "kg": kg};
}
