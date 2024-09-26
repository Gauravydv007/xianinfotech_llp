import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemDetailsReportPage extends StatefulWidget {
  const ItemDetailsReportPage({super.key});

  @override
  State<ItemDetailsReportPage> createState() => _ItemDetailsReportPageState();
}

class _ItemDetailsReportPageState extends State<ItemDetailsReportPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 12, 135, 206),
        shadowColor: Colors.grey,
        elevation: 1,
        title: const Text(
          "Item Reported By Party",
          style: TextStyle(
              fontSize: 21, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
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
                            Text(
                              selectedDateRange,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade700,
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
                padding: const EdgeInsets.only(top: 3, left: 0, right: 0),
                child: 
                Row(
                    children: [
                      Checkbox(
                        value: lvalue,
                        onChanged: (value) {
                          setState(() {
                            lvalue = value!;
                          });
                        },
                      ),
                      Text(
                        "Hide Inactive Dates",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade600,
                        ),
                      ),

                    ],
                  ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 15),
                child: Row(
                  children: [
                     Text(
                        " Item Name",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(width: 10,),


                    Container(
                      height: 50,
                      width: 180,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter Name',
                          hintStyle:  TextStyle(color: Colors.grey),

                        ),
                      ),
                    ),


                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Row(
                  children: [
                    Text(
                      "Date",
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                          decoration: TextDecoration.underline),
                    ),
                    SizedBox(
                      width: 45,
                    ),




                       Column(
                        children: [
                          Row(
                            children: [
                          
                          
                                              Text(
                          'Sales qty',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.grey
                              ),
                              
                                              ),
                                              SizedBox(
                          width: 8,
                                              ),
                                              Text(
                          "Purchase ",
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.grey),
                                              ),
                                              SizedBox(
                      width: 8,
                    ),
                                               Text(
                          'Adjust qty',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.grey
                              ),
                              
                                              ),
                                              SizedBox(
                      width: 8,
                    ),
                          
                                               Text(
                          'Closing qty',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.grey
                              ),
                              
                                              ),
                          ],
                          ),

                          Text(
                          'qty',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.grey
                              ),
                              
                                              ),
                        ],
                      )
                    
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
    );
  }
}
