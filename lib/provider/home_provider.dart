import 'package:drift_database/local%20data/database.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier{

  // === Singleton Class === //
  factory HomeProvider() => _instance;
  static final HomeProvider _instance = HomeProvider._init();
  HomeProvider._init();


  late AppDatabase database;
  int _counter = 1;

  void init(){
    database=AppDatabase();
  }

  Stream<List<Category>> getCategories() {
    return database.getCategoriesStream();
  }

  Future<void> addNewCategory() async {
    database.insertCategory(Category(
        title: 'category $_counter',
        description: 'This a description for category $_counter')).then((value) {
      _counter++;
      print('add successful...');
    }).onError((error, stackTrace) {
      print('add failed');
    });
  }

}