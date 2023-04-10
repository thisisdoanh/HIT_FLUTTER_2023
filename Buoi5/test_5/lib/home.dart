import 'package:flutter/material.dart';
import 'package:test_5/list_task.dart';

import 'add_task.dart';
import 'data_task.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        body: TabBarView(
          children: [
            (listTask.length == 1)
                ? FirstScreen(
                    task: listTask[0],
                  )
                : FirstScreen(
                    task: listTask[1],
                  ),

            // FirstScreen(),
            // FirstScreen(),
            // FirstScreen(),
          ],
        ),
      ),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key, required this.task});

  final DataTask task;

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  void _handleAddTask(
    String inputTittle,
    String inputDL,
    String inputST,
    String inputET,
    String inputRemind,
    String inputRepeat,
    String inputColor,
  ) {
    final newItem =
        DataTask(inputTittle, inputST, inputET, inputDL, true, true);
    listTask.add(newItem);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Task(widget.task),
          const Spacer(),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddTaskScreen(
                      addTask: _handleAddTask,
                    ),
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
              value: widget.task.isComplete,
              onChanged: (bool? value) {
                setState(
                  () {
                    widget.task.isComplete = value!;
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
              value: widget.task.isFavorite,
              onChanged: (bool? value) {
                setState(
                  () {
                    widget.task.isFavorite = value!;
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
