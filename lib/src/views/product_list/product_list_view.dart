import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_loyalty_point/src/styles/styles.dart';
import 'package:heroicons/heroicons.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  static const String routeName = "/product-list";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            // app bar section
            SliverAppBar(
              title: const Text("Credits"),
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
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: Styles.textFieldAuth.copyWith(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 24, right: 4, bottom: 2),
                      child: Text(
                        "+62",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    prefixIconConstraints: const BoxConstraints(),
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Container(
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
                      "Before making a transaction, make sure you have entered the number.",
                    ),
                  ],
                ),
              ),
            ),

            // product list
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 10,
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    child: Material(
                      elevation: 4,
                      color: Colors.white,
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
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      "https://images.unsplash.com/photo-1612416365463-9ddb415d7f71?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80",
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Center(
                                          child: Text(
                                            "image\nnot found!",
                                            textAlign: TextAlign.center,
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
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "Credits 15rb",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        "data",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
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
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ElevatedButton(
              onPressed: () {},
              style: Styles.greyButton,
              child: const Text("Next"),
            ),
          ),
        ),
      ),
    );
  }
}
