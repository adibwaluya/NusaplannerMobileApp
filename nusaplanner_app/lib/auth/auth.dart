import 'dart:convert';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';
import 'package:nusaplanner_app/classes/todolist.dart';
import 'package:nusaplanner_app/classes/user.dart';
import 'package:nusaplanner_app/classes/user_sp.dart';
import 'package:nusaplanner_app/utils/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:kommunicate_flutter/kommunicate_flutter.dart';

class Auth extends ChangeNotifier {
  final storage = new FlutterSecureStorage();

  late var token;
  // late var email;
  late var endDate;
  //late IsSplashScreens splashScreens;

  bool authenticated = false;
  late User? authenticatedUser;
  late User? dateEnd; // To be updated!
  // String userIdString = "";
  Todolist? createdTodoList;

  static var lanOne;
  static var lanTwo;
  static var lanThree;
  var docOne;
  var docTwo;
  var docThree;
  var baOne;
  var visaOne;
  var visaTwo;
  var anpOne;
  var anpTwo;
  var depOne;
  var depTwo;

  get loggedIn {
    return authenticated;
  }

  get user {
    return authenticatedUser;
  }

  get registered {
    return authenticated;
  }

  get todolist {
    return createdTodoList;
  }

  Future signin(
      {Map? data, required Function success, required Function error}) async {
    try {
      Dio.Response response =
          await dio().post('auth/login', data: json.encode(data));

      var token = json.decode(response.toString())['access_token'];
      var id = json.decode(response.toString())['user']['id'];
      var email = json.decode(response.toString())['user']['email'];
      var dateEnd = json.decode(response.toString())['user']['date_end'];

      this._setStoredToken(token);
      // this._setStoredUserId(id);
      this._setStoredEmail(email);
      this._setStoredDateEnd(dateEnd);

      await UserSimplePreferences.setDate(dateEnd);
      print(id);
      // await UserSimplePreferences.setUserId(id);
      // _addDate(dateEnd);
      // _addUserId(id);
      this.attempt(token: token);
      // this.attemptTodoList(token: token);

      notifyListeners();

      success();
    } catch (e) {
      error();
    }
  }

  // TODO!
  Future signUp(
      {Map? data, required Function success, required Function error}) async {
    try {
      Dio.Response response =
          await dio().post('auth/register', data: json.encode(data));

      var token = json.decode(response.toString())['access_token'];
      var id = json.decode(response.toString())['user']['id'];
      var email = json.decode(response.toString())['user']['email'];
      var dateEnd = json.decode(response.toString())['user']['date_end'];

      print(token);
      this._setStoredToken(token);
      this._setStoredEmail(email);
      this._setStoredDateEnd(dateEnd);

      // this._setStoredUserId(id);
      await UserSimplePreferences.setDate(dateEnd);
      print(id);
      // _addDate(dateEnd);
      // _addUserId(id);
      this.attempt(token: token);
      // this.attemptTodoList(token: token);
      notifyListeners();

      success();
    } catch (e) {
      error();
    }
  }

  void attempt({token = ''}) async {
    if (token.toString().isNotEmpty) {
      this.token = token;
    }

    // No preexisting token, just return. No attempt on authentication
    if (this.token.toString().isEmpty) {
      return;
    }

    try {
      Dio.Response response = await dio().get(
        'auth/user-profile',
      );

      this.authenticated = true;

      this.authenticatedUser =
          User.fromJson(json.decode(response.toString())['data']);
      print(json.decode(response.toString())['data']);
      notifyListeners();
    } catch (e) {
      _setUnauthenticated();
    }
  }

  Future showTodoList(
      {Map? data, required Function success, required Function error}) async {
    try {
      Dio.Response response =
          await dio().post('auth/todo-lists', data: json.encode(data));

      // this.createdTodoList =
      //     Todolist.fromJson(json.decode(response.toString())['todolist']);
      // var userId = json.decode(response.toString())['todolist']['user_id'];
      // print(userId);
      // this._setStoredUserId(userId);
      var token = await storage.read(key: 'token');
      print(token);
      this.attemptTodoList(token: token);
      notifyListeners();
      success();
    } catch (e) {
      error();
    }
  }

