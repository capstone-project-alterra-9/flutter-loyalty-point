import 'package:flutter_loyalty_point/src/models/product/provider_model.dart';

class PaketDataModel extends ProviderModel {
  PaketDataModel({
    required super.namaProvider,
    required super.kodePrefix,
    required this.listPaketData,
  });

  List<ListPaketData> listPaketData;

  factory PaketDataModel.fromJson(Map<String, dynamic> json) => PaketDataModel(
        namaProvider: json["nama_provider"],
        kodePrefix: json["kode_prefix"],
        listPaketData: List<ListPaketData>.from(
            json["list_paket_data"].map((x) => ListPaketData.fromJson(x))),
      );
}

class ListPaketData {
  ListPaketData({
    required this.namaPaketData,
    required this.harga,
    required this.deskripsi,
    required this.poin,
    required this.stock,
  });

  String namaPaketData;
  int harga;
  String deskripsi;
  int poin;
  int stock;

  factory ListPaketData.fromJson(Map<String, dynamic> json) => ListPaketData(
        namaPaketData: json["nama_paket_data"],
        harga: json["harga"],
        deskripsi: json["deskripsi"],
        poin: json["poin"],
        stock: json["stock"],
      );
}

// [
//     {
//             "nama_provider":"",
//             "kode_prefix": "",
//             "list_paket_data":[
//                 {
//                 "harga":10000,
//                 "deskripsi":"",
//                 "poin":100,
//                 "stock":50
//                 }
//             ]
//     }
// ]