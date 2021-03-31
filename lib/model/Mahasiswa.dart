import 'dart:convert';

class Mahasiswa{
  final String nim;
  final String user;
  final String pass;
  final String ang;
  final String nama;

  Mahasiswa({this.nim,this.user, this.pass,this.ang, this.nama});

  factory Mahasiswa.fromJson(Map<String, dynamic> json) =>
      Mahasiswa(
        nim: json['nim'],
        user: json['user'],
        pass: json['pass'],
          nama: json['nama'],
        ang: json['ang']
      );

  Map<String, dynamic> toJson() {
    return {
      'nim': nim,
      'user': user,
      'pass': pass,
      'nama':nama,
      'ang': ang,
    };
  }

  @override
  String toString() {
    return 'Datawarga{nim:$nim , user:$user, pass:$pass, ang:$ang, nama:$nama}';
  }

  String mahasiswaToJson(Mahasiswa mahasiswa) {
    final jsonData = mahasiswa.toJson();
    return json.encode(jsonData);
  }
}