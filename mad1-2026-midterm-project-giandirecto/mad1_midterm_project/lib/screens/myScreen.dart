import 'package:flutter/material.dart';

class Myscreen extends StatefulWidget {
  const new({super.key});

  @override
  State<Myscreen> createState() => _MyscreenState();
}

class _MyscreenState extends State<Myscreen> {
  var itemList = [];
  var itemController = TextEditingController();
  List<bool> isChecked = [];

  void addItem() {
    var item = itemController.text;
    if (item.isEmpty) {
      return;
    }

    setState(() {
      itemList.add(item);
      isChecked.add(false);
      itemController.clear();
    });
  }

  void checkAll() {
    setState(() {
      for (int i = 0; i < itemList.length; i++) {
        isChecked[i] = true;
      }
    });
  }

  void uncheckAll() {
    setState(() {
      for (int i = 0; i < itemList.length; i++) {
        isChecked[i] = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () {
            checkAll();
          },
          icon: Icon(Icons.check_circle_outline, color: Colors.white),
        ),
        title: Text("Shopping List", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {
              uncheckAll();
            },
            icon: Icon(Icons.cleaning_services),
            color: Colors.white,
          ),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextField(
                      controller: itemController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "item",
                      ),
                    ),
                    Align(
                      alignment: .centerRight,
                      child: TextButton(
                        onPressed: () {
                          addItem();
                        },
                        child: Text(
                          "Add",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: itemList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text(
                            itemList[index],
                            style: TextStyle(
                              fontSize: 20,
                              decoration: isChecked[index]
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                          Checkbox(
                            activeColor: Colors.grey,
                            checkColor: Colors.white,

                            value: isChecked[index],
                            onChanged: (value) {
                              setState(() {
                                isChecked[index] = !isChecked[index];
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
