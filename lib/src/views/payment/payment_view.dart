import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_loyalty_point/src/styles/styles.dart';
import 'package:flutter_loyalty_point/src/view_models/payment/payment_view_model.dart';
import 'package:flutter_loyalty_point/src/views/widgets/bottom_sheet_widget.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';

part 'widgets/payment_app_bar.dart';
part 'widgets/payment_bottom_sheet.dart';
part 'widgets/payment_web_view.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  static const String routeName = "payment";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          PaymentAppBar(),
          PaymentWebView(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
        ],
      ),
      bottomNavigationBar: PaymentBottomSheet(),
    );
  }
}
