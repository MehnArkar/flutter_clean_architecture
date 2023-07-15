import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/error/faliures.drt.dart';
import 'package:flutter_clean_architecture/features/domain/entities/number_trivia.dart';

abstract class NumberTriviaRepository{
  Future<Either<Failure,NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Failure,NumberTrivia>> getRandomNumberTrivia();
}