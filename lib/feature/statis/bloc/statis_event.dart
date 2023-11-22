class StatisEvent {}

class StatisGetMapEvent extends StatisEvent {
  final DateTime today;
  StatisGetMapEvent({
    required this.today,
  });
}
