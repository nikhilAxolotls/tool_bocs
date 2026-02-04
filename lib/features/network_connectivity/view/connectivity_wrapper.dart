import 'package:flutter/material.dart';
import 'package:tool_bocs/routes/app_routes.dart';
import 'package:tool_bocs/routes/navigator_key.dart';
import 'package:tool_bocs/util/connectivity_service.dart';

class ConnectivityWrapper extends StatefulWidget {
  final Widget child;

  const ConnectivityWrapper({super.key, required this.child});

  @override
  State<ConnectivityWrapper> createState() => _ConnectivityWrapperState();
}

class _ConnectivityWrapperState extends State<ConnectivityWrapper> {
  final ConnectivityService _connectivityService = ConnectivityService();
  bool _isShowingNoInternet = false;

  @override
  void initState() {
    super.initState();
    _connectivityService.isConnected.addListener(_onConnectivityChanged);
  }

  void _onConnectivityChanged() {
    final isConnected = _connectivityService.isConnected.value;

    if (!isConnected && !_isShowingNoInternet) {
      _isShowingNoInternet = true;
      navigatorKey.currentState?.pushNamed(AppRoutes.noInternet);
    } else if (isConnected && _isShowingNoInternet) {
      _isShowingNoInternet = false;
      // Use maybePop to ensure we don't pop if the user manually dismissed it or if something else happened
      navigatorKey.currentState?.maybePop();
    }
  }

  @override
  void dispose() {
    _connectivityService.isConnected.removeListener(_onConnectivityChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
