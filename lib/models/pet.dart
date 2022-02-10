class Pet {
  String? type;
  String? timestamp;
  int? value;
  String? unit;

  Pet({this.type, this.timestamp, this.value, this.unit});

  Pet.fromJson(Map<String, dynamic> json) {

    type = json['type'];
    timestamp = json['timestamp'];
    value = json['value'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['timestamp'] = this.timestamp;
    data['value'] = this.value;
    data['unit'] = this.unit;
    return data;
  }
}
