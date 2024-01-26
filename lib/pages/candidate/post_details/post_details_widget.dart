import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/comment_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'post_details_model.dart';
export 'post_details_model.dart';

class PostDetailsWidget extends StatefulWidget {
  const PostDetailsWidget({
    super.key,
    this.postRef,
  });

  final DocumentReference? postRef;

  @override
  State<PostDetailsWidget> createState() => _PostDetailsWidgetState();
}

class _PostDetailsWidgetState extends State<PostDetailsWidget>
    with TickerProviderStateMixin {
  late PostDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
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
          begin: const Offset(-20.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 50.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 50.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 50.ms,
          duration: 600.ms,
          begin: const Offset(-20.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
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
          begin: const Offset(0.0, 90.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostDetailsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'PostDetails'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('POST_DETAILS_PostDetails_ON_INIT_STATE');
      logFirebaseEvent('PostDetails_backend_call');

      await widget.postRef!.update({
        ...mapToFirestore(
          {
            'num_views': FieldValue.increment(1),
          },
        ),
      });
    });

    _model.postMessageFieldController ??= TextEditingController();
    _model.postMessageFieldFocusNode ??= FocusNode();

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

    return StreamBuilder<PostsRecord>(
      stream: PostsRecord.getDocument(widget.postRef!),
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
        final postDetailsPostsRecord = snapshot.data!;
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
                Container(
                  width: double.infinity,
                  height: 49.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 50.0,
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 30.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'POST_DETAILS_arrow_back_rounded_ICN_ON_T');
                                logFirebaseEvent('IconButton_navigate_back');
                                context.pop();
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 12.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor: const Color(0xFF7E71FE),
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                icon: Icon(
                                  Icons.notifications_none,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 20.0,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ),
                            Builder(
                              builder: (context) => FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.ios_share_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 25.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'POST_DETAILS_ios_share_rounded_ICN_ON_TA');
                                  logFirebaseEvent(
                                      'IconButton_generate_current_page_link');
                                  _model.currentPageLink =
                                      await generateCurrentPageLink(
                                    context,
                                    title: postDetailsPostsRecord.postTitle,
                                    imageUrl: postDetailsPostsRecord.postPhoto,
                                    description:
                                        postDetailsPostsRecord.postDescription,
                                    isShortLink: false,
                                  );

                                  logFirebaseEvent('IconButton_share');
                                  await Share.share(
                                    _model.currentPageLink,
                                    sharePositionOrigin:
                                        getWidgetBoundingBox(context),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 0.0),
                          child: Text(
                            postDetailsPostsRecord.postTitle,
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  fontSize: 16.0,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 0.0, 0.0),
                          child: Text(
                            '${formatNumber(
                              postDetailsPostsRecord.numViews,
                              formatType: FormatType.compact,
                            )} Views',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                          ).animateOnPageLoad(
                              animationsMap['textOnPageLoadAnimation1']!),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 16.0, 12.0),
                          child: Text(
                            postDetailsPostsRecord.postDescription,
                            style: FlutterFlowTheme.of(context).labelMedium,
                          ).animateOnPageLoad(
                              animationsMap['textOnPageLoadAnimation2']!),
                        ),
                        const Divider(
                          thickness: 1.0,
                          color: Color(0xFF7E71FE),
                        ),
                        Builder(
                          builder: (context) {
                            final comments =
                                postDetailsPostsRecord.comments.toList();
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: comments.length,
                              itemBuilder: (context, commentsIndex) {
                                final commentsItem = comments[commentsIndex];
                                return SizedBox(
                                  height: 200.0,
                                  child: CommentWidget(
                                    key: Key(
                                        'Keygdy_${commentsIndex}_of_${comments.length}'),
                                    commentRef: commentsItem,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 89.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                    child: TextFormField(
                      controller: _model.postMessageFieldController,
                      focusNode: _model.postMessageFieldFocusNode,
                      onFieldSubmitted: (_) async {
                        logFirebaseEvent(
                            'POST_DETAILS_PostMessageField_ON_TEXTFIE');
                        logFirebaseEvent('PostMessageField_backend_call');

                        var commentsRecordReference =
                            CommentsRecord.createDoc(widget.postRef!);
                        await commentsRecordReference.set({
                          ...createCommentsRecordData(
                            text: _model.postMessageFieldController.text,
                            userRef: currentUserReference,
                            postRef: widget.postRef,
                          ),
                          ...mapToFirestore(
                            {
                              'date': FieldValue.serverTimestamp(),
                            },
                          ),
                        });
                        _model.commentObj = CommentsRecord.getDocumentFromData({
                          ...createCommentsRecordData(
                            text: _model.postMessageFieldController.text,
                            userRef: currentUserReference,
                            postRef: widget.postRef,
                          ),
                          ...mapToFirestore(
                            {
                              'date': DateTime.now(),
                            },
                          ),
                        }, commentsRecordReference);
                        logFirebaseEvent('PostMessageField_backend_call');

                        await widget.postRef!.update({
                          ...mapToFirestore(
                            {
                              'comments': FieldValue.arrayUnion(
                                  [_model.commentObj?.reference]),
                            },
                          ),
                        });
                        logFirebaseEvent(
                            'PostMessageField_trigger_push_notificati');
                        triggerPushNotification(
                          notificationTitle: 'Someone replied to your comment!',
                          notificationText: _model.commentObj!.text,
                          notificationSound: 'default',
                          userRefs: [_model.commentObj!.userRef!],
                          initialPageName: 'PostDetails',
                          parameterData: {
                            'postRef': widget.postRef,
                          },
                        );
                        logFirebaseEvent('PostMessageField_bottom_sheet');
                        Navigator.pop(context);

                        setState(() {});
                      },
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.send,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelStyle:
                            FlutterFlowTheme.of(context).bodyLarge.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontSize: 14.0,
                                ),
                        hintText: FFLocalizations.of(context).getText(
                          'iqrnaof7' /* Leave post here... */,
                        ),
                        hintStyle:
                            FlutterFlowTheme.of(context).labelLarge.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontSize: 14.0,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        contentPadding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 14.0,
                          ),
                      textAlign: TextAlign.start,
                      maxLines: null,
                      minLines: 1,
                      cursorColor: FlutterFlowTheme.of(context).primary,
                      validator: _model.postMessageFieldControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation']!),
              ],
            ),
          ),
        );
      },
    );
  }
}
