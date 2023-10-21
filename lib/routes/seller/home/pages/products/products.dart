import 'package:diabeto/routes/seller/home/pages/products/widgets/product_card/productCard.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var data = {
    'categories': {
      'Hleb': [
        {'productName': 'Mokroluski hleb', 'price': '250 RSD'},
        {'productName': 'Mokroluski hleb', 'price': '250 RSD'},
      ],
      'Kolac': [
        {'productName': 'Kolacic', 'price': '150 RSD'},
      ]
    }
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 0),
            sliver: SliverAppBar(
              clipBehavior: Clip.none,
              shape: const StadiumBorder(),
              scrolledUnderElevation: 0,
              titleSpacing: 0,
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              pinned: true,
              floating: true,
              elevation: 0,
              centerTitle: true,
              title: SearchBar(
                leading: const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(Icons.menu),
                ),
                trailing: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                ],
                elevation: MaterialStateProperty.all(5),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
                hintText: 'Search your products...',
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
              child: Divider(),
            ),
          ),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.only(
              left: 40,
            ),
            child: Text(
              'Hleb',
              style: TextStyle(
                  fontSize: 24, color: Theme.of(context).colorScheme.secondary),
            ),
          )),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                // return Card(
                //     margin: EdgeInsets.symmetric(vertical: 7, horizontal: 30),
                //     child: Container(
                //       margin: EdgeInsets.all(0),
                //       child: Row(
                //         children: <Widget>[
                //           ClipRRect(
                //             // width: 100.0,
                //             // height: 80,
                //             // decoration: BoxDecoration(
                //             //   borderRadius: BorderRadius.all(Radius.circular(8.0)),
                //             //   color: Colors.redAccent,
                //             // ),
                //             borderRadius: BorderRadius.only(
                //                 topLeft: Radius.circular(12),
                //                 topRight: Radius.zero,
                //                 bottomLeft: Radius.circular(12),
                //                 bottomRight: Radius.zero),
                //             child: Image.network(
                //               'https://i.redd.it/wplznapopmm11.jpg',
                //               height: 80,
                //               width: 80,
                //             ),
                //           ),
                //           Padding(
                //             padding: const EdgeInsets.all(15),
                //             child: Column(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Text(
                //                   'Mokroluški hleb',
                //                   maxLines: 1,
                //                   style: TextStyle(
                //                     fontSize: 16,
                //                     fontWeight: FontWeight.w600,
                //                     color: Theme.of(context)
                //                         .colorScheme
                //                         .onSurfaceVariant,
                //                   ),
                //                 ),
                //                 SizedBox(
                //                   height: 5,
                //                 ),
                //                 Text('250 RSD',
                //                     maxLines: 1,
                //                     style:
                //                         Theme.of(context).textTheme.titleSmall),
                //               ],
                //             ),
                //           ),
                //           Spacer(),
                //           Padding(
                //             padding: EdgeInsets.all(15),
                //             child: IconButton(
                //               icon: Icon(Icons.more_vert),
                //               onPressed: () {},
                //             ),
                //           )
                //         ],
                //       ),
                //     ));
                // return Card(
                //     margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 30),
                //     child: Container(
                //     margin: const EdgeInsets.all(0),
                //
                // child: Column(
                // children: <Widget>[
                //   Padding(
                //     padding: const EdgeInsets.only(
                //       left: 15,
                //       right: 15,
                //       top: 10,
                //       bottom: 10
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Text('Hleb sa semenkama',
                //           style: TextStyle(
                //             fontSize: 16,
                //             fontWeight: FontWeight.w600,
                //             color: Theme.of(context)
                //                 .colorScheme
                //                 .onSurfaceVariant,
                //           ),
                //         ),
                //     IconButton(
                //       icon: const Icon(Icons.arrow_upward),
                //       iconSize: 20,
                //       onPressed: () {},
                //       )
                //       ],
                //     ),
                //   ),
                //   Stack(
                //     alignment: Alignment.center,
                //     children: [
                //       Image(
                //           image: NetworkImage(
                //         'https://placehold.co/400x200.png',
                //       )
                //       ),
                //       OutlinedButton(
                //           child: Text(
                //               'Change Image',
                //               style: TextStyle(
                //                   color: Theme.of(context).colorScheme.onSurfaceVariant
                //               )
                //           ),
                //           onPressed: () {},
                //           style: ButtonStyle(
                //             backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.surface.withOpacity(0.8)),
                //           ),
                //       )
                //     ],
                //   ),
                //   Padding(
                //     padding: const EdgeInsets.only(
                //       left: 15,
                //       right: 15,
                //     ),
                //     child: Row(
                //       mainAxisSize: MainAxisSize.min,
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         Icon(
                //           Icons.mode_comment_outlined,
                //           size: 16,
                //         ),
                //         Expanded(
                //           child: TextFormField(
                //             initialValue: 'Lorem ipsum dolor sit...',
                //             style: TextStyle(
                //               fontSize: 16,
                //               fontWeight: FontWeight.w500,
                //               color: Theme.of(context)
                //                   .colorScheme
                //                   .onSurfaceVariant,
                //             ),
                //             decoration: InputDecoration(
                //                 border: InputBorder.none,
                //                 focusedBorder: InputBorder.none,
                //                 enabledBorder: InputBorder.none,
                //                 errorBorder: InputBorder.none,
                //                 disabledBorder: InputBorder.none,
                //                 contentPadding: EdgeInsets.only(
                //                     left: 10,
                //                     right: 0,
                //                     bottom: 5,
                //                     top: 5,
                //                 ),
                //                 hintText: 'Lorem ipsum dolor sit...'),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                //   Padding(
                //         padding: const EdgeInsets.only(
                //           left: 15,
                //           right: 15,
                //           bottom: 0
                //         ),
                //         child: Divider(
                //           height: 0,
                //         )
                //     ),
                //   Padding(
                //     padding: const EdgeInsets.only(
                //       left: 15,
                //       right: 15,
                //     ),
                //     child: Row(
                //       mainAxisSize: MainAxisSize.min,
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         Icon(
                //           Icons.star_outline,
                //           size: 20,
                //         ),
                //         Expanded(
                //           child: TextFormField(
                //             initialValue: '250 RSD',
                //             style: TextStyle(
                //               fontSize: 16,
                //               fontWeight: FontWeight.w500,
                //               color: Theme.of(context)
                //                   .colorScheme
                //                   .onSurfaceVariant,
                //             ),
                //             decoration: InputDecoration(
                //                 border: InputBorder.none,
                //                 focusedBorder: InputBorder.none,
                //                 enabledBorder: InputBorder.none,
                //                 errorBorder: InputBorder.none,
                //                 disabledBorder: InputBorder.none,
                //                 contentPadding: EdgeInsets.only(
                //                   left: 8,
                //                   right: 0,
                //                   bottom: 5,
                //                   top: 5
                //                 ),
                //                 hintText: 'Lorem ipsum dolor sit...'),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                //   Padding(
                //       padding: const EdgeInsets.only(
                //           left: 15,
                //           right: 15,
                //           bottom: 0
                //       ),
                //       child: Divider(
                //         height: 0,
                //       )
                //   ),
                //   Padding(
                //     padding: const EdgeInsets.only(
                //       left: 15,
                //       right: 15,
                //     ),
                //     child: Row(
                //       mainAxisSize: MainAxisSize.min,
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         Icon(
                //           Icons.folder_open_outlined,
                //           size: 20,
                //         ),
                //         Expanded(
                //           child: TextFormField(
                //             // TODO: Exteral product category
                //             initialValue: 'Hleb',
                //             style: TextStyle(
                //               fontSize: 16,
                //               fontWeight: FontWeight.w500,
                //               color: Theme.of(context)
                //                   .colorScheme
                //                   .onSurfaceVariant,
                //             ),
                //             decoration: InputDecoration(
                //                 border: InputBorder.none,
                //                 focusedBorder: InputBorder.none,
                //                 enabledBorder: InputBorder.none,
                //                 errorBorder: InputBorder.none,
                //                 disabledBorder: InputBorder.none,
                //                 contentPadding: EdgeInsets.only(
                //                   left: 8,
                //                   right: 0,
                //                   bottom: 5,
                //                   top: 5,
                //                 ),
                //                 // TODO: External product price
                //                 hintText: 'Hleb'),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                //   Padding(
                //     padding: const EdgeInsets.only(
                //       right: 10,
                //       bottom: 10
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.end,
                //       children: [
                //         OutlinedButton.icon(
                //             icon: Icon(
                //               Icons.delete_outline_rounded,
                //               size: 18,
                //             ),
                //             label: Text('Delete',
                //               style: TextStyle(
                //                 height: 2.6,
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.w600,
                //               ),
                //             ),
                //             onPressed: () {}
                //         ),
                //         SizedBox(
                //           width: 10,
                //         ),
                //         FilledButton.icon(
                //           icon: Icon(
                //               Icons.check,
                //             size: 18,
                //           ),
                //             label: Text('Save',
                //               style: TextStyle(
                //                 height: 2.6,
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.w500,
                //               ),
                //             ),
                //             onPressed: () {}
                //         ),
                //       ],
                //     ),
                //   )
                //   ]
                // )
                // )
                // );
                return ProductCard();
              },
              childCount: 10, // 1000 list items
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: const Icon(Icons.add),
      ),
    ));
  }
}
