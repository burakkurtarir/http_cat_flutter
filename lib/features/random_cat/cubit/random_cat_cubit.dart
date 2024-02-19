import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http_cat_flutter/shared/constants/statuses.dart';
import 'package:http_cat_flutter/shared/extensions/list_extension.dart';
import 'package:http_cat_flutter/shared/repositories/cat_repository.dart';

part 'random_cat_state.dart';

class RandomCatCubit extends Cubit<RandomCatState> {
  RandomCatCubit(this._catRepository) : super(const RandomCatState());
  final CatRepository _catRepository;

  Future<void> fetchRandomCat() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final imageBytes = await _catRepository.fetch(statuses.randomElement());
      emit(state.copyWith(imageBytes: imageBytes));
    } catch (_) {
      emit(state.copyWith(imageBytes: null));
    }
  }
}
