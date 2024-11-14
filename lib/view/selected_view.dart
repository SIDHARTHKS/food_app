import 'package:flutter/material.dart';
import 'package:food_app/helper/font_style.dart';

class SelectedView extends StatelessWidget {
  final String img;
  final String title;
  final String cat;
  final int price;
  final String description;
  final String portionSize;
  final String ingredients;
  const SelectedView(
      {super.key,
      required this.title,
      required this.img,
      required this.cat,
      required this.price,
      required this.description,
      required this.portionSize,
      required this.ingredients});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          // title: Text(title),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () =>
                Navigator.pop(context), // Navigate back to the previous page
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: width,
              height: height * 0.4,
              child: Image.network(
                img,
                fit: BoxFit.contain,
              ),
            ),
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    title,
                    style: FontStyles.title,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "₹" "$price",
                    style: FontStyles.price2,
                  ),
                  Text(
                    portionSize,
                    style: FontStyles.light,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(ingredients, style: FontStyles.italics)
                ],
              ),
              subtitle: Text(
                description,
                style: FontStyles.light,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: 100,
              height: height * 0.07,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 255, 89, 0)),
              child: const Center(
                  child: Text(
                'Order Now',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
            )
          ],
        ),
      ),
    );
  }
}
