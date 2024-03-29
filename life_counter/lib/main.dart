import 'package:flutter/material.dart';
import 'package:life_counter/add_life_event_screen.dart';
import 'package:life_counter/model/life_event.dart';
import 'package:life_counter/objectbox.g.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LifeCounterPage(),
    );
  }
}

class LifeCounterPage extends StatefulWidget {
  const LifeCounterPage({super.key});

  @override
  State<LifeCounterPage> createState() => _LifeCounterPageState();
}

class _LifeCounterPageState extends State<LifeCounterPage> {
  late Box<LifeEvent> _lifeEventBox;
  List<LifeEvent> _lifeEvents = [];

  Future<void> initialize() async {
    final store = await openStore();
    _lifeEventBox = store.box<LifeEvent>();
    fetchLifeEvents();
  }

  void fetchLifeEvents() {
    setState(() {
      _lifeEvents = _lifeEventBox.getAll();
    });
  }

  void incrementLifeEventCount(LifeEvent lifeEvent) {
    lifeEvent.counter++;
    _lifeEventBox.put(lifeEvent);
    fetchLifeEvents();
  }

  void removeLifeEvent(LifeEvent lifeEvent) {
    final isRemoved = _lifeEventBox.remove(lifeEvent.id);
    if (isRemoved) {
      fetchLifeEvents();
    }
  }

  void addLifeEvent(String eventName) {
    final lifeEvent = LifeEvent(eventName: eventName, counter: 1);
    _lifeEventBox.put(lifeEvent);
    fetchLifeEvents();
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('人生カウンター')),
      body: ListView.builder(
        itemCount: _lifeEvents.length,
        itemBuilder: ((context, index) {
          final lifeEvent = _lifeEvents[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(lifeEvent.eventName),
                const Spacer(),
                Text(lifeEvent.counter.toString()),
                IconButton(
                  icon: const Icon(Icons.plus_one),
                  onPressed: () => incrementLifeEventCount(lifeEvent),
                ),
                IconButton(
                  onPressed: () => removeLifeEvent(lifeEvent),
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final eventName = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddLifeEventScreen()),
          );
          if (eventName.toString().isNotEmpty) {
            addLifeEvent(eventName);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
