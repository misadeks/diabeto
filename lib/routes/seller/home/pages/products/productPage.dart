import 'package:diabeto/routes/seller/home/pages/products/productGallery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<StatefulWidget> createState() => _ProductPageState();
}

const List<String> currencies = <String>['RSD', 'EUR', 'USD'];

List<String> tagList = ['Hleb', 'Cookie'];
String? productTag = 'Hleb';
String? productName = 'Mokroluški hleb';
String? productDescription =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet';
int? productPrice = 250;
List<String> productGallery = [
  'https://i.redd.it/wplznapopmm11.jpg',
  'https://i.redd.it/wplznapopmm11.jpg',
  'https://i.redd.it/wplznapopmm11.jpg'
];

class TextInputField extends StatelessWidget {
  final String labelText;
  final String placeholderText;
  final int maxLines;

  const TextInputField(
      {super.key,
      required this.labelText,
      required this.placeholderText,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(text: placeholderText),
      maxLines: (maxLines == 0) ? null : maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}

class NumberInputField extends StatelessWidget {
  final String labelText;
  final int placeholderNumber;

  const NumberInputField(
      {super.key, required this.labelText, required this.placeholderNumber});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
      controller: TextEditingController(text: placeholderNumber.toString()),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }
}

class _ProductPageState extends State<ProductPage> {
  String currency = currencies.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 37, right: 37, top: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextInputField(
                  labelText: "Title",
                  placeholderText: productName!,
                ),
                const Padding(padding: EdgeInsets.only(top: 24)),
                TextInputField(
                  labelText: "Description",
                  placeholderText: productDescription!,
                  maxLines: 0,
                ),
                const Padding(padding: EdgeInsets.only(top: 24)),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(
                        color: Theme.of(context).colorScheme.outline),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: Stack(
                      // gallery deo
                      alignment: Alignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Image.network(
                                productGallery[0],
                                height: 141,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              flex: 2,
                              child: Image.network(
                                productGallery[0],
                                height: 141,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              flex: 2,
                              child: Image.network(
                                productGallery[2],
                                height: 141,
                              ),
                            )
                          ],
                        ),
                        FloatingActionButton.extended(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ProductGallery()),
                            );
                          },
                          backgroundColor:
                              Theme.of(context).colorScheme.tertiaryContainer,
                          label: Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: Text(
                              'Edit gallery',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onTertiaryContainer,
                                  letterSpacing: 0.5),
                            ),
                          ),
                          icon: const Icon(
                            Icons.folder_outlined,
                            size: 24,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 24)),
                Row(
                  children: [
                    SizedBox(
                      width: 142,
                      child: NumberInputField(
                          labelText: 'Price', placeholderNumber: productPrice!),
                    ),
                    const SizedBox(
                      width: 24.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                            color: Theme.of(context).colorScheme.outline),
                        color: Theme.of(context).colorScheme.surfaceVariant,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 8.0),
                        child: DropdownButton(
                            underline: const SizedBox.shrink(),
                            value: currency,
                            items: currencies
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                currency = value!;
                              });
                            }),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 9, top: 24),
                  child: Text(
                    'Tag',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 16)),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).colorScheme.outline),
                      color: Theme.of(context).colorScheme.surfaceVariant),
                  child: Column(
                    children: [
                      Container(
                        constraints: BoxConstraints(maxHeight: 150),
                        // Set a specific height or use constraints
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: ListView.separated(
                            itemBuilder: (BuildContext context, int index) {
                              final tag = tagList[index];

                              return Row(
                                children: [
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Container(
                                      child: Text(
                                        tag,
                                        style:
                                            Theme.of(context).textTheme.bodyLarge,
                                      ),
                                    ),
                                  )),
                                  Radio<String>(
                                    value: tag,
                                    groupValue: productTag,
                                    onChanged: (value) {
                                      setState(() {
                                        productTag = value;
                                      });
                                    },
                                  ),
                                ],
                              );
                            },
                            itemCount: tagList.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Divider();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 80.0, vertical: 32.0),
                  child: OutlinedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            // return the AlertDialog
                            return AlertDialog(
                              title: Text('Delete product?'),
                              content:
                                  Text('Are you sure you want to delete ' + productName!  + '?'),
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
                      child: Text('Delete product')),
                ),
              ],
            ),
          ),
        ));
  }
}
