import '/flutter_flow/flutter_flow_util.dart';
import 'candidate_details_widget.dart' show CandidateDetailsWidget;
import 'package:flutter/material.dart';

class CandidateDetailsModel extends FlutterFlowModel<CandidateDetailsWidget> {
  ///  Local state fields for this page.

  bool isFollowing = false;

  ///  State fields for stateful widgets in this page.

  String currentPageLink = '';
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
