import 'package:flutter/material.dart';
import 'package:meu_fake/dummy_data.dart';

import 'dummy_meal.dart';

class DummyCategories extends StatefulWidget {
  const DummyCategories({
    super.key,
  });

  @override
  State<DummyCategories> createState() => _DummyCategoriesState();
}

class _DummyCategoriesState extends State<DummyCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
        title: const Text(
          'Categories',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: const Icon(Icons.menu),
        backgroundColor: Colors.pink,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                  itemCount: DUMMY_CATEGORIES.length,
                  padding: const EdgeInsets.all(20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: 60,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  itemBuilder: ((context, index) {
                    final dummyCategories = DUMMY_CATEGORIES[index];
                    return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: dummyCategories.color,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 40,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DummyMeal(
                                          id_categories: dummyCategories.id,
                                          name_category: dummyCategories.title,
                                        )));
                          },
                          child: Text(
                            dummyCategories.title,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ));
                  })),
            ),
            Container(
              color: Colors.pink,
              height: 40,
              // padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(
                    Icons.category,
                    color: Colors.yellow,
                    size: 25,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 25,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
