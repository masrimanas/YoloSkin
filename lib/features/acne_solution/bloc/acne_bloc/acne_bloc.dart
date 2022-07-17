import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'acne_event.dart';
part 'acne_state.dart';

class AcneBloc extends Bloc<AcneEvent, AcneState> {
  AcneBloc() : super(AcneInitial()) {
    on<AcneEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
