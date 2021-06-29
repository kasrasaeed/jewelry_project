import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:safira_selab/application/application.dart';

class App extends StatefulWidget {
  AppState createState() {
    return AppState();
  }
}

class AppState extends State {
  final List<String> _filterList = [
    'Product Type',
    'Material',
    'Style',
    'Brand',
    'Collection',
  ];

  List listOfRings = [];

  Future<String> loadJsonData() async {
    final jsonFile = await rootBundle.loadString('assets/json/rings.json');
    listOfRings = json.decode(jsonFile)['products'];
    setState(() {});
    return 'success';
  }

  void getRingsList() async {
    await Application.ringsFutureListToRingModelsList();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    // getRingsList()
    loadJsonData();
  }

  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;

    return _screenWidth > 990
        ? Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(_screenHeight * 0.2),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Padding(
                    padding: EdgeInsets.only(
                      top: _screenHeight * 0.01,
                      right: _screenWidth * 0.05,
                      left: _screenWidth * 0.05,
                    ),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.black,
                          height: constraints.maxHeight * 0.3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Free shipping and returns',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '48H Express delivery',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                'Always gold and silver',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: constraints.maxHeight * 0.4,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                child: Container(
                                  height: constraints.maxHeight * 0.45,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.search),
                                      Text(
                                        'SEARCH',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: constraints.maxWidth * 0.43,
                                child: Container(
                                  height: constraints.maxHeight * 0.45,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'SAFIRA',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                child: Container(
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              FaIcon(FontAwesomeIcons
                                                  .globeAmericas),
                                              SizedBox(
                                                width: 3,
                                              ),
                                              Text('SELECT COUNTRY'),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Container(
                                        color: Color(0xfff9e4a3),
                                        width: constraints.maxWidth * 0.06,
                                        height: constraints.maxHeight * 0.45,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  constraints.maxWidth * 0.007),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Text('\$0'),
                                                  Icon(Icons.shopping_bag),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: constraints.maxHeight * 0.25,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Divider(
                                height: 1,
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                      onHover: (_isHovered) {},
                                      child: Text('NEWS'),
                                    ),
                                    InkWell(
                                      child: Text('MOST WANTED'),
                                    ),
                                    InkWell(
                                      child: Text('RINGS'),
                                    ),
                                    InkWell(
                                      child: Text('BRACELETS'),
                                    ),
                                    InkWell(
                                      child: Text('NECKLACES'),
                                    ),
                                    InkWell(
                                      child: Text('EARRINGS'),
                                    ),
                                    InkWell(
                                      child: Text('ALL JEWELLRY'),
                                    ),
                                    InkWell(
                                      child: Text('COLLECTIOS'),
                                    ),
                                    InkWell(
                                      child: Text('OUTLET'),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: _screenWidth * 0.05,
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text('FILTER'),
                            ..._filterList.map((e) {
                              return InkWell(
                                onTap: () {},
                                child: Container(
                                  width: _screenWidth * 0.13,
                                  height: 40,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(e),
                                      FaIcon(
                                        FontAwesomeIcons.plus,
                                        size: 10,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Text(
                                '8 out of ${listOfRings.length} items',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            if (_screenWidth > 1200)
                              SizedBox(
                                height: _screenHeight * 1.5,
                                width: _screenWidth * 0.75,
                                child: listOfRings.isEmpty
                                    ? Container()
                                    : GridView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 4,
                                          childAspectRatio: 0.7,
                                        ),
                                        itemCount: 8,
                                        itemBuilder: (context, index) {
                                          return Card(
                                            child: Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Image.network(
                                                    listOfRings[index]
                                                        ['product_image_url'],
                                                    fit: BoxFit.cover,
                                                  ),
                                                  Text(listOfRings[index]
                                                      ['product_name']),
                                                  Text(
                                                    listOfRings[index]
                                                        ['product_brand'],
                                                    style:
                                                        TextStyle(fontSize: 9),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text('\$' +
                                                      listOfRings[index]
                                                          ['product_price']),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                              ),
                            if (990 < _screenWidth && _screenWidth < 1200)
                              SizedBox(
                                height: _screenHeight * 2,
                                width: _screenWidth * 0.75,
                                child: GridView.builder(
                                  itemCount: listOfRings.sublist(0, 8).length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          childAspectRatio: 0.68),
                                  itemBuilder: (context, index) {
                                    return Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.network(
                                              listOfRings[index]
                                                  ['product_image_url'],
                                              fit: BoxFit.cover,
                                            ),
                                            Text(listOfRings[index]
                                                ['product_name']),
                                            Text(
                                              listOfRings[index]
                                                  ['product_brand'],
                                              style: TextStyle(fontSize: 9),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text('\$' +
                                                listOfRings[index]
                                                    ['product_price']),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),

                            // if (990 > _screenWidth)
                            //   SizedBox(
                            //     height: _screenHeight * 2,
                            //     width: _screenWidth * 0.75,
                            //     child: GridView.count(
                            //       physics: const NeverScrollableScrollPhysics(),
                            //       crossAxisCount: 2,
                            //       childAspectRatio: 0.75,
                            //       mainAxisSpacing: 0,
                            //       crossAxisSpacing: 0,
                            //       children: <String>[
                            //         'http://www.for-example.org/img/main/forexamplelogo.png',
                            //         'http://www.for-example.org/img/main/forexamplelogo.png',
                            //         'http://www.for-example.org/img/main/forexamplelogo.png',
                            //         'http://www.for-example.org/img/main/forexamplelogo.png',
                            //         'http://www.for-example.org/img/main/forexamplelogo.png',
                            //         'http://www.for-example.org/img/main/forexamplelogo.png',
                            //         'http://www.for-example.org/img/main/forexamplelogo.png',
                            //         'http://www.for-example.org/img/main/forexamplelogo.png',
                            //         'http://www.for-example.org/img/main/forexamplelogo.png',
                            //         'http://www.for-example.org/img/main/forexamplelogo.png',
                            //         'http://www.for-example.org/img/main/forexamplelogo.png',
                            //       ].map((String url) {
                            //         return Container(
                            //             child: Card(
                            //           child:
                            //               Image.network(url, fit: BoxFit.cover),
                            //         ));
                            //       }).toList(),
                            //     ),
                            //   ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: _screenWidth,
                      height: _screenHeight * 0.3,
                      color: Colors.black54,
                      child: Center(
                        child: Text(
                          '#safirashine',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(_screenHeight * 0.2),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Padding(
                    padding: EdgeInsets.only(
                      top: _screenHeight * 0.01,
                      right: _screenWidth * 0.05,
                      left: _screenWidth * 0.05,
                    ),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.black,
                          height: constraints.maxHeight * 0.3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Free shipping and returns',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '48H Express delivery',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                'Always gold and silver',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: constraints.maxHeight * 0.4,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                child: Container(
                                  height: constraints.maxHeight * 0.45,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.search),
                                      Text(
                                        'SEARCH',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: constraints.maxWidth * 0.35,
                                child: Container(
                                  height: constraints.maxHeight * 0.45,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'SAFIRA',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                child: Container(
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              FaIcon(FontAwesomeIcons
                                                  .globeAmericas),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Container(
                                        color: Color(0xfff9e4a3),
                                        width: constraints.maxWidth * 0.06,
                                        height: constraints.maxHeight * 0.45,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  constraints.maxWidth * 0.007),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Icon(
                                                    Icons.shopping_bag,
                                                    size: 18,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: constraints.maxHeight * 0.25,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Divider(
                                height: 1,
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onHover: (_isHovered) {},
                                      child: Container(
                                          color: Color(0xfff9e4a3),
                                          child: Text('menu')),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: _screenWidth * 0.05,
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Text(
                                '8 out of ${listOfRings.length} items',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),

                            SizedBox(
                              height: _screenHeight * 2.6,
                              width: _screenWidth * 0.75,
                              child: listOfRings.isEmpty
                                  ? Container()
                                  : GridView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.68,
                                      ),
                                      itemCount:
                                          listOfRings.sublist(0, 8).length,
                                      itemBuilder: (context, index) {
                                        return Card(
                                          child: Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Image.network(
                                                  listOfRings[index]
                                                      ['product_image_url'],
                                                  fit: BoxFit.cover,
                                                ),
                                                Text(listOfRings[index]
                                                    ['product_name']),
                                                Text(
                                                  listOfRings[index]
                                                      ['product_brand'],
                                                  style: TextStyle(fontSize: 9),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text('\$' +
                                                    listOfRings[index]
                                                        ['product_price']),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                            ),

                            // if (990 > _screenWidth)
                            //   SizedBox(
                            //     height: _screenHeight * 2,
                            //     width: _screenWidth * 0.75,
                            //     child: GridView.count(
                            //       physics: const NeverScrollableScrollPhysics(),
                            //       crossAxisCount: 2,
                            //       childAspectRatio: 0.75,
                            //       mainAxisSpacing: 0,
                            //       crossAxisSpacing: 0,
                            //       children: <String>[
                            //         'http://www.for-example.org/img/main/forexamplelogo.png',
                            //         'http://www.for-example.org/img/main/forexamplelogo.png',
                            //         'http://www.for-example.org/img/main/forexamplelogo.png',
                            //         'http://www.for-example.org/img/main/forexamplelogo.png',
                            //         'http://www.for-example.org/img/main/forexamplelogo.png',
                            //         'http://www.for-example.org/img/main/forexamplelogo.png',
                            //         'http://www.for-example.org/img/main/forexamplelogo.png',
                            //         'http://www.for-example.org/img/main/forexamplelogo.png',
                            //         'http://www.for-example.org/img/main/forexamplelogo.png',
                            //         'http://www.for-example.org/img/main/forexamplelogo.png',
                            //         'http://www.for-example.org/img/main/forexamplelogo.png',
                            //       ].map((String url) {
                            //         return Container(
                            //             child: Card(
                            //           child:
                            //               Image.network(url, fit: BoxFit.cover),
                            //         ));
                            //       }).toList(),
                            //     ),
                            //   ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: _screenWidth,
                      height: _screenHeight * 0.3,
                      color: Colors.black54,
                      child: Center(
                        child: Text(
                          '#safirashine',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
