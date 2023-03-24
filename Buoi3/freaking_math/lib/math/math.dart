// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

int time = 20;
late Timer timer;

///0:start, 1 play, 2 end
int status = 0;
late int pt1;
late int pt2;
late int ans;
late String operator;
late int correct_ans;
int score = 0;
int hightest_score = 0;
List list = <String>['+', '-', '*', '/'];
final rdlist = Random();

class FreakingMath extends StatefulWidget {
  const FreakingMath({super.key});

  @override
  State<FreakingMath> createState() => _FreakingMathState();
}

class _FreakingMathState extends State<FreakingMath> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: status == 0
                ? StartScreen()
                : status == 1
                    ? PlayScreen()
                    : GameOver(),
          ),
        ),
      ),
    );
  }

  Container StartScreen() {
    return Container(
      width: double.infinity,
      color: Colors.purple,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Freaking Math',
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
              status = 1;
              score = 0;
              createExpression();
              time = 20;
              CountdownTimer();
              setState(() {});
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(12),
              backgroundColor: Colors.white,
            ),
            child: const Text(
              'Play',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container PlayScreen() {
    return Container(
      color: Colors.purple,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * time / 20,
                height: 8,
                color: Colors.white,
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            '$score',
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 64,
          ),
          Text(
            '$pt1 $operator $pt2 = $ans',
            style: const TextStyle(
              fontSize: 40,
            ),
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: MediaQuery.of(context).size.width / 2 - 16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),

                    ///chọn đúng
                    child: TextButton(
                      onPressed: () {
                        if (ans == correct_ans) {
                          score += 1;
                          createExpression();
                          time = 20;
                          CountdownTimer();
                        } else {
                          status = 2;
                        }
                        setState(
                          () {},
                        );
                      },
                      child: const Icon(
                        Icons.check,
                        size: 130,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    height: MediaQuery.of(context).size.width / 2 - 16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (ans != correct_ans) {
                          score += 1;
                          createExpression();
                          time = 20;
                          CountdownTimer();
                        } else {
                          status = 2;
                        }
                        setState(
                          () {},
                        );
                      },
                      child: const Icon(
                        Icons.clear,
                        size: 130,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Container GameOver() {
    if (hightest_score < score) hightest_score = score;
    return Container(
      color: Colors.pink,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Game Over',
            style: TextStyle(
              fontSize: 36,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Your score: $score',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          Text(
            'Best score: $hightest_score',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(8),
                  ),
                  onPressed: () {
                    status = 1;
                    score = 0;
                    time = 20;
                    setState(() {});
                  },
                  child: const Icon(Icons.cached_sharp),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(8),
                  ),
                  onPressed: () {
                    status = 0;
                    score = 0;
                    time = 1;
                    setState(() {});
                  },
                  child: const Icon(Icons.home),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  CountdownTimer() {
    // ignore: unnecessary_new
    timer = new Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        time -= 1;
        if (time <= 0) {
          timer.cancel();
          status = 2;
        }
        setState(() {});
      },
    );
  }
}

createExpression() {
  pt1 = Random().nextInt(20) + 1;
  pt2 = Random().nextInt(20) + 2;
  operator = list[rdlist.nextInt(list.length)];
  switch (operator) {
    case '+':
      correct_ans = pt1 + pt2;
      break;
    case '-':
      correct_ans = pt1 - pt2;
      break;
    case '*':
      correct_ans = pt1 * pt2;
      break;
    case '/':
      correct_ans = pt1 ~/ pt2;
      break;
  }
  ans = correct_ans + Random().nextInt(2) - 1;
}
