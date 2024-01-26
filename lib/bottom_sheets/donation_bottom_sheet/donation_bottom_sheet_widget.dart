import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'donation_bottom_sheet_model.dart';
export 'donation_bottom_sheet_model.dart';

class DonationBottomSheetWidget extends StatefulWidget {
  const DonationBottomSheetWidget({
    super.key,
    this.candidateName,
    this.candidateAccountId,
    this.candidateRef,
  });

  final String? candidateName;
  final String? candidateAccountId;
  final DocumentReference? candidateRef;

  @override
  State<DonationBottomSheetWidget> createState() =>
      _DonationBottomSheetWidgetState();
}

class _DonationBottomSheetWidgetState extends State<DonationBottomSheetWidget> {
  late DonationBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DonationBottomSheetModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: const [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(0.0, 2.0),
          )
        ],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              FFLocalizations.of(context).getText(
                'xcchle95' /* Choose Donation Amount */,
              ),
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w500,
                  ),
            ),
            Text(
              FFLocalizations.of(context).getText(
                'z9l1pj92' /* Must be greater than 50 cents */,
              ),
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Outfit',
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                  ),
            ),
            Text(
              '\$ ${_model.donationAmount.toString()}',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Outfit',
                    fontSize: 40.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            GridView(
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 1.0,
              ),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(8.0, 16.0, 8.0, 16.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'DONATION_BOTTOM_SHEET_\$5_BTN_ON_TAP');
                        logFirebaseEvent('Button_update_component_state');
                        setState(() {
                          _model.donationAmount = 5;
                        });
                      },
                      text: FFLocalizations.of(context).getText(
                        'n6716v08' /* $5 */,
                      ),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).tertiary,
                        textStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.w600,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(8.0, 16.0, 8.0, 16.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'DONATION_BOTTOM_SHEET_\$20_BTN_ON_TAP');
                        logFirebaseEvent('Button_update_component_state');
                        setState(() {
                          _model.donationAmount = 20;
                        });
                      },
                      text: FFLocalizations.of(context).getText(
                        '25tsdy3w' /* $20 */,
                      ),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).alternate,
                        textStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.w600,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(8.0, 16.0, 8.0, 16.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'DONATION_BOTTOM_SHEET_\$100_BTN_ON_TAP');
                        logFirebaseEvent('Button_update_component_state');
                        setState(() {
                          _model.donationAmount = 100;
                        });
                      },
                      text: FFLocalizations.of(context).getText(
                        '7qreyd9c' /* $100 */,
                      ),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).alternate,
                        textStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.w600,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(8.0, 16.0, 8.0, 16.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'DONATION_BOTTOM_SHEET_\$500_BTN_ON_TAP');
                        logFirebaseEvent('Button_update_component_state');
                        setState(() {
                          _model.donationAmount = 500;
                        });
                      },
                      text: FFLocalizations.of(context).getText(
                        'qo52lrca' /* $500 */,
                      ),
                      options: FFButtonOptions(
                        height: 0.0,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).alternate,
                        textStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.w600,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                  child: TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.textController',
                      const Duration(milliseconds: 2000),
                      () async {
                        logFirebaseEvent(
                            'DONATION_BOTTOM_SHEET_TextField_io9kqnb2');
                        logFirebaseEvent('TextField_update_component_state');
                        setState(() {
                          _model.donationAmount =
                              int.parse(_model.textController.text);
                        });
                      },
                    ),
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: FFLocalizations.of(context).getText(
                        'xcp2hjgr' /* $ Custom Amount */,
                      ),
                      hintStyle: FlutterFlowTheme.of(context).bodyLarge,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).secondaryText,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).labelMedium,
                    keyboardType: TextInputType.number,
                    validator:
                        _model.textControllerValidator.asValidator(context),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('DONATION_BOTTOM_SHEET_SUBMIT_DONATION_BT');
                  var shouldSetState = false;
                  logFirebaseEvent('Button_custom_action');
                  _model.stripeAmount = await actions.stripifyInteger(
                    _model.donationAmount,
                  );
                  shouldSetState = true;
                  // Fetch Donation Records
                  logFirebaseEvent('Button_FetchDonationRecords');
                  _model.candidateDonationRecord =
                      await queryDonationRecordsRecordOnce(
                    parent: currentUserReference,
                    queryBuilder: (donationRecordsRecord) =>
                        donationRecordsRecord.where(
                      'candidate_ref',
                      isEqualTo: widget.candidateRef,
                    ),
                    singleRecord: true,
                  ).then((s) => s.firstOrNull);
                  shouldSetState = true;
                  if (_model.candidateDonationRecord?.reference.id == null ||
                      _model.candidateDonationRecord?.reference.id == '') {
                    logFirebaseEvent('Button_backend_call');

                    var donationRecordsRecordReference =
                        DonationRecordsRecord.createDoc(currentUserReference!);
                    await donationRecordsRecordReference
                        .set(createDonationRecordsRecordData(
                      candidateRef: widget.candidateRef,
                      donationLimit:
                          FFAppState().userJurisdiction.donationLimit,
                      donationTotal: 0,
                      candidateName: widget.candidateName,
                    ));
                    _model.newDonationRecord =
                        DonationRecordsRecord.getDocumentFromData(
                            createDonationRecordsRecordData(
                              candidateRef: widget.candidateRef,
                              donationLimit:
                                  FFAppState().userJurisdiction.donationLimit,
                              donationTotal: 0,
                              candidateName: widget.candidateName,
                            ),
                            donationRecordsRecordReference);
                    shouldSetState = true;
                    logFirebaseEvent('Button_custom_action');
                    await actions.sumDonations(
                      _model.stripeAmount!,
                      _model.newDonationRecord!.donationTotal,
                    );
                  } else {
                    logFirebaseEvent('Button_custom_action');
                    _model.exceededLimit = await actions.sumDonations(
                      _model.stripeAmount!,
                      _model.candidateDonationRecord!.donationTotal,
                    );
                    shouldSetState = true;
                  }

                  logFirebaseEvent('Button_custom_action');
                  _model.donationSum = await actions.sumDonations(
                    _model.stripeAmount!,
                    _model.candidateDonationRecord!.donationTotal,
                  );
                  shouldSetState = true;
                  if (_model.donationSum! <
                      _model.candidateDonationRecord!.donationLimit) {
                    if (shouldSetState) setState(() {});
                    return;
                  }

                  logFirebaseEvent('Button_backend_call');
                  _model.paymentIntent = await StripeDirectChargeCall.call(
                    amount: _model.stripeAmount,
                    currency: 'USD',
                    connectedAccountId: widget.candidateAccountId,
                    description:
                        'Donating \$${_model.donationAmount.toString()}to Candidate: ${widget.candidateName}',
                  );
                  shouldSetState = true;
                  if (isWeb) {
                    logFirebaseEvent('Button_custom_action');
                    await actions.webDonationPayment(
                      context,
                      (_model.paymentIntent?.jsonBody ?? ''),
                      widget.candidateAccountId!,
                    );
                  } else {
                    logFirebaseEvent('Button_custom_action');
                    _model.sucess = await actions.mobileDonationPayment(
                      context,
                      (_model.paymentIntent?.jsonBody ?? ''),
                      widget.candidateAccountId!,
                    );
                    shouldSetState = true;
                  }

                  if (_model.sucess!) {
                    // Add new record
                    logFirebaseEvent('Button_Addnewrecord');

                    await _model.candidateDonationRecord!.reference
                        .update(createDonationRecordsRecordData(
                      donationTotal: _model.donationSum,
                    ));
                  } else {
                    if (shouldSetState) setState(() {});
                    return;
                  }

                  if (shouldSetState) setState(() {});
                },
                text: FFLocalizations.of(context).getText(
                  'imml1bko' /* Submit Donation */,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Plus Jakarta Sans',
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                  elevation: 0.0,
                ),
              ),
            ),
            Text(
              FFLocalizations.of(context).getText(
                'nrqrc6f1' /* UpRoot takes a 5% processing f... */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 12.0,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
