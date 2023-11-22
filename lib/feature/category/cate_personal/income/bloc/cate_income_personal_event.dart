import 'package:flutter/cupertino.dart';

class CateIncomePersonalEvent {}

class CateGetIncomeListEvent extends CateIncomePersonalEvent {
  final BuildContext context;
  CateGetIncomeListEvent({
    required this.context,
  });
}

class CateAddEvent extends CateIncomePersonalEvent {
  final BuildContext context;
  CateAddEvent({
    required this.context,
  });
}

class CateUpdateEvent extends CateIncomePersonalEvent {
  final BuildContext context;
  final String id;
  CateUpdateEvent({
    required this.context,
    required this.id,
  });
}
