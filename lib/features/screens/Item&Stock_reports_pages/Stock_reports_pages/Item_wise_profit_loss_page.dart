import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemWiseProfitLossPage extends StatefulWidget {
  const ItemWiseProfitLossPage({super.key});

  @override
  State<ItemWiseProfitLossPage> createState() => _ItemWiseProfitLossPageState();
}

class _ItemWiseProfitLossPageState extends State<ItemWiseProfitLossPage> {
  String selectedDateRange = "Custom";
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  bool isDropdownVisible = false;
  bool isTypeDropdownVisible = false;
  bool kname = false;

  final List<String> dateRangeOptions = [
    "Today",
    "This Week",
    "This Month",
    "This Quarter",
    "This Financial Year",
    "Custom"
  ];

  final List<String> typeOptions = [
    "Name",
    "Amount",
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 12, 135, 206),
          shadowColor: Colors.grey,
          elevation: 1,
          actions: [
            Row(
              children: [
                const Text(
                  "Item Reported By Party",
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 50,
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
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: const Offset(0.0, 1),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
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
                              width: 55,
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
                            const Icon(
                              Icons.calendar_month,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 5),
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
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3, left: 0, right: 10),
                child: Row(
                  children: [
                    Checkbox(
                      value: kname,
                      onChanged: (value) {
                        setState(() {
                          kname = value!;
                        });
                      },
                    ),
                    Text(
                      "Items Having Sale",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sort by",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.blue,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isTypeDropdownVisible = !isTypeDropdownVisible;
                            });
                          },
                          child: Row(
                            children: [
                              Text(
                                selectedType,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(width: 60),
                              const Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Item name",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.grey),
                    ),
                    Text(
                      'Profit/Loss Amount',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 475,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      " Total",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "\u{20B9}${0.0}",
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (isDropdownVisible)
            Positioned(
              top: 35,
              left: 10,
              child: Container(
                height: 170,
                width: 140,
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
                              fontSize: 12, overflow: TextOverflow.ellipsis),
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
              top: 90,
              left: 240,
              child: Container(
                height: 120,
                width: 100,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset:  Offset(0.0, 1),
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
    );
  }
}
