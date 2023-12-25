part of '../data.dart';

//Data Mode
class ProductModel extends ProductEntity {
  const ProductModel(
      {super.id,
      super.title,
      super.price,
      super.description,
      super.category,
      super.image,
      super.rating});
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': this.id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': (rating as RatingModel).toMap(),
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      //
      // ---- Used casting as num then converted to double,
      // ---- Cause the price don't return in float form
      //
      price: map['price'] != null ? (map['price'] as num).toDouble() : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      rating: map['rating'] != null
          ? RatingModel.fromMap(map['rating'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class RatingModel extends RatingEntity {
  const RatingModel({super.rate, super.count});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rate': rate,
      'count': count,
    };
  }

  factory RatingModel.fromMap(Map<String, dynamic> map) {
    return RatingModel(
      //
      // ---- Used casting as num then converted to double,
      // ---- Cause the price don't return in float form
      //
      rate: map['rate'] != null ? (map['rate'] as num).toDouble() : null,
      count: map['count'] != null ? map['count'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RatingModel.fromJson(String source) =>
      RatingModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
