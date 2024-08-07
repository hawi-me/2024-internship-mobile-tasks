import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:image_picker/image_picker.dart';

class Update extends StatefulWidget {
  const Update({super.key});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.blue,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Add Product',
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: double.infinity,
                  height: 190,
                  color: const Color.fromARGB(255, 232, 227, 227),
                  child: Center(
                    child: Container(
                      width: 100,
                      height: 93,
                      color: const Color.fromARGB(255, 232, 227, 227),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.image, size: 50),
                            onPressed: _pickImage,
                          ),
                          const SizedBox(height: 20),
                          selectedImage != null
                              ? Image.file(selectedImage!)
                              : const Text('please upload image'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('name'),
              const SizedBox(height: 10),
              const SizedBox(
                width: double.infinity,
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color.fromARGB(255, 232, 227, 227),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Category'),
              const SizedBox(height: 10),
              const SizedBox(
                width: double.infinity,
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color.fromARGB(255, 232, 227, 227),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('price'),
              const SizedBox(height: 10),
              const SizedBox(
                width: double.infinity,
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 232, 227, 227),
                    filled: true,
                    suffixIcon: Icon(Icons.monetization_on_outlined),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('description'),
              const SizedBox(height: 10),
              const SizedBox(
                width: double.infinity,
                height: 100,
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 232, 227, 227),
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RootPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 44),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.4),
                  ),
                ),
                child: const Text('ADD'),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RootPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.red,
                  minimumSize: const Size(double.infinity, 44),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.4),
                  ),
                ),
                child: const Text('DELETE'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }
}

void main() {
  runApp(const MaterialApp(
    home: Update(),
  ));
}
