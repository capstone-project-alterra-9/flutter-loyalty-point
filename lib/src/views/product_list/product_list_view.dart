import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/models/product/product_model.dart';
import 'package:flutter_loyalty_point/src/view_models/product_list/product_list_view_model.dart';
import 'package:flutter_loyalty_point/src/views/home/home_view.dart';
import 'package:flutter_loyalty_point/src/views/product_detail/product_detail_view.dart';
import 'package:flutter_loyalty_point/src/views/product_list/widget/emptylist_view.dart';
import 'package:flutter_loyalty_point/src/views/product_list/widget/reedemlist_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({super.key});

  static const String routeName = "/reedem";

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  @override
  Widget build(BuildContext context) {
    final List<ProductModel> listReedemProduct =
        Provider.of<ProductListViewModel>(context).productList;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Pulsa",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[50],
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(HomeView.routeName);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        contentPadding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 10, right: 10),
                        hintText: "Phone Number",
                        hintStyle: GoogleFonts.poppins(),
                        prefix: Text("+62 ")),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  listReedemProduct.isNotEmpty
                      ? const RedeemListView()
                      : const EmptyListView(),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(156, 194, 155, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(ProductDetailView.routeName);
                    },
                    child: Text(
                      "Next",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
