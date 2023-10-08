import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
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
                return Card(
                    margin: EdgeInsets.symmetric(vertical: 7, horizontal: 30),
                    child: Container(
                      margin: EdgeInsets.all(0),
                      child: Row(
                        children: <Widget>[
                          ClipRRect(
                            // width: 100.0,
                            // height: 80,
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            //   color: Colors.redAccent,
                            // ),
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              'https://placehold.co/80/png',
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
                                  'Mokroluški hleb',
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('250 RSD',
                                    maxLines: 1,
                                    style:
                                        Theme.of(context).textTheme.titleSmall),
                              ],
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: IconButton(
                              icon: Icon(Icons.more_vert),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    ));
              },
              childCount: 1000, // 1000 list items
            ),
          ),
        ],
      ),
    );
  }
}