  Future attemptTodoList({token = ''}) async {
    if (token.toString().isNotEmpty) {
      this.token = token;
    }

    // No preexisting token, just return. No attempt on authentication
    if (this.token.toString().isEmpty) {
      return;
    }

    try {
      Dio.Response response = await dio().get(
        'auth/get-todo-lists',
      );

      this.createdTodoList =
          Todolist.fromJson(json.decode(response.toString())['todolist']);

      /* await UserSimplePreferences.setTodolist(
          json.decode(response.toString())['todolist']); */

      /* Auth.lanOne = json.decode(response.toString())['todolist']['languageOne'];
      Auth.lanTwo = json.decode(response.toString())['todolist']['languageTwo'];
      Auth.lanThree =
          json.decode(response.toString())['todolist']['languageThree'];
      this.docOne = json.decode(response.toString())['todolist']['documentOne'];
      this.docTwo = json.decode(response.toString())['todolist']['documentTwo'];
      this.docThree =
          json.decode(response.toString())['todolist']['documentThree'];
      this.baOne = json.decode(response.toString())['todolist']['bankOne'];
      this.visaOne = json.decode(response.toString())['todolist']['visaOne'];
      this.visaTwo = json.decode(response.toString())['todolist']['visaTwo'];
      this.anpOne = json.decode(response.toString())['todolist']['anpOne'];
      this.anpTwo = json.decode(response.toString())['todolist']['anpTwo'];
      this.depOne = json.decode(response.toString())['todolist']['depOne'];
      this.depTwo = json.decode(response.toString())['todolist']['depTwo']; */

      // print("Mastiin" + Auth.lanOne.toString());
      // print(json.decode(response.toString())['todolist']);
      print('API');
      notifyListeners();
    } catch (e) {
      _setUnauthenticated();
    }
  }

  /* Future<List<Todolist>> fetchTodolist() async {
    Dio.Response response = await dio().get(
      'auth/get-todo-lists',
    );
    if (response.statusCode == 200) {
      /* {
    "todolist": {
        "languageOne": 0,
        "languageTwo": 0,
        "languageThree": 0,
        "documentOne": 0,
        "documentTwo": 0,
        "documentThree": 0,
        "bankOne": 0,
        "visaOne": 0,
        "visaTwo": 0,
        "anpOne": 0,
        "anpTwo": 0,
        "depOne": 0,
        "depTwo": 0
    }
}*/
      print(response.data['todolist']);
      var parsed = json.decode(response.data);
      // print("parsed: " + parsed);
      List jsonResponse = parsed['todolist'] as List;
      // print("List" + jsonResponse.toString());

