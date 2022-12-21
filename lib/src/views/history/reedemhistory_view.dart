import "package:flutter/material.dart";
import 'package:flutter_loyalty_point/src/styles/styles.dart';
import 'package:flutter_loyalty_point/src/utils/types/view_state_type.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../models/transaction/transaction_model.dart';
import '../../utils/helper/args_transaction_detail_helper.dart';
import '../../view_models/history/history_view_model.dart';

class ReedemHistoryView extends StatelessWidget {
  const ReedemHistoryView({super.key});

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
                        "You don't have any current redeem actions,\nPlease try redeem at Homepage",
                        textAlign: TextAlign.center,
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      itemCount: value.redeemList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            context
                                .read<HistoryViewModel>()
                                .toTransactionDetail(
                                    ArgsTransactionDetailHelper(
                                      transaction: TransactionModel(
                                          id: value.redeemList[index].id,
                                          category:
                                              value.redeemList[index].category,
                                          name: value.redeemList[index].name,
                                          price: value.redeemList[index].price,
                                          image: value.redeemList[index].image,
                                          serialNumber: value
                                              .redeemList[index].serialNumber,
                                          identifierNumber: value
                                              .redeemList[index]
                                              .identifierNumber,
                                          date: value.redeemList[index].date,
                                          status:
                                              value.redeemList[index].status),
                                    ),
                                    context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            margin: const EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
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
                                      Container(
                                        width: 75,
                                        height: 75,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          image: DecorationImage(
                                              image: AssetImage(value
                                                          .redeemList[index]
                                                          .category ==
                                                      "credits"
                                                  ? "assets/images/redeem_history.png"
                                                  : value.redeemList[index]
                                                              .category ==
                                                          "data-quota"
                                                      ? "assets/images/data-quota_history.png"
                                                      : "assets/images/redeem_history.png")),
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
                                              value.redeemList[index]
                                                          .category ==
                                                      "credits"
                                                  ? "Credits"
                                                  : value.redeemList[index]
                                                              .category ==
                                                          "data-quota"
                                                      ? "Data Quota"
                                                      : "E-Money",
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  color: Styles.colorBlack400,
                                                  fontSize: 16),
                                            ),
                                            const SizedBox(
                                              height: 12,
                                            ),
                                            Text(
                                              value.redeemList[index].name ??
                                                  "",
                                              style: GoogleFonts.poppins(
                                                  color: Styles.colorBlack400,
                                                  fontSize: 12),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              DateFormat.yMMMd()
                                                  .format(DateTime.parse(
                                                    value.redeemList[index]
                                                            .date ??
                                                        "",
                                                  ))
                                                  .toString(),
                                              style: GoogleFonts.poppins(
                                                  color: Styles.colorBlack400,
                                                  fontSize: 12),
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
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        "-${value.redeemList[index].price.toString()} Points",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            color: Styles.colorBlack400,
                                            fontSize: 13),
                                        textAlign: TextAlign.right,
                                      ),
                                      const SizedBox(
                                        height: 18,
                                      ),
                                      Text(
                                        "Order ID : ID${value.redeemList[index].id![0]}00${value.redeemList[index].id!.substring(value.redeemList[index].id!.length - 3).toUpperCase()}",
                                        style: GoogleFonts.poppins(
                                            color: Styles.colorBlack400,
                                            fontSize: 12),
                                        textAlign: TextAlign.right,
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
