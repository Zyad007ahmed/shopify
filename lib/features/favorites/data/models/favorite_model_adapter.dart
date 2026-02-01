import 'package:hive/hive.dart';
import 'package:shopify/features/favorites/data/models/favorite_model.dart';

class FavoriteModelAdapter extends TypeAdapter<FavoriteModel> {
  @override
  final typeId = 0;

  @override
  FavoriteModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteModel(
      productId: fields[0] as int,
      title: fields[1] as String,
      price: fields[2] as double,
      images: fields[3] as List<String>,
      categoryName: fields[4] as String?,
      addedAt: DateTime.parse(fields[5] as String),
      description: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteModel obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
