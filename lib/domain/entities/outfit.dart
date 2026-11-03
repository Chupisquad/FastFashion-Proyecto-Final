import 'garment.dart';
import 'garment_style.dart';
import 'occasion.dart';

class OutfitProposal {
  const OutfitProposal({
    required this.top,
    required this.bottom,
    required this.title,
    required this.occasion,
    required this.style,
    this.shoes,
    this.jacket,
    this.score = 0,
    this.reasons = const [],
  });

  final Garment top;
  final Garment bottom;
  final Garment? shoes;
  final Garment? jacket;
  final String title;
  final Occasion occasion;
  final GarmentStyle style;

  final double score;

  final List<String> reasons;

  List<Garment> get garments => [top, bottom, ?shoes, ?jacket];

  String get signature => garments.map((g) => g.id).join('|');
}

class OutfitRecord {
  const OutfitRecord({
    required this.id,
    required this.userId,
    required this.date,
    required this.topId,
    required this.bottomId,
    required this.title,
    required this.occasion,
    required this.style,
    required this.createdAt,
    this.shoesId,
    this.jacketId,
  });

  final String id;
  final String userId;

  final String date;
  final String topId;
  final String bottomId;
  final String? shoesId;
  final String? jacketId;
  final String title;
  final Occasion occasion;
  final GarmentStyle style;
  final DateTime createdAt;

  List<String> get garmentIds => [topId, bottomId, ?shoesId, ?jacketId];

  Map<String, dynamic> toRow() => {
    'id': id,
    'user_id': userId,
    'outfit_date': date,
    'top_id': topId,
    'bottom_id': bottomId,
    'shoes_id': shoesId,
    'jacket_id': jacketId,
    'title': title,
    'occasion': occasion.name,
    'style': style.name,
    'created_at': createdAt.toUtc().toIso8601String(),
  };

  factory OutfitRecord.fromRow(Map<String, dynamic> row) {
    return OutfitRecord(
      id: row['id'] as String,
      userId: row['user_id'] as String,
      date: row['outfit_date'] as String,
      topId: row['top_id'] as String,
      bottomId: row['bottom_id'] as String,
      shoesId: row['shoes_id'] as String?,
      jacketId: row['jacket_id'] as String?,
      title: row['title'] as String? ?? 'Outfit',
      occasion: Occasion.fromName(row['occasion'] as String?),
      style: GarmentStyle.fromName(row['style'] as String?),
      createdAt:
          DateTime.tryParse(row['created_at'] as String? ?? '')?.toLocal() ??
          DateTime.now(),
    );
  }
}
