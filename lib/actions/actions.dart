import '/backend/backend.dart';
import '/components/modal_sections/modal_user/modal_user_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

Future openUserDetails(
  BuildContext context, {
  OfficialsRecord? officerItem,
}) async {
  if (MediaQuery.sizeOf(context).width > 991.0) {
    logFirebaseEvent('openUserDetails_alert_dialog');
    await showDialog(
      barrierColor: FlutterFlowTheme.of(context).accent4,
      context: context,
      builder: (dialogContext) {
        return Dialog(
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          alignment: const AlignmentDirectional(0.0, 0.0)
              .resolve(Directionality.of(context)),
          child: ModalUserWidget(
            officerItem: officerItem!,
          ),
        );
      },
    );
  }
}
