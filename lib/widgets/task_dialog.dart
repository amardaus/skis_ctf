import 'package:flutter/material.dart';
import 'package:skis_campus_game/models/singletask.dart';
import 'package:skis_campus_game/screens/task_screen.dart';
import 'package:skis_campus_game/themes/mytheme.dart';

class TaskDialog extends StatelessWidget{
  final SingleTask task;

  TaskDialog({Key key, @required this.task}) : super(key: key);

  final double radius = 20;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
      //borderRadius: BorderRadius.only(topLeft:  Radius.circular(radius), topRight:  Radius.circular(radius))),
      borderRadius: BorderRadius.all(Radius.circular(radius),)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(borderRadius: 
            BorderRadius.only(topLeft: Radius.circular(radius), topRight: Radius.circular(radius)),
            color: task.category.color),
            child: Column(children: <Widget>[
              Image.asset('assets/images/categories/tmp/resistor.png', width: 100,),
              Text(task.name)
            ],),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(task.description),),
          Container(padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
            FlatButton(child: Text("Cancel", style: TextStyle(color: Colors.white)), 
              color: TaskColors.negativeBtn, 
              onPressed:  () {
                Navigator.pop(context);
              },
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0))
              ),
            FlatButton(child: Text("Accept", style: TextStyle(color: Colors.white)), 
              color: TaskColors.positiveBtn, 
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TaskScreen(task: task)));
              },
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)))
          ],),)
        ],
        ));
  }
}