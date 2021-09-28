import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CocktailDetails extends StatelessWidget {
  const CocktailDetails({
    Key? key,
    this.drink,
  }) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final drink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: '${drink['strDrink']}'.text.white.make(),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: drink['idDrink'],
              child: CircleAvatar(
                radius: 100.0,
                backgroundImage: NetworkImage(
                  drink['strDrinkThumb'],
                ),
              ),
            ),
            10.heightBox,
            'ID: ${drink['idDrink']}'.text.white.xl.bold.make(),
            10.heightBox,
            'Title: ${drink['strDrink']}'.text.white.xl2.bold.make(),
          ],
        ),
      ),
    );
  }
}
