import 'package:band_names/models/band.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Band> bands = [
    Band(id: '1', name: 'Grupo 5', votes: 5),
    Band(id: '2', name: 'Agua marina', votes: 2),
    Band(id: '3', name: 'Corazón Serrano', votes: 3),
    Band(id: '4', name: 'Armonia 10', votes: 7)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BandName',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, int i) => _bandTile(bands[i]),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        elevation: 1,
        onPressed: () => addNewBand(),
      ),
    );
  }

  Widget _bandTile(Band band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        //TODO: falta implementar el borrado
        print(band.id);
      },
      background: Container(
        padding: const EdgeInsets.only(left: 8.0),
        color: Colors.red[500],
        child: const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Delete band',
              style: TextStyle(color: Colors.white),
            )),
      ),
      child: ListTile(
          leading: CircleAvatar(
            child: Text(band.name.substring(0, 2)),
            backgroundColor: Colors.blue[100],
          ),
          title: Text(
            band.name,
            style: const TextStyle(color: Colors.black87),
          ),
          trailing: Text(
            '${band.votes}',
            style: const TextStyle(fontSize: 20),
          ),
          onTap: () {}),
    );
  }

  addNewBand() {
    final textController = TextEditingController();

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: const Text('New Band add'),
              content: TextField(controller: textController),
              actions: [
                MaterialButton(
                    child: const Text('Add'),
                    onPressed: () => _addBandTile(textController.text))
              ]);
        });
  }

  void _addBandTile(String name) {
    if (name.isNotEmpty) {
      bands.add(Band(id: (bands.length + 1).toString(), name: name, votes: 0));
      setState(() {});
    }

    Navigator.pop(context);
  }
}
