// import 'package:flutter/material.dart';
//
// class ExpandedProductCard extends StatefulWidget {
//   const ExpandedProductCard({super.key});
//
//   @override
//   State<ExpandedProductCard> createState() => _ExpandedProductCardState();
// }
//
// class _ExpandedProductCardState extends State<ExpandedProductCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//         margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 30),
//         child: Container(
//             margin: const EdgeInsets.all(0),
//
//             child: Column(
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         left: 15,
//                         right: 15,
//                         top: 10,
//                         bottom: 10
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text('Hleb sa semenkama',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: Theme.of(context)
//                                 .colorScheme
//                                 .onSurfaceVariant,
//                           ),
//                         ),
//                         IconButton(
//                           icon: const Icon(Icons.arrow_upward),
//                           iconSize: 20,
//                           onPressed: () {
//                             setState(() {
//                               _expanded = false;
//                             });
//                           },
//                         )
//                       ],
//                     ),
//                   ),
//                   Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       Image(
//                           image: NetworkImage(
//                             'https://placehold.co/400x200.png',
//                           )
//                       ),
//                       OutlinedButton(
//                         child: Text(
//                             'Change Image',
//                             style: TextStyle(
//                                 color: Theme.of(context).colorScheme.onSurfaceVariant
//                             )
//                         ),
//                         onPressed: () {},
//                         style: ButtonStyle(
//                           backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.surface.withOpacity(0.8)),
//                         ),
//                       )
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                       left: 15,
//                       right: 15,
//                     ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Icon(
//                           Icons.mode_comment_outlined,
//                           size: 16,
//                         ),
//                         Expanded(
//                           child: TextFormField(
//                             initialValue: 'Lorem ipsum dolor sit...',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                               color: Theme.of(context)
//                                   .colorScheme
//                                   .onSurfaceVariant,
//                             ),
//                             decoration: InputDecoration(
//                                 border: InputBorder.none,
//                                 focusedBorder: InputBorder.none,
//                                 enabledBorder: InputBorder.none,
//                                 errorBorder: InputBorder.none,
//                                 disabledBorder: InputBorder.none,
//                                 contentPadding: EdgeInsets.only(
//                                   left: 10,
//                                   right: 0,
//                                   bottom: 5,
//                                   top: 5,
//                                 ),
//                                 hintText: 'Lorem ipsum dolor sit...'),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                       padding: const EdgeInsets.only(
//                           left: 15,
//                           right: 15,
//                           bottom: 0
//                       ),
//                       child: Divider(
//                         height: 0,
//                       )
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                       left: 15,
//                       right: 15,
//                     ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Icon(
//                           Icons.star_outline,
//                           size: 20,
//                         ),
//                         Expanded(
//                           child: TextFormField(
//                             initialValue: '250 RSD',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                               color: Theme.of(context)
//                                   .colorScheme
//                                   .onSurfaceVariant,
//                             ),
//                             decoration: InputDecoration(
//                                 border: InputBorder.none,
//                                 focusedBorder: InputBorder.none,
//                                 enabledBorder: InputBorder.none,
//                                 errorBorder: InputBorder.none,
//                                 disabledBorder: InputBorder.none,
//                                 contentPadding: EdgeInsets.only(
//                                     left: 8,
//                                     right: 0,
//                                     bottom: 5,
//                                     top: 5
//                                 ),
//                                 hintText: 'Lorem ipsum dolor sit...'),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                       padding: const EdgeInsets.only(
//                           left: 15,
//                           right: 15,
//                           bottom: 0
//                       ),
//                       child: Divider(
//                         height: 0,
//                       )
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                       left: 15,
//                       right: 15,
//                     ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Icon(
//                           Icons.folder_open_outlined,
//                           size: 20,
//                         ),
//                         Expanded(
//                           child: TextFormField(
//                             // TODO: Exteral product category
//                             initialValue: 'Hleb',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                               color: Theme.of(context)
//                                   .colorScheme
//                                   .onSurfaceVariant,
//                             ),
//                             decoration: InputDecoration(
//                                 border: InputBorder.none,
//                                 focusedBorder: InputBorder.none,
//                                 enabledBorder: InputBorder.none,
//                                 errorBorder: InputBorder.none,
//                                 disabledBorder: InputBorder.none,
//                                 contentPadding: EdgeInsets.only(
//                                   left: 8,
//                                   right: 0,
//                                   bottom: 5,
//                                   top: 5,
//                                 ),
//                                 // TODO: External product price
//                                 hintText: 'Hleb'),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         right: 10,
//                         bottom: 10
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         OutlinedButton.icon(
//                             icon: Icon(
//                               Icons.delete_outline_rounded,
//                               size: 18,
//                             ),
//                             label: Text('Delete',
//                               style: TextStyle(
//                                 height: 2.6,
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                             onPressed: () {}
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         FilledButton.icon(
//                             icon: Icon(
//                               Icons.check,
//                               size: 18,
//                             ),
//                             label: Text('Save',
//                               style: TextStyle(
//                                 height: 2.6,
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             onPressed: () {}
//                         ),
//                       ],
//                     ),
//                   )
//                 ]
//             )
//         )
//     );
//   }
// }
