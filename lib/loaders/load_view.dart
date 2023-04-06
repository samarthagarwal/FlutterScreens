import 'package:flutter/material.dart';

import 'color_loader_4.dart';
import 'color_loader_5.dart';
import 'loaders.dart';

class LoaderWidgetPreview extends StatefulWidget {
  const LoaderWidgetPreview({super.key});

  @override
  State<LoaderWidgetPreview> createState() => _LoaderWidgetPreviewState();
}

class _LoaderWidgetPreviewState extends State<LoaderWidgetPreview> {
  final loaders = {
    'ColorLoader': ColorLoader(),
    'ColorLoader2': ColorLoader2(),
    'ColorLoader3': ColorLoader3(),
    'ColorLoader4': ColorLoader4(),
    'ColorLoader5': ColorLoader5(),
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Loader Preview')),
      body: ListView.builder(
        itemCount: loaders.length,
        itemBuilder: (context, index) {
          final key = loaders.keys.elementAt(index);

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 150,
              child: Row(
                children: [
                  Text(key),
                  Expanded(child: loaders[key]!),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
