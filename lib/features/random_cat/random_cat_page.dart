import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_cat_flutter/features/random_cat/cubit/random_cat_cubit.dart';
import 'package:http_cat_flutter/shared/repositories/cat_status.dart';
import 'package:http_cat_flutter/shared/di.dart';
import 'package:http_cat_flutter/shared/widgets/my_async_button.dart';

class RandomCatPage extends StatelessWidget {
  const RandomCatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<RandomCatCubit>(),
      child: const RandomCatView(),
    );
  }
}

class RandomCatView extends StatelessWidget {
  const RandomCatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Cat"),
      ),
      body: Column(
        children: [
          const _RandomImageBuilder(),
          MyAsyncButton(
            onPressed: context.read<RandomCatCubit>().fetchRandomCat,
            child: const Text("Randomize"),
          ),
        ],
      ),
    );
  }
}

class _RandomImageBuilder extends StatelessWidget {
  const _RandomImageBuilder();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomCatCubit, RandomCatState>(
      builder: (context, state) {
        // if (state.catStatus == CatStatus.loading) {
        //   return const Center(child: CircularProgressIndicator.adaptive());
        // }
        // if (state.catStatus == CatStatus.failure) {
        //   return const Center(child: Text("Couldn't load http cat"));
        // }
        final imageBytes = state.imageBytes;
        if (imageBytes != null) {
          return Image.memory(imageBytes);
        }
        return Image.asset('assets/images/cat_404.jpg');
      },
    );
  }
}
