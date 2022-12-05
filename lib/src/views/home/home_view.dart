import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/models/local/product_type_model.dart';
import 'package:flutter_loyalty_point/src/styles/styles.dart';
import 'package:flutter_loyalty_point/src/views/widgets/bottomnav_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heroicons/heroicons.dart';

part 'widgets/home_app_bar.dart';
part 'widgets/home_banner.dart';
part 'widgets/home_transaction_selection_button.dart';
part 'widgets/home_user_card.dart';
part 'widgets/home_product_title.dart';
part 'widgets/home_product_list.dart';
part 'widgets/home_sheet_product_type_list.dart';

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
              children: const [
                HomeUserCard(),
                HomeBanner(),
                HomeTransactionSelectionButton(),
                HomeProductTitle(title: "Product Recommend"),
                HomeProductList(),
                HomeProductTitle(title: "Redeem Recommend"),
                HomeProductList(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavWidget(routeName: HomeView.routeName),
    );
  }
}
