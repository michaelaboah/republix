import '/flutter_flow/flutter_flow_util.dart';
import 'edit_profile_photo_widget.dart' show EditProfilePhotoWidget;
import 'package:flutter/material.dart';

class EditProfilePhotoModel extends FlutterFlowModel<EditProfilePhotoWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
