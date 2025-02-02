import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:neptune/boxes.dart';
import 'package:neptune/person.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

//====================================================================
class _HomePageState extends State<HomePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  //====================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 19, 41),
      appBar: AppBar(
        title: Text("Neptune by Ahmed Mabrouk"),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10.0),
          //Image.network(
          //    'https://images-platform.99static.com/34OixtNawXfG4ugxds2Qqnl2aQo=/332x30:1680x1378/500x500/top/smart/99designs-contests-attachments/74/74261/attachment_74261695',
          //    height: 100),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    // text filed Title
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        //hintText: 'Title',
                        labelText: 'Title',
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    // text filed Subject
                    TextField(
                      controller: subjectController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        //hintText: 'Subject',
                        labelText: 'Subject',
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          boxPersons.put(
                            'key_${titleController.text}',
                            Person(
                              title: titleController.text,
                              subject: subjectController.text,
                              date: DateTime.now(),
                            ),
                          );
                        });
                      },
                      child: const Text(
                        'Add note',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                color: Colors.orange,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  // Todo : ListView
                  child: ListView.builder(
                      itemCount: boxPersons.length,
                      itemBuilder: (context, index) {
                        // Todo .getAt
                        Person person = boxPersons.getAt(index);
                        return ListTile(
                          leading: IconButton(
                            onPressed: () {
                              //Todo .deleleAt
                              setState(() {
                                boxPersons.deleteAt(index);
                              });
                            },
                            icon: const Icon(
                              Icons.remove,
                            ),
                          ),
                          title: Text(person.title),
                          subtitle: Text(person.subject),
                          //trailing: Text('${person.date.year}') as DateTime,
                          trailing: Text(
                            DateFormat.yMMMd().format(person.date),
                            style: const TextStyle(fontSize: 10),
                          ),
                        );
                      }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
