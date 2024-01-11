import '/components/modal_sections/officer_details_main/officer_details_main_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'modal_user_widget.dart' show ModalUserWidget;
import 'package:flutter/material.dart';

class ModalUserModel extends FlutterFlowModel<ModalUserWidget> {
  ///  Local state fields for this component.

  bool? showBack = false;

  ///  State fields for stateful widgets in this component.

  // Model for officer_Details_main component.
  late OfficerDetailsMainModel officerDetailsMainModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    officerDetailsMainModel =
        createModel(context, () => OfficerDetailsMainModel());
  }

  @override
  void dispose() {
    officerDetailsMainModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
