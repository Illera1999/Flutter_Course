import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final providerThemeDark = StateProvider((ref) => false);


final providerThemeColor = Provider((ref) => colorList);


final providerSelectedColor = StateProvider((ref) => 0);