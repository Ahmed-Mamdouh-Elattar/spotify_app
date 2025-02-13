import 'package:spotify_app/features/home/data/models/record_model/record_model.dart';

void determineFavoriteRecords(
    {required List<RecordModel> records,
    required List<dynamic> favorites}) async {
  for (var element in records) {
    if (favorites.contains(element.id)) {
      element.changeFavouriteValue();
    }
  }
}
