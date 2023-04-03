import 'package:flutter/material.dart';

import 'dummy_data.dart';

class DetailsDummyMeal extends StatelessWidget {
  const DetailsDummyMeal({
    super.key,
    required this.detail,
  });

  final Meal detail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
        title: Text(detail.title),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.pink,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 2 / 5,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(detail.imageUrl), fit: BoxFit.cover),
              ),
            ),
            const Text(
              'Ingredients',
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: detail.ingredients.length,
                itemBuilder: (context, index) {
                  final ingredientsDetail = detail.ingredients[index];
                  return Container(
                    margin: const EdgeInsets.all(4),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      ingredientsDetail,
                    ),
                  );
                },
              ),
            ),
            const Text('Steps'),
            Expanded(
              child: ListView.builder(
                itemCount: detail.steps.length,
                itemBuilder: (context, index) {
                  final stepsDetail = detail.steps[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.pink,
                            ),
                            child: Text(
                              '#${index + 1}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 10,
                            child: Container(
                                margin: const EdgeInsets.only(left: 8),
                                child: Text(stepsDetail))),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}