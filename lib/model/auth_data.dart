// ignore_for_file: public_member_api_docs, sort_constructors_first
class AuthData {
  String? username;
  String? token;

  AuthData({this.username, this.token});

  @override
  bool operator ==(covariant AuthData other) {
    if (identical(this, other)) return true;

    return other.username == username && other.token == token;
  }

  @override
  int get hashCode => username.hashCode ^ token.hashCode;
}
