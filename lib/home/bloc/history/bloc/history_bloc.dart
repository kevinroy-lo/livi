import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:livi/home/bloc/area/bloc/area_code_bloc.dart';
import 'package:livi/local_storage.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final AreaCodeBloc areaCodeBloc;

  HistoryBloc({required this.areaCodeBloc}) : super(HistoryInitial()) {
    on<HistoryPhoneCommit>(_onHistoryPhoneCommit);
    on<HistoryPhonePick>(_onHistoryPhonePick);
    on<HistoryPhoneList>(_onHistoryPhoneList);
  }

  void _onHistoryPhoneCommit(
      HistoryPhoneCommit event, Emitter<HistoryState> state) async {
    var phoneNum = event.phone;
    var areaCode = event.areaCode;
    if (phoneNum.isEmpty || areaCode.isEmpty) {
      return;
    }
    log('_onHistoryPhoneCommit: $phoneNum, $areaCode');
    var sp = await LocalStorage.sp;
    var list = sp?.getStringList("phone_list") ?? List.empty(growable: true);
    var item = "$areaCode&$phoneNum";
    if (!list.contains(item)) {
      list.add(item);
    }
    sp?.setStringList("phone_list", list);
  }

  void _onHistoryPhoneList(
      HistoryPhoneList event, Emitter<HistoryState> emitter) async {
    var sp = await LocalStorage.sp;
    var list = sp?.getStringList("phone_list") ?? List.empty(growable: true);
    var stateList = list
        .map((e) => HistoryPhonePickState(
            areaCode: e.split("&")[0], phone: e.split("&")[1]))
        .toList();
    log('_onHistoryPhoneList: ${stateList.length}');
    emitter(HistoryPickListState(items: stateList));
  }

  void _onHistoryPhonePick(
      HistoryPhonePick event, Emitter<HistoryState> emitter) async {
    var phoneNum = event.phone;
    var areaCode = event.areaCode;
    log('_onHistoryPhonePick: $phoneNum, $areaCode');
    areaCodeBloc.emit(areaCodeBloc.state.copywith(
      curAreaCode: areaCode,
    ));
    emitter(HistoryPhonePickState(areaCode: areaCode, phone: phoneNum));
  }
}
