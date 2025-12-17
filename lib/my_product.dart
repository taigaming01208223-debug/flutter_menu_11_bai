import 'package:flutter/material.dart';
import 'package:flutter_nhom3_3/api.dart';
import 'package:flutter_nhom3_3/model/product.dart';

class MyProduct extends StatefulWidget {
  const MyProduct({super.key});

  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  @override
  void initState() {
    super.initState();
    test_api.getAllProduct(); // gọi API
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: test_api.getAllProduct(), 
            builder: (context, snap){
              if(snap.connectionState == ConnectionState.done){
                return myListView(snap.data!);
              }
              else{
                return CircularProgressIndicator();
              }
            }),
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 2, 1, 87),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: Text(
                'Back',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget myListView(List<Product>  ls){
    return ListView(
      scrollDirection: Axis.vertical,
      children: ls.map((p)=>myItem(p)).toList(),
    );
  }
  Widget myItem(Product p) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 6,
          offset: Offset(0, 3),
        )
      ],
    ),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            p.image,
            width: 70,
            height: 70,
            fit: BoxFit.contain,
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                p.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                "\$${p.price}",
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 6),

              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 18),
                  Text(
                    "${p.rating.rate} (${p.rating.count})",
                    style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}


}
