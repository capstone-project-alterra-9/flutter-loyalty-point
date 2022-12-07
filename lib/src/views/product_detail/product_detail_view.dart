import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/styles/styles.dart';
import 'package:heroicons/heroicons.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  static const String routeName = "/product-detail";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            floating: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const HeroIcon(
                HeroIcons.arrowLeft,
                style: HeroIconStyle.outline,
                size: 24,
                color: Styles.colorBlack400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
