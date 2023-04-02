import 'package:objectbox/objectbox.dart';

@Entity()
class LifeEvent {
  LifeEvent({
    required this.eventName,
    required this.counter,
  });

  int id = 0;

  final String eventName;
  int counter;
}
