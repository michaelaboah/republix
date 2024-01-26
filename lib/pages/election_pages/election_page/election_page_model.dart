import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'election_page_widget.dart' show ElectionPageWidget;
import 'package:flutter/material.dart';

class ElectionPageModel extends FlutterFlowModel<ElectionPageWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> activeCandidateRefs = [];
  void addToActiveCandidateRefs(DocumentReference item) =>
      activeCandidateRefs.add(item);
  void removeFromActiveCandidateRefs(DocumentReference item) =>
      activeCandidateRefs.remove(item);
  void removeAtIndexFromActiveCandidateRefs(int index) =>
      activeCandidateRefs.removeAt(index);
  void insertAtIndexInActiveCandidateRefs(int index, DocumentReference item) =>
      activeCandidateRefs.insert(index, item);
  void updateActiveCandidateRefsAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      activeCandidateRefs[index] = updateFn(activeCandidateRefs[index]);

  bool isShowFullList = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PartyDropdownFilter widget.
  String? partyDropdownFilterValue;
  FormFieldController<String>? partyDropdownFilterValueController;
  // Stores action output result for [Custom Action - mapCandidates] action in PartyDropdownFilter widget.
  List<DocumentReference>? filteredCandidateRefs;
  String currentPageLink = '';

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
