import 'dart:convert';

class Mahasiswa{
  final String nim;
  final String user;
  final String pass;
  final String ang;

  Mahasiswa({this.nim,this.user, this.pass,this.ang});

  factory Mahasiswa.fromJson(Map<String, dynamic> json) =>
      Mahasiswa(
        nim: json['nim'],
        user: json['user'],
        pass: json['pass'],
        ang: json['ang']
      );
  Map<String, dynamic> toJson() {
    return {
      'nim': nim,
      'user': user,
      'pass': pass,
      'ang': ang,
    };
  }

  @override
  String toString() {
    return 'Datawarga{nim:$nim , user:$user, pass:$pass, ang:$ang}';
  }

  String mahasiswaToJson(Mahasiswa mahasiswa) {
    final jsonData = mahasiswa.toJson();
    return json.encode(jsonData);
  }


}