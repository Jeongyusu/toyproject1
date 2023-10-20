import 'package:flutter_blog/data/model/productDTO.dart';
import 'package:flutter_blog/data/repository/product_repository.dart';

void main() {
  ProductRepository productRepository = ProductRepository();
  List<ProductDTO> productDTOs = productRepository.findAll();
  print(productDTOs.toString());
}
