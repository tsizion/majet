import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'recipe_detail_viewmodel.dart';

class RecipeDetailView extends StackedView<RecipeDetailViewModel> {
  const RecipeDetailView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    RecipeDetailViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("RecipeDetailView")),
      ),
    );
  }

  @override
  RecipeDetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      RecipeDetailViewModel();
}
