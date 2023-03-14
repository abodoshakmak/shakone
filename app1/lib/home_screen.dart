import 'package:app1/Details_Screen.dart';
import 'package:app1/task_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();
  List<TaskModel> tasks = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    child: Container(
                      width: 50,
                      color: Color.fromARGB(255, 42, 48, 3),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              controller: titleController,
                              decoration: InputDecoration(
                                  hintText: "Enter task",
                                  hintStyle: TextStyle(
                                      color: Colors.green.withOpacity(0.6))),
                            ),
                            TextField(
                              controller: subTitleController,
                              decoration: InputDecoration(
                                  hintText: "enter sub",
                                  hintStyle: TextStyle(color: Colors.pink)),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MaterialButton(
                                  onPressed: () {
                                    if (titleController.text.isNotEmpty) {
                                      tasks.add(TaskModel(
                                          title: titleController.text,
                                          creatAt: DateTime.now(),
                                          subTitle:
                                              subTitleController.text.isEmpty
                                                  ? null
                                                  : subTitleController.text));
                                      titleController.clear();
                                      subTitleController.clear();
                                      Navigator.pop(context);
                                      setState(() {});
                                    }
                                  },
                                  color: Colors.green,
                                  child: Row(
                                    children: const [
                                      Text(
                                        'ADD',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Icon(
                                        Icons.add,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  color: Colors.green,
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
                labelColor: Color.fromARGB(255, 113, 71, 228),
                indicatorColor: Color.fromARGB(255, 190, 230, 69),
                tabs: [
                  Tab(
                    text: 'Done',
                  ),
                  Tab(
                    text: 'WAITING',
                  ),
                ]),
            Expanded(
              child: TabBarView(children: [
                Center(
                    child: ListView.builder(
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => DetailsScreen(
                                            taskModel: tasks[index],
                                          )));
                            },
                            child: ListTile(
                              title: Text(tasks[index].title),
                              subtitle: Text(tasks[index]
                                  .creatAt
                                  .toString()
                                  .substring(0, 10)
                                  .replaceAll('-', '/')),
                              trailing: Checkbox(
                                  value: tasks[index].isDone,
                                  onChanged: (value) {
                                    setState(() {
                                      tasks[index].isDone =
                                          !tasks[index].isDone;
                                    });
                                  }),
                            ),
                          );
                        })),
                const Center(
                  child: Text('WEAITNTG'),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
