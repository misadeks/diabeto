import 'dart:ui';

import 'package:flutter/material.dart';

/// Flutter code sample for [ReorderableListView].

void main() => runApp(const ProductGallery());

class ProductGallery extends StatelessWidget {
  const ProductGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: Text(productName!),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.check))
          ],
        ),
        body: const ReorderableExample(),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: SizedBox(
            width: 132,
            height: 72,
            child: FloatingActionButton(
              onPressed: () {
                // Add your onPressed code here!
              },
              child: const Icon(Icons.add),
              backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

class ReorderableExample extends StatefulWidget {
  const ReorderableExample({super.key});

  @override
  State<ReorderableExample> createState() => _ReorderableExampleState();
}

String? productName = 'Mokroluški hleb';

List<String> productGalleryLinks = [
  'https://i.redd.it/wplznapopmm11.jpg',
  'https://i.redd.it/wplznapopmm11.jpg',
  'https://i.redd.it/wplznapopmm11.jpg'
];

List<bool> productGalleryCheckboxValues = [true, false, true];

class _ReorderableExampleState extends State<ReorderableExample> {
  final List<int> _items =
      List<int>.generate(productGalleryLinks.length, (int index) => index);

  @override
  Widget build(BuildContext context) {
    final List<Card> cards = <Card>[
      for (int index = 0; index < productGalleryLinks.length; index += 1)
        Card(
          margin: EdgeInsets.symmetric(vertical: 6.0),
          key: Key('$index'),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.dehaze),
                ),
                SizedBox(
                  height: 100,
                  child: Center(
                    child: Image.network(productGalleryLinks[index]),
                  ),
                ),
                Expanded(
                    child: SizedBox(
                  height: 10.0,
                )),
                Checkbox(
                    value: productGalleryCheckboxValues[index],
                    onChanged: (value) {
                      setState(() {
                        productGalleryCheckboxValues[index] = value!;
                      });
                    }),
                IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // return the AlertDialog
                          return AlertDialog(
                            title: Text('Rmove picture?'),
                            content: Text(
                                'Are you sure you want to remove this picture from the gallery?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  // Close the dialog
                                  Navigator.of(context).pop();
                                },
                                child: Text('Delete'),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Close the dialog
                                  Navigator.of(context).pop();
                                },
                                child: Text('Cancel'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.delete))
              ],
            ),
          ),
        ),
    ];

    Widget proxyDecorator(
        Widget child, int index, Animation<double> animation) {
      return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          final double animValue = Curves.easeInOut.transform(animation.value);
          final double elevation = lerpDouble(1, 6, animValue)!;
          final double scale = lerpDouble(1, 1.02, animValue)!;
          return Transform.scale(
            scale: scale,
            // Create a Card based on the color and the content of the dragged one
            // and set its elevation to the animated value.
            child: Card(
              elevation: elevation,
              color: cards[index].color,
              child: cards[index].child,
            ),
          );
        },
        child: child,
      );
    }

    return ReorderableListView(
      padding: const EdgeInsets.all(16),
      proxyDecorator: proxyDecorator,
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final int item = _items.removeAt(oldIndex);
          _items.insert(newIndex, item);
        });
      },
      children: cards,
    );
  }
}
