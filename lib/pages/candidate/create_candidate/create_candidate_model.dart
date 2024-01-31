import '/backend/backend.dart';
import '/components/main_logo_small/main_logo_small_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_candidate_widget.dart' show CreateCandidateWidget;
import 'package:flutter/material.dart';

class CreateCandidateModel extends FlutterFlowModel<CreateCandidateWidget> {
  ///  Local state fields for this page.

  int? currentStage = 0;

  SocialMediaStruct? newSocialMedia;
  void updateNewSocialMediaStruct(Function(SocialMediaStruct) updateFn) =>
      updateFn(newSocialMedia ??= SocialMediaStruct());

  List<PoliciesStruct> newPolicies = [];
  void addToNewPolicies(PoliciesStruct item) => newPolicies.add(item);
  void removeFromNewPolicies(PoliciesStruct item) => newPolicies.remove(item);
  void removeAtIndexFromNewPolicies(int index) => newPolicies.removeAt(index);
  void insertAtIndexInNewPolicies(int index, PoliciesStruct item) =>
      newPolicies.insert(index, item);
  void updateNewPoliciesAtIndex(int index, Function(PoliciesStruct) updateFn) =>
      newPolicies[index] = updateFn(newPolicies[index]);

  List<String> newMedia = [];
  void addToNewMedia(String item) => newMedia.add(item);
  void removeFromNewMedia(String item) => newMedia.remove(item);
  void removeAtIndexFromNewMedia(int index) => newMedia.removeAt(index);
  void insertAtIndexInNewMedia(int index, String item) =>
      newMedia.insert(index, item);
  void updateNewMediaAtIndex(int index, Function(String) updateFn) =>
      newMedia[index] = updateFn(newMedia[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - getAuthorizationCode] action in createCandidate widget.
  String? authCode;
  // Stores action output result for [Custom Action - authorizeToken] action in createCandidate widget.
  String? token;
  // Model for main_Logo_Small component.
  late MainLogoSmallModel mainLogoSmallModel;
  // State field(s) for displayName widget.
  FocusNode? displayNameFocusNode;
  TextEditingController? displayNameController;
  String? Function(BuildContext, String?)? displayNameControllerValidator;
  // State field(s) for committeName widget.
  FocusNode? committeNameFocusNode;
  TextEditingController? committeNameController;
  String? Function(BuildContext, String?)? committeNameControllerValidator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode1;
  TextEditingController? emailAddressController1;
  String? Function(BuildContext, String?)? emailAddressController1Validator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode2;
  TextEditingController? emailAddressController2;
  String? Function(BuildContext, String?)? emailAddressController2Validator;
  // State field(s) for StateDropDown widget.
  String? stateDropDownValue;
  FormFieldController<String>? stateDropDownValueController;
  // State field(s) for ElectionDropDown widget.
  String? electionDropDownValue;
  FormFieldController<String>? electionDropDownValueController;
  // State field(s) for PartyDropdown widget.
  String? partyDropdownValue;
  FormFieldController<String>? partyDropdownValueController;
  // State field(s) for otherParty widget.
  FocusNode? otherPartyFocusNode;
  TextEditingController? otherPartyController;
  String? Function(BuildContext, String?)? otherPartyControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for bioField widget.
  FocusNode? bioFieldFocusNode;
  TextEditingController? bioFieldController;
  String? Function(BuildContext, String?)? bioFieldControllerValidator;
  // State field(s) for mediaInput widget.
  FocusNode? mediaInputFocusNode1;
  TextEditingController? mediaInputController1;
  String? Function(BuildContext, String?)? mediaInputController1Validator;
  // State field(s) for mediaInput widget.
  FocusNode? mediaInputFocusNode2;
  TextEditingController? mediaInputController2;
  String? Function(BuildContext, String?)? mediaInputController2Validator;
  // State field(s) for mediaInput widget.
  FocusNode? mediaInputFocusNode3;
  TextEditingController? mediaInputController3;
  String? Function(BuildContext, String?)? mediaInputController3Validator;
  // State field(s) for mediaInput widget.
  FocusNode? mediaInputFocusNode4;
  TextEditingController? mediaInputController4;
  String? Function(BuildContext, String?)? mediaInputController4Validator;
  // State field(s) for mediaInput widget.
  FocusNode? mediaInputFocusNode5;
  TextEditingController? mediaInputController5;
  String? Function(BuildContext, String?)? mediaInputController5Validator;
  // State field(s) for ytLinkInput widget.
  FocusNode? ytLinkInputFocusNode;
  TextEditingController? ytLinkInputController;
  String? Function(BuildContext, String?)? ytLinkInputControllerValidator;
  // State field(s) for policyLabelInput widget.
  FocusNode? policyLabelInputFocusNode;
  TextEditingController? policyLabelInputController;
  String? Function(BuildContext, String?)? policyLabelInputControllerValidator;
  // State field(s) for policyDetailsInput widget.
  FocusNode? policyDetailsInputFocusNode;
  TextEditingController? policyDetailsInputController;
  String? Function(BuildContext, String?)?
      policyDetailsInputControllerValidator;
  // State field(s) for DonationLink widget.
  FocusNode? donationLinkFocusNode;
  TextEditingController? donationLinkController;
  String? Function(BuildContext, String?)? donationLinkControllerValidator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Firestore Query - Query a collection] action in Button-Login widget.
  ElectionsRecord? electionObject;
  // Stores action output result for [Backend Call - Create Document] action in Button-Login widget.
  CandidatesRecord? newCandidateObject;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    mainLogoSmallModel = createModel(context, () => MainLogoSmallModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    mainLogoSmallModel.dispose();
    displayNameFocusNode?.dispose();
    displayNameController?.dispose();

    committeNameFocusNode?.dispose();
    committeNameController?.dispose();

    emailAddressFocusNode1?.dispose();
    emailAddressController1?.dispose();

    emailAddressFocusNode2?.dispose();
    emailAddressController2?.dispose();

    otherPartyFocusNode?.dispose();
    otherPartyController?.dispose();

    bioFieldFocusNode?.dispose();
    bioFieldController?.dispose();

    mediaInputFocusNode1?.dispose();
    mediaInputController1?.dispose();

    mediaInputFocusNode2?.dispose();
    mediaInputController2?.dispose();

    mediaInputFocusNode3?.dispose();
    mediaInputController3?.dispose();

    mediaInputFocusNode4?.dispose();
    mediaInputController4?.dispose();

    mediaInputFocusNode5?.dispose();
    mediaInputController5?.dispose();

    ytLinkInputFocusNode?.dispose();
    ytLinkInputController?.dispose();

    policyLabelInputFocusNode?.dispose();
    policyLabelInputController?.dispose();

    policyDetailsInputFocusNode?.dispose();
    policyDetailsInputController?.dispose();

    donationLinkFocusNode?.dispose();
    donationLinkController?.dispose();

    tabBarController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
