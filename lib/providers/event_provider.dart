import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/event.dart';

class EventProvider with ChangeNotifier {
  final List<Event> _events = [];

  List<Event> get events => _events;

  void addEvent(String title, String description, DateTime date) {
    final newEvent = Event(
      id: Uuid().v4(),
      title: title,
      description: description,
      date: date,
    );
    _events.add(newEvent);
    notifyListeners();
  }

  void removeEvent(String id) {
    _events.removeWhere((event) => event.id == id);
    notifyListeners();
  }

  void editEvent(String id, String title, String description, DateTime date) {
    final eventIndex = _events.indexWhere((event) => event.id == id);
    if (eventIndex >= 0) {
      _events[eventIndex] = Event(
        id: id,
        title: title,
        description: description,
        date: date,
      );
      notifyListeners();
    }
  }
}
