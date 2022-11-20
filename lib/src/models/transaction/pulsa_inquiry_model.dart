class PulsaInquiryModel {
  PulsaInquiryModel(
      {required this.orderID,
      required this.nomorHandphone,
      required this.nominal,
      required this.deskripsi,
      required this.poin,
      required this.stockBeli,
      required this.tanggalBeli});

  String orderID;
  int nomorHandphone;
  int nominal;
  String deskripsi;
  int poin;
  int stockBeli;
  DateTime? tanggalBeli;

  factory PulsaInquiryModel.fromJson(Map<String, dynamic> json) =>
      PulsaInquiryModel(
          orderID: json["order_id"],
          nomorHandphone: json["nomor_handphone"],
          nominal: json["nominal"],
          deskripsi: json["deskripsi"],
          poin: json["poin"],
          stockBeli: json["stock_beli"],
          tanggalBeli: json["tanggal_beli"]);

  Map<String, dynamic> toJson() => {
        "order_id": orderID,
        "nominal": nominal,
        "deskripsi": deskripsi,
        "poin": poin,
        "stock_beli": stockBeli,
        "tanggal_beli": tanggalBeli,
      };
}

// {
//     "pulsa":[
//         {
//                 "order_id":"q34gqgo4qghq",
//                 "nominal":50000,
//                 "deskripsi":"anrviagkvaa",
//                 "poin":100,
//                 "stock_beli":1,
//                 "tanggal_beli":20
//         }
//     ]
// }