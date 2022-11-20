import 'package:flutter_loyalty_point/src/models/product/provider_model.dart';

class PulsaModel extends ProviderModel {
  PulsaModel({
    required super.namaProvider,
    required super.kodePrefix,
    required this.listPulsa,
  });
  List<ListPulsa> listPulsa;

  factory PulsaModel.fromJson(Map<String, dynamic> json) => PulsaModel(
        namaProvider: json["nama_provider"],
        kodePrefix: json["kode_prefix"],
        listPulsa: List<ListPulsa>.from(
            json["list_pulsa"].map((x) => ListPulsa.fromJson(x))),
      );
}

class ListPulsa {
  ListPulsa({
    required this.nominal,
    required this.deskripsi,
    required this.poin,
    required this.stock,
  });

  int nominal;
  String deskripsi;
  int poin;
  int stock;

  factory ListPulsa.fromJson(Map<String, dynamic> json) => ListPulsa(
        nominal: json["nominal"],
        deskripsi: json["deskripsi"],
        poin: json["poin"],
        stock: json["stock"],
      );
}

// {
//         "nama_provider": "",
//         "kode_prefix": "",
//         "list_pulsa":[
//             {
//             "nominal":10000,
//             "deskripsi":"dsiargvaqrgoi",
//             "poin":100,
//             "stock":50
//             }
//         ]
// }

