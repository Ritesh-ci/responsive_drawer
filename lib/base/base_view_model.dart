import 'package:flutter/widgets.dart';
import 'package:responsive_drawer/auth/auth_service.dart';
import 'package:responsive_drawer/base/injection.dart';

enum ViewState { IDLE, BUSY }

class BaseViewModel extends ChangeNotifier {
  final authService = Injection.injector.get<AuthService>();

  ViewState _viewState = ViewState.BUSY;

  ViewState get viewState => _viewState;

  void setViewState(ViewState viewState) {
    if (viewState == _viewState) return;
    _viewState = viewState;
    notifyListeners();
  }
}
