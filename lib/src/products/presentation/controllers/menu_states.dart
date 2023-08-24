// ignore_for_file: public_member_api_docs, sort_constructors_first

abstract class MenuStates {}

class InitialMenuStates extends MenuStates {}

class LoadingMenuStates extends MenuStates {}

class LoadedMenuStates extends MenuStates {}

class GotMenuStates extends MenuStates {}

class ConfirmedMenuState extends MenuStates {}

class ErrorMenuStates extends MenuStates {
  final String message;

  ErrorMenuStates(this.message);
}
