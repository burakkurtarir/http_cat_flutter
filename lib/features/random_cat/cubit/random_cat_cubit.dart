import 'dart:typed_data';
import 'dart:math' as math;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http_cat_flutter/shared/repositories/cat_repository.dart';
import 'package:http_cat_flutter/shared/repositories/cat_status.dart';

part 'random_cat_state.dart';

class RandomCatCubit extends Cubit<RandomCatState> {
  RandomCatCubit(this._catRepository) : super(const RandomCatState());
  final CatRepository _catRepository;

  final _rand = math.Random();

  Future<void> fetchRandomCat() async {
    try {
      emit(state.copyWith(catStatus: CatStatus.loading));
      await Future.delayed(const Duration(seconds: 2));
      final randomStatusCode = _rand.nextInt(600) + 100;
      final imageBytes = await _catRepository.fetch(randomStatusCode);
      emit(state.copyWith(
          imageBytes: imageBytes, catStatus: CatStatus.completed));
    } catch (e) {
      emit(state.copyWith(catStatus: CatStatus.failure));
    }
  }
}
