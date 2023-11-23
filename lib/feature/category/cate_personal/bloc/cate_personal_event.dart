import 'package:flutter/cupertino.dart';

class CatePersonalEvent {}

class CateGetListEvent extends CatePersonalEvent {
  final BuildContext context;
  CateGetListEvent({
    required this.context,
  });
}

class CateAddEvent extends CatePersonalEvent {
  final BuildContext context;
  CateAddEvent({
    required this.context,
  });
}

class CateUpdateEvent extends CatePersonalEvent {
  final BuildContext context;
  final String id;
  CateUpdateEvent({
    required this.context,
    required this.id,
  });
}
