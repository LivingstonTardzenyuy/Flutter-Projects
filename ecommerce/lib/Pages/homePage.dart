import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Footware Admin'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                  title: Text('Title'),
                  subtitle: Text('Price-200'),

                trailing: IconButton(
                    onPressed: () {
                      print('pressed to delete item');
                    },
                    icon: Icon(Icons.delete)),
              );
            }),
      ),

      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {
          print('Add new data');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
