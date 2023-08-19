import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Food {
  final String name;
  final String imagePath;
  final String recipe;

  Food ({required this.name, required this.imagePath, required this.recipe});
}

class MyApp extends StatelessWidget {
  final List<Food> foodList = [
    Food(
      name: "A",
      imagePath: "assets/runner.png",
      recipe: "AA",
    ),
    Food(
      name: "B",
      imagePath: "assets/a.png",
      recipe: "BB",
    )
  ];

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Food List',
      home: FoodGrid(foodList: foodList),
    );
  }
}

class FoodGrid extends StatelessWidget{
  final List<Food> foodList;

  const FoodGrid({required this.foodList});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food List',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
            fontFamily: 'Times New Roman',
          ),
        ),
        backgroundColor: Colors.yellow[400],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
        ),
        itemCount: foodList.length,
        itemBuilder:(context, index){
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return RecipePage(food: foodList[index]);
                  },
                ),
              );
            },
            child: Column(
              children:[
                Container(
                  margin: EdgeInsets.all(5),
                  width: 160,
                  height: 160,
                  child: Image.asset(foodList[index].imagePath),
                ),
                Container(
                  width: 160,
                  decoration: BoxDecoration(
                    color:Colors.yellow[200],
                    borderRadius: BorderRadius.circular(3),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0,5),
                      ),
                    ],
                    border: Border.all(
                      color: Colors.brown,
                      width: 2,
                      strokeAlign: BorderSide.strokeAlignCenter,
                    )
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      foodList[index].name,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Times New Roman',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class RecipePage extends StatelessWidget{
  final Food food;

  const RecipePage ({required this.food});

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(food.name,
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
            fontFamily: 'Times New Roman',
          ),
        ),
        backgroundColor: Colors.yellow[400],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(food.imagePath),
          ),
          Text(
            food.recipe,
            style: const TextStyle(
              fontSize: 20,
              fontFamily: 'Times New Roman',
            ),
          ),
        ],
      ),
    );
  }
}