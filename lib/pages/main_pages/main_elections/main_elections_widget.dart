import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/bottom_sheets/jurisdiction_update/jurisdiction_update_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'main_elections_model.dart';
export 'main_elections_model.dart';

class MainElectionsWidget extends StatefulWidget {
  const MainElectionsWidget({super.key});

  @override
  State<MainElectionsWidget> createState() => _MainElectionsWidgetState();
}

class _MainElectionsWidgetState extends State<MainElectionsWidget>
    with TickerProviderStateMixin {
  late MainElectionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 20.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainElectionsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Main_Elections'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MAIN_ELECTIONS_Main_Elections_ON_INIT_ST');
      logFirebaseEvent('Main_Elections_backend_call');
      _model.civicResponse = await GoogleCivicAPICall.call(
        address: '9661 Bothwell ln, Frederick, MD 21704',
      );
      if ((_model.civicResponse?.succeeded ?? true)) {
        logFirebaseEvent('Main_Elections_custom_action');
        unawaited(
          () async {
            await actions.setUserJurisdiction(
              getJsonField(
                (_model.civicResponse?.jsonBody ?? ''),
                r'''$.divisions''',
              ),
            );
          }(),
        );
      }
    });

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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

    return StreamBuilder<List<StatesRecord>>(
      stream: queryStatesRecord(
        queryBuilder: (statesRecord) => statesRecord.where(
          'state_name',
          isEqualTo: valueOrDefault<String>(
            FFAppState().userJurisdiction.state,
            'Maryland',
          ),
        ),
        singleRecord: true,
      ),
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
        List<StatesRecord> mainElectionsStatesRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final mainElectionsStatesRecord =
            mainElectionsStatesRecordList.isNotEmpty
                ? mainElectionsStatesRecordList.first
                : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                      ))
                        wrapWithModel(
                          model: _model.webNavModel,
                          updateCallback: () => setState(() {}),
                          child: const WebNavWidget(
                            selectedNav: 3,
                          ),
                        ),
                      Expanded(
                        child: Container(
                          width: 300.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 45.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 1.0, 0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'qy4e304l' /* Coming Elections */,
                                          ),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .displaySmall
                                              .override(
                                                fontFamily: 'Outfit',
                                                fontSize: 28.0,
                                              ),
                                        ).animateOnPageLoad(animationsMap[
                                            'textOnPageLoadAnimation']!),
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                          tablet: false,
                                          tabletLandscape: false,
                                          desktop: false,
                                        ))
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30.0,
                                            borderWidth: 1.0,
                                            buttonSize: 60.0,
                                            icon: FaIcon(
                                              FontAwesomeIcons.mapMarkerAlt,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 30.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'MAIN_ELECTIONS_mapMarkerAlt_ICN_ON_TAP');
                                              logFirebaseEvent(
                                                  'IconButton_bottom_sheet');
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                barrierColor: const Color(0x1A000000),
                                                context: context,
                                                builder: (context) {
                                                  return WebViewAware(
                                                    child: GestureDetector(
                                                      onTap: () => _model
                                                              .unfocusNode
                                                              .canRequestFocus
                                                          ? FocusScope.of(
                                                                  context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(
                                                                  context)
                                                              .unfocus(),
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child: const SizedBox(
                                                          height:
                                                              double.infinity,
                                                          child:
                                                              JurisdictionUpdateWidget(),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            },
                                          ),
                                        FlutterFlowIconButton(
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent1,
                                          borderRadius: 20.0,
                                          borderWidth: 2.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            Icons.filter_alt_off,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'MAIN_ELECTIONS_filter_alt_off_ICN_ON_TAP');
                                            logFirebaseEvent(
                                                'IconButton_reset_form_fields');
                                            setState(() {
                                              _model.dropDownValueController1
                                                  ?.reset();
                                              _model.dropDownValueController2
                                                  ?.reset();
                                              _model.dropDownValueController3
                                                  ?.reset();
                                              _model.dropDownValueController4
                                                  ?.reset();
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 77.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Form(
                                  key: _model.formKey,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownValueController1 ??=
                                                FormFieldController<String>(
                                              _model.dropDownValue1 ??=
                                                  valueOrDefault<String>(
                                                FFAppState()
                                                    .userJurisdiction
                                                    .state,
                                                'Maryland',
                                              ),
                                            ),
                                            options:
                                                List<String>.from(['Maryland']),
                                            optionLabels: [
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'aw1zj3mr' /* MD */,
                                              )
                                            ],
                                            onChanged: (val) async {
                                              setState(() =>
                                                  _model.dropDownValue1 = val);
                                              logFirebaseEvent(
                                                  'MAIN_ELECTIONS_DropDown_e1fyebgz_ON_FORM');
                                              logFirebaseEvent(
                                                  'DropDown_update_app_state');
                                              setState(() {
                                                FFAppState()
                                                    .updateUserJurisdictionStruct(
                                                  (e) => e
                                                    ..county =
                                                        _model.dropDownValue1,
                                                );
                                              });
                                            },
                                            width: 80.0,
                                            height: 50.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium,
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              '1kv6xwzo' /* State */,
                                            ),
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderWidth: 2.0,
                                            borderRadius: 8.0,
                                            margin:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 16.0, 4.0),
                                            hidesUnderline: true,
                                            isOverButton: true,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          ),
                                          FlutterFlowDropDown<int>(
                                            controller: _model
                                                    .dropDownValueController2 ??=
                                                FormFieldController<int>(
                                              _model.dropDownValue2 ??= -1,
                                            ),
                                            options: List<int>.from(
                                                [1, 2, 3, 4, 5, 6, 7, 8, -1]),
                                            optionLabels: [
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '91fxazgy' /* 1st */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'xduyzpq4' /* 2nd */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '2xlz5tzf' /* 3rd */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'c9assyd5' /* 4th */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'gsl2fpb3' /* 5th */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'mv28we7m' /* 6th */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'pold12y4' /* 7th */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ict1cvj8' /* 8th */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '5xrbln8n' /* All */,
                                              )
                                            ],
                                            onChanged: (val) async {
                                              setState(() =>
                                                  _model.dropDownValue2 = val);
                                              logFirebaseEvent(
                                                  'MAIN_ELECTIONS_DropDown_7u80gjs7_ON_FORM');
                                              logFirebaseEvent(
                                                  'DropDown_update_app_state');
                                              setState(() {
                                                FFAppState().userJurisdiction =
                                                    JurisdictionStruct(
                                                  city: 'All',
                                                  county: 'All',
                                                  federalDistrict:
                                                      _model.dropDownValue2,
                                                );
                                              });
                                            },
                                            width: 84.0,
                                            height: 50.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium,
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              '2ia9vbft' /* District */,
                                            ),
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderWidth: 2.0,
                                            borderRadius: 8.0,
                                            margin:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 16.0, 4.0),
                                            hidesUnderline: true,
                                            isOverButton: false,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          ),
                                          FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownValueController3 ??=
                                                FormFieldController<String>(
                                              _model.dropDownValue3 ??=
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'pk8fyb1r' /* All */,
                                              ),
                                            ),
                                            options: mainElectionsStatesRecord!
                                                .counties,
                                            onChanged: (val) async {
                                              setState(() =>
                                                  _model.dropDownValue3 = val);
                                              logFirebaseEvent(
                                                  'MAIN_ELECTIONS_DropDown_16m08t3y_ON_FORM');
                                              logFirebaseEvent(
                                                  'DropDown_update_app_state');
                                              setState(() {
                                                FFAppState().userJurisdiction =
                                                    JurisdictionStruct(
                                                  city: 'All',
                                                  county: _model.dropDownValue3,
                                                  federalDistrict: -1,
                                                );
                                              });
                                            },
                                            width: 132.0,
                                            height: 50.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium,
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              '3wvttao5' /* County */,
                                            ),
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderWidth: 2.0,
                                            borderRadius: 8.0,
                                            margin:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 16.0, 4.0),
                                            hidesUnderline: true,
                                            isOverButton: true,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          ),
                                          FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownValueController4 ??=
                                                FormFieldController<String>(
                                              _model.dropDownValue4 ??=
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'rxb5lyum' /* All */,
                                              ),
                                            ),
                                            options: [
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '123g7ku6' /* Baltimore */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '4i4ky507' /* All */,
                                              )
                                            ],
                                            onChanged: (val) async {
                                              setState(() =>
                                                  _model.dropDownValue4 = val);
                                              logFirebaseEvent(
                                                  'MAIN_ELECTIONS_DropDown_3abzd4k6_ON_FORM');
                                              logFirebaseEvent(
                                                  'DropDown_update_app_state');
                                              setState(() {
                                                FFAppState().userJurisdiction =
                                                    JurisdictionStruct(
                                                  city: _model.dropDownValue4,
                                                  county: 'All',
                                                  federalDistrict: -1,
                                                );
                                              });
                                            },
                                            width: 146.0,
                                            height: 50.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium,
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              '2xmp69rt' /* City */,
                                            ),
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderWidth: 2.0,
                                            borderRadius: 8.0,
                                            margin:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 16.0, 4.0),
                                            hidesUnderline: true,
                                            isOverButton: false,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          ),
                                        ].divide(const SizedBox(width: 8.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: MediaQuery.sizeOf(context).height * 0.7,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: StreamBuilder<List<ElectionsRecord>>(
                                    stream: queryElectionsRecord(
                                      queryBuilder: (electionsRecord) =>
                                          electionsRecord
                                              .where(
                                                'jurisidiction.city',
                                                isEqualTo:
                                                    _model.dropDownValue4 !=
                                                            'All'
                                                        ? FFAppState()
                                                            .userJurisdiction
                                                            .city
                                                        : null,
                                              )
                                              .where(
                                                'jurisidiction.county',
                                                isEqualTo:
                                                    _model.dropDownValue3 !=
                                                            'All'
                                                        ? _model.dropDownValue3
                                                        : null,
                                              )
                                              .where(
                                                'jurisidiction.federal_district',
                                                isEqualTo:
                                                    _model.dropDownValue2 != -1
                                                        ? _model.dropDownValue2
                                                        : null,
                                              ),
                                    ),
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
                                      List<ElectionsRecord>
                                          listViewElectionsRecordList =
                                          snapshot.data!;
                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewElectionsRecordList.length,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(height: 8.0),
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewElectionsRecord =
                                              listViewElectionsRecordList[
                                                  listViewIndex];
                                          return StreamBuilder<ElectionsRecord>(
                                            stream: ElectionsRecord.getDocument(
                                                listViewElectionsRecord
                                                    .reference),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              final containerElectionsRecord =
                                                  snapshot.data!;
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'MAIN_ELECTIONS_Container_kn5ipguq_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Container_navigate_to');

                                                  context.pushNamed(
                                                    'electionPage',
                                                    queryParameters: {
                                                      'officeRace':
                                                          serializeParam(
                                                        containerElectionsRecord
                                                            .electionName,
                                                        ParamType.String,
                                                      ),
                                                      'electrionRef':
                                                          serializeParam(
                                                        containerElectionsRecord
                                                            .reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          containerElectionsRecord
                                                              .electionName,
                                                          maxLines: 2,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 60.0,
                                                              height: 60.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: const Color(
                                                                    0x98FFFFFF),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                                  'assets/images/Seal_of_the_United_States_Congress.svg',
                                                                  width: 54.0,
                                                                  height: 54.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.058,
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                  child: StreamBuilder<
                                                                      List<
                                                                          CandidatesRecord>>(
                                                                    stream:
                                                                        queryCandidatesRecord(
                                                                      queryBuilder: (candidatesRecord) => candidatesRecord
                                                                          .where(
                                                                            'election_ref',
                                                                            isEqualTo:
                                                                                containerElectionsRecord.reference,
                                                                          )
                                                                          .where(
                                                                            'photo_url',
                                                                            isNotEqualTo:
                                                                                null,
                                                                          ),
                                                                    ),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<CandidatesRecord>
                                                                          listViewCandidatesRecordList =
                                                                          snapshot
                                                                              .data!;
                                                                      return ListView
                                                                          .builder(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        shrinkWrap:
                                                                            true,
                                                                        scrollDirection:
                                                                            Axis.horizontal,
                                                                        itemCount:
                                                                            listViewCandidatesRecordList.length,
                                                                        itemBuilder:
                                                                            (context,
                                                                                listViewIndex) {
                                                                          final listViewCandidatesRecord =
                                                                              listViewCandidatesRecordList[listViewIndex];
                                                                          return Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.13,
                                                                            height:
                                                                                MediaQuery.sizeOf(context).width * 0.13,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              image: DecorationImage(
                                                                                fit: BoxFit.fill,
                                                                                image: CachedNetworkImageProvider(
                                                                                  listViewCandidatesRecord.photoUrl,
                                                                                ),
                                                                              ),
                                                                              shape: BoxShape.circle,
                                                                              border: Border.all(
                                                                                color: () {
                                                                                  if (listViewCandidatesRecord.partyAffilication == 'Republican Party') {
                                                                                    return const Color(0xFFFF0000);
                                                                                  } else if (listViewCandidatesRecord.partyAffilication == 'Democratic Party') {
                                                                                    return const Color(0xFF2208FF);
                                                                                  } else {
                                                                                    return const Color(0x00000000);
                                                                                  }
                                                                                }(),
                                                                                width: 2.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
