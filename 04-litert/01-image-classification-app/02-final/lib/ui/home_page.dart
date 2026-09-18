import 'package:flutter/material.dart';
import 'package:tflite_vision_app/controller/image_classification_provider.dart';
import 'package:tflite_vision_app/services/image_classification_service.dart';
import 'package:tflite_vision_app/widget/camera_view.dart';
import 'package:tflite_vision_app/widget/classification_item.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Image Classification App'),
      ),
      body: ColoredBox(
        color: Colors.black,
        child: Center(
          // todo-05-ui-01: inject all classes
          child: MultiProvider(
            providers: [
              Provider(
                create: (context) => ImageClassificationService(),
              ),
              ChangeNotifierProvider(
                create: (context) => ImageClassificationViewmodel(
                  context.read<ImageClassificationService>(),
                ),
              ),
            ],
            child: _HomeBody(),
          ),
        ),
      ),
    );
  }
}

// todo-05-ui-02: change this widget into StatefulWidget
class _HomeBody extends StatefulWidget {
  const _HomeBody();

  @override
  State<_HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<_HomeBody> {
  // todo-05-ui-03: setup the provider and dispose it after using it
  late final readViewmodel = context.read<ImageClassificationViewmodel>();

  @override
  void dispose() {
    Future.microtask(() async => await readViewmodel.close());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CameraView(
          // todo-05-ui-04: add the parameter and run the inference process
          onImage: (cameraImage) async {
            await readViewmodel.runClassification(cameraImage);
          },
        ),
        // todo-05-ui-05: add a widget to see the result
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Consumer<ImageClassificationViewmodel>(
            builder: (_, updateViewmodel, _) {
              final classifications = updateViewmodel.classifications.entries;

              if (classifications.isEmpty) {
                return const SizedBox.shrink();
              }
              return SingleChildScrollView(
                child: Column(
                  children: classifications
                      .map(
                        (classification) => ClassificatioinItem(
                          item: classification.key,
                          value: classification.value.toStringAsFixed(2),
                        ),
                      )
                      .toList(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
