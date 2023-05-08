import 'dart:async';

import 'package:bloc_rxdart/database/database_helper.dart';

import '../model/example_model.dart';
import 'api_provider.dart';

class Repository {
  final apiProvider = ApiProvider();
  DatabaseHelper databaseHelper = DatabaseHelper();

  Future<List<ExampleModel>?> fetchExample() =>
      apiProvider.fetchExample();

  Future<List<ExampleModel>> databaseItem() => databaseHelper.getProduct();
}