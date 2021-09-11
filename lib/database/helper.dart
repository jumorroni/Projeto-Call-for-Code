import 'package:sqflite/sqflite.dart';

final String idColumn = "idColumn";
final String nameColumn = "nameColumn";
final String emailColumn = "emailColumn";
final String phoneColumn = "phoneColumn";
final String passwordColumn = "passwordColumn";
final String addressIdColumn = "addressIdColumn";
final String nameFoodColumn = "nameFoodColumn";
final String typeColumn = "typeColumn";
final String imageColumn = "imageColumn";
final String finalityColumn = "finalityColumn";
final String deadlineColumn = "deadlineColumn";
final String quantityColumn = "quantityColumn";
final String countryColumn = "countryColumn";
final String stateColumn = "stateColumn";
final String cityColumn = "cityColumn";
final String addressColumn = "addressColumn";
final String postalColumn = "postalColumn";
final String idFoodColumn = "idFoodColumn";
final String idUserColumn = "idUserColumn";
final String idDonorColumn = "idDonorColumn";

final String foodTable = "foodTable";
final String userTable = "userTable";
final String addressTable = "addressTable";
final String userFoodTable = "userFoodTable";
final String requestTable = "requestTable";

class Helper {
  static final Helper _instance = Helper.internal();
  factory Helper() => _instance;
  Helper.internal();

  late Database _db;

  Future<Database> get db async {
    _db = await initDb();
    return _db;
  }

