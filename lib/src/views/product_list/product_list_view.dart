import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_loyalty_point/src/styles/styles.dart';
import 'package:flutter_loyalty_point/src/utils/extensions/int_extension.dart';
import 'package:flutter_loyalty_point/src/utils/types/category_product_type.dart';
import 'package:flutter_loyalty_point/src/utils/types/view_state_type.dart';
import 'package:flutter_loyalty_point/src/view_models/product_list/product_list_view_model.dart';
import 'package:flutter_loyalty_point/src/views/widgets/bottom_sheet_widget.dart';
import 'package:flutter_loyalty_point/src/views/widgets/skelton_widget.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';

part 'widgets/product_list_app_bar.dart';
part 'widgets/product_list_bottom_sheet.dart';
part 'widgets/product_list_form_field.dart';
part 'widgets/product_list_information_card.dart';
part 'widgets/product_list_product_card.dart';
part 'widgets/product_list_product_list.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  static const String routeName = "/product-list";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => FocusManager.instance.primaryFocus?.unfocus(),
      child: const Scaffold(
        body: CustomScrollView(
          slivers: [
            // app bar section
            ProductListAppBar(),

            // input identifier number section
            ProductListFormField(),

            // information card section
            ProductListInformationCard(),

            // product list section
            ProductListProductList(),
          ],
        ),

        // bottom bar section
        bottomSheet: ProductListBottomSheet(),
      ),
    );
  }
}
