import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'custom_switch_tile_widget.dart' show CustomSwitchTileWidget;
import 'package:flutter/material.dart';

class CustomSwitchTileModel extends FlutterFlowModel<CustomSwitchTileWidget> {
  ///  Local state fields for this component.

  DocumentReference? issuePosRef;

  bool? issuePosState;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in CustomSwitchTile widget.
  IssuePositionsRecord? oldIssue;
  // Stores action output result for [Backend Call - Create Document] action in CustomSwitchTile widget.
  IssuePositionsRecord? newIssue;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
