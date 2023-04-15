import 'package:flutter/material.dart';

extension SvgColorFilter on Color{
  ColorFilter get toSvg => ColorFilter.mode(this, BlendMode.srcIn);
}