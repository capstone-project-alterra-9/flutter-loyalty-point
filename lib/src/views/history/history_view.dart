import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/models/transaction/transaction_model.dart';
import 'package:flutter_loyalty_point/src/styles/styles.dart';
import 'package:flutter_loyalty_point/src/utils/helper/args_transaction_detail_helper.dart';
import 'package:flutter_loyalty_point/src/view_models/history/history_view_model.dart';
import 'package:flutter_loyalty_point/src/views/history/reedemhistory_view.dart';
import 'package:flutter_loyalty_point/src/views/history/transactionhistory_view.dart';
import 'package:flutter_loyalty_point/src/views/widgets/bottomnav_widget.dart';
import 'package:flutter_loyalty_point/src/views/transaction_detail/transaction_detail_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  static const String routeName = "/history";

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  bool cbxAll = false,
      cbxCredit = false,
      cbxDataQuota = false,
      cbxEmoney = false,
      cbxCashout = false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet<dynamic>(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(32),
                  ),
                ),
                isScrollControlled: true,
                builder: ((context) {
                  return FractionallySizedBox(
                    heightFactor: 0.65,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "FILTER",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Styles.colorBlack200,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "Reset",
                                style: TextStyle(color: Styles.colorBlack400),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "CATEGORY",
                                  style: TextStyle(
                                      color: Styles.colorBlack200,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "All",
                                            style: TextStyle(
                                              color: Styles.colorBlack400,
                                            ),
                                          ),
                                          Checkbox(
                                            visualDensity: VisualDensity(
                                                horizontal: -4, vertical: -4),
                                            value: cbxAll,
                                            activeColor: Styles.colorBlack900,
                                            onChanged: (values) {
                                              setState(() {
                                                cbxAll = !cbxAll;
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Credit",
                                            style: TextStyle(
                                              color: Styles.colorBlack400,
                                            ),
                                          ),
                                          Checkbox(
                                            visualDensity: VisualDensity(
                                                horizontal: -4, vertical: -4),
                                            value: cbxAll,
                                            activeColor: Styles.colorBlack900,
                                            onChanged: (values) {
                                              setState(() {
                                                cbxAll = !cbxAll;
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Data Quota",
                                            style: TextStyle(
                                              color: Styles.colorBlack400,
                                            ),
                                          ),
                                          Checkbox(
                                            visualDensity: VisualDensity(
                                                horizontal: -4, vertical: -4),
                                            value: cbxAll,
                                            activeColor: Styles.colorBlack900,
                                            onChanged: (values) {
                                              setState(() {
                                                cbxAll = !cbxAll;
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "E-money",
                                            style: TextStyle(
                                              color: Styles.colorBlack400,
                                            ),
                                          ),
                                          Checkbox(
                                            visualDensity: VisualDensity(
                                                horizontal: -4, vertical: -4),
                                            value: cbxAll,
                                            activeColor: Styles.colorBlack900,
                                            onChanged: (values) {
                                              setState(() {
                                                cbxAll = !cbxAll;
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Cashout",
                                            style: TextStyle(
                                              color: Styles.colorBlack400,
                                            ),
                                          ),
                                          Checkbox(
                                            visualDensity: VisualDensity(
                                                horizontal: -4, vertical: -4),
                                            value: cbxAll,
                                            activeColor: Styles.colorBlack900,
                                            onChanged: (values) {
                                              setState(() {
                                                cbxAll = !cbxAll;
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "SORT BY",
                                  style: TextStyle(
                                      color: Styles.colorBlack200,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Newest",
                                            style: TextStyle(
                                              color: Styles.colorBlack400,
                                            ),
                                          ),
                                          Radio(
                                            visualDensity: VisualDensity(
                                                horizontal: -4, vertical: -4),
                                            value: cbxAll,
                                            activeColor: Styles.colorBlack900,
                                            onChanged: (values) {
                                              setState(() {
                                                cbxAll = !cbxAll;
                                              });
                                            },
                                            groupValue: null,
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Oldest",
                                            style: TextStyle(
                                              color: Styles.colorBlack400,
                                            ),
                                          ),
                                          Radio(
                                            visualDensity: VisualDensity(
                                                horizontal: -4, vertical: -4),
                                            value: cbxAll,
                                            activeColor: Styles.colorBlack900,
                                            onChanged: (values) {
                                              setState(() {
                                                cbxAll = !cbxAll;
                                              });
                                            },
                                            groupValue: null,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              style: Styles.primaryButton.copyWith(
                                minimumSize: const MaterialStatePropertyAll(
                                  Size.fromHeight(44),
                                ),
                              ),
                              child: const Text("Show"))
                        ],
                      ),
                    ),
                  );
                }),
              );
            },
            backgroundColor: Styles.colorGreen500,
            child: const Icon(Icons.filter_list),
          ),
          bottomNavigationBar:
              const BottomNavWidget(routeName: HistoryView.routeName),
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            title: Text(
              "History",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500, color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: Colors.grey[50],
            automaticallyImplyLeading: false,
            bottom: const TabBar(
                unselectedLabelColor: Styles.colorGreen500,
                labelColor: Styles.colorWhite,
                indicatorColor: Styles.colorGreen500,
                indicator: BoxDecoration(color: Styles.colorGreen500),
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      "Transaction",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Reedem",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                ]),
          ),
          body: const TabBarView(
            children: <Widget>[TransactionHistoryView(), ReedemHistoryView()],
          )),
    );
  }
}
