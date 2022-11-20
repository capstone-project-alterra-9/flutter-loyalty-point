class PaketDataInquiryModel {
  PaketDataInquiryModel(
      {required this.orderID,
      required this.nomorHandphone,
      required this.namaPaketData,
      required this.harga,
      required this.deskripsi,
      required this.poin,
      required this.stockBeli,
      required this.tanggalBeli});

  String orderID;
  int nomorHandphone;
  String namaPaketData;
  int harga;
  String deskripsi;
  int poin;
  int stockBeli;
  DateTime? tanggalBeli;

  factory PaketDataInquiryModel.fromJson(Map<String, dynamic> json) =>
      PaketDataInquiryModel(
          orderID: json["order_id"],
          nomorHandphone: json["nomor_handphone"],
          namaPaketData: json["nama_paket_data"],
          harga: json["harga"],
          deskripsi: json["deskripsi"],
          poin: json["poin"],
          stockBeli: json["stock_beli"],
          tanggalBeli: json["tanggal_beli"]);
}

// {
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