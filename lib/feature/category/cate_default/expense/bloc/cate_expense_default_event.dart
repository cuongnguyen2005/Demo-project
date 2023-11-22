// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

class CateExpenseDefaultEvent {}

class CateGetExpenseDefaultEvent extends CateExpenseDefaultEvent {
  final BuildContext context;
  CateGetExpenseDefaultEvent({
    required this.context,
  });
}
