import 'package:flutter/material.dart';
import 'package:gatal_io_mobile/models/product.dart';

class DetailPage extends StatelessWidget {
  final Product product;

  const DetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.fields.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name: ${product.fields.name}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text("Description: ${product.fields.description}"),
            const SizedBox(height: 8),
            Text("Genre: ${product.fields.genre}"),
            const SizedBox(height: 8),
            Text("Price: ${product.fields.price}"),
            const SizedBox(height: 8),
            Text("Time: ${product.fields.time}"),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Kembali ke halaman daftar
              },
              child: const Text("Back to List"),
            ),
          ],
        ),
      ),
    );
  }
}
