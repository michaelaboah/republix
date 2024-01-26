import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'post_comment_widget.dart' show PostCommentWidget;
import 'package:flutter/material.dart';

class PostCommentModel extends FlutterFlowModel<PostCommentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for EditMessageField widget.
  FocusNode? editMessageFieldFocusNode;
  TextEditingController? editMessageFieldController;
  String? Function(BuildContext, String?)? editMessageFieldControllerValidator;
  // State field(s) for PostMessageField widget.
  FocusNode? postMessageFieldFocusNode;
  TextEditingController? postMessageFieldController;
  String? Function(BuildContext, String?)? postMessageFieldControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in PostMessageField widget.
  CommentsRecord? commentObj;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textFieldController;
  String? Function(BuildContext, String?)? textFieldControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in TextField widget.
  CommentsRecord? replyObj;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    editMessageFieldFocusNode?.dispose();
    editMessageFieldController?.dispose();

    postMessageFieldFocusNode?.dispose();
    postMessageFieldController?.dispose();

    textFieldFocusNode?.dispose();
    textFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
