import 'package:dexplateassessment/pokemonApiView.dart';
import 'package:dexplateassessment/presentation/Dashboard/favourite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigationHolder extends StatefulWidget {
  const BottomNavigationHolder({super.key});

  @override
  State<BottomNavigationHolder> createState() => _BottomNavigationHolderState();
}

class _BottomNavigationHolderState extends State<BottomNavigationHolder> {
  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
     List<Widget> pages = <Widget>[
      PokemonListScreen(),
      FavouriteScreen()
    ];
    return Scaffold(
      body: Center(
        child: pages.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
              size: 25,
            ),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              size: 25,
            ),
            label: 'Favourite',
          ),
        ],
        currentIndex: selectedIndex,
        unselectedItemColor: Color(0xff9DA8C3),
        selectedItemColor: Colors.amber,
        selectedIconTheme: IconThemeData(color: Colors.yellow),
        onTap: onItemTapped,
      ),
    );
  }
}