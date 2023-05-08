import 'dart:async';

import 'package:bloc_rxdart/database/database_helper.dart';

import '../model/example_model.dart';
import 'api_provider.dart';

class Repository {
  final pharmacyApiProvider = ApiProvider();
  DatabaseHelper databaseHelper = DatabaseHelper();

  Future<List<ExampleModel>?> fetchExample() =>
      pharmacyApiProvider.fetchExample();

  Future<List<ExampleModel>> databaseItem() => databaseHelper.getProduct();
}