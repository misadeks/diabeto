import 'package:diabeto/routes/seller/home/pages/products/newProductPage.dart';
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
          SliverAppBar(
            clipBehavior: Clip.none,
            shape: const StadiumBorder(),
            scrolledUnderElevation: 0,
            titleSpacing: 0,
            backgroundColor: Colors.white,
            pinned: true,
            floating: false,
            elevation: 0,
            centerTitle: true,
            title: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
              child: SearchBar(
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
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 46, vertical: 18),
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
                return ProductCard();
              },
              childCount: 10, // 10 list items
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 132,
        height: 72,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewProductPage()),
            );
          },
          child: const Icon(Icons.add),
          backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    ));
  }
}
