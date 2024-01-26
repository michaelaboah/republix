import '/components/main_logo_small/main_logo_small_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'modal_onboarding_widget.dart' show ModalOnboardingWidget;
import 'package:flutter/material.dart';

class ModalOnboardingModel extends FlutterFlowModel<ModalOnboardingWidget> {
  ///  Local state fields for this component.

  int? stage = 0;

  ///  State fields for stateful widgets in this component.

  // Model for main_Logo_Small component.
  late MainLogoSmallModel mainLogoSmallModel;
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
  void initState(BuildContext context) {
    mainLogoSmallModel = createModel(context, () => MainLogoSmallModel());
  }

  @override
  void dispose() {
    mainLogoSmallModel.dispose();
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
