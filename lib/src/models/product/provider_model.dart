class ProviderModel {
  ProviderModel({
    required this.namaProvider,
    required this.kodePrefix,
  });

  String namaProvider;
  String kodePrefix;

  factory ProviderModel.fromJson(Map<String, dynamic> json) => ProviderModel(
        namaProvider: json["nama_provider"],
        kodePrefix: json["kode_prefix"],
      );
}

// {
//         "nama_provider": "",
//         "kode_prefix": ""
// }
