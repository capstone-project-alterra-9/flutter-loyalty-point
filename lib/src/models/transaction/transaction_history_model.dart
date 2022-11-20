import 'package:flutter_loyalty_point/src/models/transaction/paket_data_inquiry_model.dart';
import 'package:flutter_loyalty_point/src/models/transaction/pulsa_inquiry_model.dart';

class TransactionHistoryModel {
  TransactionHistoryModel({
    required this.pulsa,
    required this.paketData,
  });

  List<PulsaInquiryModel> pulsa;
  List<PaketDataInquiryModel> paketData;

  factory TransactionHistoryModel.fromJson(Map<String, dynamic> json) =>
      TransactionHistoryModel(
        pulsa: List<PulsaInquiryModel>.from(
            json["pulsa"].map((x) => PulsaInquiryModel.fromJson(x))),
        paketData: List<PaketDataInquiryModel>.from(
            json["paket_data"].map((x) => PaketDataInquiryModel.fromJson(x))),
      );
}


// {
//     "pulsa":[
//         {
//                 "order_id":"q34gqgo4qghq",
//                 "nomor_handphone":0812929202,
//                 "nominal":50000,
//                 "deskripsi":"anrviagkvaa",
//                 "poin":100,
//                 "stock_beli":1,
//                 "tanggal_beli":
//         }
//     ],
//     "paket_data":[
//         {
//                 "order_id":"q34gqgo4qghq",
//                 "nomor_handphone":0812929202,
//                 "nama_paket_data":"Panas 1",
//                 "harga":20000,
//                 "deskripsi":"arvibarabv",
//                 "poin":100,
//                 "stock_beli":1,
//                 "tanggal_beli":
//         }
//     ]
// }