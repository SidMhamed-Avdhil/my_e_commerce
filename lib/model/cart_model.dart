class CartModel {
  String? computerId, name, image, price;
  int? quantity;

  CartModel({
    this.computerId,
    this.name,
    this.image,
    this.price,
    this.quantity,
  });

  CartModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    computerId = map['computerId'];
    name = map['name'];
    image = map['image'];
    price = map['price'];
    quantity = map['quantity'];
  }

  toJson() {
    return {
      'computerId': computerId,
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
    };
  }
}
