import 'package:dexplateassessment/app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sizer/sizer.dart';

import '../../widget/constants.dart';
import '../../widget/textWidget.dart';

final box = Hive.box<String>('pokemons');
class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, userSnapshot) {
        if (userSnapshot.data == null) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Favourite'),
            ),
            body: const Center(
              child: Text(
                'Please Login First',
              ),
            ),
          );
        } else if (userSnapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.yellow,
              title: Text(''),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "Favorites",
                      size: 20.0,
                      color: primaryText,
                      weight: FontWeight.w700,
                      align: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ValueListenableBuilder(
                      valueListenable: box.listenable(),
                      builder: (context, Box<String> box, _) {
                        if (box.values.isEmpty) {
                          return const Center(
                            child: Text("No Favourites"),
                          );
                        } else {
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: box.values.length,
                              itemBuilder: (context, index) {
                                final restaurant = box.getAt(index);
                                return GestureDetector(
                                  onTap: () {
                                  },
                                  child: Card(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 3, vertical: 3),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [

                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                TextWidget(
                                                  text: restaurant?.split(' ')[0],
                                                  size: 13.0,
                                                  color: primaryText,
                                                  weight: FontWeight.w600,
                                                  align: TextAlign.left,
                                                ),
                                                ListTile(
                                                  contentPadding:
                                                  EdgeInsets.zero,
                                                  visualDensity:
                                                  VisualDensity.compact,
                                                  horizontalTitleGap: 0,
                                                  leading: Icon(
                                                    Icons.location_on,
                                                    color: yellowcol,
                                                    size: 20,
                                                  ),
                                                  title: TextWidget(
                                                    text: restaurant?.split(' ')[1],
                                                    size: 9.0,
                                                    weight: FontWeight.w400,
                                                    color: Color(0xff6B7280),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (userSnapshot.hasError) {
          return const Scaffold(
            body: Center(
              child: Text(
                'An error has occurred. Try again later.',
              ),
            ),
          );
        } else if (userSnapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return const Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Text(
              'FATAL ERROR',
              style: TextStyle(color: Colors.red, fontSize: 30),
            ),
          ),
        );
      },
    );
  }
}
