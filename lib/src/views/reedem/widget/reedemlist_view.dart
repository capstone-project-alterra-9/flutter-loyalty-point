import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../models/product/product_model.dart';
import '../../../view_models/reedem/reedem_view_model.dart';

class RedeemListView extends StatelessWidget {
  const RedeemListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProductModel> listReedemProduct =
        Provider.of<ReedemViewModel>(context).productList;
    return Expanded(
      child: ListView.builder(
          itemCount: listReedemProduct.length,
          itemBuilder: (context, index) {
            return Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(1, .5), //(x,y)
                        blurRadius: 4.0,
                      ),
                    ]),
                margin: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Image.network(
                      listReedemProduct[index].image,
                      width: 150,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          listReedemProduct[index].name,
                          style: GoogleFonts.poppins(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Text(
                          "${listReedemProduct[index].price.toString()} Poin",
                          style: GoogleFonts.poppins(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    )
                  ],
                ));
          }),
    );
  }
}
