import "package:network/endpoints/login_api.dart";
import "package:network/model/login_req.dart";
import "package:network/model/login_resp.dart";
import "package:storage/storage.dart";

import "../model/auth_data.dart";

class LoginRepository {
  late LoginApi _loginApi;
  late Storage _localStorage;
  late Storage _secureStorage;

  LoginRepository(this._localStorage, this._secureStorage, this._loginApi);

  Future<AuthData> loginUser(String username, String password) async {
    LoginResp loginResp =
        await _loginApi.login(LoginReq(username: username, password: password));
    _localStorage.setItem(key: "userName", value: username);
    _secureStorage.setItem(key: username, value: loginResp.authToken);
    return AuthData(username: username, token: loginResp.authToken);
  }

  Future<AuthData> getLoggedInUser() async {
    String? token;
    String? userName = await _localStorage.getItem(key: "userName");
    if (userName != null) token = await _secureStorage.getItem(key: userName);
    return AuthData(
      username: userName,
      token: token,
    );
  }

  void logout() async {
    var userName = await _localStorage.getItem(key: "username");
    _localStorage.deleteItem(key: "userName");
    if (userName != null) _secureStorage.deleteItem(key: userName);
  }
}
