class CartProductDTO {
  int id;
  String productTitle;
  String productSeller;
  String image;
  int beforeDiscount;
  int discountedPrice;
  int quentity;

  CartProductDTO(this.id, this.productTitle, this.productSeller, this.image,
      this.beforeDiscount, this.discountedPrice, this.quentity);

  CartProductDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        productTitle = json["productTitle"],
        discountedPrice = json["discountedPrice"],
        productSeller = json["productSeller"],
        image = json["image"],
        beforeDiscount = json["beforeDiscount"],
        quentity = json["quentity"];
}

