import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/models/product/product_model.dart';
import 'package:flutter_loyalty_point/src/view_models/payment/payment_view_model.dart';
import 'package:flutter_loyalty_point/src/views/payment/payment_view.dart';
import 'package:provider/provider.dart';

class PaymentProduct extends StatelessWidget {
  const PaymentProduct({super.key});

  @override
  Widget build(BuildContext context) {
    ProductModel product = context.read<PaymentViewModel>().args.product;

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Detail Product",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            PaymentProductCard(
              name: product.name,
              image: product.image,
              category: product.category,
              price: product.price,
            ),
          ],
        ),
      ),
    );
  }
}
