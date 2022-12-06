import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/models/local/home_transaction_option_button_model.dart';
import 'package:flutter_loyalty_point/src/models/product/product_model.dart';
import 'package:flutter_loyalty_point/src/styles/styles.dart';
import 'package:flutter_loyalty_point/src/utils/helper/args_product_list_helper.dart';
import 'package:flutter_loyalty_point/src/utils/types/category_product_type.dart';
import 'package:flutter_loyalty_point/src/utils/types/purchase_type.dart';
import 'package:flutter_loyalty_point/src/utils/types/view_state_type.dart';
import 'package:flutter_loyalty_point/src/view_models/home/home_view_model.dart';
import 'package:flutter_loyalty_point/src/views/widgets/bottomnav_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heroicons/heroicons.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

part 'widgets/home_app_bar.dart';
part 'widgets/home_banner.dart';
part 'widgets/home_transaction_options_button.dart';
part 'widgets/home_user_card.dart';
part 'widgets/home_product_list.dart';
part 'widgets/home_sheet_product_option_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            automaticallyImplyLeading: false,
            centerTitle: false,
            toolbarHeight: 61,
            floating: true,
            snap: true,
            pinned: true,
            elevation: 1,
            flexibleSpace: HomeAppBar(),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const HomeUserCard(),
                const HomeBanner(),
                const HomeTransactionOptionsButton(),
                Consumer<HomeViewModel>(
                  builder: (context, value, child) => HomeProductList(
                    title: "Product",
                    productList: value.productList,
                    viewState: value.productListState,
                    purchaseType: PurchaseType.buy,
                  ),
                ),
                Consumer<HomeViewModel>(
                  builder: (context, value, child) => HomeProductList(
                    title: "Redeem",
                    productList: value.redeemList,
                    viewState: value.redeemListState,
                    purchaseType: PurchaseType.redeem,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavWidget(routeName: HomeView.routeName),
    );
  }
}
