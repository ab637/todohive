import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;


  TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
        child: Slidable(
          endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(onPressed: deleteFunction,
              icon: Icons.delete,
                backgroundColor: Colors.red,
                borderRadius: BorderRadius.circular(12),
              )
            ],
          ),
          child: Container( 
            child: Padding( 
              padding: const EdgeInsets.all(15.0),
              child: FittedBox(
                child: Row( 
                  children: [
                    Checkbox(
                      value: taskCompleted,
                      onChanged: onChanged,
                      activeColor: Colors.black,
                    ),
                    Text(
                      taskName,
                      style: TextStyle( fontSize: 20,
                          decoration: taskCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                  ],
                ),
              ),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xffb5dcfb), Color(0xff16b5fc)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
                color: Colors.grey[300], borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
