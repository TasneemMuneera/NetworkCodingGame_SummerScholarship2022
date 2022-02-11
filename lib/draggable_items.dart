import 'package:flutter/material.dart';

class Draggable_obj extends StatefulWidget {
  const Draggable_obj({Key? key}) : super(key: key);

  @override
  _Draggable_objState createState() => _Draggable_objState();
}

class _Draggable_objState extends State<Draggable_obj> {
  int initial_value=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Draggable<int>(
          data: 1,
          feedback: Container(
            color: Colors.deepPurple,
            height: 100,
            width: 100,
          ),
          childWhenDragging: Container(
            color: Colors.blue,
            height: 100,
            width: 100,

          ),
          child: Container(
            color: Colors.black,
            height: 100,
            width: 100,
          ),



        ),
        DragTarget<int>(
        builder: (
        BuildContext context,
        List<dynamic> accepted,
        List<dynamic> rejected,
         ) {
           return Container(
           height: 100.0,
           width: 100.0,
           color: Colors.cyan,
           child: Center(
            child: Text('Value is updated to: $initial_value'),
            ),
        );
        },
        onAccept: (int data) {
        setState(() {
        initial_value += data;
    });
    },
    ),

      ],
    );
  }
}
