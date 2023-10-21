import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/toy_response_dto.dart';
import 'package:flutter_blog/data/model/productDTO.dart';
import 'package:flutter_blog/data/repository/product_repository.dart';
import 'package:logger/logger.dart';

void main() async {

  await CartDTORepository().fetchCartList();
}

class CartDTORepository {
  Future<ToyResponseDTO> fetchCartList() async {
    try {
      // 1. 통신
      Logger().d("fetchCartList동작중");
      final response = await dio.get("/api/carts");
      Logger().d(response.data);
      // 2. ResponseDTO 파싱
      ToyResponseDTO toyResponseDTO = ToyResponseDTO.fromJson(response.data);
      Logger().d("CartProductDTO파싱완료");
      // 3. ResponseDTO의 data 파싱
      Logger().d(toyResponseDTO.response);
      return toyResponseDTO;
    } catch (e) {
      return ToyResponseDTO(false, null, null);
    }
  }

}