import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livi/home/bloc/history/bloc/history_bloc.dart';

class PhoneHistoryButton extends StatelessWidget {
  final BuildContext context;
  const PhoneHistoryButton({Key? key, required this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _onShowHistories,
      tooltip: 'Increment',
      backgroundColor: Colors.blue,
      child: const Icon(Icons.history),
    );
  }

  Future<void> _onShowHistories() async {
    FocusScope.of(context).requestFocus(FocusNode());
    try {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return BlocBuilder<HistoryBloc, HistoryState>(
            builder: (context, state) {
              if (state is HistoryPickListState && state.items.isNotEmpty) {
                var list = state.items;
                return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, i) => GestureDetector(
                        onTap: () => {
                              BlocProvider.of<HistoryBloc>(context).add(
                                  HistoryPhonePick(
                                      areaCode: list[i].areaCode,
                                      phone: list[i].phone)),
                            },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.black87, fontSize: 18),
                            "${list[i].areaCode} : ${list[i].phone}",
                          ),
                        )));
              } else {
                return const Center(
                  child: Text("No history"),
                );
              }
            },
          );
        },
      );
    } catch (e) {}
    BlocProvider.of<HistoryBloc>(context).add(HistoryPhoneList());
  }
}
