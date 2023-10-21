import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/cartDTOList_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class CartPage extends ConsumerWidget {
  CartPage();

  // 초기 수량
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CartDTOListModel? cartDTOListModel = ref.watch(cartDTOListProvider);
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text(
              "장바구니",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "전체선택",
                        style: h5(),
                      ),
                      Text(
                        "선택삭제",
                        style: h5(),
                      ),
                    ],
                  ),
                  SizedBox(height: mlargeGap),
                  ListView.builder(
                      shrinkWrap: true,  // 이 줄을 추가
                      primary: false,
                      itemCount: 3,
                      // itemCount: cartDTOListModel?.cartDTO.cartProducts.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  cartDTOListModel?.cartDTO.cartProducts[index].productSeller ?? "",
                                  style: h5(),
                                ),
                                SizedBox(width: mediumGap),
                                Text(
                                cartDTOListModel?.cartDTO.cartProducts[index].productTitle ?? "",
                                  style: h5(),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/product01.jpg',
                                  width: 60,
                                  height: 90,
                                ),
                                //할인된가격,할인전가격, 수량 컬럼
                                Column(
                                  children: [
                                    SizedBox(
                                      width: 150,
                                    ),
                                    Row(
                                      children: [
                                        Text("${cartDTOListModel?.cartDTO.cartProducts[index].discountedPrice}원" ?? "에러",
                                        ),
                                        Text("${cartDTOListModel?.cartDTO.cartProducts[index].beforeDiscount}원" ?? "에러", style: disabledText()),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 15,
                                          height: 15,
                                          child: GestureDetector(
                                              onTap: () {
                                                ref.watch(cartDTOListProvider.notifier).plusQuantity(index);
                                              },
                                              child: Image.asset("assets/plus.png")),
                                        ),
                                        SizedBox(width: 10,),
                                        Text("${cartDTOListModel?.cartDTO.cartProducts[index].quentity}" ?? "에러"),
                                        SizedBox(width: 10,),
                                        Container(
                                          width: 15,
                                          height: 15,
                                          child: GestureDetector(
                                              onTap: () {
                                                ref.watch(cartDTOListProvider.notifier).minusQuantity(index);
                                              },
                                              child: Image.asset("assets/minus.png")),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        );
                      }),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("상품금액"),
                          Text("8400원"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("상품할인금액"),
                          Text("2,520원"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("배송비"),
                          Text("0원"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("결제예정금액"),
                          Text("5,880원"),
                        ],
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: ElevatedButton(
                onPressed: () {
                  print("주문하기 클릭됨");
                },
                style: ElevatedButton.styleFrom(fixedSize:Size(0, 50),primary: primaryColor),
                child: Text("주문하기")),
          ),
        )
      ],
    );

  }
}
