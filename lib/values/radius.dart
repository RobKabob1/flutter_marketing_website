part of 'values.dart';

class AppRadius {
  static const BorderRadius primaryRadius = BorderRadius.only(
    topLeft: Radius.circular(Sizes.radius30),
    topRight: Radius.circular(Sizes.radius30),
  );

  static const BorderRadius defaultButtonRadius = BorderRadius.only(
    topLeft: Radius.circular(Sizes.radius30),
    bottomLeft: Radius.circular(Sizes.radius30),
  );

  static const BorderRadius northTearDropRadius = BorderRadius.only(
    topLeft: Radius.circular(Sizes.radius80),
    bottomLeft: Radius.circular(Sizes.radius80),
    bottomRight: Radius.circular(Sizes.radius80),
  );
  static const BorderRadius southTearDropRadius = BorderRadius.only(
    topRight: Radius.circular(Sizes.radius80),
    topLeft: Radius.circular(Sizes.radius80),
    bottomRight: Radius.circular(Sizes.radius80),
  );

  static const BorderRadius southSemiCircleRadius = BorderRadius.only(
    bottomRight: Radius.circular(Sizes.radius80),
    bottomLeft: Radius.circular(Sizes.radius80),
  );

  static const BorderRadius northSemiCircleRadius = BorderRadius.only(
    topLeft: Radius.circular(Sizes.radius80),
    topRight: Radius.circular(Sizes.radius80),
  );

  static const BorderRadius westSemiCircleRadius = BorderRadius.only(
    topLeft: Radius.circular(Sizes.radius80),
    bottomLeft: Radius.circular(Sizes.radius80),
  );

  static const BorderRadius eastSemiCircleRadius = BorderRadius.only(
    topRight: Radius.circular(Sizes.radius80),
    bottomRight: Radius.circular(Sizes.radius80),
  );

  static const BorderRadius fullCircleRadius = BorderRadius.all(
    Radius.circular(Sizes.radius80),
  );

  static const BorderRadius noRadius = BorderRadius.all(
    Radius.circular(Sizes.radius0),
  );

  static const BorderRadius aboutRadius = BorderRadius.all(
    Radius.circular(Sizes.radius8),
  );
}
