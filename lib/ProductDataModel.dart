// ignore_for_file: file_names

class ProductDataModel {
  String? name;
  String? asma;
  String? audioURL;
  String? keterangan;
  String? nomor;
  int? ayat;
  String? type;

  ProductDataModel({
    this.name,
    this.asma,
    this.audioURL,
    this.keterangan,
    this.nomor,
    this.ayat,
    this.type,
  });

  ProductDataModel.fromJson(Map<String, dynamic> json) {
    name = json['nama'];
    asma = json['asma'];
    audioURL = json['audio'];
    keterangan = json['keterangan'];
    nomor = json['nomor'];
    ayat = json['ayat'];
    type = json['type'];
  }
}
