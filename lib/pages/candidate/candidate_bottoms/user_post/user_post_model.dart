import '/flutter_flow/flutter_flow_util.dart';
import 'user_post_widget.dart' show UserPostWidget;
import 'package:flutter/material.dart';

class UserPostModel extends FlutterFlowModel<UserPostWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for editTitle widget.
  FocusNode? editTitleFocusNode;
  TextEditingController? editTitleController;
  String? Function(BuildContext, String?)? editTitleControllerValidator;
  // State field(s) for editDesc widget.
  FocusNode? editDescFocusNode;
  TextEditingController? editDescController;
  String? Function(BuildContext, String?)? editDescControllerValidator;
  // State field(s) for newTitle widget.
  FocusNode? newTitleFocusNode;
  TextEditingController? newTitleController;
  String? Function(BuildContext, String?)? newTitleControllerValidator;
  // State field(s) for newDescription widget.
  FocusNode? newDescriptionFocusNode;
  TextEditingController? newDescriptionController;
  String? Function(BuildContext, String?)? newDescriptionControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    editTitleFocusNode?.dispose();
    editTitleController?.dispose();

    editDescFocusNode?.dispose();
    editDescController?.dispose();

    newTitleFocusNode?.dispose();
    newTitleController?.dispose();

    newDescriptionFocusNode?.dispose();
    newDescriptionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
