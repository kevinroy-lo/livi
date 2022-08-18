part of 'history_bloc.dart';

abstract class HistoryEvent extends Equatable {
  const HistoryEvent();

  @override
  List<Object> get props => [];
}

class HistoryPhoneCommit extends HistoryEvent {
  final String areaCode;
  final String phone;

  const HistoryPhoneCommit({required this.areaCode, required this.phone});

  @override
  List<Object> get props => [areaCode, phone];
}

class HistoryPhoneList extends HistoryEvent {}

class HistoryPhonePick extends HistoryEvent {
  final String areaCode;
  final String phone;

  const HistoryPhonePick({required this.areaCode, required this.phone});

  @override
  List<Object> get props => [areaCode, phone];
}
