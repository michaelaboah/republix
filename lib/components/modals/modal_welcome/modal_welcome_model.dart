import '/components/main_logo_small/main_logo_small_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'modal_welcome_widget.dart' show ModalWelcomeWidget;
import 'package:flutter/material.dart';

class ModalWelcomeModel extends FlutterFlowModel<ModalWelcomeWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for main_Logo_Small component.
  late MainLogoSmallModel mainLogoSmallModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    mainLogoSmallModel = createModel(context, () => MainLogoSmallModel());
  }

  @override
  void dispose() {
    mainLogoSmallModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
