class Covid {
  final Update update;

  Covid({required this.update});

  factory Covid.fromJson(Map<String, dynamic> json) {
    return Covid(
      update: Update.fromJson(json['update']),
    );
  }
}

class Update {
  final Total total;

  const Update({
    required this.total,
  });

  factory Update.fromJson(Map<String, dynamic> json) {
    return Update(
      total: Total.fromJson(json['total']),
    );
  }
}

class Total {
  final int jumlahPositif;
  final int jumlahDirawat;
  final int jumlahSembuh;
  final int jumlahMeninggal;

  const Total({
    required this.jumlahDirawat,
    required this.jumlahMeninggal,
    required this.jumlahPositif,
    required this.jumlahSembuh,
  });

  factory Total.fromJson(Map<String, dynamic> json) {
    return Total(
      jumlahDirawat: json['jumlah_dirawat'],
      jumlahMeninggal: json['jumlah_meninggal'],
      jumlahPositif: json['jumlah_positif'],
      jumlahSembuh: json['jumlah_sembuh'],
    );
  }
}
