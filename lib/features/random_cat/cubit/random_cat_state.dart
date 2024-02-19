part of 'random_cat_cubit.dart';

final class RandomCatState extends Equatable {
  const RandomCatState({this.imageBytes, this.catStatus = CatStatus.initial});

  final Uint8List? imageBytes;
  final CatStatus catStatus;

  @override
  List<Object?> get props => [imageBytes, catStatus];

  RandomCatState copyWith({
    Uint8List? imageBytes,
    CatStatus? catStatus,
  }) {
    return RandomCatState(
      imageBytes: imageBytes ?? this.imageBytes,
      catStatus: catStatus ?? this.catStatus,
    );
  }
}
