import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'jurisdiction_update_widget.dart' show JurisdictionUpdateWidget;
import 'package:flutter/material.dart';

class JurisdictionUpdateModel
    extends FlutterFlowModel<JurisdictionUpdateWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode1;
  TextEditingController? emailAddressController1;
  String? Function(BuildContext, String?)? emailAddressController1Validator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode2;
  TextEditingController? emailAddressController2;
  String? Function(BuildContext, String?)? emailAddressController2Validator;
  // State field(s) for districtNum widget.
  FocusNode? districtNumFocusNode;
  TextEditingController? districtNumController;
  String? Function(BuildContext, String?)? districtNumControllerValidator;
  // State field(s) for StateDropDown widget.
  String? stateDropDownValue;
  FormFieldController<String>? stateDropDownValueController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailAddressFocusNode1?.dispose();
    emailAddressController1?.dispose();

    emailAddressFocusNode2?.dispose();
    emailAddressController2?.dispose();

    districtNumFocusNode?.dispose();
    districtNumController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
