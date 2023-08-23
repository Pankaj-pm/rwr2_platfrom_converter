import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platfrom_converter/provider/base_provider.dart';
import 'package:provider/provider.dart';

class AddContact extends StatefulWidget {
  const AddContact({Key? key}) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  @override
  Widget build(BuildContext context) {
    return Provider.of<BaseProvider>(context).isAndroid
        ? Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: CircleAvatar(
                        radius: 60,
                        child: Icon(Icons.camera_alt_outlined),
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        labelText: "Full name",
                        hintText: "Ex. Meet",
                        prefixIcon: Icon(Icons.person)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      prefixIcon: Icon(Icons.phone),
                      labelText: "Phone Number",
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      prefixIcon: Icon(Icons.chat),
                      labelText: "Chat Conversation",
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextButton.icon(
                    onPressed: () {
                      showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2050));
                    },
                    icon: Icon(Icons.date_range),
                    label: Text("Pick Date"),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      showTimePicker(context: context, initialTime: TimeOfDay.now());
                    },
                    icon: Icon(Icons.access_time_rounded),
                    label: Text("Pick Time"),
                  ),
                ],
              ),
            ),
          )
        : CupertinoPageScaffold(
            child: Text("Hello"),
          );
  }
}
