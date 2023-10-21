import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

  late bool _expanded = false;


  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      clipBehavior: Clip.antiAlias,
      curve: Curves.easeIn,
      child: _expanded ? ExpandedProductCard(): CollapsedProductCard(),
    );
  }

  Widget ExpandedProductCard(){
    return Card(
        margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 30),
        child: Container(
            margin: const EdgeInsets.all(0),

            child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                        top: 10,
                        bottom: 10
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Hleb sa semenkama',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurfaceVariant,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_upward),
                          iconSize: 20,
                          onPressed: () {
                            setState(() {
                              _expanded = false;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image(
                          image: NetworkImage(
                            'https://placehold.co/400x200.png',
                          )
                      ),
                      OutlinedButton(
                        child: Text(
                            'Change Image',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurfaceVariant
                            )
                        ),
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.surface.withOpacity(0.8)),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.mode_comment_outlined,
                          size: 16,
                        ),
                        Expanded(
                          child: TextFormField(
                            initialValue: 'Lorem ipsum dolor sit...',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                  left: 10,
                                  right: 0,
                                  bottom: 5,
                                  top: 5,
                                ),
                                hintText: 'Lorem ipsum dolor sit...'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                          bottom: 0
                      ),
                      child: Divider(
                        height: 0,
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star_outline,
                          size: 20,
                        ),
                        Expanded(
                          child: TextFormField(
                            initialValue: '250 RSD',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 8,
                                    right: 0,
                                    bottom: 5,
                                    top: 5
                                ),
                                hintText: 'Lorem ipsum dolor sit...'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                          bottom: 0
                      ),
                      child: Divider(
                        height: 0,
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.folder_open_outlined,
                          size: 20,
                        ),
                        Expanded(
                          child: TextFormField(
                            // TODO: Exteral product category
                            initialValue: 'Hleb',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                  left: 8,
                                  right: 0,
                                  bottom: 5,
                                  top: 5,
                                ),
                                // TODO: External product price
                                hintText: 'Hleb'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 10,
                        bottom: 10
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton.icon(
                            icon: Icon(
                              Icons.delete_outline_rounded,
                              size: 18,
                            ),
                            label: Text('Delete',
                              style: TextStyle(
                                height: 2.6,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            onPressed: () {}
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        FilledButton.icon(
                            icon: Icon(
                              Icons.check,
                              size: 18,
                            ),
                            label: Text('Save',
                              style: TextStyle(
                                height: 2.6,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            onPressed: () {}
                        ),
                      ],
                    ),
                  )
                ]
            )
        )
    );
  }

  Widget CollapsedProductCard(){
    return Card(
        margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 30),
        child: Container(
          margin: const EdgeInsets.all(0),
          child: Row(
            children: <Widget>[
              ClipRRect(
                // width: 100.0,
                // height: 80,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.all(Radius.circular(8.0)),
                //   color: Colors.redAccent,
                // ),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.zero,
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.zero),
                child: Image.network(
                  // TODO: External link for image
                  'https://i.redd.it/wplznapopmm11.jpg',
                  height: 80,
                  width: 80,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // TODO: External product name
                      'Mokroluški hleb',
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Theme
                            .of(context)
                            .colorScheme
                            .onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    // TODO: External product price
                    Text('250 RSD',
                        maxLines: 1,
                        style:
                        Theme
                            .of(context)
                            .textTheme
                            .titleSmall),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(15),
                child: IconButton(
                  icon: const Icon(Icons.arrow_downward),
                  onPressed: () {
                    setState(() {
                      _expanded = true;
                    });
                  },
                ),
              )
            ],
          ),
        )
    );
  }
}
