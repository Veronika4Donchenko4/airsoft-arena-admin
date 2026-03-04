import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/format_item/format_item_widget.dart';
import '/components/main_bottom/main_bottom_widget.dart';
import '/components/type_achiv_item/type_achiv_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'create_edit_achiv_widget.dart' show CreateEditAchivWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateEditAchivModel extends FlutterFlowModel<CreateEditAchivWidget> {
  ///  Local state fields for this component.

  int? format;

  int? type;

  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadDataCwe = false;
  FFUploadedFile uploadedLocalFile_uploadDataCwe =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Model for format_item component.
  late FormatItemModel formatItemModel1;
  // Model for format_item component.
  late FormatItemModel formatItemModel2;
  // Model for format_item component.
  late FormatItemModel formatItemModel3;
  // Model for kills.
  late TypeAchivItemModel killsModel;
  // Model for series.
  late TypeAchivItemModel seriesModel;
  // Model for gamecount.
  late TypeAchivItemModel gamecountModel;
  // Model for win.
  late TypeAchivItemModel winModel;
  // Model for rate.
  late TypeAchivItemModel rateModel;
  // Model for main_bottom component.
  late MainBottomModel mainBottomModel1;
  bool isDataUploading_uploadDataI4g = false;
  FFUploadedFile uploadedLocalFile_uploadDataI4g =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataI4g = '';

  // Stores action output result for [Backend Call - Create Document] action in main_bottom widget.
  AchievementRecord? newAchiv;
  // Model for main_bottom component.
  late MainBottomModel mainBottomModel2;
  bool isDataUploading_uploadData02k = false;
  FFUploadedFile uploadedLocalFile_uploadData02k =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData02k = '';

  @override
  void initState(BuildContext context) {
    formatItemModel1 = createModel(context, () => FormatItemModel());
    formatItemModel2 = createModel(context, () => FormatItemModel());
    formatItemModel3 = createModel(context, () => FormatItemModel());
    killsModel = createModel(context, () => TypeAchivItemModel());
    seriesModel = createModel(context, () => TypeAchivItemModel());
    gamecountModel = createModel(context, () => TypeAchivItemModel());
    winModel = createModel(context, () => TypeAchivItemModel());
    rateModel = createModel(context, () => TypeAchivItemModel());
    mainBottomModel1 = createModel(context, () => MainBottomModel());
    mainBottomModel2 = createModel(context, () => MainBottomModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    formatItemModel1.dispose();
    formatItemModel2.dispose();
    formatItemModel3.dispose();
    killsModel.dispose();
    seriesModel.dispose();
    gamecountModel.dispose();
    winModel.dispose();
    rateModel.dispose();
    mainBottomModel1.dispose();
    mainBottomModel2.dispose();
  }
}