      return jsonResponse.map((job) => new Todolist.fromJson(job)).toList();
    } else {
      print('Error. Could not load data');
      throw Exception('Failed to load data');
    }
  } */

  Future<Todolist> fetchTodolist() async {
    Dio.Response response = await dio().get(
      'auth/get-todo-lists',
    );
    if (response.statusCode == 200) {
      /* {
    "todolist": {
        "languageOne": 0,
        "languageTwo": 0,
        "languageThree": 0,
        "documentOne": 0,
        "documentTwo": 0,
        "documentThree": 0,
        "bankOne": 0,
        "visaOne": 0,
        "visaTwo": 0,
        "anpOne": 0,
        "anpTwo": 0,
        "depOne": 0,
        "depTwo": 0
    }
}*/

      print(response.data['todolist']);
      // var parsed = json.decode(response.data);
      // print("parsed: " + parsed);
      // List jsonResponse = parsed['todolist'] as List;
      // print("List" + jsonResponse.toString());
      Map apiResponse = response.data;

      return this.createdTodoList =
          new Todolist.fromJson(json.decode(response.toString())['todolist']);
    } else {
      print('Error. Could not load data');
      throw Exception('Failed to load data');
    }
  }

  /* void attemptDate({endDate = ''}) async {
    if (endDate.toString().isNotEmpty) {
      this.endDate = endDate;
    }

    if (this.endDate.toString().isEmpty) {
      return;
    }
    try {
      Dio.Response response = await dio().get(
        'auth/user-profile',
      );
      this.dateEnd =
          User.fromJson(json.decode(response.toString())['data']['dateEnd']);
      notifyListeners();
    } catch (e) {
      _setUnauthenticated();
    }
  } */

  void updateTodoList(
      {Map? data, required Function success, required Function error}) async {
    try {
      Dio.Response response =
          await dio().post('auth/update-todolist', data: json.encode(data));

      notifyListeners();
    } catch (e) {
      error();
    }
  }

  void updateSplashOne(
      {Map? data, required Function success, required Function error}) async {
    try {
      Dio.Response response =
          await dio().post('auth/update-splashOne', data: json.encode(data));

      notifyListeners();

      success();
      print(response);
    } catch (e) {
      error();
    }
  }

  void updateSplashTwo(
      {Map? data, required Function success, required Function error}) async {
    try {
      Dio.Response response =
          await dio().post('auth/update-splashTwo', data: json.encode(data));

      notifyListeners();

      success();
      print(response);
    } catch (e) {
      error();
    }
  }

  void updateSplashThree(
      {Map? data, required Function success, required Function error}) async {
    try {
      Dio.Response response =
          await dio().post('auth/update-splashThree', data: json.encode(data));

      notifyListeners();

      success();
      print(response);
    } catch (e) {
      error();
    }
  }

  void updateSplashFour(
      {Map? data, required Function success, required Function error}) async {
    try {
      Dio.Response response =
          await dio().post('auth/update-splashFour', data: json.encode(data));

      notifyListeners();

      success();
      print(response);
    } catch (e) {
      error();
    }
  }

  void updateSplashFive(
      {Map? data, required Function success, required Function error}) async {
    try {
      Dio.Response response =
          await dio().post('auth/update-splashFive', data: json.encode(data));

      notifyListeners();

      success();
      print(response);
    } catch (e) {
      error();
    }
  }

  void updateSplashSix(
      {Map? data, required Function success, required Function error}) async {
    try {
      Dio.Response response =
          await dio().post('auth/update-splashSix', data: json.encode(data));

      notifyListeners();
      success();
    } catch (e) {
      error();
    }
  }

  void updateDate(
      {Map? data, required Function success, required Function error}) async {
    try {
      Dio.Response response =
          await dio().post('auth/update-DatePrep', data: json.encode(data));

      notifyListeners();
      success();
    } catch (e) {
      error();
    }
  }

  void signOut({required Function success}) async {
    try {
      await dio().post('auth/logout');
      this._setUnauthenticated();
      KommunicateFlutterPlugin.logout();
      notifyListeners();

      success();
    } catch (e) {}
  }

  void _setUnauthenticated() async {
    this.authenticated = false;
    this.authenticatedUser = null;
    this.createdTodoList = null;
    await storage.delete(key: 'token');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    //await storage.delete(key: 'dateEnd');
  }

  void _setStoredUserId(String userid) async {
    await storage.write(key: 'userId', value: userid);
  }

  void _setStoredToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  void _setStoredEmail(String email) async {
    await storage.write(key: 'email', value: email);
  }

  void _setStoredDateEnd(String dateEnd) async {
    await storage.write(key: 'dateEnd', value: dateEnd);
  }

  /* _deleteDate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  } */

  /* _addDate(String date) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userDateEnd', date); // Previously addDateEnd
  }

  _addUserId(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var usedIdInt = int.parse(id);
    await prefs.setInt('userId', usedIdInt); // Previously addUserId
  } */
}
