import 'package:flutter/material.dart';
import 'package:promracing/Quizzes.dart';

List<Widget> buttons(context, curindex) {
  const List<Widget> _labels = [
    Text('News', style: TextStyle(fontSize: 15)),
    Text('Prom', style: TextStyle(fontSize: 15)),
    Text('Quizzes', style: TextStyle(fontSize: 15)),
    Text('Rules', style: TextStyle(fontSize: 15)),
    Text('Photos', style: TextStyle(fontSize: 15)),
    Text('Sponsors', style: TextStyle(fontSize: 15)),
    Text('ContactUs', style: TextStyle(fontSize: 15)),
    Text('Quizzes', style: TextStyle(fontSize: 15))
  ];
  final List<Widget> _butt = [];
  const _space = SizedBox(width: 10);
  _butt.add(_space);

  for (var i = 0; i < 7; i++) {
    _butt.add(_button(_labels[i], i + 1, context, curindex));
    _butt.add(_space);
  }
  return _butt;
}

_button(text, index, context, curindex) {
  return ButtonTheme(
      minWidth: 70,
      height: 30,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Container(
        margin: const EdgeInsets.all(0),
        child: ElevatedButton.icon(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0))),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 255, 158, 190)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            elevation:
                MaterialStateProperty.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed) ||
                  states.contains(MaterialState.hovered) ||
                  states.contains(MaterialState.focused) ||
                  index == curindex) {
                return 13;
              } else {
                return 0;
              }
            }),
          ),
          onPressed: () {},
          onLongPress: () {
            if (index == 1) Navigator.pushNamed(context, '/MainPage');
            if (index == 2) Navigator.pushNamed(context, '/Prom');
            if (index == 3) Navigator.pushNamed(context, '/Rules');
            if (index == 4) Navigator.pushNamed(context, '/Quizzes');
            if (index == 5) Navigator.pushNamed(context, '/Photos');
            if (index == 6) Navigator.pushNamed(context, '/Sponsors');
          },
          icon: Padding(
              padding: const EdgeInsets.all(0),
              child: Image.asset(
                'assets/image$index.png',
                height: 25.0,
                width: 25.0,
              )),
          label: Padding(padding: const EdgeInsets.all(0), child: text),
        ),
      ));
}
