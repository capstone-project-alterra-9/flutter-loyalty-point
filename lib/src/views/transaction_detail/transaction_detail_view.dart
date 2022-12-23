import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_loyalty_point/src/utils/helper/args_transaction_detail_helper.dart';
import 'package:flutter_loyalty_point/src/view_models/transaction_detail/transaction_detail_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TransactionDetailView extends StatelessWidget {
  const TransactionDetailView({super.key});

  static const String routeName = "/transaction-detail";

  @override
  Widget build(BuildContext context) {
    ArgsTransactionDetailHelper dataTransaksi =
        Provider.of<TransactionDetailViewModel>(context).args;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          "Transaction Details",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[50],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 1.0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Text(
                        dataTransaksi.transaction.status == "success"
                            ? "Success"
                            : dataTransaksi.transaction.status == "pending"
                                ? "Pending"
                                : "Failed",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            color: dataTransaksi.transaction.status == "success"
                                ? Colors.green
                                : dataTransaksi.transaction.status == "pending"
                                    ? Colors.amber
                                    : Colors.red,
                            borderRadius: BorderRadius.circular(100)),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Date:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          DateFormat.yMMMd()
                              .format(DateTime.parse(
                                dataTransaksi.transaction.date ?? "",
                              ))
                              .toString(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Order ID:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () => Clipboard.setData(
                            ClipboardData(
                              text: dataTransaksi.transaction.id.toString(),
                            ),
                          ),
                          child: Text(
                            dataTransaksi.transaction.id.toString(),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 1.0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Transaction Details",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Product Name",
                      ),
                      Expanded(
                        child: Text(
                          dataTransaksi.transaction.name ?? "",
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Mobile Number",
                      ),
                      Expanded(
                        child: Text(
                          dataTransaksi.transaction.identifierNumber ?? "",
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Price",
                      ),
                      Expanded(
                        child: Text(
                          "${dataTransaksi.transaction.price.toString()} Poins",
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(156, 194, 155, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    onPressed: () {
                      context
                          .read<TransactionDetailViewModel>()
                          .toCustomerService();
                    },
                    child: Text(
                      "Butuh Bantuan?",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
