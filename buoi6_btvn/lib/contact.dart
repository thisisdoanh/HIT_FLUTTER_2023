import 'dart:math';

import 'package:buoi6_btvn/add_contact.dart';
import 'package:flutter/material.dart';

import 'detail_contact.dart';

class AllContact extends StatefulWidget {
  const AllContact({super.key});

  @override
  State<AllContact> createState() => _AllContactState();
}

class _AllContactState extends State<AllContact> {
  List<DetailContact> listAllContact = [];
  List<DetailContact> listCustomerContact = [];
  List<DetailContact> listCustomerAndManufactureContact = [];
  List<DetailContact> listManufactureContact = [];
  List<Color> listColor = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 0,
        length: 4,
        animationDuration: const Duration(),
        child: Scaffold(
          appBar: AppBar(
            leading: const Icon(Icons.arrow_back),
            title: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: const [
                  Expanded(
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(
                      'Tìm kiếm',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push<DetailContact>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddContact(),
                    ),
                  ).then(
                    (value) {
                      if (value != null) {
                        if (value.type == 1) {
                          listCustomerContact.add(value);
                        } else if (value.type == 2) {
                          listCustomerAndManufactureContact.add(value);
                        } else if (value.type == 3) {
                          listManufactureContact.add(value);
                        }
                        listAllContact.add(value);
                        setState(() {});
                      }
                    },
                  );
                },
                icon: const Icon(Icons.add),
              ),
            ],
            bottom: const TabBar(tabs: [
              Text('Tất cả'),
              Text('Khách hàng'),
              Text('Khách hàng và nhà cung cấp'),
              Text('Nhà cung cấp'),
            ]),
          ),
          body: TabBarView(
            children: [
              DisplayContact(
                list: listAllContact,
                listColor: listColor,
              ),
              DisplayContact(
                list: listCustomerContact,
                listColor: listColor,
              ),
              DisplayContact(
                list: listCustomerAndManufactureContact,
                listColor: listColor,
              ),
              DisplayContact(
                list: listManufactureContact,
                listColor: listColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DisplayContact extends StatelessWidget {
  DisplayContact({super.key, required this.list, required this.listColor});

  final List list;
  final List<Color> listColor;
  static List<Color> colors = [
    const Color.fromARGB(255, 198, 83, 83),
    Colors.teal,
    const Color.fromARGB(255, 95, 219, 99),
    const Color.fromARGB(255, 149, 97, 97),
    const Color.fromARGB(255, 65, 195, 205),
    const Color.fromARGB(255, 207, 202, 76),
    const Color.fromARGB(255, 221, 118, 206),
    const Color.fromARGB(255, 79, 185, 231),
  ];

  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          final DetailContact item = list[index];
          Color colorBackground = colors[random.nextInt(colors.length)];
          if (listColor.length != list.length) listColor.add(colorBackground);
          return Container(
            decoration: BoxDecoration(
              color: listColor[index],
              borderRadius: BorderRadius.circular(8),
            ),
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Name
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),

                ///phoneNumber

                Row(
                  children: [
                    Expanded(
                      child: Text("SĐT: ${item.phoneNumber}"),
                    ),

                    ///Address
                    Expanded(
                      child: Text(
                          'Địa chỉ: ${item.address} ${item.district} ${item.city}'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),

                ///MST
                Row(
                  children: [
                    Expanded(
                      child: Text("MST: ${item.taxCode}"),
                    ),

                    ///CCCD
                    Expanded(
                      child: Text("CCCD: ${item.idNumber}"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),

                ///Type
                Row(
                  children: [
                    const Text('Loại khách hàng: '),
                    Text(item.type == 1
                        ? 'Khách hàng'
                        : item.type == 2
                            ? 'Khách hàng và nhà cung cấp'
                            : 'Nhà cung cấp'),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),

                ///Email
                Text("Email: ${item.email}"),
                const SizedBox(
                  height: 8,
                ),

                ///Description
                Text("Mô tả: ${item.description}"),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
