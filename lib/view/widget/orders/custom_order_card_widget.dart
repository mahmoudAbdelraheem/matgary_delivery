import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:matgary_delivery/core/class/orders.dart';
import 'package:matgary_delivery/core/constant/app_colors.dart';
import 'package:matgary_delivery/data/models/orders/order_model.dart';

import 'custom_order_button_widget.dart';

class CustomOrderCardWidget extends StatelessWidget {
  final OrdersModel order;
  final bool isDone;
  final void Function()? onDetails;
  final void Function()? onApprove;
  final void Function()? onDone;

  const CustomOrderCardWidget({
    super.key,
    required this.order,
    this.isDone = false,
    this.onDetails,
    this.onApprove,
    this.onDone,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //? order number
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order Number : #${order.orderId}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.myBlack,
                  ),
                ),
              ],
            ),
            Text(Jiffy.parse(order.orderDateTime!).fromNow()),
            const Divider(thickness: 2),
            //? order payment method
            Text(
              'Payment Method : ${Orders.printPaymentMethod(order.orderPaymentMethod!)}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.myBlack,
                height: 2,
              ),
            ),
            //? order type
            Text(
              'Order type : ${Orders.printOrderType(order.orderType!)}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.myBlack,
                height: 2,
              ),
            ),
            //? order status
            Text(
              'Order Status : ${Orders.printOrderStatus(order.orderStatus!)}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.myBlack,
                height: 2,
              ),
            ),
            //? order price
            Text(
              'Order Price : ${order.orderPrice}\$',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.myBlack,
                height: 2,
              ),
            ),
            //? order coupon discount
            if (order.orderCouponDiscount != '0')
              Text(
                'Coupon Discount : ${order.orderCouponDiscount}%',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.myBlack,
                  height: 2,
                ),
              ),
            //? shipping price
            if (order.orderType == '0')
              Text(
                'Delivery Price : ${order.orderShippingPrice}\$',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.myBlack,
                  height: 2,
                ),
              ),
            const Divider(thickness: 2),
            //? total price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'total Price: ${order.orderTotalPrice}\$',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.myRed,
                  ),
                ),

                //? order details

                Row(
                  children: [
                    isDone
                        ? CustomOrderButtonWidget(
                            title: 'Done', onPressed: onDone)
                        : CustomOrderButtonWidget(
                            title: 'Approve', onPressed: onApprove),
                    const SizedBox(width: 5),
                    CustomOrderButtonWidget(
                        title: 'Details', onPressed: onDetails),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
