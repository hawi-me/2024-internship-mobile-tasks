import 'package:flutter/material.dart';
import 'package:flutter_application_1/details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Search(),
    );
  }
}

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  RangeValues _currentRangeValues = const RangeValues(0, 100);

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
          'Search Product',
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  height: 48,
                  width: 290,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Leather',
                      suffixIcon: Icon(
                        Icons.arrow_forward,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4.0,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return _bottomsheetfilter();
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.filter_list,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView(
                children: [
                  _buildProductCard(
                    context,
                    'assets/images/shoe_3.jpg',
                    'Sneaker',
                    '\$120',
                    'Best shoe ever',
                    'The North Face',
                  ),
                  // Add more products here
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(
    BuildContext context,
    String image_url1,
    String pro_name1,
    String pro_price1,
    String pro_categorey1,
    String pro_description1,
  ) {
    return GestureDetector(
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
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        padding: const EdgeInsets.all(16.0),
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
    );
  }

  Widget _bottomsheetfilter() {
    return SizedBox(
      width: 400,
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Category',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const SizedBox(
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Price',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            RangeSlider(
              values: _currentRangeValues,
              min: 0,
              max: 100,
              divisions: 10,
              labels: RangeLabels(
                _currentRangeValues.start.round().toString(),
                _currentRangeValues.end.round().toString(),
              ),
              activeColor: Colors.blue,
              inactiveColor: Colors.grey,
              onChanged: (RangeValues values) {
                setState(() {
                  _currentRangeValues = values;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 44),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Apply'),
            ),
          ],
        ),
      ),
    );
  }
}

// class Details extends StatelessWidget {
//   final String imageUrl;
//   final String price;
//   final String productName;
//   final String category;
//   final String description;

//   const Details({
//     super.key,
//     required this.imageUrl,
//     required this.price,
//     required this.productName,
//     required this.category,
//     required this.description,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(productName),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.asset(imageUrl),
//             const SizedBox(height: 10),
//             Text(
//               productName,
//               style: const TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               price,
//               style: const TextStyle(
//                 fontSize: 20,
//                 color: Colors.black,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               description,
//               style: const TextStyle(
//                 fontSize: 16,
//                 color: Colors.black54,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               'Category: $category',
//               style: const TextStyle(
//                 fontSize: 16,
//                 color: Colors.black54,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
