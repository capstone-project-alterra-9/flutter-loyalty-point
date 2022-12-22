import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/models/local/home_transaction_option_button_model.dart';
import 'package:flutter_loyalty_point/src/models/product/product_model.dart';
import 'package:flutter_loyalty_point/src/styles/styles.dart';
import 'package:flutter_loyalty_point/src/utils/extensions/int_extension.dart';
import 'package:flutter_loyalty_point/src/utils/helper/args_product_list_helper.dart';
import 'package:flutter_loyalty_point/src/utils/types/category_product_type.dart';
import 'package:flutter_loyalty_point/src/utils/types/purchase_type.dart';
import 'package:flutter_loyalty_point/src/utils/types/snack_bar_type.dart';
import 'package:flutter_loyalty_point/src/utils/types/view_state_type.dart';
import 'package:flutter_loyalty_point/src/view_models/home/home_view_model.dart';
import 'package:flutter_loyalty_point/src/views/widgets/bottomnav_widget.dart';
import 'package:flutter_loyalty_point/src/views/widgets/skelton_widget.dart';
import 'package:flutter_loyalty_point/src/views/widgets/snack_bar_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';

part 'widgets/home_app_bar.dart';
part 'widgets/home_banner.dart';
part 'widgets/home_product_card.dart';
part 'widgets/home_product_list.dart';
part 'widgets/home_product_title.dart';
part 'widgets/home_sheet_product_option_list.dart';
part 'widgets/home_transaction_options_button.dart';
part 'widgets/home_user_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // app bar section
          const HomeAppBar(),

          // user card section
          const HomeUserCard(),

          // banner section
          const HomeBanner(),

          // buttons section
          const HomeTransactionOptionsButton(),

          // product list
          const HomeProductTitle(title: "Product"),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 4, bottom: 16),
              child: SizedBox(
                height: 214,
                child: Consumer<HomeViewModel>(
                  builder: (context, value, child) => HomeProductList(
                    productList: value.productList,
                    viewState: value.productListState,
                    purchaseType: PurchaseType.buy,
                  ),
                ),
              ),
            ),
          ),

          // reedem list
          const HomeProductTitle(title: "Redeem"),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 4, bottom: 16),
              child: SizedBox(
                height: 214,
                child: Consumer<HomeViewModel>(
                  builder: (context, value, child) => HomeProductList(
                    productList: value.redeemList,
                    viewState: value.redeemListState,
                    purchaseType: PurchaseType.redeem,
                  ),
                ),
              ),
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(
              height: 150,
            ),
          )
        ],
      ),

      // bottom bar section
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
          const BottomNavWidget(routeName: HomeView.routeName),
    );
  }
}
