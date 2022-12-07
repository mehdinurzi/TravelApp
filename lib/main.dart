import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/Model/TravelModel.dart';
import 'package:expandable_text/expandable_text.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            fontFamily: "poppins",
            textTheme: const TextTheme(
              // bold
              headline1: TextStyle(
                fontFamily: "poppins",
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
              // semi
              headline2: TextStyle(
                fontFamily: "poppins",
                fontSize: 19,
                fontWeight: FontWeight.w300,
                color: Color.fromARGB(255, 120, 202, 222),
              ),
              // semi
              headline3: TextStyle(
                fontFamily: "poppins",
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
              // regular
              headline4: TextStyle(
                fontFamily: "poppins",
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
              headline5: TextStyle(
                fontFamily: "poppins",
                fontSize: 13,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
              bodyText1: TextStyle(
                fontFamily: "poppins",
                fontSize: 12,
                fontWeight: FontWeight.w100,
                color: Colors.black,
              ),
              bodyText2: TextStyle(
                fontFamily: "poppins",
                fontSize: 11,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
              headline6: TextStyle(
                fontFamily: "poppins",
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
            )),
        home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  double imageSize = 55;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height / 1.9,
              child: Stack(
                children: [
                  // main image
                  Container(
                    width: double.infinity,
                    height: size.height / 2.1,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(60),
                        ),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage(travelList[_selectedIndex].image))),
                  ),
                  // image item/listveiw
                  Positioned(
                    right:0 ,
                    top: size.height /6.1,
                    child: SizedBox(
                      width: 90,
                      height: double.maxFinite,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: travelList.length,
                        itemBuilder: (context, index) {
                          return imageItem(index);
                        },
                      ),
                    ),
                  ),
                  // name & location
                  Positioned(
                    bottom: size.height / 11.5,
                    left: size.width / 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          travelList[_selectedIndex].name,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        Row(
                          children: [
                            const Icon(CupertinoIcons.location_solid,
                                color: Colors.white, size: 17),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(travelList[_selectedIndex].location,
                                style: Theme.of(context).textTheme.headline5)
                          ],
                        )
                      ],
                    ),
                  ),
                  // head icon
                  Padding(
                    padding: const EdgeInsets.fromLTRB(35, 20, 35, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(98, 210, 193, 193)),
                            child: const Icon(CupertinoIcons.arrow_left)),
                        Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(98, 210, 193, 193)),
                            child: const Icon(CupertinoIcons.heart)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    // temp,rating,distance
            
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(
                                    color: Color.fromARGB(80, 0, 0, 0),
                                    width: 1)),
                            child: Container(
                              width: 80,
                              height: 80,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Distance",
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    Text(
                                      travelList[_selectedIndex].distance,
                                      style:
                                          Theme.of(context).textTheme.headline2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(
                                    color: Color.fromARGB(80, 0, 0, 0),
                                    width: 1)),
                            child: Container(
                              width: 80,
                              height: 80,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Temp",
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    Text(
                                      "${travelList[_selectedIndex].temp}\u00B0 c",
                                      style:
                                          Theme.of(context).textTheme.headline2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(
                                    color: Color.fromARGB(80, 0, 0, 0),
                                    width: 1)),
                            child: Container(
                              width: 80,
                              height: 80,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Rating",
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    Text(
                                      travelList[_selectedIndex].rating,
                                      style:
                                          Theme.of(context).textTheme.headline2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
            
                          // Distance
                          // Container(
                          //   width: 80,
                          //   height: 80,
                          //   decoration: const BoxDecoration(
                          //     boxShadow: <BoxShadow>[
                          //       BoxShadow(blurRadius: 1, color: Colors.grey)
                          //     ],
                          //     borderRadius:
                          //         BorderRadius.all(Radius.circular(20)),
                          //     color: Colors.white,
                          //   ),
                          //   child: Padding(
                          //     padding: const EdgeInsets.fromLTRB(0,8,0,8),
                          //     child: Column(
                          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //       children: [
                          //         Text(
                          //           "Distance",
                          //           style:
                          //               Theme.of(context).textTheme.bodyText1,
                          //         ),
                          //         Text(
                          //           travelList[_selectedIndex].distance,
                          //           style:
                          //               Theme.of(context).textTheme.headline2,
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // // temp
                          // Container(
                          //   width: 80,
                          //   height: 80,
                          //   decoration: const BoxDecoration(
                          //     boxShadow: <BoxShadow>[
                          //       BoxShadow(blurRadius: 1, color: Colors.grey)
                          //     ],
                          //     borderRadius:
                          //         BorderRadius.all(Radius.circular(20)),
                          //     color: Colors.white,
                          //   ),
                          //   child: Padding(
                          //     padding: const EdgeInsets.fromLTRB(0,8,0,8),
                          //     child: Column(
                          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //       children: [
                          //         Text(
                          //           "Temp",
                          //           style:
                          //               Theme.of(context).textTheme.bodyText1,
                          //         ),
                          //         Text(travelList[_selectedIndex].temp+"\u00B0 c",
                          //             style: Theme.of(context)
                          //                 .textTheme
                          //                 .headline2)
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // // rating
                          // Container(
                          //   width: 80,
                          //   height: 80,
                          //   decoration: const BoxDecoration(
                          //     boxShadow: <BoxShadow>[
                          //       BoxShadow(blurRadius: 1, color: Colors.grey)
                          //     ],
                          //     borderRadius:
                          //         BorderRadius.all(Radius.circular(20)),
                          //     color: Colors.white,
                          //   ),
                          //   child: Padding(
                          //     padding: const EdgeInsets.fromLTRB(0,8,0,8),
                          //     child: Column(
                          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //       children: [
                          //         Text(
                          //           "Rating",
                          //           style:
                          //               Theme.of(context).textTheme.bodyText1,
                          //         ),
                          //         Text(travelList[_selectedIndex].rating,
                          //             style: Theme.of(context)
                          //                 .textTheme
                          //                 .headline2)
                          //       ],
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // discription
                    Column(
                      children: [
                        Align(
                          //insted of align we can use crossaxisalignment.start too
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Description',
                              style: Theme.of(context).textTheme.headline3,
                            )),
                        const ExpandableText(
                          
                          'This Is The Shortest Of The Three Routes, But Certainly Not Any Less Interesting. The North Wales Way Leads You In 120 Km From Abergwyngregyn To The Beautiful Island Of Anglesey...bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb ',
                          expandText: 'read more',
                          collapseText: 'show less',
                          maxLines: 2,
                          linkColor: Colors.blue,
                        )
                        // Padding(
                        //   padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        //   child: Text(
                        //     travelList[_selectedIndex].description,
                        //     style: Theme.of(context).textTheme.bodyText1,
                        //   ),
                        // )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    // total price & big icon
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start ,
                          children: [
                            Text('Total Price',
                                style: Theme.of(context).textTheme.headline6),
                            Text("\$" + travelList[_selectedIndex].price,
                                style: Theme.of(context).textTheme.headline1)
                          ],
                        ),

                        Container(
                          width: 90,
                          height: 90 ,
                          decoration: const BoxDecoration(shape: BoxShape.circle,color: Colors.black,),
                          child: const Icon(CupertinoIcons.forward,color: Colors.white,size: 50,),
                         
                        )
                        // Image.asset("assets/images/big b slash.png"),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
              ),
            ),
        ));
  }

  Widget imageItem(int index) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              width: _selectedIndex == index ? imageSize + 15 : imageSize,
              height: _selectedIndex == index ? imageSize + 15 : imageSize,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  // BorderRadius.circular(_selectedIndex == index ? 50 : 15),
                  // borderRadius: _selectedIndex==index?BorderRadius.circular(50):BorderRadius.circular(10),
                  border: Border.all(color: Colors.white, width: 3
                      // color: _selectedIndex == index
                      //     ? Color.fromARGB(255, 56, 23, 23)
                      //     : Colors.white,
                      // width: 3
                      ),
                  image: DecorationImage(
                      image: AssetImage(travelList[index].image),
                      fit: BoxFit.fill)),
            ),
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ],
    );
  }
}
