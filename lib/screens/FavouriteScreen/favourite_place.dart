// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

// import '../../screens/navbar_screen.dart';
import '../../provider/favourite_provider.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final finalList = provider.favorites;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        
        leading: Icon(
          Icons.arrow_back,
          color: Colors.blue[400],
        ),
        
       
        title: Padding(
          padding: EdgeInsets.only(left: 40),
          child:  Text('Favourite Place',style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.white,
            fontSize: 25
          ),),
        ),
        
      ),
      body: ListView.builder(
        itemCount: finalList.length,
        itemBuilder: (context, index) {
          final favoriteItems = finalList[index];
          return Column(
            children: [
              Card(
                elevation: 2,
                margin: EdgeInsets.all(10),
                child: Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Shadow color
                        spreadRadius: 4, // How much the shadow spreads
                        blurRadius: 5, // How blurry the shadow appears
                        offset:
                            Offset(2, 3), // Changes position of shadow (x, y)
                      ),
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Image.asset(
                                favoriteItems.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  favoriteItems.title,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                Text(
                                  favoriteItems.location,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 25,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      '${favoriteItems.rate}',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10,right: 10),
                          child: GestureDetector(
                            onTap: () {
                              finalList.removeAt(index);
                              setState(() {});
                            },
                            child: const Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
          // return Container(
          //   height: 100,
          //   width: MediaQuery.of(context).size.width,
          //   decoration: BoxDecoration(
          //     color: Colors.blue[400],
          //   ),
          //   child: Padding(
          //     padding: EdgeInsets.only(top: 20, left: 10, right: 15),
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Text(
          //           'Favourite Place',
          //           style: TextStyle(
          //             fontSize: 25,
          //             color: Colors.white,
          //             fontStyle: FontStyle.italic,
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //         //Card
          //         Card(
          //           elevation: 8,
          //           margin: EdgeInsets.all(10),
          //           child: Container(
          //             height: 180,
          //             width: MediaQuery.of(context).size.width,
          //             decoration: BoxDecoration(
          //               color: Colors.white,
          //               boxShadow: [
          //                 BoxShadow(
          //                   color: Colors.grey.withOpacity(0.5), // Shadow color
          //                   spreadRadius: 4, // How much the shadow spreads
          //                   blurRadius: 5, // How blurry the shadow appears
          //                   offset: Offset(
          //                       2, 3), // Changes position of shadow (x, y)
          //                 ),
          //               ],
          //               borderRadius: BorderRadius.circular(8),
          //             ),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Row(
          //                   children: [
          //                     Container(
          //                       height: MediaQuery.of(context).size.height,
          //                       width: 150,
          //                       decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.circular(10),
          //                       ),
          //                       child: Padding(
          //                         padding: EdgeInsets.all(10),
          //                         child: Image.asset(
          //                           favoriteItems.image,
          //                           fit: BoxFit.cover,
          //                         ),
          //                       ),
          //                     ),
          //                     Padding(
          //                       padding: EdgeInsets.all(10),
          //                       child: Column(
          //                         mainAxisAlignment: MainAxisAlignment.center,
          //                         crossAxisAlignment: CrossAxisAlignment.start,
          //                         children: [
          //                           Text(
          //                             'Title',
          //                             style: TextStyle(
          //                               fontSize: 20,
          //                               fontStyle: FontStyle.italic,
          //                             ),
          //                           ),
          //                           Text(
          //                             'Locations',
          //                             style: TextStyle(
          //                               fontSize: 20,
          //                               fontStyle: FontStyle.italic,
          //                             ),
          //                           ),
          //                           Row(
          //                             children: List.generate(
          //                                 5,
          //                                 (index) => Icon(
          //                                       Icons.star,
          //                                       color: Colors.yellow,
          //                                       size: 20,
          //                                     )),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //                 Align(
          //                   alignment: Alignment.topRight,
          //                   child: Padding(
          //                       padding: EdgeInsets.only(top: 5),
          //                       child: IconButton(
          //                           onPressed: () {},
          //                           icon: Icon(
          //                             Icons.delete,
          //                             color: Colors.red,
          //                           ))),
          //                 )
          //               ],
          //             ),
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // );
        },
      ),
    );
  }
}
