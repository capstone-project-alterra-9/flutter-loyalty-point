import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/models/local/payment_method_model.dart';
import 'package:flutter_loyalty_point/src/styles/styles.dart';
import 'package:flutter_loyalty_point/src/utils/extensions/int_extension.dart';
import 'package:flutter_loyalty_point/src/utils/types/category_product_type.dart';
import 'package:flutter_loyalty_point/src/view_models/payment/payment_view_model.dart';
import 'package:flutter_loyalty_point/src/views/payment/widgets/payment_product.dart';
import 'package:flutter_loyalty_point/src/views/widgets/bottom_sheet_widget.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';

part 'widgets/payment_app_bar.dart';
part 'widgets/payment_method_list.dart';
part 'widgets/payment_product_card.dart';
part 'widgets/payment_bottom_sheet.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  static const String routeName = "payment";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          PaymentAppBar(),
          PaymentProduct(),
          PaymentMethodList(),
        ],
      ),
      bottomNavigationBar: PaymentBottomSheet(),
    );
  }
}
