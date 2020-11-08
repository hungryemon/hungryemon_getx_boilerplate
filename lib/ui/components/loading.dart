import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


final _themeKey = GlobalKey(debugLabel: 'overlay_parent');
final _modalBarrierDefaultColor = Colors.black.withOpacity(0.7);

//Updates with the latest [OverlayEntry] child
OverlayEntry _loaderEntry;
bool isDarkTheme = false;

//To keep track if the [Overlay] is shown
bool _loaderShown = false;

Widget _loadingIndicator;

class Loading extends StatelessWidget {
  final Widget child;
  final Widget loader;
  final bool darkTheme;

  const Loading({Key key, this.child, this.darkTheme = false, this.loader})
      :  super(key: key);

  @override
  Widget build(BuildContext context) {
  _loadingIndicator =  loader;
  isDarkTheme = darkTheme;
  return SizedBox(
    key: _themeKey,
    child: child,
  );
  }
}

OverlayState get _overlayState {
  final context = _themeKey.currentContext;
  if(context == null){
    return null;
  }

  NavigatorState navigator;

  void visitor(Element element) {
    if(navigator != null) return;

    if(element.widget is Navigator) {
      navigator = (element as StatefulElement).state;
    }
    else {
      element.visitChildElements(visitor);
    }
  }

  context.visitChildElements(visitor);

  assert(navigator != null, '''unable to show overlay''');
  return navigator.overlay;
}

//To handle a loader for the application
Future<void> showLoadingIndicator({bool isModal = true, Color modalColor}) async {
  try {
    debugPrint('Showing loading overlay');
    final _child = Center(
      child: SizedBox(
        child: _loadingIndicator ?? SpinKitFadingCircle(),
      ),
    );
    await _showOverlay(
      child: isModal ? Stack(
        children: <Widget>[
          ModalBarrier(
            color: modalColor ?? _modalBarrierDefaultColor,
          ),
          _child
        ],
      ): _child
    );
  }
  catch(err) {
    debugPrint('Exception showing loading overlay \n${err.toString()}');
    throw err;
  }
}

Future<void> _showOverlay({@required Widget child}) async {
  try {
    final overlay = _overlayState;

    if(_loaderShown) {
      debugPrint('An overlay is already showing');
      return Future.value(false);
    }

    final overlayEntry = OverlayEntry(
        builder: (context) => child,
    );

    overlay.insert(overlayEntry);
    _loaderEntry = overlayEntry;
    _loaderShown = true;
  }
  catch (err) {
    debugPrint('Exception inserting loading overlay\n${err.toString()}');
    throw err;
  }
}

Future<void> _hideOverlay() async {
  try {
    _loaderEntry.remove();
    _loaderShown = false;
  } catch (err) {
    debugPrint('Exception removing loading overlay\n${err.toString()}');
    throw err;
  }
}

Future<void> hideLoadingIndicator() async {
  try {
    debugPrint('Hiding loading overlay');
    await _hideOverlay();
  } catch (err) {
    debugPrint('Exception hiding loading overlay');
    throw err;
  }
}