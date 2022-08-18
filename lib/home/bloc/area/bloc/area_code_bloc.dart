import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:livi/service/repository.dart';
import 'package:equatable/equatable.dart';

part 'area_code_event.dart';
part 'area_code_state.dart';

class AreaCodeBloc extends Bloc<AreaCodeEvent, AreaCodeState> {
  final LiviRepository liviRepository;
  final BuildContext contxt;
  AreaCodeBloc({
    required this.liviRepository,
    required this.contxt,
  }) : super(const AreaCodeState()) {
    on<AreaCodeStart>(_onAreaCodeStart);
    on<AreaCodeSelected>((event, emit) {
      _onAreaCodePick(event, emit);
      log("AreaCodeSelected:${event.selectedAreaCode}");
    });
  }

  void _onAreaCodePick(
      AreaCodeSelected event, Emitter<AreaCodeState> emit) async {
    emit(state.copywith(
      curAreaCode: event.selectedAreaCode,
    ));
  }

  void _onAreaCodeStart(_, Emitter<AreaCodeState> emit) async {
    log('_onAreaCodeStart');
    try {
      final areaList = await liviRepository.getAreaCodeList(contxt);
      log('areaList=$areaList');
      emit(state.copywith(
        status: AreaCodeStatus.loaded,
        areaList: areaList,
      ));
    } catch (e) {
      emit(state.copywith(
        status: AreaCodeStatus.error,
      ));
    }
  }
}
