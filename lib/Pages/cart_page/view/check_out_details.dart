import 'package:flutter/material.dart';
import 'package:genius_shop/Pages/cart_page/controller/cart_controller.dart';
import 'package:genius_shop/core/helper/constens.dart';
import 'package:genius_shop/ui/widget/action_button.dart';
import 'package:get/get.dart';

class CheckOutDetails extends StatelessWidget {
  const CheckOutDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CartController>();
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: SizedBox(
        height: Get.height / 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              sp20,
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey),
                  color: Colors.grey[100],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          controller: controller.controllerTextField,
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: 'Enter your Promo code',
                            icon: Icon(
                              Icons.confirmation_number_outlined,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () async {},
                      icon: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ],
                ),
              ),
              sp20,

              _RowDetails(
                title: 'Item Cost :',
                value: controller.getTotalCost(),
              ),
              _RowDetails(title: 'Shipping Fee :', value: '29'),
              sp20,
              _RowDetails(title: 'Total Price:', value: '158', isFinal: true),
              sp10,
              ActionButton(
                title: Text('CheckOut', style: TextStyle(color: Colors.white)),
                withBorder: false,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RowDetails extends StatelessWidget {
  final String? title;
  final String? value;
  final bool? isFinal;
  const _RowDetails({this.title, this.value, this.isFinal = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title ?? '', style: TextStyle(color: Colors.grey, fontSize: 18)),
          Text(
            '\$${value ?? ''}',
            style: TextStyle(
              color: Colors.black,
              fontSize: isFinal! ? 20 : 16,
              fontWeight: isFinal! ? FontWeight.bold : null,
            ),
          ),
        ],
      ),
    );
  }
}
