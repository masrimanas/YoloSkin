import 'package:get_it/get_it.dart' show GetIt;
import 'package:yolo_skin/features/acne_solution/data/datasource/helpers/detection_helper.dart';
import 'package:yolo_skin/features/acne_solution/data/datasource/helpers/image_helper.dart';
import 'package:yolo_skin/features/acne_solution/data/datasource/local_data_source.dart';
import 'package:yolo_skin/features/acne_solution/data/repository/acne_repository.dart';

final locator = GetIt.instance;

void init() {
  locator
// repository
    ..registerLazySingleton<AcneRepository>(() => AcneRepositoryImpl(locator()))

// datasources
    ..registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(
        locator(),
        locator(),
      ),
    )

// helpers

    ..registerLazySingleton<ImageHelper>(ImageHelper.new)
    ..registerLazySingleton<DetectionHelper>(DetectionHelper.new);
}
