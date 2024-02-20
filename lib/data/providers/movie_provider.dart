import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_provider/data/const/const.dart';
import 'package:movie_provider/data/models/movie_list_model.dart';

class MovieProvider extends ChangeNotifier {
  MovieProvider({required this.dio});
  final Dio dio;
  MovieListModel? data;

  Future<void> getMovie(String name) async {
   try{
     final response = await dio.get(
      '',
      queryParameters: {
        'apikey': Const.apiKey,
        's': name,
      },
    );
    data = MovieListModel.fromJson(response.data);
   }catch(e) {
    print(e.toString());
   }
   notifyListeners();
  }
}
