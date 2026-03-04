import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/main_bottom/main_bottom_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'fill_data_page_widget.dart' show FillDataPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FillDataPageModel extends FlutterFlowModel<FillDataPageWidget> {
  ///  Local state fields for this page.

  String? profileImage;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_adminPhotoUploaded = false;
  FFUploadedFile uploadedLocalFile_adminPhotoUploaded =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for main_bottom component.
  late MainBottomModel mainBottomModel;
  bool isDataUploading_uploadDataAdminPhoto = false;
  FFUploadedFile uploadedLocalFile_uploadDataAdminPhoto =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataAdminPhoto = '';

  @override
  void initState(BuildContext context) {
    mainBottomModel = createModel(context, () => MainBottomModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    mainBottomModel.dispose();
  }
}
