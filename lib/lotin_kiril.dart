import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:latin_crillic/latin_crillic.dart';

class Lotin_KirilPage extends StatefulWidget {
  const Lotin_KirilPage({super.key});

  @override
  State<Lotin_KirilPage> createState() => _Lotin_KirilPageState();
}

class _Lotin_KirilPageState extends State<Lotin_KirilPage> {
  final TextEditingController _titleEditingController =
      TextEditingController(text: "");
  bool text1 = false;
  bool krill = false;
  bool latin = true;
  String text = "";
  late String _text = "";
  var title1 = "Lotincha";
  var title2 = "Кириллча";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.blue,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        title1,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: () {
                            if (krill == false) {
                              setState(() {
                                title1 = 'Кириллча';
                                krill = true;
                              });
                            } else {
                              setState(() {
                                krill = false;
                                title1 = 'Lotincha';
                              });
                            }

                            if (latin == false) {
                              setState(() {
                                title2 = 'Кириллча';
                                latin = true;
                              });
                            } else {
                              setState(() {
                                latin = false;
                                title2 = 'Lotincha';
                              });
                            }
                          },
                          icon: const Icon(
                            Icons.repeat,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        title2,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  minLines: 1, 
                  maxLines: null, 
                  controller: _titleEditingController,
                  onChanged: (value) {
                    if (krill) {
                      setState(() {
                        text = LatinCrillic.toLatin(value);
                      });
                    } else {
                      setState(() {
                        text = LatinCrillic.toCrillic(value);
                      });
                    }
                    _text = value;
                  },
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                    hintText: "Matn",
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.white,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 150,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              color: const Color.fromARGB(255, 236, 223, 223),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        text = text.toUpperCase();
                        _titleEditingController.text =
                            _titleEditingController.text.toUpperCase();
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "KATTA HARFLAR",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        text = text.toLowerCase();
                        _titleEditingController.text =
                            _titleEditingController.text.toLowerCase();
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "kichik harflar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: text));
                      const snackBar = SnackBar(
                        content: Text('Copiya Olindi!'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Nusxa Olish",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              color: const Color.fromARGB(255, 236, 223, 223),
              child: Text(
                "Harflar Soni: ${_text.length}",
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
