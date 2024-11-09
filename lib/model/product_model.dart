import 'package:my_e_commerce/model/cpu_model.dart';
import 'package:my_e_commerce/model/operatingSystem_model.dart';
import 'package:my_e_commerce/model/storage_model.dart';

class ComputerModel {
  late String computerId;
  late String brand;
  late String model;
  late CPU cpu;
  late int memory;
  late Storage storage;
  late OperatingSystem operatingSystem;
  late double price;
  late List<String> imageUrls;
  String? description;
  bool? inStock;

  ComputerModel({
    required this.computerId,
    required this.brand,
    required this.model,
    required this.cpu,
    required this.memory,
    required this.storage,
    required this.operatingSystem,
    required this.price,
    required this.imageUrls,
    this.description,
    this.inStock,
  }) {
    memory > 0;
  }

  ComputerModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) return;
    computerId = map['computerId'];
    brand = map['brand'];
    model = map['model'];
    cpu = CPU.fromJson(map['cpu'] as Map<String, dynamic>);
    memory = map['memory'];
    storage = Storage.fromJson(map['storage'] as Map<String, dynamic>);
    operatingSystem = OperatingSystem.fromJson(
        map['operatingSystem'] as Map<String, dynamic>);
    price = map['price'];
    imageUrls = (map['imageUrls'] as List<dynamic>).cast<String>();
    description = map['description'];
    inStock = map['inStock'];
  }

  toJson() {
    return {
      'computerId': computerId,
      'brand': brand,
      'model': model,
      'cpu': cpu.toJson(),
      'memory': memory,
      'storage': storage.toJson(),
      'operatingSystem': operatingSystem.toJson(),
      'price': price,
      'imageUrls': imageUrls,
      if (description != null) 'description': description,
      if (inStock != null) 'inStock': inStock,
    };
  }
}
