import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  @override
  NavigationState get initialState => NavigationInitial();
  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is NavigationOne) {
      // Outputting a state from the asynchronous generator
      yield SecondSate();
    } else if (event is NavigationTwo) {
      // Outputting a state from the asynchronous generator
      yield ThirdSate();
    } else if (event is NavigationThree) {
      // Outputting a state from the asynchronous generator
      yield ThirdSate();
    } else if (event is NavigationFour) {
      // Outputting a state from the asynchronous generator
      yield ForthSate();
    }
  }
}
