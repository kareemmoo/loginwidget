import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ContactItem item1 = ContactItem(visible: false);
  ContactItem item2 = ContactItem(visible: false);
  ContactItem item3 = ContactItem(visible: false);

  int NumberOfCounteItems = 0;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Contact App'),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white12,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  hintText: 'Write Your Name Here',
                  suffixIcon: SizedBox(
                    width: 40,
                    child: Row(
                      children: [
                        Icon(Icons.drive_file_rename_outline),
                        Icon(Icons.add),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white12,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  hintText: 'Write Your Phone Number',
                  suffixIcon: SizedBox(
                    width: 40,
                    child: Row(
                      children: [
                        Icon(Icons.drive_file_rename_outline),
                        Icon(Icons.add),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.blue,
                        ),
                        padding: EdgeInsets.all(10),
                        child: TextButton(
                            onPressed: onAddClicked,
                            child: Text(
                              'Add',
                              style: TextStyle(color: Colors.black),
                            ))),
                  ),
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.blue,
                        ),
                        padding: EdgeInsets.all(10),
                        child: TextButton(
                            onPressed: onDeletePressed,
                            child: Text('Delete',
                                style: TextStyle(color: Colors.black)))),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              item1,
              SizedBox(
                height: 15,
              ),
              item2,
              SizedBox(
                height: 15,
              ),
              item3,
            ],
          ),
        ),
      ),
    );
  }

  onAddClicked() {
    nameController.clear();
    phoneController.clear();
    setState(() {
      if (NumberOfCounteItems == 0) {
        item1 = ContactItem(
          name: nameController.text,
          phone: phoneController.text,
          visible: true,
        );
        NumberOfCounteItems++;
      } else if (NumberOfCounteItems == 1) {
        item2 = ContactItem(
          name: nameController.text,
          phone: phoneController.text,
          visible: true,
        );
        NumberOfCounteItems++;
      } else if (NumberOfCounteItems == 2) {
        item3 = ContactItem(
          name: nameController.text,
          phone: phoneController.text,
          visible: true,
        );
        NumberOfCounteItems++;
      }
    });
  }

  onDeletePressed() {
    setState(() {
      if (NumberOfCounteItems == 0) {
      } else if (NumberOfCounteItems == 1) {
        item1 = ContactItem(
          visible: false,
        );
        NumberOfCounteItems--;
      } else if (NumberOfCounteItems == 2) {
        item2 = ContactItem(
          visible: false,
        );
        NumberOfCounteItems--;
      } else if (NumberOfCounteItems == 3) {
        item3 = ContactItem(
          visible: false,
        );
      }
    });
  }
}

class ContactItem extends StatefulWidget {
  String name, phone;
  bool visible;
  ContactItem({this.name, this.phone, this.visible});
  @override
  _ContactItemState createState() => _ContactItemState();
}

class _ContactItemState extends State<ContactItem> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.visible,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Colors.blue,
        ),
        child: Column(
          children: [
            Text(
              'Name : ${widget.name}',
              style: TextStyle(fontSize: 15),
            ),
            Text(
              'Phone : ${widget.phone}',
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
