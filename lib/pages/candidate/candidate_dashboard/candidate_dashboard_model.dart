import '/flutter_flow/flutter_flow_util.dart';
import 'candidate_dashboard_widget.dart' show CandidateDashboardWidget;
import 'package:flutter/material.dart';

class CandidateDashboardModel
    extends FlutterFlowModel<CandidateDashboardWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
