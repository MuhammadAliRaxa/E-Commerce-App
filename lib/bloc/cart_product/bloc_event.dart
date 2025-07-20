import 'package:flutter/foundation.dart';
import 'package:flutter_e_commerce_app/data/models/product.dart';
@immutable
class CartEvent{
  const CartEvent();
}
@immutable
class FetchCartProduct extends CartEvent{
  const FetchCartProduct();
}
@immutable
class IncreamentQantityEvent extends CartEvent{
   const IncreamentQantityEvent();
}
@immutable
class DecreamentQuantityEvent extends CartEvent{
  const DecreamentQuantityEvent();
}
@immutable
class DeleteCartProductEvent extends CartEvent{
  final String product;
  const DeleteCartProductEvent({required this.product});
}