import 'dart:convert';

import 'package:cocktail_app/cocktail_details.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var api = 'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail';
  // ignore: prefer_typing_uninitialized_variables
  var response, drinks;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    response = await http.get(
      Uri.parse(api),
    );
    drinks = jsonDecode(response.body)['drinks'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: 'Cocktail App'.text.white.makeCentered(),
        elevation: 0.0,
      ),
      body: Center(
        child: response != null
            ? ListView.builder(
                itemCount: drinks.length,
                itemBuilder: (context, index) {
                  var drink = drinks[index];
                  return ListTile(
                    leading: Hero(
                      tag: drink['idDrink'],
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          drink['strDrinkThumb'],
                        ),
                      ),
                    ),
                    title: '${drink['strDrink']}'.text.white.xl.bold.make(),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CocktailDetails(drink: drink),
                        ),
                      );
                    },
                  );
                },
              )
            : const CircularProgressIndicator(
                color: Colors.white,
              ),
      ),
    );
  }
}
