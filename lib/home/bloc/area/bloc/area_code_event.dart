part of 'area_code_bloc.dart';

@immutable
abstract class AreaCodeEvent extends Equatable {
  const AreaCodeEvent();
  @override
  List<Object?> get props => [];
}

class AreaCodeStart extends AreaCodeEvent {}

class AreaCodeSelected extends AreaCodeEvent {
  final String selectedAreaCode;
  const AreaCodeSelected({required this.selectedAreaCode});
  @override
  List<Object?> get props => [selectedAreaCode];
}
