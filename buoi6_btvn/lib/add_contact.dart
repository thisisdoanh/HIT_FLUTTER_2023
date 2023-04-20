import 'package:buoi6_btvn/detail_contact.dart';
import 'package:buoi6_btvn/list_city.dart';
import 'package:flutter/material.dart';

class AddContact extends StatelessWidget {
  AddContact({super.key});

  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  TextEditingController controllerName = TextEditingController();
  int type = 1;
  TextEditingController controllerPhoneNumber = TextEditingController();
  String city = "";
  TextEditingController controllerDistrict = TextEditingController();
  TextEditingController controllerAddress = TextEditingController();
  TextEditingController controllerTaxCode = TextEditingController();
  TextEditingController controllerIdNumber = TextEditingController();
  TextEditingController controllerDescription = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();

  List<DropdownMenuItem> loopDropDownButton() {
    List<DropdownMenuItem> listDropDownItem = [];

    for (int i = 0; i < listCity.length; i++) {
      String item = listCity[i];
      final x = DropdownMenuItem(
        value: i + 1,
        child: Text(item),
      );
      listDropDownItem.add(x);
    }

    return listDropDownItem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, null);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Thêm khách hàng'),
        centerTitle: true,
      ),
      body: Form(
        key: keyForm,
        child: Container(
          color: Colors.grey,
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 12,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Text('Tên khách hàng'),
                            Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: controllerName,
                          validator: (value) {
                            if (value == "") {
                              return "Vui lòng nhập tên khách hàng";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Ví dụ: Nguyễn Văn A',
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: const [
                            Text('Loại khách hàng'),
                            Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                        DropdownButtonFormField<int>(
                          value: 1,
                          items: const [
                            DropdownMenuItem(
                              value: 1,
                              child: Text('Khách hàng'),
                            ),
                            DropdownMenuItem(
                              value: 2,
                              child: Text('Khách hàng và Nhà cung cấp'),
                            ),
                            DropdownMenuItem(
                              value: 3,
                              child: Text('Nhà cung cấp'),
                            ),
                          ],
                          onChanged: (value) {
                            type = value!;
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text('Số điện thoại'),
                        const Text(
                          'Ví dụ: 0364334273(Số em Doanh đẹp trai cute phô mai que)',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        TextFormField(
                          controller: controllerPhoneNumber,
                          validator: (value) {
                            if (value!.isNotEmpty) {
                              if (value.length < 10 || value.length > 14) {
                                return "Số điện thoại không hợp lệ";
                              }
                            }
                            return null;
                          },
                          maxLength: 14,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text('Tỉnh/Thành phố'),
                        DropdownButtonFormField(
                          value: 1,
                          items: loopDropDownButton(),
                          onChanged: (value) {
                            city = value;
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text('Quận/Huyện'),
                        TextFormField(
                          controller: controllerDistrict,
                          decoration: const InputDecoration(
                            hintText: 'Ví dụ: Vũ Quang',
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text('Địa chỉ'),
                        TextFormField(
                          controller: controllerAddress,
                          decoration: const InputDecoration(
                            hintText:
                                'Ví dụ: Số 1, Nguyễn Du, Thị Trấn Vũ Quang',
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text('Mã số thuế'),
                        const Text(
                          'Ví dụ: 1234567890',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        TextFormField(
                          controller: controllerTaxCode,
                          maxLength: 14,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text('Căn cước công dân'),
                        TextFormField(
                          controller: controllerIdNumber,
                          validator: (value) {
                            if (value!.isNotEmpty) {
                              if (value.length != 9 && value.length != 12) {
                                return "Số căn cước công dân phải là 9 hoặc 12 số";
                              }
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Ví dụ: 042203000xxx',
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text('Email'),
                        TextFormField(
                          controller: controllerEmail,
                          validator: (value) {
                            if (value!.isNotEmpty) {
                              if (!value.contains("@gmail.com")) {
                                return "Vui lòng nhập đúng định dạng email";
                              }
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Ví dụ: tranquocdoanhvq@gmail.com',
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text('Mô tả'),
                        TextFormField(
                          controller: controllerDescription,
                          decoration: const InputDecoration(
                            hintText:
                                'Ví dụ: Chuyên bán thịt, các món nhậu từ cá sấu',
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 158, 1, 90),
                      backgroundColor: const Color.fromARGB(255, 71, 221, 149),
                    ),
                    onPressed: () {
                      DetailContact item = DetailContact(
                          controllerName.text,
                          type,
                          controllerPhoneNumber.text,
                          city,
                          controllerDistrict.text,
                          controllerAddress.text,
                          controllerTaxCode.text,
                          controllerEmail.text,
                          controllerIdNumber.text,
                          controllerDescription.text);

                      if (keyForm.currentState!.validate()) {
                        Navigator.pop(context, item);
                      } else {
                        print("Ngu rồi");
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      width: double.maxFinite,
                      child: const Center(
                        child: Text('Thêm nhoáaaa'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
