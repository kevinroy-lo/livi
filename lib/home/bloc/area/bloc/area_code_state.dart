part of 'area_code_bloc.dart';

enum AreaCodeStatus { loading, loaded, error }

class AreaCodeState extends Equatable {
  const AreaCodeState({
    this.status = AreaCodeStatus.loading,
    this.areaList,
    this.curAreaCode,
  });
  final AreaCodeStatus status;
  final String? curAreaCode;
  final Map<String, dynamic>? areaList;

  AreaCodeState copywith({
    AreaCodeStatus? status,
    Map<String, dynamic>? areaList,
    String? curAreaCode,
  }) {
    return AreaCodeState(
      status: status ?? this.status,
      areaList: areaList ?? this.areaList,
      curAreaCode: curAreaCode ?? (areaList != null ? areaList['HK'] : ''),
    );
  }

  @override
  List<Object?> get props => [status, areaList, curAreaCode];
}
