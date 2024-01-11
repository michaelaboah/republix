import '/backend/backend.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'main_home_widget.dart' show MainHomeWidget;
import 'package:flutter/material.dart';

class MainHomeModel extends FlutterFlowModel<MainHomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Main_Home widget.
  ElectionsRecord? samplePrimary;
  // Stores action output result for [Firestore Query - Query a collection] action in Main_Home widget.
  ElectionsRecord? sampleGeneral;
  // Model for webNav component.
  late WebNavModel webNavModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    webNavModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
