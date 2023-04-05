import 'package:flutter/material.dart';

import 'add_task.dart';
import 'data_task.dart';

final listTask = [
  DataTask('Task1', ' ', ' ', ' ', ' ', ' '),
];

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Board',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.calendar_month),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'All',
              ),
              Tab(
                text: 'Uncompleted',
              ),
              Tab(
                text: 'Completed',
              ),
              Tab(
                text: 'Favorite',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            FirstScreen(),
            FirstScreen(),
            FirstScreen(),
            FirstScreen(),
          ],
        ),
      ),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool isDoned = false;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.amber,
      child: Column(
        children: [
          Task(listTask[0]),
          const Spacer(),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddTaskScreen(),
                  ),
                );
              },
              child: const Text('Add a task')),
        ],
      ),
    );
  }

  Container Task(DataTask item) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.green,
      ),
      child: Row(
        children: [
          Expanded(
            child: Checkbox(
              value: isDoned,
              onChanged: (bool? value) {
                setState(
                  () {
                    isDoned = value!;
                  },
                );
              },
            ),
          ),
          Expanded(
            flex: 10,
            child: Column(
              children: [
                Text(item.titleTask.toString()),
                Text('From ${item.startTime}- To ${item.endTime}'),
                Text('Deadline: ${item.dateDealine}'),
              ],
            ),
          ),
          Expanded(
            child: Checkbox(
              shape: const StadiumBorder(),
              value: isFavorite,
              onChanged: (bool? value) {
                setState(
                  () {
                    isFavorite = value!;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
