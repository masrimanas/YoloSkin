import 'dart:io' show File;

import 'package:dartz/dartz.dart' show Either, Left, Right;
import 'package:yolo_skin/features/acne_solution/acne_solution.dart';
import 'package:yolo_skin/features/acne_solution/utils/exception.dart';
import 'package:yolo_skin/features/acne_solution/utils/failure.dart';

abstract class AcneRepository {
  Future<Either<Failure, Map<String, dynamic>>> detectAcne(File image);
  Future<Either<Failure, File?>> getImageFromCamera();
  Future<Either<Failure, File?>> getImageFromGallery();
}

class AcneRepositoryImpl implements AcneRepository {
  AcneRepositoryImpl(this.local);

  final LocalDataSource local;

  @override
  Future<Either<Failure, Map<String, dynamic>>> detectAcne(File image) async {
    try {
      final result = await local.detectAcne(image);
      return Right({'result': result});
    } on Exception catch (e) {
      return Left(DetectionFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, File?>> getImageFromCamera() async {
    try {
      final result = await local.getImageFromCamera();
      return Right(result);
    } on ImageException catch (e) {
      return Left(ImageFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, File?>> getImageFromGallery() async {
    try {
      final result = await local.getImageFromGallery();
      return Right(result);
    } on ImageException catch (e) {
      return Left(ImageFailure(e.message));
    }
  }
}
