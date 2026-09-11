import 'package:house_price_predictor_app/model/house_detail.dart';
import 'package:house_price_predictor_app/service/lite_rt_service.dart';
import 'package:flutter/widgets.dart';

// todo-03-controller-01: create a class
class LiteRtController extends ChangeNotifier {
  // todo-03-controller-02: add a property and constructor
  final LiteRtService service;

  LiteRtController(this.service);

  // todo-03-controller-03: add state alse create a runInference and close method
  double _number = 0;

  double get number => _number;

  void runInference(HouseDetail value) {
    _number = service.inference(value.values);
    notifyListeners();
  }

  void close() => service.close();
}
