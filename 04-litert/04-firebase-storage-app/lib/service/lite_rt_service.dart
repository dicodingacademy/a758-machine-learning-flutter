import 'dart:developer';
import 'dart:io';

import 'package:house_price_predictor_app/service/firebase_storage_service.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

// todo-02-service-02: add service
class LiteRtService {
  final FirebaseStorageService _mlService;

  LiteRtService(this._mlService);

  // todo-02-service-03: setup static value and variable
  late final File modelFile;

  late final Interpreter interpreter;
  late final List<String> labels;
  late List inputFormat;
  late List outputFormat;

  // todo-02-service-04: setup model
  Future<void> initModel() async {
    modelFile = await _mlService.loadModel();

    final options = InterpreterOptions()
      ..useNnApiForAndroid = true
      ..useMetalDelegateForIOS = true;

    // Load model from assets
    interpreter = Interpreter.fromFile(modelFile, options: options);
    // Get tensor output shape [1, 1]
    final outputTensor = interpreter.getOutputTensors().first;
    final outputShape = outputTensor.shape;
    log('outputShape: $outputShape');
    // Create a list [1, 1]
    outputFormat = List.generate(
      outputShape.first,
      (_) => List.generate(outputShape.last, (_) => 0.0),
    );
    log('outputFormat: $outputFormat');

    log('Interpreter loaded successfully');
  }

  // todo-02-service-05: setup inference and close function
  double inference(List<double> number) {
    // Get tensor input shape [1, 4, 1]
    final inputTensor = interpreter.getInputTensors().first;
    final inputShape = inputTensor.shape;
    log('inputShape: $inputShape');
    // Create a list [1, 4, 1]
    inputFormat = List.generate(
      inputShape.first,
      (_) => List.generate(
        inputShape[1],
        (i) => List.generate(inputShape.last, (_) => number[i]),
      ),
    );
    log('inputFormat: $inputFormat');

    interpreter.run(inputFormat, outputFormat);

    final result = outputFormat.first.first;
    log('outputFormat: $outputFormat (after)');
    return result;
  }

  void close() {
    interpreter.close();
  }
}
