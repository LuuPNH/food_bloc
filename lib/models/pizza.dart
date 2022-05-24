class Pizza {
  final int? id;
  final String? name;
  final bool? veg;
  final int? price;
  final String? description;
  final int? quantity;
  final String? img;

  Pizza({
    required this.id,
    required this.name,
    required this.veg,
    required this.price,
    required this.description,
    required this.quantity,
    required this.img,
  });

  factory Pizza.fromJson(Map<String, dynamic> json) {
    return Pizza(
      id: json['id'],
      name: json['name'],
      veg: json['veg'],
      price: json['price'],
      description: json['description'],
      quantity: json['quantity'],
      img: json['img'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['veg'] = veg;
    _data['price'] = price;
    _data['description'] = description;
    _data['quantity'] = quantity;
    _data['img'] = img;
    return _data;
  }
}
