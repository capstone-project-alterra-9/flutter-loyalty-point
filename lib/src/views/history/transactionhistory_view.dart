import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/models/transaction/transaction_model.dart';
import 'package:flutter_loyalty_point/src/utils/helper/args_transaction_detail_helper.dart';
import 'package:flutter_loyalty_point/src/view_models/history/history_view_model.dart';
import 'package:flutter_loyalty_point/src/views/widgets/bottomnav_widget.dart';
import 'package:flutter_loyalty_point/src/views/transaction_detail/transaction_detail_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../styles/styles.dart';
import '../../utils/types/view_state_type.dart';

class TransactionHistoryView extends StatefulWidget {
  const TransactionHistoryView({super.key});

  @override
  State<TransactionHistoryView> createState() => _TransactionHistoryViewState();
}

class _TransactionHistoryViewState extends State<TransactionHistoryView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryViewModel>(
      builder: (context, value, child) {
        switch (value.transactionListState) {
          case ViewStateType.loading:
            {
              return const Center(child: CircularProgressIndicator());
            }
          case ViewStateType.error:
            {
              return const Center(
                child: Text(
                  "There's a problem with services,\nPlease try again later",
                  textAlign: TextAlign.center,
                ),
              );
            }
          case ViewStateType.none:
            {
              return value.redeemList.isEmpty
                  ? const Center(
                      child: Text(
                        "You don't have any current transaction actions,\nPlease try at Homepage",
                        textAlign: TextAlign.center,
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      itemCount: value.transactionList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            context
                                .read<HistoryViewModel>()
                                .toTransactionDetail(
                                  ArgsTransactionDetailHelper(
                                    transaction: TransactionModel(
                                        id: value.transactionList[index].id,
                                        category: value
                                            .transactionList[index].category,
                                        name: value.transactionList[index].name,
                                        price:
                                            value.transactionList[index].price,
                                        image:
                                            value.transactionList[index].image,
                                        serialNumber: value
                                            .transactionList[index]
                                            .serialNumber,
                                        identifierNumber: value
                                            .transactionList[index]
                                            .identifierNumber,
                                        date: value.transactionList[index].date,
                                        status: value
                                            .transactionList[index].status),
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
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    children: [
                                      //circleavatar
                                      Container(
                                        width: 75,
                                        height: 75,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/redeem_history.png")),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 13,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              value.transactionList[index]
                                                      .category ??
                                                  "",
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  color: Styles.colorBlack400,
                                                  fontSize: 14),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              value.transactionList[index]
                                                      .name ??
                                                  "",
                                              style: GoogleFonts.poppins(
                                                  color: Styles.colorBlack400,
                                                  fontSize: 12),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              "09 Nov 2022",
                                              style: GoogleFonts.poppins(
                                                  color: Styles.colorBlack400,
                                                  fontSize: 10),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "-${value.transactionList[index].price.toString()} Points",
                                        style: GoogleFonts.poppins(
                                            color: Styles.colorBlack400,
                                            fontSize: 14),
                                        textAlign: TextAlign.right,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "Rp ${value.transactionList[index].price}",
                                        style: GoogleFonts.poppins(
                                            color: Styles.colorBlack400,
                                            fontSize: 12),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "Order ID : ID${value.transactionList[index].id}",
                                        style: GoogleFonts.poppins(
                                            color: Styles.colorBlack400,
                                            fontSize: 10),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
            }
        }
      },
    );
  }
}
