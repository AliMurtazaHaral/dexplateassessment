import 'package:dexplateassessment/models/user_model.dart';
import 'package:dexplateassessment/pokemon/pokemon.dart';
import 'package:dexplateassessment/pokemon/pokemonApiService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'dart:math';
import 'package:hive_flutter/hive_flutter.dart';

class PokemonListScreen extends StatefulWidget {
  @override
  _PokemonListScreenState createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  final PokemonApiService _apiService = PokemonApiService();
  late Future<List<dynamic>> _pokemonList;

  @override
  void initState() {
    super.initState();
    _pokemonList = _apiService.fetchPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokémon List'),
      ),
      body: Center(
        child: FutureBuilder<List<dynamic>>(
          future: _pokemonList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<dynamic> pokemons = snapshot.data!;
              return ListView.builder(
                itemCount: pokemons.length,
                itemBuilder: (context, index) {
                  Map<String,dynamic> pokemon = pokemons[index];
                  return ListTile(
                    title: Text(pokemon['name']),
                    leading: GestureDetector(
                        onTap: postToLocalStorage(pokemon['name'],pokemon['url']),
                        child: Icon(Icons.add_box,color: Colors.red,)),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
  postToLocalStorage(String name,String url)async{
    final favBox = Hive.box<String>('pokemons');
    bool doesExist =
    favBox.values.any((myRestaurant) => favBox.name == name);

    if (doesExist) {
      Fluttertoast.showToast(
          msg: "Restaurant already added!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      UserModel userModel = UserModel();
      String key = "$name $url";
      userModel.url = url;
      await favBox.add(
        key
      );
      Fluttertoast.showToast(
          msg: "Restaurant has been added successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
