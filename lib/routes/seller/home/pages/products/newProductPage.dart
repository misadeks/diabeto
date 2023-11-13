import 'package:diabeto/routes/seller/home/pages/products/productGallery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewProductPage extends StatefulWidget {
  const NewProductPage({super.key});

  @override
  State<StatefulWidget> createState() => _NewProductPageState();
}

List<String> productGallery = [
  "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/1022px-Placeholder_view_vector.svg.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/1022px-Placeholder_view_vector.svg.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/1022px-Placeholder_view_vector.svg.png"
];

List<String> tagList = ['Hleb', 'Cookie'];
String? productTag = '';

const List<String> currencies = <String>['RSD', 'EUR', 'USD'];

class _NewProductPageState extends State<NewProductPage> {
  String currency = currencies.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("New product"),
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
                TextField(
                  decoration: InputDecoration(
                    labelText: "Title",
                    border: const OutlineInputBorder(),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 24)),
                TextField(
                  maxLines: null,
                  decoration: InputDecoration(
                    labelText: "Description",
                    border: const OutlineInputBorder(),
                  ),
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
                              MaterialPageRoute(
                                  builder: (context) => ProductGallery()),
                            );
                          },
                          backgroundColor:
                              Theme.of(context).colorScheme.tertiaryContainer,
                          label: Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: Text(
                              'Add images',
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
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Price",
                            border: const OutlineInputBorder(),
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        )),
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
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
              ],
            ),
          ),
        ));
  }
}
