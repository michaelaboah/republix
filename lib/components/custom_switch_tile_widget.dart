import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'custom_switch_tile_model.dart';
export 'custom_switch_tile_model.dart';

class CustomSwitchTileWidget extends StatefulWidget {
  const CustomSwitchTileWidget({
    super.key,
    required this.issue,
    required this.issueRef,
  });

  final String? issue;
  final DocumentReference? issueRef;

  @override
  _CustomSwitchTileWidgetState createState() => _CustomSwitchTileWidgetState();
}

class _CustomSwitchTileWidgetState extends State<CustomSwitchTileWidget> {
  late CustomSwitchTileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomSwitchTileModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CUSTOM_SWITCH_TILE_CustomSwitchTile_ON_I');
      logFirebaseEvent('CustomSwitchTile_firestore_query');
      _model.oldIssue = await queryIssuePositionsRecordOnce(
        parent: currentUserReference,
        queryBuilder: (issuePositionsRecord) => issuePositionsRecord.where(
          'issue_ref',
          isEqualTo: widget.issueRef,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.oldIssue?.issueRef != null) {
        logFirebaseEvent('CustomSwitchTile_update_component_state');
        setState(() {
          _model.issuePosRef = _model.oldIssue?.reference;
          _model.issuePosState = _model.oldIssue?.position;
        });
      } else {
        logFirebaseEvent('CustomSwitchTile_backend_call');

        var issuePositionsRecordReference =
            IssuePositionsRecord.createDoc(currentUserReference!);
        await issuePositionsRecordReference.set(createIssuePositionsRecordData(
          issueRef: widget.issueRef,
        ));
        _model.newIssue = IssuePositionsRecord.getDocumentFromData(
            createIssuePositionsRecordData(
              issueRef: widget.issueRef,
            ),
            issuePositionsRecordReference);
        logFirebaseEvent('CustomSwitchTile_update_component_state');
        setState(() {
          _model.issuePosRef = _model.newIssue?.reference;
          _model.issuePosState = _model.newIssue?.position;
        });
      }
    });

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

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
      child: Container(
        width: double.infinity,
        height: 61.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 0.0,
              color: FlutterFlowTheme.of(context).primaryBackground,
              offset: const Offset(0.0, 1.0),
            )
          ],
          borderRadius: BorderRadius.circular(1.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
        ),
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                valueOrDefault<String>(
                  widget.issue,
                  'N/A',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 18.0,
                    ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: _model.issuePosState!
                            ? null
                            : () async {
                                logFirebaseEvent(
                                    'CUSTOM_SWITCH_TILE_COMP_PRO_BTN_ON_TAP');
                                logFirebaseEvent('Button_backend_call');

                                await _model.issuePosRef!
                                    .update(createIssuePositionsRecordData(
                                  position: _model.issuePosState,
                                ));
                              },
                        text: FFLocalizations.of(context).getText(
                          'tchj55ih' /* Pro */,
                        ),
                        options: FFButtonOptions(
                          height: double.infinity,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).tertiary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Colors.white,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).tertiary,
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(0.0),
                          ),
                          disabledColor: FlutterFlowTheme.of(context).accent3,
                          disabledTextColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: !_model.issuePosState!
                            ? null
                            : () async {
                                logFirebaseEvent(
                                    'CUSTOM_SWITCH_TILE_COMP_ANTI_BTN_ON_TAP');
                                logFirebaseEvent('Button_backend_call');

                                await _model.issuePosRef!
                                    .update(createIssuePositionsRecordData(
                                  position: _model.issuePosState,
                                ));
                              },
                        text: FFLocalizations.of(context).getText(
                          'fhdot1jf' /* Anti */,
                        ),
                        options: FFButtonOptions(
                          height: double.infinity,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Colors.white,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(12.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(12.0),
                          ),
                          disabledColor: FlutterFlowTheme.of(context).accent1,
                          disabledTextColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
