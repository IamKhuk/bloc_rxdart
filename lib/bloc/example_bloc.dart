import 'package:bloc_rxdart/database/database_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import '../model/example_model.dart';
import '../resource/repository.dart';

class ExampleBloc {
  DatabaseHelper dataBase = DatabaseHelper();
  final _repository = Repository();
  final _exampleFetcher = PublishSubject<List<ExampleModel>>();

  Stream<List<ExampleModel>> get allExample => _exampleFetcher.stream;

  fetchAllExample(bool isConnect) async {
    if (isConnect) {
      List<ExampleModel>? example = await _repository.fetchExample();
      if (example != null) {
        dataBase.clear();
        for (int i = 0; i < example.length; i++) {
          dataBase.saveProducts(example[i]);
        }
        _exampleFetcher.sink.add(example);
      }
    } else {
      List<ExampleModel> database = await _repository.databaseItem();
      if (kDebugMode) {
        print(database.length);
      }
      _exampleFetcher.sink.add(database);
    }
  }

  dispose() {
    _exampleFetcher.close();
  }
}

final blocExample = ExampleBloc();