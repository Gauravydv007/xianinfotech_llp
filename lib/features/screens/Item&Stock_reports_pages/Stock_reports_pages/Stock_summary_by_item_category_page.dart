import 'package:flutter/material.dart';

class StockSummaryByItemCategoryPage extends StatelessWidget {
  const StockSummaryByItemCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 12, 135, 206),
          shadowColor: Colors.grey,
          elevation: 1,
          actions: const [
            Row(
              children: [
                SizedBox(
                  width: 230,
                  child:  Text(
                    "Stock Summary By Item Category",
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                        
                        overflow: TextOverflow.ellipsis,
                  
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ]),
      body:  Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Row(
          children: [
            Text(
              "Item Category",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.grey.shade600),
            ),
            SizedBox(
              width: 50,
            ),
            Text(
              "Stock qty",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.grey.shade600),
            ),
            SizedBox(
              width: 30,
            ),
            Text(
              "Stock Value",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }
}
