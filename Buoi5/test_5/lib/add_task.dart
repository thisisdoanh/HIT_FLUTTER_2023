import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String inputTittle,
        inputDL,
        inputST,
        inputET,
        inputRemind,
        inputRepeat,
        inputColor;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.chevron_left),
        ),
        title: const Text('Add Task'),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Title'),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Design team meeting',
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                inputTittle = text;
              },
            ),
            const Text('DeadLine'),
            TextField(
              decoration: const InputDecoration(
                hintText: '2021-02-28',
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                inputDL = text;
              },
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text('Start Time'),
                      TextField(
                        decoration: const InputDecoration(
                          hintText: '11:00 Am',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (text) {
                          inputST = text;
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Text('End Time'),
                      TextField(
                        decoration: const InputDecoration(
                          hintText: '14:00 Pm',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (text) {
                          inputET = text;
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Text('Remind'),
            TextField(
              decoration: const InputDecoration(
                hintText: '10 minutes early',
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                inputRemind = text;
              },
            ),
            const Text('Repeat'),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Weekly',
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                inputRepeat = text;
              },
            ),
            const Text('Color'),
            const TextField(
              decoration: InputDecoration(
                hintText: '...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Create a Task'),
              ),
            ),
          ],
        ),
      ),
    );
  },


}
  void _handleOnCreateTask(){
    Task();
  }
