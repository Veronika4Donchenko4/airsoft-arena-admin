import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/main_bottom/main_bottom_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'verification_page_widget.dart' show VerificationPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VerificationPageModel extends FlutterFlowModel<VerificationPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for main_bottom component.
  late MainBottomModel mainBottomModel;

  @override
  void initState(BuildContext context) {
    mainBottomModel = createModel(context, () => MainBottomModel());
  }

  @override
  void dispose() {
    mainBottomModel.dispose();
  }
}
