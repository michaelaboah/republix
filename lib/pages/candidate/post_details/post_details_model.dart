import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'post_details_widget.dart' show PostDetailsWidget;
import 'package:flutter/material.dart';

class PostDetailsModel extends FlutterFlowModel<PostDetailsWidget> {
  ///  Local state fields for this page.

  bool expanded = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  String currentPageLink = '';
  // State field(s) for PostMessageField widget.
  FocusNode? postMessageFieldFocusNode;
  TextEditingController? postMessageFieldController;
  String? Function(BuildContext, String?)? postMessageFieldControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in PostMessageField widget.
  CommentsRecord? commentObj;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    postMessageFieldFocusNode?.dispose();
    postMessageFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
