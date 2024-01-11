import '/components/custom_switch_tile_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'candidate_filter_widget.dart' show CandidateFilterWidget;
import 'package:flutter/material.dart';

class CandidateFilterModel extends FlutterFlowModel<CandidateFilterWidget> {
  ///  Local state fields for this component.

  bool policiesVisible = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for PartyDropdownFilter widget.
  String? partyDropdownFilterValue;
  FormFieldController<String>? partyDropdownFilterValueController;
  // Models for CustomSwitchTile dynamic component.
  late FlutterFlowDynamicModels<CustomSwitchTileModel> customSwitchTileModels;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    customSwitchTileModels =
        FlutterFlowDynamicModels(() => CustomSwitchTileModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    customSwitchTileModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
