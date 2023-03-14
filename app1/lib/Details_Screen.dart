import 'package:flutter/material.dart';
import 'package:app1/task_model.dart';
class DetailsScreen extends StatefulWidget{
  const DetailsScreen ({super.key,required this.taskModel});
  final TaskModel taskModel;
  @override
  State<DetailsScreen> createState() =>_DetailsScreen();
}
class _DetailsScreen extends State<DetailsScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.taskModel.title,
          style: const TextStyle(color:Colors.white),
        ),
      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.taskModel.subTitle ??'',
            style: const TextStyle(fontSize: 18),
            textAlign:  TextAlign.center,
            ),
            Icon(
              widget.taskModel.isDone ? Icons.check : Icons.close,
              color: widget.taskModel.isDone ? Colors.green :Colors.red,
              size: 200,
            ),
            Text(
              "this task Added at : ${widget.taskModel.creatAt.toString().substring(0,10).replaceAll('-', '/')}")
           
          ],
        )
         ),
    );
  }
}

