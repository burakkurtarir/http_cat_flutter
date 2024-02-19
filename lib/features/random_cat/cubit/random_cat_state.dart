part of 'random_cat_cubit.dart';

final class RandomCatState extends Equatable {
  const RandomCatState({this.imageBytes});

  final Uint8List? imageBytes;

  @override
  List<Object?> get props => [imageBytes];

  RandomCatState copyWith({
    Uint8List? imageBytes,
  }) {
    return RandomCatState(
      imageBytes: imageBytes ?? this.imageBytes,
    );
  }
}
