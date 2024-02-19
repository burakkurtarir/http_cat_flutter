import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http_cat_flutter/shared/repositories/cat_repository.dart';

part 'cat_select_state.dart';

class CatSelectCubit extends Cubit<CatSelectState> {
  CatSelectCubit(this._catRepository) : super(const CatSelectState());

  final CatRepository _catRepository;

  Future<void> fetchCat(int statusCode) async {
    try {
      final imageBytes = await _catRepository.fetch(statusCode);
      emit(state.copyWith(imageBytes: imageBytes));
    } catch (_) {
      emit(state.copyWith(imageBytes: null));
    }
  }
}
