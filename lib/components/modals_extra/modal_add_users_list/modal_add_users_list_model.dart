import '/flutter_flow/flutter_flow_util.dart';
import 'modal_add_users_list_widget.dart' show ModalAddUsersListWidget;
import 'package:flutter/material.dart';

class ModalAddUsersListModel extends FlutterFlowModel<ModalAddUsersListWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameController;
  String? Function(BuildContext, String?)? yourNameControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
