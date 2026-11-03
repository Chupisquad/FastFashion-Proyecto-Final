import 'garment_style.dart';

enum Occasion {
  classes('Clases', GarmentStyle.casual),
  work('Trabajo', GarmentStyle.formal),
  outing('Salida', GarmentStyle.casual),
  sport('Deporte', GarmentStyle.sporty);

  const Occasion(this.label, this.preferredStyle);

  final String label;
  final GarmentStyle preferredStyle;

  static Occasion fromName(String? value) {
    return Occasion.values.firstWhere(
      (o) => o.name == value,
      orElse: () => Occasion.classes,
    );
  }
}
