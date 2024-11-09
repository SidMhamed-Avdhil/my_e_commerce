class CPU {
  String? brand;
  int? cores;
  double? clockSpeed;

  CPU({
    this.brand,
    this.cores,
    this.clockSpeed,
  });

  CPU.fromJson(Map<String, dynamic> map) {
    if (map == null) {
      return;
    }
    brand = map['brand'];
    cores = map['cores'];
    clockSpeed = map['clockSpeed'];
  }

  toJson() {
    return {
      'brand': brand,
      'cores': cores,
      'clockSpeed': clockSpeed,
    };
  }
}
