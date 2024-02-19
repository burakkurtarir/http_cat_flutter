part of 'cat_select_cubit.dart';

final class CatSelectState extends Equatable {
  const CatSelectState({this.imageBytes});

  final Uint8List? imageBytes;

  @override
  List<Object?> get props => [imageBytes];

  CatSelectState copyWith({
    Uint8List? imageBytes,
  }) {
    return CatSelectState(
      imageBytes: imageBytes ?? this.imageBytes,
    );
  }
}
