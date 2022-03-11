import 'package:flutter/material.dart';

List<Widget> buttons(context) {
  const List<Widget> _labels = [
    Text('News', style: TextStyle(fontSize: 15)),
    Text('Prom', style: TextStyle(fontSize: 15)),
    Text('Quizzes', style: TextStyle(fontSize: 15)),
    Text('Rules', style: TextStyle(fontSize: 15)),
    Text('Photos', style: TextStyle(fontSize: 15)),
    Text('Sponsors', style: TextStyle(fontSize: 15)),
    Text('ContactUs', style: TextStyle(fontSize: 15))
  ];
  final List<Widget> _butt = [];
  const _space = SizedBox(width: 10);
  _butt.add(_space);

  for (var i = 0; i < 7; i++) {
    _butt.add(_button(_labels[i], i + 1, context));
    _butt.add(_space);
  }
  return _butt;
}

_button(text, index, context) {
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
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            elevation:
                MaterialStateProperty.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed) ||
                  states.contains(MaterialState.hovered) ||
                  states.contains(MaterialState.focused) ||
                  index == 1)
                return 13;
              else {
                return 0;
              }
            }),
          ),
          onPressed: () {},
          onLongPress: () {
            if (index == 3) Navigator.pushNamed(context, '/Quizzes');
            if (index == 5) Navigator.pushNamed(context, '/Photos');
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
