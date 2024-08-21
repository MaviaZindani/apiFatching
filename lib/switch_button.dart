import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SwitchButton extends StatefulWidget {
  const SwitchButton({super.key});

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  @override
  Widget build(BuildContext context) {
    var status6 = false;
    var status1 = false;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
             Column(
               children: [
                 Text("Default"),
                 SizedBox(height: 10.0),
                 FlutterSwitch(
                   value: status1,
                   onToggle: (val) {
                     setState(() {
                       status1 = val;
                     });
                   },
                 ),
               ]
             ),
            Text("Custom text"),
              SizedBox(height: 10.0),
              FlutterSwitch(
                activeColor: Colors.green,
                inactiveColor: Colors.red,
                activeText: "Online",
                inactiveText: "Offline",
                value: true,
                valueFontSize: 10.0,
                width: 110,
                borderRadius: 30.0,
                showOnOff: true,
                onToggle: (val) {
                  status6 = val;
                  print(status6 = val);
                  setState(() {});
              },
            ),
          ]
        ),
      )
    );
  }
}