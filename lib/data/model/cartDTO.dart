import 'dart:ffi';

import 'package:flutter/cupertino.dart';

import 'cart_productDTO.dart';

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
        "cartProducts": cartProducts,
        "totalBeforePrice": totalBeforePrice,
        "totalDiscountPrice": totalDiscountPrice,
        "deliveryFee": deliveryFee,
        "totalPrice": totalPrice,
      };

  CartDTO.fromJson(Map<String, dynamic> json)
      : cartProducts = json["cartProducts"],
        totalBeforePrice = json["totalBeforePrice"],
        totalDiscountPrice = json["totalDiscountPrice"],
        deliveryFee = json["deliveryFee"],
        totalPrice = json["totalPrice"];
}
