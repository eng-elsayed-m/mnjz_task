part of '../domain.dart';

//BluePrint of data model
class ProductEntity extends Equatable {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final RatingEntity? rating;

  const ProductEntity(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});

  @override
  List<Object?> get props {
    return [
      id,
      title,
      price,
      description,
      category,
      image,
      rating,
    ];
  }
}

class RatingEntity extends Equatable {
  final double? rate;
  final int? count;

  const RatingEntity({this.rate, this.count});

  @override
  List<Object?> get props => [rate, count];
}
