part of 'history_bloc.dart';

abstract class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object> get props => [];
}

class HistoryInitial extends HistoryState {}

class HistoryPickListState extends HistoryState {
  final List<HistoryPhonePickState> items;
  const HistoryPickListState({required this.items});
}

class HistoryPhonePickState extends HistoryState {
  final String areaCode;
  final String phone;

  const HistoryPhonePickState({required this.areaCode, required this.phone});

  @override
  List<Object> get props => [areaCode, phone];
}
