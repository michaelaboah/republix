import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'donation_bottom_sheet_widget.dart' show DonationBottomSheetWidget;
import 'package:flutter/material.dart';

class DonationBottomSheetModel
    extends FlutterFlowModel<DonationBottomSheetWidget> {
  ///  Local state fields for this component.

  int donationAmount = 5;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - stripifyInteger] action in Button widget.
  int? stripeAmount;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  DonationRecordsRecord? candidateDonationRecord;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DonationRecordsRecord? newDonationRecord;
  // Stores action output result for [Custom Action - sumDonations] action in Button widget.
  int? exceededLimit;
  // Stores action output result for [Custom Action - sumDonations] action in Button widget.
  int? donationSum;
  // Stores action output result for [Backend Call - API (Stripe Direct Charge)] action in Button widget.
  ApiCallResponse? paymentIntent;
  // Stores action output result for [Custom Action - mobileDonationPayment] action in Button widget.
  bool? sucess;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
