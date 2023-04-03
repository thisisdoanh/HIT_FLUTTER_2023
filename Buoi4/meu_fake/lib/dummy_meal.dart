import 'package:flutter/material.dart';

import 'detail_meal.dart';
import 'dummy_data.dart';

class DummyMeal extends StatefulWidget {
  const DummyMeal({
    super.key,
    required this.id_categories,
    required this.name_category,
  });

  final String id_categories, name_category;

  @override
  State<DummyMeal> createState() => _DummyMealState();
}

class _DummyMealState extends State<DummyMeal> {
  List<Meal> listMeal = [];

  @override
  void initState() {
    super.initState();
    listMeal = DUMMY_MEALS
        .where((i) => i.categories.contains(widget.id_categories))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
        title: Text(widget.name_category),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.pink,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.amber,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount: listMeal.length,
                  itemBuilder: (context, index) {
                    final item = listMeal[index];
                    return Container(
                      // height: 400,
                      padding: const EdgeInsets.only(bottom: 16),
                      margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListMeal(
                        list: item,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListMeal extends StatelessWidget {
  const ListMeal({
    super.key,
    required this.list,
  });

  final Meal list;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(0),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsDummyMeal(detail: list)));
          },
          child: Container(
            margin: const EdgeInsets.all(0),
            width: double.maxFinite,
            height: 350,
            // width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              image: DecorationImage(
                image: NetworkImage(list.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Positioned(
                  bottom: MediaQuery.of(context).size.height / 15,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    color: Colors.black.withOpacity(0.7),
                    child: Text(
                      list.title,
                      style: const TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.access_time,
                  size: 15,
                ),
                Text(
                  ' ${list.duration} min',
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.shopping_bag,
                  size: 15,
                ),
                Text(
                  list.complexity.name.toString(),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.attach_money,
                  size: 15,
                ),
                Text(
                  list.affordability.name.toString(),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
