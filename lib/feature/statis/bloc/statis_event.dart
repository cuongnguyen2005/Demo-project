// ignore_for_file: public_member_api_docs, sort_constructors_first
class StatisEvent {}

class StatisGetMapMonthEvent extends StatisEvent {
  final DateTime today;
  StatisGetMapMonthEvent({
    required this.today,
  });
}

class StatisGetMapYearEvent extends StatisEvent {
  final DateTime today;
  StatisGetMapYearEvent({
    required this.today,
  });
}
