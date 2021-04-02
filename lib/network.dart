import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class NetworkManager {
  NetworkManager._privateConstructor();

  static final NetworkManager _instance = NetworkManager._privateConstructor();

  factory NetworkManager() {
    return _instance;
  }

  Future<dynamic> findByBarcode(String barcode) async {
    http.Response response = await http
        .get('https://api.formation-android.fr/v2/getProduct?barcode=$barcode');
    var body = json.decode(response.body);
    return body;
  }
}

abstract class ProductEvent {}

class GetProductEvent extends ProductEvent {}

class ProductContentBloc extends Bloc {
  ProductContentBloc(initialState) : super(initialState);

  @override
  Stream mapEventToState(event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
