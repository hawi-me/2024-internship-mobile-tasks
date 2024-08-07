import 'package:flutter/material.dart';
import 'package:flutter_application_1/details.dart';
import 'package:flutter_application_1/search.dart';
import 'package:flutter_application_1/update.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            Icon(Icons.menu_open_rounded, size: 40, color: Colors.grey[700]),
        toolbarHeight: 100,
        actions: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12, // Optional: for a slight shadow effect
                  blurRadius: 4.0,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            margin: EdgeInsets.only(right: 27),
            child: Icon(Icons.notifications_none,
                size: 40, color: Colors.grey[700]),
          ),
        ],
        title: const Column(
          children: [
            Row(
              children: [
                Text(
                  'July 14, 2023',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text('Hello, '),
                Text(
                  'Yohannes ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Available Products',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors
                              .black12, // Optional: for a slight shadow effect
                          blurRadius: 4.0,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Search()),
                        );
                      },
                      icon: const Icon(
                        Icons.search,
                        size: 40,
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            ),
            // card one
            _shopppincard(context, 'assets/images/shoe.jpg', 'pro_name1',
                'pro_price', ' pro_categorey1', 'pro_description1'),
            _shopppincard(
              context,
              'assets/images/shoe_5.jpg',
              'Derby Leather Shoes',
              '\$120',
              'Men’s shoe',
              'A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // disabledElevation: 100.5,
        backgroundColor: Colors.blue,
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Update()),
          );
        },
        child: const Icon(Icons.add, color: Colors.white, size: 40),
      ),
    );
  }

  Widget _shopppincard(
    BuildContext context,
    String image_url1,
    String pro_name1,
    String pro_price1,
    String pro_categorey1,
    String pro_description1,
  ) {
    return Card(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Details(
                image_url: image_url1,
                pro_name: pro_name1,
                pro_price: pro_price1,
                pro_catrgory: pro_categorey1,
                pro_description: pro_description1,
              ),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          // padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(image_url1, fit: BoxFit.cover),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    pro_name1,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    pro_price1,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(pro_categorey1),
                  const Row(
                    children: [
                      Icon(Icons.star_rate_rounded, color: Colors.yellow),
                      Text('(4.0)'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
