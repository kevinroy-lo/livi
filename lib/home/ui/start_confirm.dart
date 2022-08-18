import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livi/constant/fonts.dart';
import 'package:livi/home/bloc/area/bloc/area_code_bloc.dart';
import 'package:livi/home/bloc/history/bloc/history_bloc.dart';
import 'package:livi/home/bloc/login/bloc/login_bloc.dart';

class PhoneConfirmButton extends StatelessWidget {
  final TextEditingController controller;
  final BuildContext context;
  const PhoneConfirmButton(
      {Key? key, required this.context, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AreaCodeBloc, AreaCodeState>(
      builder: (context, areaState) {
        return BlocBuilder<HistoryBloc, HistoryState>(
          builder: (context, state) {
            return MaterialButton(
              onPressed: () => {_onConfirm(areaState)},
              color: Colors.blue,
              child: const Text(
                'Confirm',
                style: t14white,
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _onConfirm(AreaCodeState areaCodeState) async {
    if (controller.text.isEmpty) {
      const snackBar = SnackBar(
        content: Text('Phone number can not be empty !!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    if (controller.text.length < 11) {
      const snackBar = SnackBar(
        content: Text('Phone number should have 11 numbers !!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    var phoneNum = controller.text.trim();

    FocusScope.of(context).requestFocus(FocusNode());
    BlocProvider.of<HistoryBloc>(context).add(
      HistoryPhoneCommit(
        areaCode: areaCodeState.curAreaCode ?? '',
        phone: phoneNum,
      ),
    );

    BlocProvider.of<LoginBloc>(context).add(
      LoginUsernameChanged(
        username: phoneNum,
      ),
    );
  }
}
