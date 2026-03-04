import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  int _menuIndex = 0;
  int get menuIndex => _menuIndex;
  set menuIndex(int value) {
    _menuIndex = value;
  }

  bool _exitOpen = false;
  bool get exitOpen => _exitOpen;
  set exitOpen(bool value) {
    _exitOpen = value;
  }

  bool _dataIsFull = false;
  bool get dataIsFull => _dataIsFull;
  set dataIsFull(bool value) {
    _dataIsFull = value;
  }
}
