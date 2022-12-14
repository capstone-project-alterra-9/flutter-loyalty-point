import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/models/transaction/transaction_model.dart';
import 'package:flutter_loyalty_point/src/utils/helper/args_transaction_detail_helper.dart';
import 'package:flutter_loyalty_point/src/view_models/transaction_detail/transaction_detail_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
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
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Detail Transaksi",
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
                boxShadow: [
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
                      Text(dataTransaksi.transaction.status == "success"
                          ? "Status : Berhasil"
                          : dataTransaksi.transaction.status == "pending"
                              ? "Status : Menunggu Server"
                              : "Status : Gagal"),
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
                  Text(
                    "Tanggal : ${dataTransaksi.transaction.date}",
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Text(
                    "Order ID : ${dataTransaksi.transaction.id.toString()}",
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
                boxShadow: [
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
                    "Detail transaksi",
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
                        "Serial Number",
                      ),
                      Expanded(
                        child: Text(
                          dataTransaksi.transaction.serialNumber.toString(),
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
                        "Nama Produk",
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
                        "Nomor Handphone",
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
                        "Harga",
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
                    onPressed: () {},
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
