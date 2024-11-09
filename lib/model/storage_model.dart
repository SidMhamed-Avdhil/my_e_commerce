class Storage {
  int? capacity;
  String? type;

  Storage({this.capacity, this.type});

  Storage.fromJson(Map<String, dynamic> map) {
    if (map == null) {
      return;
    }
    capacity = map['capacity'];
    type = map['type'];
  }

  toJson() {
    return {
      'capacity': capacity,
      'type': type,
    };
  }
}
