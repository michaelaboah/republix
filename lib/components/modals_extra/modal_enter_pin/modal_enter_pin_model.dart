import '/flutter_flow/flutter_flow_util.dart';
import 'modal_enter_pin_widget.dart' show ModalEnterPinWidget;
import 'package:flutter/material.dart';

class ModalEnterPinModel extends FlutterFlowModel<ModalEnterPinWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
