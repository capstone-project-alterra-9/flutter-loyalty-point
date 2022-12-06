import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_loyalty_point/src/styles/styles.dart';
import 'package:flutter_loyalty_point/src/utils/types/category_product_type.dart';
import 'package:flutter_loyalty_point/src/utils/types/view_state_type.dart';
import 'package:flutter_loyalty_point/src/view_models/product_detail/product_detail_view_model.dart';
import 'package:flutter_loyalty_point/src/view_models/product_list/product_list_view_model.dart';
import 'package:heroicons/heroicons.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  static const String routeName = "/product-list";

  @override
  Widget build(BuildContext context) {
    ProductListViewModel productListViewModel =
        context.read<ProductListViewModel>();

    String? hintFormField;
    Widget? prefixFormField;

    switch (productListViewModel.args.categoryProductType) {
      case CategoryProductType.credits:
        {
          hintFormField = "000 1111 2222";

          prefixFormField = const Padding(
            padding: EdgeInsets.only(left: 24, right: 4, bottom: 2),
            child: Text(
              "+62",
              style: TextStyle(fontSize: 16),
            ),
          );
          break;
        }
      case CategoryProductType.dataQuota:
        {
          hintFormField = "823 2222 3333";
          prefixFormField = const Padding(
            padding: EdgeInsets.only(left: 24, right: 4, bottom: 2),
            child: Text(
              "+62",
              style: TextStyle(fontSize: 16),
            ),
          );
          break;
        }
      case CategoryProductType.eMoney:
        {
          hintFormField = "0000 1111 2222 3333";
          break;
        }
      default:
    }

    return GestureDetector(
      onTapDown: (details) => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            // app bar section
            SliverAppBar(
              title: Text(productListViewModel.args.categoryProductType.value),
              automaticallyImplyLeading: false,
              pinned: true,
              elevation: 1,
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

            // input identifier number section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                  bottom: 8,
                ),
                child: TextFormField(
                  onChanged: (value) =>
                      productListViewModel.identifierNumber = value,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: Styles.textFieldAuth.copyWith(
                    hintText: hintFormField,
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: prefixFormField,
                    prefixIconConstraints: const BoxConstraints(),
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Consumer<ProductListViewModel>(
                builder: (context, value, child) {
                  if (!value.nextButtonDisabled) {
                    return const SizedBox();
                  }

                  return Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xffFFF9ED),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: const Color(0xffF3BA63),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          spacing: 8,
                          children: const [
                            Text(
                              "Information",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            HeroIcon(
                              HeroIcons.informationCircle,
                              style: HeroIconStyle.solid,
                              color: Color(0xffEE9D2B),
                              size: 20,
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "Before making a transaction, make sure you have entered the number and select the product.",
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // product list
            Consumer<ProductListViewModel>(
              builder: (context, value, child) {
                switch (value.productListState) {
                  case ViewStateType.loading:
                    {
                      return const SliverToBoxAdapter(
                        child: Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      );
                    }

                  case ViewStateType.error:
                    {
                      return const SliverToBoxAdapter(
                        child: Center(
                          child: Text("Something went wrong!"),
                        ),
                      );
                    }

                  case ViewStateType.none:
                    {
                      if (value.productList.isEmpty) {
                        return const SliverToBoxAdapter(
                          child: Center(
                            child: Text("Product not found!"),
                          ),
                        );
                      }

                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: value.productList.length,
                          (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 16,
                              ),
                              child: GestureDetector(
                                onTap: () => productListViewModel
                                    .tapProduct(value.productList[index].id),
                                child: Material(
                                  elevation: 4,
                                  color: value.args.productId ==
                                          value.productList[index].id
                                      ? Styles.colorGreen100
                                      : Styles.colorWhite,
                                  borderRadius: BorderRadius.circular(15),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: AspectRatio(
                                              aspectRatio: 181 / 104,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.network(
                                                  value.productList[index]
                                                          .image ??
                                                      "",
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (
                                                    context,
                                                    error,
                                                    stackTrace,
                                                  ) {
                                                    return AspectRatio(
                                                      aspectRatio: 181 / 104,
                                                      child: Container(
                                                        color: Styles
                                                            .colorBlack100,
                                                        alignment:
                                                            Alignment.center,
                                                        child: const Text(
                                                          "Image\nNot Found!",
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 16,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    value.productList[index]
                                                            .name ??
                                                        "",
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Text(
                                                    NumberFormat.simpleCurrency(
                                                            locale: "in_ID")
                                                        .format(
                                                      value.productList[index]
                                                          .price,
                                                    ),
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }

                  default:
                    {
                      return const SliverToBoxAdapter();
                    }
                }
              },
            ),
          ],
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Consumer<ProductListViewModel>(
              builder: (context, value, child) => ElevatedButton(
                onPressed: value.nextButtonDisabled
                    ? null
                    : productListViewModel.toReedemProductDetail,
                style: value.nextButtonDisabled
                    ? Styles.greyButton
                    : Styles.primaryButton,
                child: const Text("Next"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
