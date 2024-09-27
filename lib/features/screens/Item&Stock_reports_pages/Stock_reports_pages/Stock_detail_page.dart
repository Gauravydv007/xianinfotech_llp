import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StockDetailPage extends StatefulWidget {
  const StockDetailPage({super.key});

  @override
  State<StockDetailPage> createState() => _StockDetailPageState();
}

class _StockDetailPageState extends State<StockDetailPage> {
  bool fvalue = false;
  String selectedDateRange = "Custom";
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  bool isDropdownVisible = false;
  bool isTypeDropdownVisible = false;
  bool lvalue = false;

  final List<String> dateRangeOptions = [
    "Today",
    "This Week",
    "This Month",
    "This Quarter",
    "This Year",
    "Custom"
  ];

  final List<String> typeOptions = [
    "Name",
    "Sale qua...",
    "Purchas..",
  ];

  String selectedType = "Name";

  String formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  Future<void> selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate ? startDate : endDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != (isStartDate ? startDate : endDate)) {
      setState(() {
        if (isStartDate) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }

  void selectDateRange(String option) {
    setState(() {
      selectedDateRange = option;
      isDropdownVisible = false;
    });
  }

  void selectType(String option) {
    setState(() {
      selectedType = option;
      isTypeDropdownVisible = false;
    });
  }

  String getCurrentDate() {
    var currentDate = DateTime.now();
    var formattedDate =
        "${currentDate.day}/${currentDate.month}/${currentDate.year}";
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.grey,
        elevation: 1,
        title: const Text(
          "Stock Detail Report",
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isDropdownVisible = !isDropdownVisible;
                                });
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 60,
                                    child: Text(
                                      selectedDateRange,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey.shade700,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Icon(Icons.arrow_drop_down),
                                ],
                              ),
                            ),
                            const SizedBox(width: 5),
                            const SizedBox(
                              height: 20,
                              child: VerticalDivider(color: Colors.grey),
                            ),
                            GestureDetector(
                              onTap: () => selectDate(context, true),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.calendar_month,
                                    color: Colors.blue,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    formatDate(startDate),
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 7),
                            const Text(
                              "to",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(width: 7),
                            GestureDetector(
                              onTap: () => selectDate(context, false),
                              child: Row(
                                children: [
                                  Text(
                                    formatDate(endDate),
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Filters Applied:',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Container(
                              height: 25,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.filter_alt_outlined,
                                    size: 16,
                                    color: Colors.blue,
                                  ),
                                  Text(
                                    'Filters',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          fvalue ? Colors.black : Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, left: 10, right: 10, bottom: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 25,
                              width: 130,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  'Item Category - All',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ),
                            ),

                            Container(
                              height: 25,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  'Status - All',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 1),
                Image.asset('assets/images/NO Data Image.jpeg'),
              ],
            ),
            if (isDropdownVisible)
              Positioned(
                top: 35,
                left: 10,
                child: Container(
                  height: 170,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: const Offset(0.0, 1),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: dateRangeOptions.map((String option) {
                      return SizedBox(
                        height: 26,
                        child: ListTile(
                          dense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                          title: Text(
                            option,
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          onTap: () {
                            selectDateRange(option);
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            if (isTypeDropdownVisible)
              Positioned(
                top: 100,
                left: 200,
                child: Container(
                  height: 120,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: const Offset(0.0, 1),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: typeOptions.map((String option) {
                      return SizedBox(
                        height: 30,
                        child: ListTile(
                          dense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 5),
                          title: Text(
                            option,
                            style: const TextStyle(fontSize: 18),
                          ),
                          onTap: () {
                            selectType(option);
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
