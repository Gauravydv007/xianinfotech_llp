import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:intl/intl.dart';

class ItemWiseDiscountPage extends StatefulWidget {
  const ItemWiseDiscountPage({super.key});

  @override
  State<ItemWiseDiscountPage> createState() => _ItemWiseDiscountPageState();
}

class _ItemWiseDiscountPageState extends State<ItemWiseDiscountPage> {
  String selectedDateRange = "Custom";
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  bool isDropdownVisible = false;
  bool isTypeDropdownVisible = false;
  bool isPartyDropdownVisible = false;

  final List<String> dateRangeOptions = [
    "Today",
    "This Week",
    "This Month",
    "This Quarter",
    "This Financial Year",
    "Custom"
  ];

  final List<String> typeOptions = [
    "All",
    "Unauthorized",
  ];

  final List<String> partyOptions = [
    "All Parties",
    "Gaurav",
  ];

  String selectedType = "All";
  String selectedParty = "All Parties";

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

  void selectParty(String option) {
    setState(() {
      selectedParty = option;
      isPartyDropdownVisible = false;
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
           Padding(
             padding: const EdgeInsets.only(right: 5),
             child: Row(
                       children: [
              SizedBox(
                width: 220,
                child: Text(
                  "Item Wise Discount",
                  style: TextStyle(
                      fontSize: 21, fontWeight: FontWeight.w500, color: Colors.white),
                ),
              ),
             
              SizedBox(width: 15,),
             
              Icon(FontAwesomeIcons.solidFilePdf, color: Colors.red,),
               SizedBox(width: 8,),
             
              Icon(FontAwesomeIcons.solidFileExcel, color: Colors.green,)
                       ],
                     ),
           ),
        ],
      ),
      body: Stack(
        children: [
          
          
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
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
                          height: 25,
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
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: const Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    children: [
                      Text(
                        "Item Name",
                        style: TextStyle(fontSize: 13, color: Colors.blue),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "All Items",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(height: 20, child: VerticalDivider()),
                      Text(
                        "Item Category",
                        style: TextStyle(fontSize: 13, color: Colors.blue),
                      ),
                      SizedBox(
                        width: 5,
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
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(width: 25),
                            const Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    children: [
                      Text(
                        "Party Name",
                        style: TextStyle(fontSize: 13, color: Colors.blue),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 200,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: const Icon(Icons.arrow_drop_down),
                            hintText: selectedParty,
                          ),
                          
                          onTap: () {
                            setState(() {
                              isPartyDropdownVisible = !isPartyDropdownVisible;
                              
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 360,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Summary",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "\u{20B9}${0.0}",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "\u{20B9}${0.0}",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (isDropdownVisible)
            Positioned(
              top: 35,
              left: 10,
              child: Container(
                height: 185,
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
                      height: 30,
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
              top: 80,
              left: 250,
              child: Container(
                height: 90,
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
                          style: const TextStyle(fontSize: 13),
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
          if (isPartyDropdownVisible)
            Positioned(
              top: 150, 
              left: 70, 
              child: Container(
                height: 90,
                width: 200, 
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
                  children: partyOptions.map((String option) {
                    return SizedBox(
                      height: 30,
                      child: ListTile(
                        dense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        title: Text(
                          option,
                          style: const TextStyle(fontSize: 13),
                        ),
                        onTap: () {
                          selectParty(option);
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
