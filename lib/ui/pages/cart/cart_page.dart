import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/cartDTOList_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class CartPage extends ConsumerWidget {
  CartPage();

  int quantity = 1;
  // 초기 수량
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CartDTOListModel? cartDTOListModel = ref.watch(cartDTOListProvider);
    if (cartDTOListModel == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "장바구니",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
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
              Expanded(
                flex: 2,
                child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "${cartDTOListModel.cartDTOs[0].cartProducts[0].productSeller}",
                                style: h5(),
                              ),
                              SizedBox(width: mediumGap),
                              Text(
                                "${cartDTOListModel.cartDTOs[1].cartProducts[0].productTitle}",
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
                                      Text("5,880원"),
                                      Text("8,400원", style: disabledText()),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("수량 : ")
                                      // TextButton(
                                      //     onPressed: () {
                                      //       setState(() {
                                      //         quantity++;
                                      //       });
                                      //     },
                                      //     child: Text("-")),
                                      // Text(quantity.toString()),
                                      // TextButton(
                                      //     onPressed: () {
                                      //       if (quantity > 1) {
                                      //         quantity--;
                                      //       }
                                      //     },
                                      //     child: Text("+")),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      );
                    }),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
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
                      ElevatedButton(
                          onPressed: () {
                            print("주문하기 클릭됨");
                          },
                          child: Text("주문하기"))
                    ],
                  )),
            ],
          ),
        ),
      );
    }
  }
}
