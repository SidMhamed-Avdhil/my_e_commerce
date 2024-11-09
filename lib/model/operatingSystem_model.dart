class OperatingSystem {
  String? name, version;

  OperatingSystem({this.name, this.version});

  OperatingSystem.fromJson(Map<String, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    version = map['version'];
  }

  toJson() {
    return {
      'name': name,
      'version': version,
    };
  }
}