  Future<Database> initDb() async {
    final databasePath = await getDatabasesPath();
    final path = databasePath + "give.db";
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $userTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT, $emailColumn TEXT, $phoneColumn TEXT, $addressIdColumn INTEGER, $passwordColumn TEXT)");
      await db.execute(
          "CREATE TABLE $foodTable($idColumn INTEGER PRIMARY KEY, $nameFoodColumn TEXT, $typeColumn TEXT, $finalityColumn TEXT, $deadlineColumn TEXT, $imageColumn TEXT, $quantityColumn INTEGER)");
      await db.execute(
          "CREATE TABLE $addressTable($idColumn INTEGER PRIMARY KEY, $countryColumn TEXT, $stateColumn TEXT, $cityColumn TEXT, $addressIdColumn TEXT, $postalColumn TEXT)");
      await db.execute(
          "CREATE TABLE $userFoodTable($idColumn INTEGER PRIMARY KEY, $idFoodColumn INTEGER, $idUserColumn INTEGER)");
      await db.execute(
          "CREATE TABLE $requestTable($idColumn INTEGER PRIMARY KEY, $idDonorColumn INTEGER, $idUserColumn INTEGER, $idFoodColumn INTEGER, $quantityColumn INTEGER)");
    });
  }

  Future<User> saveUser(User user) async {
    Database dbase = await db;
    user.id = await dbase.insert(userTable, user.toMap());
    return user;
  }

  Future<dynamic> getUser(int id) async {
    Database dbase = await db;
    List<Map> maps = await dbase.query(userTable,
        columns: [
          idColumn,
          nameColumn,
          emailColumn,
          phoneColumn,
          passwordColumn,
          addressIdColumn
        ],
        where: "$idColumn = ?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return User.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteUser(int id) async {
    Database dbase = await db;
    return await dbase
        .delete(userTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> updateUser(User user) async {
    Database dbase = await db;
    return await dbase.update(
      userTable,
      user.toMap(),
      where: "$idColumn = ?",
      whereArgs: [user.id],
    );
  }

  Future<List> getAllUsers() async {
    Database dbase = await db;
    List listMap = await dbase.rawQuery("SELECT * FROM $userTable");
    List<User> listUser = [];
    for (Map m in listMap) {
      listUser.add(User.fromMap(m));
    }
    return listUser;
  }

  Future<int?> getNumberUser() async {
    Database dbase = await db;
    return Sqflite.firstIntValue(
        await dbase.rawQuery("SELECT COUNT(*) FROM $userTable"));
  }

  Future close() async {
    Database dbase = await db;
    dbase.close();
  }

  Future<Food> saveFood(Food food) async {
    Database dbase = await db;
    food.id = await dbase.insert(foodTable, food.toMap());
    return food;
  }

  Future<dynamic> getFood(int id) async {
    Database dbase = await db;
    List<Map> maps = await dbase.query(foodTable,
        columns: [
          idColumn,
          typeColumn,
          nameFoodColumn,
          finalityColumn,
          deadlineColumn,
          quantityColumn,
          imageColumn,
        ],
        where: "$idColumn = ?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return Food.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteFood(int id) async {
    Database dbase = await db;
    return await dbase
        .delete(foodTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> updateFood(Food food) async {
    Database dbase = await db;
    return await dbase.update(
      foodTable,
      food.toMap(),
      where: "$idColumn = ?",
      whereArgs: [food.id],
    );
  }

  Future<List> getAllFoods() async {
    Database dbase = await db;
    List listMap = await dbase.rawQuery("SELECT * FROM $foodTable");
    List<User> listFood = [];
    for (Map m in listMap) {
      listFood.add(User.fromMap(m));
    }
    return listFood;
  }

  Future<int?> getNumberFood() async {
    Database dbase = await db;
    return Sqflite.firstIntValue(
        await dbase.rawQuery("SELECT COUNT(*) FROM $foodTable"));
  }

  Future<Address> saveAddress(Address address) async {
    Database dbase = await db;
    address.id = await dbase.insert(addressTable, address.toMap());
    return address;
  }

  Future<dynamic> getAddress(int id) async {
    Database dbase = await db;
    List<Map> maps = await dbase.query(addressTable,
        columns: [
          idColumn,
          countryColumn,
          stateColumn,
          cityColumn,
          addressColumn,
          postalColumn,
        ],
        where: "$idColumn = ?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return Address.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteAddress(int id) async {
    Database dbase = await db;
    return await dbase
        .delete(addressTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> updateAddress(Address address) async {
    Database dbase = await db;
    return await dbase.update(
      addressTable,
      address.toMap(),
      where: "$idColumn = ?",
      whereArgs: [address.id],
    );
  }

  Future<List> getAllAddress() async {
    Database dbase = await db;
    List listMap = await dbase.rawQuery("SELECT * FROM $addressTable");
    List<Address> listAddress = [];
    for (Map m in listMap) {
      listAddress.add(Address.fromMap(m));
    }
    return listAddress;
  }

  Future<int?> getNumberAddress() async {
    Database dbase = await db;
    return Sqflite.firstIntValue(
        await dbase.rawQuery("SELECT COUNT(*) FROM $addressTable"));
  }

  Future<UserFood> saveUserFood(UserFood userFood) async {
    Database dbase = await db;
    userFood.id = await dbase.insert(userFoodTable, userFood.toMap());
    return userFood;
  }

  Future<dynamic> getUserFood(int id) async {
    Database dbase = await db;
    List<Map> maps = await dbase.query(userFoodTable,
        columns: [
          idColumn,
          idUserColumn,
          idFoodColumn,
        ],
        where: "$idColumn = ?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return UserFood.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteUserFood(int id) async {
    Database dbase = await db;
    return await dbase
        .delete(userFoodTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> updateUserFood(UserFood userfood) async {
    Database dbase = await db;
    return await dbase.update(
      userFoodTable,
      userfood.toMap(),
      where: "$idColumn = ?",
      whereArgs: [userfood.id],
    );
  }

  Future<List> getAllUserFood() async {
    Database dbase = await db;
    List listMap = await dbase.rawQuery("SELECT * FROM $userFoodTable");
    List<UserFood> listUserFood = [];
    for (Map m in listMap) {
      listUserFood.add(UserFood.fromMap(m));
    }
    return listUserFood;
  }

  Future<int?> getNumberUserFood() async {
    Database dbase = await db;
    return Sqflite.firstIntValue(
        await dbase.rawQuery("SELECT COUNT(*) FROM $userFoodTable"));
  }

  Future<Request> saveRequest(Request request) async {
    Database dbase = await db;
    request.id = await dbase.insert(requestTable, request.toMap());
    return request;
  }

  Future<dynamic> getRequest(int id) async {
    Database dbase = await db;
    List<Map> maps = await dbase.query(requestTable,
        columns: [
          idColumn,
          idUserColumn,
          idFoodColumn,
          idDonorColumn,
          quantityColumn,
        ],
        where: "$idColumn = ?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return Request.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteRequest(int id) async {
    Database dbase = await db;
    return await dbase
        .delete(requestTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> updateRequest(Request request) async {
    Database dbase = await db;
    return await dbase.update(
      requestTable,
      request.toMap(),
      where: "$idColumn = ?",
      whereArgs: [request.id],
    );
  }

  Future<List> getAllRequests() async {
    Database dbase = await db;
    List listMap = await dbase.rawQuery("SELECT * FROM $requestTable");
    List<Request> listRequest = [];
    for (Map m in listMap) {
      listRequest.add(Request.fromMap(m));
    }
    return listRequest;
  }

  Future<int?> getNumberRequest() async {
    Database dbase = await db;
    return Sqflite.firstIntValue(
        await dbase.rawQuery("SELECT COUNT(*) FROM $requestTable"));
  }
}

class User {
  late int id;
  late String name;
  late String phone;
  late String email;
  late int addressID;
  late String password;

  User();
  User.fromMap(Map map) {
    id = map[idColumn];
    name = map[nameColumn];
    phone = map[phoneColumn];
    email = map[emailColumn];
    password = map[passwordColumn];
    addressID = map[addressIdColumn];
  }

  Map<String, Object> toMap() {
    Map<String, Object> map = {
      nameColumn: name,
      emailColumn: email,
      phoneColumn: phone,
      addressIdColumn: addressID,
      passwordColumn: password,
    };
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }
}

class Food {
  late int id;
  late String type;
  late String foodName;
  late String finality;
  late String deadline;
  late int quantity;
  late String image;

  Food();
  Food.fromMap(Map map) {
    id = map[idColumn];
    type = map[typeColumn];
    foodName = map[nameFoodColumn];
    finality = map[finalityColumn];
    deadline = map[deadlineColumn];
    quantity = map[quantityColumn];
    image = map[imageColumn];
  }

  Map<String, Object> toMap() {
    Map<String, Object> map = {
      typeColumn: type,
      nameFoodColumn: foodName,
      finalityColumn: finality,
      deadlineColumn: deadline,
      quantityColumn: quantity,
      imageColumn: image,
    };
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }
}

class Address {
  late int id;
  late String country;
  late String state;
  late String city;
  late String address;
  late String postal;

  Address();
  Address.fromMap(Map map) {
    id = map[idColumn];
    country = map[countryColumn];
    state = map[stateColumn];
    city = map[cityColumn];
    address = map[addressColumn];
    postal = map[postalColumn];
  }

  Map<String, Object> toMap() {
    Map<String, Object> map = {
      countryColumn: country,
      stateColumn: state,
      cityColumn: city,
      addressColumn: address,
      postalColumn: postal,
    };
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }
}

class UserFood {
  late int idUser;
  late int idFood;
  late int id;

  UserFood();
  UserFood.fromMap(Map map) {
    idUser = map[idUserColumn];
    idFood = map[idFoodColumn];
    id = map[idColumn];
  }

  Map<String, Object> toMap() {
    Map<String, Object> map = {
      idUserColumn: idUser,
      idFoodColumn: idFood,
    };
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }
}

class Request {
  late int idDonor;
  late int idUser;
  late int idFood;
  late int quantity;
  late int id;

  Request();
  Request.fromMap(Map map) {
    idUser = map[idUserColumn];
    idFood = map[idFoodColumn];
    idDonor = map[idDonorColumn];
    id = map[idColumn];
  }

  Map<String, Object> toMap() {
    Map<String, Object> map = {
      idUserColumn: idUser,
      idFoodColumn: idFood,
      idDonorColumn: idDonor,
    };
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }
}
