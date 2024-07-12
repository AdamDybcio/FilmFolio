// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmarked_movie_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookmarkedMovieAdapter extends TypeAdapter<BookmarkedMovie> {
  @override
  final int typeId = 0;

  @override
  BookmarkedMovie read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookmarkedMovie(
      id: fields[0] as int,
      title: fields[1] as String,
      posterPath: fields[2] as String,
      overview: fields[3] as String,
      releaseDate: fields[4] as String,
      voteAverage: fields[5] as double,
      backdropPath: fields[6] as String,
      video: fields[7] as bool,
      adult: fields[8] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, BookmarkedMovie obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.posterPath)
      ..writeByte(3)
      ..write(obj.overview)
      ..writeByte(4)
      ..write(obj.releaseDate)
      ..writeByte(5)
      ..write(obj.voteAverage)
      ..writeByte(6)
      ..write(obj.backdropPath)
      ..writeByte(7)
      ..write(obj.video)
      ..writeByte(8)
      ..write(obj.adult);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookmarkedMovieAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
