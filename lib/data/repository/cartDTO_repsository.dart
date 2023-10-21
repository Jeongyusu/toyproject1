import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/post_request.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/dto/toy_response_dto.dart';
import 'package:flutter_blog/data/dto/user_request.dart';
import 'package:flutter_blog/data/model/cartDTO.dart';
import 'package:flutter_blog/data/model/cart_productDTO.dart';
import 'package:flutter_blog/data/model/post.dart';
import 'package:flutter_blog/data/model/productDTO.dart';
import 'package:flutter_blog/data/model/user.dart';
import 'package:logger/logger.dart';

// V -> P(전역프로바이더, 뷰모델) -> R
class CartDTORepository {
  Future<ToyResponseDTO> fetchCartList() async {
    try {
      // 1. 통신
      Logger().d("fetchCartList동작중");
      final response = await dio.get("/api/carts");
      Logger().d(response.data);
      // 2. ResponseDTO 파싱
     ToyResponseDTO toyResponseDTO = ToyResponseDTO.fromJson(response.data);
     toyResponseDTO.response = CartDTO.fromJson(toyResponseDTO.response);

      // 3. ResponseDTO의 data 파싱
      Logger().d("CartProductDTO파싱완료");
      return toyResponseDTO;
    } catch (e) {
      return ToyResponseDTO(false, "카트 목록 불러오기 실패", null);
    }
  }

  // Future<ResponseDTO> fetchPost(String jwt, int id) async {
  //   try {
  //     // 통신
  //     Response response = await dio.get("/post/$id",
  //         options: Options(headers: {"Authorization": "$jwt"}));
  //
  //     // 응답 받은 데이터 파싱
  //     ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
  //     responseDTO.data = Post.fromJson(responseDTO.data);
  //
  //     return responseDTO;
  //   } catch (e) {
  //     return ResponseDTO(-1, "게시글 한건 불러오기 실패", null);
  //   }
  // }
  //
  // // deletePost, updatePost, savePost
  // // fetchPost, fetchPostList
  // Future<ResponseDTO> savePost(String jwt, PostSaveReqDTO dto) async {
  //   try {
  //     // 1. 통신
  //     final response = await dio.post("/post",
  //         data: dto.toJson(),
  //         options: Options(headers: {"Authorization": "${jwt}"}));
  //
  //     Logger().d(response.data);
  //
  //     // 2. ResponseDTO 파싱
  //     ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
  //     Logger().d(responseDTO.data);
  //
  //     // 3. ResponseDTO의 data 파싱
  //     Post post = Post.fromJson(responseDTO.data);
  //
  //     // 4. 파싱된 데이터를 다시 공통 DTO로 덮어씌우기
  //     responseDTO.data = post;
  //
  //     return responseDTO;
  //   } catch (e) {
  //     return ResponseDTO(-1, "게시글 작성 실패", null);
  //   }
  // }
}
