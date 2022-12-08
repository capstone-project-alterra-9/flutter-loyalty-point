import "package:flutter/material.dart";
import 'package:flutter_loyalty_point/src/styles/styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../models/transaction/transaction_model.dart';
import '../../utils/helper/args_transaction_detail_helper.dart';
import '../../view_models/history/history_view_model.dart';

class ReedemHistoryView extends StatelessWidget {
  const ReedemHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TransactionModel> listTransactionHistory =
        Provider.of<HistoryViewModel>(context).transactionList;
    return ListView.builder(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        itemCount: listTransactionHistory.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              context.read<HistoryViewModel>().toTransactionDetail(
                    ArgsTransactionDetailHelper(
                      transaction: TransactionModel(
                          id: listTransactionHistory[index].id,
                          category: listTransactionHistory[index].category,
                          name: listTransactionHistory[index].name,
                          price: listTransactionHistory[index].price,
                          image: listTransactionHistory[index].image,
                          serialNumber:
                              listTransactionHistory[index].serialNumber,
                          identifierNumber:
                              listTransactionHistory[index].identifierNumber),
                    ),
                  );
            },
            child: Container(
              padding: const EdgeInsets.all(14),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(.5, .5), //(x,y)
                      blurRadius: 4.0,
                    ),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/redeem_history.png")),
                        ),
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            listTransactionHistory[index].category,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: Styles.colorBlack400,
                                fontSize: 16),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            listTransactionHistory[index].name,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: Styles.colorBlack400,
                                fontSize: 12),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "09 Nov 2022",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: Styles.colorBlack400,
                                fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                  Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "-${listTransactionHistory[index].price.toString()} Points",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: Styles.colorBlack400,
                                fontSize: 16),
                          ),
                          const SizedBox(
                            height: 31,
                          ),
                          Text(
                            "Order ID : ID${listTransactionHistory[index].id}",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: Styles.colorBlack400,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
