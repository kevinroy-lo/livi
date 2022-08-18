import 'package:flutter/material.dart';
import 'package:livi/home/ui/start_confirm.dart';
import 'package:livi/home/ui/start_area.dart';
import 'package:livi/home/ui/start_float.dart';
import 'package:livi/home/ui/start_header.dart';
import 'package:livi/home/ui/start_phone_input.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Livi Bank"),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.black87,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const PhoneInputHeader(),
            const Divider(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 10,
                ),
                const PhoneAreaPicker(),
                const SizedBox(
                  width: 16,
                ),
                PhoneInput(
                  controller: controller,
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            PhoneConfirmButton(
              context: context,
              controller: controller,
            ),
          ],
        ),
      ),
      floatingActionButton: PhoneHistoryButton(
        context: context,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
