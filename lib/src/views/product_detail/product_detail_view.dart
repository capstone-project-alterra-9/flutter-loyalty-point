import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/styles/styles.dart';
import 'package:flutter_loyalty_point/src/utils/extensions/int_extension.dart';
import 'package:flutter_loyalty_point/src/utils/types/category_product_type.dart';
import 'package:flutter_loyalty_point/src/utils/types/purchase_type.dart';
import 'package:flutter_loyalty_point/src/utils/types/view_state_type.dart';
import 'package:flutter_loyalty_point/src/view_models/product_detail/product_detail_view_model.dart';
import 'package:flutter_loyalty_point/src/views/widgets/bottom_sheet_widget.dart';
import 'package:flutter_loyalty_point/src/views/widgets/skelton_widget.dart';
import 'package:heroicons/heroicons.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

part 'widgets/product_detail_app_bar.dart';
part 'widgets/product_detail_bottom_sheet.dart';
part 'widgets/product_detail_description.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  static const String routeName = "/product-detail";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          ProductDetailAppBar(),
          ProductDetailDescription(),
        ],
      ),
      bottomSheet: ProductDetailBottomSheet(),
    );
  }
}
