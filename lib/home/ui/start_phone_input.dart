import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livi/constant/fonts.dart';
import 'package:livi/home/bloc/history/bloc/history_bloc.dart';

// ignore: must_be_immutable
class PhoneInput extends StatelessWidget {
  final TextEditingController controller;
  PhoneInput({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<HistoryBloc, HistoryState>(
      listener: (context, state) {
        if (state is HistoryPhonePickState) {
          Navigator.pop(context);
          controller.text = state.phone;
        }
      },
      child: Expanded(
          child: TextField(
        autofocus: true,
        controller: controller,
        keyboardType: TextInputType.phone,
        style: const TextStyle(color: Colors.white, fontSize: 16),
        decoration:
            const InputDecoration(hintText: "请输入手机号", hintStyle: t14lightGrey),
        textInputAction: TextInputAction.done,
        inputFormatters: <TextInputFormatter>[
          LengthLimitingTextInputFormatter(11)
        ],
        // onChanged: (v) => _splitPhoneNumber(v),
      )),
    );
  }
}
