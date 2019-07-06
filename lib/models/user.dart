class User {
  String _username;
  String _password;
  int _id;

  User(this._username, this._password);

  User.map(dynamic object) {
    this._username = object['username'];
    this._password = object['password'];
    this._id = object['id'];
  }

  String get username => _username;

  String get password => _password;

  int get id => _id;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["username"] = _username;
    map["password"] = _password;
    map["id"] = _id;

    if (id != null) {
      map["id"] = _id;
    }
    return map;
  }

  User.fromMap(Map<String, dynamic> map) {
    this._username = map["username"];
    this._password = map["password"];
    this._id = map["id"];
  }
}
