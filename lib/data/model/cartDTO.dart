import 'package:flutter_blog/data/model/cart_productDTO.dart';

class CartDTO {
  List<CartProductDTO> cartProducts;
  int totalBeforePrice;
  int totalDiscountPrice;
  int deliveryFee;
  int totalPrice;

  CartDTO(
      this.cartProducts,
      this.totalBeforePrice,
      this.totalDiscountPrice,
      this.deliveryFee,
      this.totalPrice,
      );

  Map<String, dynamic> toJson() => {
    // "cartProducts": cartProducts.map((product) => product.toJson()).toList(),
    "totalBeforePrice": totalBeforePrice,
    "totalDiscountPrice": totalDiscountPrice,
    "deliveryFee": deliveryFee,
    "totalPrice": totalPrice,
  };

  CartDTO.fromJson(Map<String, dynamic> json)
      :cartProducts = (json["cartProducts"] as List<dynamic>)
      .map((e) => CartProductDTO.fromJson(e as Map<String, dynamic>))
      .toList(),
        totalBeforePrice = json["totalBeforePrice"],
        totalDiscountPrice = json["totalDiscountPrice"],
        deliveryFee = json["deliveryFee"],
        totalPrice = json["totalPrice"];
}
