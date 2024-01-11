import '/backend/backend.dart';
import '/bottom_sheets/candidate_filter/candidate_filter_widget.dart';
import '/components/candidate_component/candidate_component_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'election_page_model.dart';
export 'election_page_model.dart';

class ElectionPageWidget extends StatefulWidget {
  const ElectionPageWidget({
    super.key,
    this.officeRace,
    required this.electrionRef,
  });

  final String? officeRace;
  final DocumentReference? electrionRef;

  @override
  _ElectionPageWidgetState createState() => _ElectionPageWidgetState();
}

class _ElectionPageWidgetState extends State<ElectionPageWidget> {
  late ElectionPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ElectionPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'electionPage'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return StreamBuilder<ElectionsRecord>(
      stream: ElectionsRecord.getDocument(widget.electrionRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final electionPageElectionsRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'ELECTION_arrow_back_rounded_ICN_ON_TAP');
                      logFirebaseEvent('IconButton_navigate_back');
                      context.pop();
                    },
                  ),
                  Expanded(
                    child: AutoSizeText(
                      valueOrDefault<String>(
                        widget.officeRace,
                        'N/A',
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                          ),
                      minFontSize: 14.0,
                    ),
                  ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.filter_list,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent('ELECTION_filter_list_ICN_ON_TAP');
                          logFirebaseEvent('IconButton_bottom_sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return GestureDetector(
                                onTap: () => _model.unfocusNode.canRequestFocus
                                    ? FocusScope.of(context)
                                        .requestFocus(_model.unfocusNode)
                                    : FocusScope.of(context).unfocus(),
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: SizedBox(
                                    height:
                                        MediaQuery.sizeOf(context).height * 1.0,
                                    child: CandidateFilterWidget(
                                      electionRef: widget.electrionRef,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                      ),
                    ),
                ],
              ),
              actions: const [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 2.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'lxiuzu22' /* Incumbents: */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 16.0,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(12.0, 2.0, 0.0, 4.0),
                        child: Builder(
                          builder: (context) {
                            final incumbents =
                                electionPageElectionsRecord.incumbents.toList();
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(incumbents.length,
                                  (incumbentsIndex) {
                                final incumbentsItem =
                                    incumbents[incumbentsIndex];
                                return StreamBuilder<OfficialsRecord>(
                                  stream: OfficialsRecord.getDocument(
                                      incumbentsItem),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    final containerOfficialsRecord =
                                        snapshot.data!;
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'ELECTION_Container_dq4cjy1c_ON_TAP');
                                        logFirebaseEvent(
                                            'Container_navigate_to');

                                        context.pushNamed(
                                          'officerDetails',
                                          queryParameters: {
                                            'showBack': serializeParam(
                                              false,
                                              ParamType.bool,
                                            ),
                                            'officerRef': serializeParam(
                                              containerOfficialsRecord
                                                  .reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Container(
                                        width: 146.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .accent1,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      containerOfficialsRecord
                                                          .photoUrl,
                                                      width: 60.0,
                                                      height: 60.0,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'puia6qwp' /* Running? */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            containerOfficialsRecord
                                                                    .reElection
                                                                ? 'Yes'
                                                                : 'No',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                4.0, 0.0),
                                                    child: Text(
                                                      '(${(String var1) {
                                                        return var1[0];
                                                      }(containerOfficialsRecord.partyAffiliation)})',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Plus Jakarta Sans',
                                                            fontSize: 12.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                  Text(
                                                    containerOfficialsRecord
                                                        .displayName
                                                        .maybeHandleOverflow(
                                                            maxChars: 30),
                                                    textAlign: TextAlign.start,
                                                    maxLines: 3,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          fontSize: 12.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ].divide(const SizedBox(height: 4.0)),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 0.0,
                            color: FlutterFlowTheme.of(context).alternate,
                            offset: const Offset(0.0, 1.0),
                          )
                        ],
                        borderRadius: BorderRadius.circular(0.0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 6.0, 16.0, 6.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.balanceScaleLeft,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 20.0,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'r25m9hmo' /* Party / Affiliation */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).labelMedium,
                                ),
                              ),
                            ),
                            Expanded(
                              child: FlutterFlowDropDown<String>(
                                controller: _model
                                        .partyDropdownFilterValueController ??=
                                    FormFieldController<String>(
                                  _model.partyDropdownFilterValue ??=
                                      FFLocalizations.of(context).getText(
                                    'k40o6v2u' /* None */,
                                  ),
                                ),
                                options: [
                                  FFLocalizations.of(context).getText(
                                    'fmq7h1qn' /* Democratic Party */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'fhvddw5q' /* Republican Party */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'injwqpt0' /* Independent */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'gchk6cc2' /* Other */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    '478en5v7' /* Unaffiliated */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'e1eb7t85' /* None */,
                                  )
                                ],
                                onChanged: (val) async {
                                  setState(() =>
                                      _model.partyDropdownFilterValue = val);
                                  logFirebaseEvent(
                                      'ELECTION_PartyDropdownFilter_ON_FORM_WID');
                                  var shouldSetState = false;
                                  if (_model.partyDropdownFilterValue ==
                                      'None') {
                                    logFirebaseEvent(
                                        'PartyDropdownFilter_update_page_state');
                                    setState(() {
                                      _model.isShowFullList = true;
                                    });
                                    if (shouldSetState) setState(() {});
                                    return;
                                  } else {
                                    logFirebaseEvent(
                                        'PartyDropdownFilter_custom_action');
                                    _model.filteredCandidateRefs =
                                        await actions.mapCandidates(
                                      electionPageElectionsRecord.candidates
                                          .toList(),
                                      _model.partyDropdownFilterValue,
                                    );
                                    shouldSetState = true;
                                    logFirebaseEvent(
                                        'PartyDropdownFilter_update_page_state');
                                    setState(() {
                                      _model.isShowFullList = false;
                                    });
                                  }

                                  if (shouldSetState) setState(() {});
                                },
                                width: 227.0,
                                height: 25.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      fontSize: 12.0,
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  'zos71wx5' /* Select Party... */,
                                ),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context).accent4,
                                elevation: 2.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderWidth: 2.0,
                                borderRadius: 4.0,
                                margin: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                hidesUnderline: true,
                                isOverButton: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.7,
                    decoration: const BoxDecoration(),
                    child: Builder(
                      builder: (context) {
                        if (_model.isShowFullList) {
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final candidates = electionPageElectionsRecord
                                    .candidates
                                    .toList();
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: candidates.length,
                                  itemBuilder: (context, candidatesIndex) {
                                    final candidatesItem =
                                        candidates[candidatesIndex];
                                    return StreamBuilder<CandidatesRecord>(
                                      stream: CandidatesRecord.getDocument(
                                          candidatesItem),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        final candidateComponentCandidatesRecord =
                                            snapshot.data!;
                                        return CandidateComponentWidget(
                                          key: Key(
                                              'Keyram_${candidatesIndex}_of_${candidates.length}'),
                                          candidateRef: candidatesItem,
                                          candidateName:
                                              candidateComponentCandidatesRecord
                                                  .displayName,
                                          partyInitial: (String var1) {
                                            return var1[0];
                                          }(candidateComponentCandidatesRecord
                                              .partyAffilication),
                                          photoUrlPath:
                                              candidateComponentCandidatesRecord
                                                  .photoUrl,
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final filteredList =
                                    _model.filteredCandidateRefs!.toList();
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: filteredList.length,
                                  itemBuilder: (context, filteredListIndex) {
                                    final filteredListItem =
                                        filteredList[filteredListIndex];
                                    return StreamBuilder<CandidatesRecord>(
                                      stream: CandidatesRecord.getDocument(
                                          filteredListItem),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        final candidateComponentCandidatesRecord =
                                            snapshot.data!;
                                        return CandidateComponentWidget(
                                          key: Key(
                                              'Keykd6_${filteredListIndex}_of_${filteredList.length}'),
                                          candidateRef: filteredListItem,
                                          candidateName:
                                              candidateComponentCandidatesRecord
                                                  .displayName,
                                          partyInitial: (String var1) {
                                            return var1[0];
                                          }(candidateComponentCandidatesRecord
                                              .partyAffilication),
                                          photoUrlPath:
                                              candidateComponentCandidatesRecord
                                                  .photoUrl,
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
