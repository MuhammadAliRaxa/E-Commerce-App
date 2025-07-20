class CartProduct {
  String? id;
  String name;
  String price;
  String image;
  int quantity;
  double rating;
  CartProduct({
    this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.quantity,
    required this.rating,
  });
  

  CartProduct copyWith({
    String? id,
    String? name,
    String? price,
    String? image,
    int? quantity,
    double? rating,
  }) {
    return CartProduct(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
      rating: rating ?? this.rating,
    );
  }

  factory CartProduct.fromJson(Map<String, dynamic> json,String id) {
    return CartProduct(
      id: id,
      name: json['name'],
      price: json['price'],
      image: json['image'],
      quantity: json['quantity'],
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'image': image,
      'quantity': quantity,
      'rating': rating,
    };
  }

  @override
  String toString() {
    return '''CartProduct(id: $id, name: $name, price: $price, image: $image, quantity: $quantity, rating: $rating)''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CartProduct &&
      other.id == id &&
      other.name == name &&
      other.price == price &&
      other.image == image &&
      other.quantity == quantity &&
      other.rating == rating;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      price.hashCode ^
      image.hashCode ^
      quantity.hashCode ^
      rating.hashCode;
  }
}
