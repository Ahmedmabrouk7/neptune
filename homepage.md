import 'package:flutter/material.dart';
import 'package:use_hive/boxes.dart';
import 'package:use_hive/person.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            Color.fromARGB(255, 13, 31, 57), // background the hole page.
        appBar: AppBar(
          backgroundColor: Colors.amber, // background the AppBar only.
          title: const Text('Flutter & Hive by Ahmed Mabrouk'),
        ),
        body: Column(
          children: [
            const SizedBox(height: 10.0),
            Image.network(
              'https://avatars.githubusercontent.com/u/55202745?s=200&v=4',
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      ////////////////////// name text field
                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Name',
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      ////////////////////// age text field
                      TextField(
                        controller: ageController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Age',
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      ////////////////////// Add Button
                      TextButton(
                        onPressed: () {
                          setState(() {
                            boxPersons.put(
                              'key_${nameController.text}',
                              Person(
                                name: nameController.text,
                                age: int.parse(ageController.text),
                              ),
                            );
                          });
                        },
                        child: const Text('Add'),
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
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    //Todo : ListView.builder
                    child: ListView.builder(
                      itemCount: boxPersons.length,
                      itemBuilder: (context, index) {
                        // Todo: .getAt
                        Person person = boxPersons.getAt(index);
                        return ListTile(
                          leading: IconButton(
                            onPressed: () {
                              //Todo: .deleteAt
                              setState(() {
                                boxPersons.deleteAt(index);
                              });
                            },
                            icon: const Icon(
                              Icons.remove,
                            ),
                          ),
                          subtitle: const Text('Name'),
                          title: Text(person.name),
                          trailing: Text('age: ${person.age.toString()}'),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
