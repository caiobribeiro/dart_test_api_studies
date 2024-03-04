import 'dart:math';

double calculateImc({required double height, required double weight}) {
  if (height < 1) {
    throw Exception('height must be higher than 0');
  }
  if (weight < 1) {
    throw Exception('height must be weight than 0');
  }
  return weight / pow(height, 2);
}
