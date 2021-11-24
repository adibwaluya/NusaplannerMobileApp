import 'dart:convert';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nusaplanner_app/classes/user.dart';
import 'package:nusaplanner_app/classes/user_sp.dart';
import 'package:nusaplanner_app/utils/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth extends ChangeNotifier {
  final storage = new FlutterSecureStorage();

  late var token;
  // late var email;
  late var endDate;
  //late IsSplashScreens splashScreens;

  bool authenticated = false;
  late User? authenticatedUser;
  late User? dateEnd; // To be updated!
  String userIdString = "";

  get loggedIn {
    return authenticated;
  }

  get user {
    return authenticatedUser;
  }

  get registered {
    return authenticated;
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
      var email = json.decode(response.toString())['user']['email'];
      var dateEnd = json.decode(response.toString())['user']['date_end'];
      var id = json.decode(response.toString())['user']['id'];
      print(token);
      this._setStoredToken(token);
      this._setStoredEmail(email);
      this._setStoredDateEnd(dateEnd);
      // this._setStoredUserId(id);
      await UserSimplePreferences.setDate(dateEnd);
      // _addDate(dateEnd);
      // _addUserId(id);
      this.attempt(token: token);

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
      notifyListeners();
      success();
    } catch (e) {}
  }

  void _setUnauthenticated() async {
    this.authenticated = false;
    this.authenticatedUser = null;
    await storage.delete(key: 'token');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    //await storage.delete(key: 'dateEnd');
  }

  void _setStoredUserId(String id) async {
    await storage.write(key: 'id', value: id);
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

  _addDate(String date) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userDateEnd', date); // Previously addDateEnd
  }

  _addUserId(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var usedIdInt = int.parse(id);
    await prefs.setInt('userId', usedIdInt); // Previously addUserId
  }
}
