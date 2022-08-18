import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livi/constant/fonts.dart';
import 'package:livi/home/bloc/area/bloc/area_code_bloc.dart';

class PhoneAreaPicker extends StatelessWidget {
  const PhoneAreaPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {_onShowCities(context)},
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Container(
          width: 100,
          height: 45,
          color: Colors.blueGrey,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 6,
              ),
              Image.asset(
                "images/hongkong.jpg",
                width: 40,
                height: 20,
              ),
              const SizedBox(
                width: 6,
              ),
              BlocBuilder<AreaCodeBloc, AreaCodeState>(
                builder: (context, state) {
                  return Text(
                    '+${state.curAreaCode}',
                    style: t14darkGrey,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onShowCities(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BlocBuilder<AreaCodeBloc, AreaCodeState>(
          builder: (context, state) {
            return ListView.builder(
                itemCount: state.areaList?.length,
                itemBuilder: (context, i) => GestureDetector(
                    onTap: () => {
                          BlocProvider.of<AreaCodeBloc>(context).add(
                              AreaCodeSelected(
                                  selectedAreaCode:
                                      state.areaList?.values.elementAt(i))),
                          Navigator.pop(context),
                        },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.black87, fontSize: 18),
                        '${state.areaList?.keys.elementAt(i)}:${state.areaList?.values.elementAt(i)}',
                      ),
                    )));
          },
        );
      },
    );
  }
}
