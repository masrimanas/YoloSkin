import 'package:flutter/cupertino.dart';
import 'package:yolo_skin/app/app.dart';
import 'package:yolo_skin/injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // bootstrap(() => const App());
  di.init();
  runApp(const App());
}
