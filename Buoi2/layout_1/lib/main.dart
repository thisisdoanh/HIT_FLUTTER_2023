import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: Colors.brown[100],
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.topLeft,
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(90)),
                child: const Center(
                  child: Icon(
                    Icons.more_horiz,
                    size: 30,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: const EdgeInsets.only(
                    right: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/shopee_food.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        children: const [
                          Text('Số dư khả dụng'),
                          Text(
                            '9999999999',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
              // Container(
              //   alignment: Alignment.topRight,
              //   margin: const EdgeInsetsDirectional.only(start: 220),

              //   width: 130,
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(5),
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       const Icon(
              //         Icons.home,
              //         color: Color.fromARGB(255, 186, 65, 0),
              //         size: 30,
              //       ),
              //       Column(
              //         children: const [
              //           Text('Số dư khả dụng'),
              //           Text(
              //             '9999999999',
              //             style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              const SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.all(
                  15,
                ),
                height: 68,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 1,
                      child: menu(Icons.wallet, 'Tài khoản và thẻ'),
                    ),
                    Expanded(
                      flex: 1,
                      child: menu(Icons.attach_money_rounded, 'Rút tiền'),
                    ),
                    Expanded(
                      flex: 1,
                      child: menu(Icons.swap_horiz, 'Chuyển tiền'),
                    ),
                    Expanded(
                      flex: 1,
                      child: menu(Icons.qr_code_2_outlined, 'Mã Qr code'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(15),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Lịch sử giao dịch',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.refresh,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Hôm qua, 5 Thg 1, 2023',
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.grey),
                    ),
                    line(
                      Icons.subdirectory_arrow_right,
                      'Truong Bach Chien',
                      '+10.000.000',
                      'Chien chuyen tien hoc',
                    ),
                    line(
                      Icons.turn_left_sharp,
                      'Truong Bach Chien',
                      '-5.000.000',
                      'Thanh toan tien an',
                      false,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column line(IconData icon, String name, String money, String text,
      [bool x = true]) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Icon(
                icon,
                size: 20,
                color: x == true ? Colors.green : Colors.red,
              ),
            ),
            Expanded(
              flex: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 420,
                    // color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          money,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    text,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}

Column menu(IconData icon, String string) {
  return Column(
    children: [
      Icon(
        icon,
        color: const Color.fromARGB(255, 186, 65, 0),
        size: 30,
      ),
      Text(
        string,
        style: const TextStyle(fontSize: 15),
        textAlign: TextAlign.center,
      ),
    ],
  );
}
