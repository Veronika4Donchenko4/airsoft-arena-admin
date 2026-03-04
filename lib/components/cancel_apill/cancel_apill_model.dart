import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/main_bottom/main_bottom_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'cancel_apill_widget.dart' show CancelApillWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CancelApillModel extends FlutterFlowModel<CancelApillWidget> {
  ///  State fields for stateful widgets in this component.

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
