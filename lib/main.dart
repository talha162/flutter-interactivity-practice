import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Interactivity App",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Interactivity")),
        body: AppBody(),
      ),
    );
  }
}

class AppBody extends StatelessWidget {
  const AppBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [CheckBox(), RadioButton(), DropDown(),Slider1(),Switch1(),TextBox(),Row(
          children: [
            InkWell1(),GestureDetector1()
          ],
        )],
      ),
    );
  }
}

class CheckBox extends StatefulWidget {
  const CheckBox({Key? key}) : super(key: key);

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool isChecked = false;
  String str = "Unchecked";

  @override
  Widget build(BuildContext context) {
    return Container(
        child: CheckboxListTile(
      title: Text(str),
      value: isChecked,
      onChanged: (val) {
        setState(() {
          isChecked = val!;
          if (isChecked) {
            str = "Checked";
          } else {
            str = "Unchecked";
          }
        });
      },
    ));
  }
}

class RadioButton extends StatefulWidget {
  const RadioButton({Key? key}) : super(key: key);

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  String _language1 = "Java";
  String _language2 = "Dart";
  String _selected = "Java";

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        RadioListTile(
            title: Text("Java"),
            value: _language1,
            groupValue: _selected,
            onChanged: (String? val) {
              setState(() {
                _selected = val!;
              });
            }),
        RadioListTile(
          title: Text("Dart"),
          value: _language2,
          groupValue: _selected,
          onChanged: (String? val) {
            setState(() {
              _selected = val!;
            });
          },
        ),
        Text("$_selected"),
      ],
    ));
  }
}

class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  var items = ["pakistan", "india", "bangladesh", "china", "iran"];
  String selected = "pakistan";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        DropdownButton(
            hint: Text(selected),
            onChanged: (String? value) {
              setState(() {
                selected = value!;
              });
            },
            items: items
                .map(
                    (String e) => DropdownMenuItem(value: e, child: Text("$e")))
                .toList())
      ],
    );
  }
}
class Slider1 extends StatefulWidget {
  const Slider1({Key? key}) : super(key: key);

  @override
  State<Slider1> createState() => _Slider1State();
}

class _Slider1State extends State<Slider1> {
  double value1=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(value: value1, onChanged: (val){
          setState(() {
            value1=val;
          });
        },
          min: 0,
          max: 100,

        ),
        Text("$value1")
      ],
    );

  }
}
class Switch1 extends StatefulWidget {
  const Switch1({Key? key}) : super(key: key);

  @override
  State<Switch1> createState() => _Switch1State();
}

class _Switch1State extends State<Switch1> {
 bool isOn=false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Switch(value: isOn, onChanged: (val){
          setState(() {
            isOn=val;
          });
        }
        ,
        ),
        Text(isOn?"On":"Off")
      ],
    );
  }
}
class TextBox extends StatefulWidget {
  const TextBox({Key? key}) : super(key: key);

  @override
  State<TextBox> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  String val="";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration:InputDecoration(hintText: "Enter name here",border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 1))),
        onChanged: (value) {
          setState(() {
            val=value;
          });
        }
        ),
        SizedBox(
          height: 10,
        )
        ,
        Text(val)
      ],
    );
  }
}
// InkWell class in Flutter is
// a rectangular area in Flutter of a material that responds to touch in an application.
class InkWell1 extends StatefulWidget {
  const InkWell1({Key? key}) : super(key: key);

  @override
  State<InkWell1> createState() => _InkWell1State();
}

class _InkWell1State extends State<InkWell1> {
  MaterialColor color=Colors.grey;
  bool active=false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Material(
      child: InkWell(
        splashColor: Colors.red,
        onLongPress: () {
          setState(() {
            if(active==false){
              active=true;
              color=Colors.green;
            }
            else{
              active=false;
              color=Colors.grey;
            }
          });
        },
        child: Container(
          height: 100,
          width:100,
        ),
      ),

        color: color,
      )
    );
  }
}
class GestureDetector1 extends StatefulWidget {
  const GestureDetector1({Key? key}) : super(key: key);

  @override
  State<GestureDetector1> createState() => _GestureDetector1State();
}

class _GestureDetector1State extends State<GestureDetector1> {
  MaterialColor color1=Colors.indigo;
  bool active=false;
  @override
  Widget build(BuildContext context) {
    return
      Container(
       child:GestureDetector(
         child:Container(
         height:100,
         width: 100,
           color: color1,

         ),
         onTap:
         () {
           setState(() {
             if(active==false){
               active=true;
               color1=Colors.brown;
             }
             else{
               active=false;
               color1=Colors.indigo;
             }
           });
         },
       ),
    );
  }
}
