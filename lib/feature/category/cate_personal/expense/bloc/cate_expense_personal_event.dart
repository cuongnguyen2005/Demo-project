import 'package:flutter/cupertino.dart';

class CateExpensePersonalEvent {}

class CateGetExpenseListEvent extends CateExpensePersonalEvent {
  final BuildContext context;
  CateGetExpenseListEvent({
    required this.context,
  });
}

class CateAddEvent extends CateExpensePersonalEvent {
  final BuildContext context;
  CateAddEvent({
    required this.context,
  });
}

class CateUpdateEvent extends CateExpensePersonalEvent {
  final BuildContext context;
  final String id;
  CateUpdateEvent({
    required this.context,
    required this.id,
  });
}
