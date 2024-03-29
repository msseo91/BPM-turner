
import 'package:bpm_turner/global.dart';
import 'package:bpm_turner/ui/viewmodel/select_sheet_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SelectSheetRoute extends HookWidget {
  static const String route = "/select_sheet";
  final SelectSheetViewModel viewModel = getIt.get<SelectSheetViewModel>();

  SelectSheetRoute({
    Key? key
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {

          },
          separatorBuilder: (BuildContext context, int index) =>
          const Divider(height: 10, color: Colors.black),
          itemCount: 5
      ),
    );
  }

}