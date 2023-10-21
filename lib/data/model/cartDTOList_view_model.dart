import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/post_request.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/dto/toy_response_dto.dart';
import 'package:flutter_blog/data/model/cartDTO.dart';
import 'package:flutter_blog/data/model/post.dart';
import 'package:flutter_blog/data/repository/cartDTO_repsository.dart';
import 'package:flutter_blog/data/repository/post_repository.dart';
import 'package:flutter_blog/data/store/session_store.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

// 1. 창고 데이터
class CartDTOListModel {
  CartDTO cartDTO;
  CartDTOListModel(this.cartDTO);
}

// 2. 창고
class CartDTOListViewModel extends StateNotifier<CartDTOListModel?> {
  CartDTOListViewModel(super._state, this.ref);

  final mContext = navigatorKey.currentContext;
  Ref ref;

  Future<void> notifyInit() async {
    // // jwt 가져오기
    // SessionStore sessionStore = ref.read(sessionProvider);
    ToyResponseDTO toyResponseDTO = await CartDTORepository().fetchCartList();
    Logger().d("여까지실행");
    Logger().d(toyResponseDTO.response);
    state = CartDTOListModel(toyResponseDTO.response);
  }

  // Future<void> notifyAdd(PostSaveReqDTO dto) async {
  //   SessionStore sessionStore = ref.read(sessionProvider);
  //
  //   ResponseDTO responseDTO =
  //       await PostRepository().savePost(sessionStore.jwt!, dto);
  //
  //   if (responseDTO.code == 1) {
  //     Post newPost = responseDTO.data as Post; // 1. dynamic(Post) -> 다운캐스팅
  //     List<Post> newPosts = [
  //       newPost,
  //       ...state!.posts
  //     ]; // 2. 기존 상태에 데이터 추가 [전개연산자]
  //     state = PostListModel(
  //         newPosts); // 3. 뷰모델(창고) 데이터 갱신이 완료 -> watch 구독자는 rebuild됨.
  //     Navigator.pop(mContext!); // 4. 글쓰기 화면 pop
  //   } else {
  //     ScaffoldMessenger.of(mContext!).showSnackBar(
  //         SnackBar(content: Text("게시물 작성 실패 : ${responseDTO.msg}")));
  //   }
  // }
}

// 3. 창고 관리자 (View 빌드되기 직전에 생성됨)
final cartDTOListProvider =
    StateNotifierProvider.autoDispose<CartDTOListViewModel, CartDTOListModel?>(
        (ref) {
  return CartDTOListViewModel(null, ref)..notifyInit();
});
