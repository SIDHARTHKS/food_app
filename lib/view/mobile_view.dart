import 'package:flutter/material.dart';
import 'package:food_app/controller/mobile_controller.dart';
import 'package:food_app/helper/font_style.dart';
import 'package:food_app/view/selected_view.dart';
import 'package:get/get.dart';

class MobileView extends StatelessWidget {
  MobileView({super.key});
  final MobileController controller = Get.put(MobileController());
  final TextEditingController scontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(186, 248, 246, 246),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: Card(
                  elevation: 2,
                  child: TextField(
                    controller: scontroller,
                    decoration: InputDecoration(
                        hintText: 'Search.....',
                        hintStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 122, 121, 121)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 255, 255)),
                    onChanged: (value) {
                      controller.filtersearch(value);
                    },
                  ),
                ),
              ),
              SizedBox(
                width: width,
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Chip(
                        side: BorderSide.none,
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        label: Text(controller.categories[index],
                            style: FontStyles.chip),
                      ),
                    );
                  },
                ),
              ),
              Obx(() {
                return resutlbar(width, height);
              }),
              subhead("Todays Specials"),
              specialsbar(width, height),
              subhead("Explore More"),
              explorelist(height, width),
            ],
          ),
        ),
      ),
    );
  }

  Padding subhead(String txt) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          txt,
          style: FontStyles.subtitle,
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  ListView explorelist(double height, double width) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.foodmodel.length,
      itemBuilder: (context, index) {
        var itm = controller.foodmodel[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 12),
          child: Card(
            elevation: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SelectedView(
                      title: itm.name,
                      img: itm.imgurl,
                      cat: itm.category,
                      price: itm.price,
                      description: itm.description,
                      portionSize: itm.portionSize,
                      ingredients: itm.ingredients,
                    ),
                  ),
                );
              },
              child: Container(
                height: height * 0.18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                child: Center(
                  child: ListTile(
                    leading: SizedBox(
                      width: width * 0.15,
                      height: height * 0.2,
                      child: Image.asset(
                        itm.imgurl,
                        fit: BoxFit.contain,
                      ),
                    ),
                    trailing: orderbutton(height),
                    title: SizedBox(
                      height: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            itm.name,
                            style: FontStyles.tile,
                          ),
                          Text(
                            "₹${itm.price}",
                            style: FontStyles.price,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Container orderbutton(double height) {
    return Container(
      width: 100,
      height: height * 0.05,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 255, 89, 0)),
      child: const Center(
          child: Text(
        'Order Now',
      )),
    );
  }

  SizedBox specialsbar(double width, double height) {
    return SizedBox(
      width: width,
      height: height * 0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.foodmodel.length,
        itemBuilder: (context, index) {
          var item = controller.foodmodel[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectedView(
                        title: item.name,
                        img: item.imgurl,
                        cat: item.category,
                        price: item.price,
                        description: item.description,
                        portionSize: item.portionSize,
                        ingredients: item.ingredients,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: width < 400 ? width * 0.85 : 400,
                  height: height * 0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 247, 240, 232),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Image.asset(
                          item.imgurl,
                          fit: BoxFit.contain,
                          height: height * 0.15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                item.name,
                                style: FontStyles.subtitle,
                              ),
                              Text(
                                'Starting @ ${item.price}',
                                style: FontStyles.subtitle,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  SizedBox resutlbar(double width, double height) {
    return SizedBox(
      width: width,
      height: height * 0.2,
      child: Expanded(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.filteredmodel.length,
          itemBuilder: (context, index) {
            var item = controller.filteredmodel[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectedView(
                        title: item.name,
                        img: item.imgurl,
                        cat: item.category,
                        price: item.price,
                        description: item.description,
                        portionSize: item.portionSize,
                        ingredients: item.ingredients,
                      ),
                    ),
                  );
                },
                child: Card(
                  elevation: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: index % 2 == 0
                          ? const Color.fromARGB(255, 255, 236, 242)
                          : const Color.fromARGB(255, 242, 235, 246),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 150,
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              item.imgurl,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            item.name,
                            style: FontStyles.tile,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
