import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mayankpunethainternship/provider/data_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final eventsDataProvider = Provider.of<DataProvider>(context);
    final eventsDataProvider2 = Provider.of<DataProvider>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: Colors.red,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://gaijinpot.scdn3.secure.raxcdn.com/app/uploads/sites/6/2017/07/9522401882_ab202aaa32_k.jpg',
                ),
              ),
            ),
            child: ListTile(
              title: Text(
                'Fireworks in Edogawa',
                style: TextStyle(color: Colors.white70, fontSize: 25),
              ),
              subtitle: Text(
                'July 11-13 / Tokyo / Free',
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 20, bottom: 10),
            child: Text(
              'Explore Events...',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            height: MediaQuery.of(context).size.height * 0.30,
            width: double.infinity,
            // color: Colors.black,
            child: ListView.builder(
                itemCount: eventsDataProvider.items1.length ~/ 2,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final eventsData = (eventsDataProvider.items1);
                  return Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * 0.12,
                        margin: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                          // color: Colors.red,
                          image: DecorationImage(
                            image: NetworkImage(
                              eventsData[index].image,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            eventsData[index].title,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.12,
                        margin: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                          color: Colors.red,
                          image: DecorationImage(
                            image: NetworkImage(
                              eventsData[index + 5].image,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            eventsData[index + 5].title,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 20, bottom: 10),
            child: Text(
              'Categories',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            height: MediaQuery.of(context).size.height * 0.20,
            width: double.infinity,
            // color: Colors.black,
            child: ListView.builder(
                itemCount: eventsDataProvider.items2.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final eventsData = (eventsDataProvider.items2);
                  return Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * 0.18,
                        margin: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                          // color: Colors.red,
                          image: DecorationImage(
                            image: NetworkImage(
                              eventsData[index].image,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            eventsData[index].title,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
