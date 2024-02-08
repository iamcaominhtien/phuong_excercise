class Profile {
  String hoTen;
  String queQuan;
  DateTime ngaySinh;
  String soThich;
  String imageAssest;

  Profile({
    required this.hoTen,
    required this.queQuan,
    required this.ngaySinh,
    required this.soThich,
    required this.imageAssest,
  });

  // from json
  Profile.fromJson(Map<String, dynamic> json)
      : hoTen = json['hoTen'],
        queQuan = json['queQuan'],
        ngaySinh = DateTime.parse(json['ngaySinh']),
        soThich = json['soThich'],
        imageAssest = json['imageAssest'];

  // to json
  Map<String, dynamic> toJson() => {
        'hoTen': hoTen,
        'queQuan': queQuan,
        'ngaySinh': ngaySinh.toIso8601String(),
        'soThich': soThich,
        'imageAssest': imageAssest,
      };

  static Profile createDefaultProfile() {
    return Profile(
      hoTen: 'Cao Minh Tiến',
      queQuan: 'Nha Trang',
      ngaySinh: DateTime.parse('2001-05-19'),
      soThich: 'Ca nhạc',
      imageAssest: 'assets/pic2.jpg',
    );
  }
}
