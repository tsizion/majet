import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'upload_viewmodel.dart';

class UploadView extends StackedView<UploadViewModel> {
  const UploadView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    UploadViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("UploadView")),
      ),
    );
  }

  @override
  UploadViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UploadViewModel();
}
