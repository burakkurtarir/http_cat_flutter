import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_cat_flutter/features/cat_select/cubit/cat_select_cubit.dart';
import 'package:http_cat_flutter/shared/constants/statuses.dart';
import 'package:http_cat_flutter/shared/di.dart';

class CatSelectPage extends StatelessWidget {
  const CatSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<CatSelectCubit>(),
      child: const CatSelectView(),
    );
  }
}

class CatSelectView extends StatelessWidget {
  const CatSelectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cat Select"),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text("Choose a status code"),
                    ],
                  ),
                  SizedBox(width: 24),
                  _StatusesDropdownMenu(),
                ],
              ),
              SizedBox(height: 24),
              _CatImage(),
            ],
          ),
        ),
      ),
    );
  }
}

class _CatImage extends StatelessWidget {
  const _CatImage();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatSelectCubit, CatSelectState>(
      builder: (context, state) {
        final imageBytes = state.imageBytes;
        if (imageBytes != null) {
          return Image.memory(imageBytes);
        }
        return Image.asset('assets/images/cat_404.jpg');
      },
    );
  }
}

class _StatusesDropdownMenu extends StatelessWidget {
  const _StatusesDropdownMenu();

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<int>(
      enableFilter: true,
      requestFocusOnTap: true,
      label: const Text("Status"),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      ),
      menuHeight: 400,
      onSelected: (value) {
        FocusScope.of(context).unfocus();
        if (value != null) {
          context.read<CatSelectCubit>().fetchCat(value);
        }
      },
      dropdownMenuEntries: statuses.map<DropdownMenuEntry<int>>((e) {
        return DropdownMenuEntry<int>(value: e, label: e.toString());
      }).toList(),
    );
  }
}
