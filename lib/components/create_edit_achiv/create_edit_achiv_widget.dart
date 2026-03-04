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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_edit_achiv_model.dart';
export 'create_edit_achiv_model.dart';

class CreateEditAchivWidget extends StatefulWidget {
  const CreateEditAchivWidget({
    super.key,
    this.achivmentDoc,
  });

  final AchievementRecord? achivmentDoc;

  @override
  State<CreateEditAchivWidget> createState() => _CreateEditAchivWidgetState();
}

class _CreateEditAchivWidgetState extends State<CreateEditAchivWidget> {
  late CreateEditAchivModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateEditAchivModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.achivmentDoc != null) {
        _model.format = widget!.achivmentDoc?.format;
        _model.type = widget!.achivmentDoc?.type;
        safeSetState(() {});
      }
    });

    _model.textController1 ??= TextEditingController(
        text: widget!.achivmentDoc != null ? widget!.achivmentDoc?.name : '');
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController(
        text: widget!.achivmentDoc != null ? widget!.achivmentDoc?.text : '');
    _model.textFieldFocusNode2 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        maxWidth: 600.0,
      ),
      decoration: BoxDecoration(),
      child: Stack(
        alignment: AlignmentDirectional(1.0, -1.0),
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          FFIcons.kstar,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 27.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Text(
                        widget!.achivmentDoc != null
                            ? 'Редактирование достижения'
                            : 'Создание достижения',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                    if (widget!.achivmentDoc == null)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                        child: Text(
                          'Создайте новое достижение для игроков',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: Text(
                        'Изображение:',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          final selectedMedia = await selectMedia(
                            maxWidth: 700.00,
                            maxHeight: 700.00,
                            imageQuality: 80,
                            mediaSource: MediaSource.photoGallery,
                            multiImage: false,
                          );
                          if (selectedMedia != null &&
                              selectedMedia.every((m) =>
                                  validateFileFormat(m.storagePath, context))) {
                            safeSetState(() =>
                                _model.isDataUploading_uploadDataCwe = true);
                            var selectedUploadedFiles = <FFUploadedFile>[];

                            try {
                              selectedUploadedFiles = selectedMedia
                                  .map((m) => FFUploadedFile(
                                        name: m.storagePath.split('/').last,
                                        bytes: m.bytes,
                                        height: m.dimensions?.height,
                                        width: m.dimensions?.width,
                                        blurHash: m.blurHash,
                                      ))
                                  .toList();
                            } finally {
                              _model.isDataUploading_uploadDataCwe = false;
                            }
                            if (selectedUploadedFiles.length ==
                                selectedMedia.length) {
                              safeSetState(() {
                                _model.uploadedLocalFile_uploadDataCwe =
                                    selectedUploadedFiles.first;
                              });
                            } else {
                              safeSetState(() {});
                              return;
                            }
                          }
                        },
                        child: Container(
                          width: 96.0,
                          height: 96.0,
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    width: 1.0,
                                  ),
                                ),
                                child: Icon(
                                  FFIcons.kplussquare,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                              if (widget!.achivmentDoc != null)
                                Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: Image.network(
                                            widget!.achivmentDoc!.image,
                                            width: 200.0,
                                            height: 200.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.0, -1.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(1.5),
                                            child: Icon(
                                              FFIcons.kxsquare,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              size: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (_model.uploadedLocalFile_uploadDataCwe !=
                                      null &&
                                  (_model.uploadedLocalFile_uploadDataCwe.bytes
                                          ?.isNotEmpty ??
                                      false))
                                Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: Image.memory(
                                            _model.uploadedLocalFile_uploadDataCwe
                                                    .bytes ??
                                                Uint8List.fromList([]),
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.0, -1.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(1.5),
                                            child: Icon(
                                              FFIcons.kxsquare,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              size: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: Container(
                        width: 560.0,
                        child: TextFormField(
                          controller: _model.textController1,
                          focusNode: _model.textFieldFocusNode1,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.textController1',
                            Duration(milliseconds: 100),
                            () => safeSetState(() {}),
                          ),
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelText: 'Название',
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  color:
                                      (_model.textFieldFocusNode1?.hasFocus ??
                                              false)
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).secondary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            contentPadding: EdgeInsets.all(16.0),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          validator: _model.textController1Validator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: Container(
                        width: 560.0,
                        child: TextFormField(
                          controller: _model.textController2,
                          focusNode: _model.textFieldFocusNode2,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.textController2',
                            Duration(milliseconds: 100),
                            () => safeSetState(() {}),
                          ),
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelText: 'Описание достижения',
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  color:
                                      (_model.textFieldFocusNode2?.hasFocus ??
                                              false)
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).secondary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            contentPadding: EdgeInsets.all(16.0),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                          textAlign: TextAlign.start,
                          maxLength: 40,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          validator: _model.textController2Validator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: Text(
                          'Вид достижения:',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.format = 0;
                                safeSetState(() {});
                              },
                              child: wrapWithModel(
                                model: _model.formatItemModel1,
                                updateCallback: () => safeSetState(() {}),
                                child: FormatItemWidget(
                                  isActiv: _model.format == 0,
                                  text: 'Медаль',
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.format = 1;
                                safeSetState(() {});
                              },
                              child: wrapWithModel(
                                model: _model.formatItemModel2,
                                updateCallback: () => safeSetState(() {}),
                                child: FormatItemWidget(
                                  isActiv: _model.format == 1,
                                  text: 'Звание',
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.format = 2;
                                safeSetState(() {});
                              },
                              child: wrapWithModel(
                                model: _model.formatItemModel3,
                                updateCallback: () => safeSetState(() {}),
                                child: FormatItemWidget(
                                  isActiv: _model.format == 2,
                                  text: 'Статус',
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 8.0)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: Text(
                          'Условие получения:',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.type = 0;
                                safeSetState(() {});
                              },
                              child: wrapWithModel(
                                model: _model.killsModel,
                                updateCallback: () => safeSetState(() {}),
                                child: TypeAchivItemWidget(
                                  label: 'Количество убийств',
                                  text: widget!.achivmentDoc != null
                                      ? (widget!.achivmentDoc?.maxKills == 0
                                          ? functions.emptyString()
                                          : widget!.achivmentDoc?.maxKills
                                              ?.toString())
                                      : '',
                                  isActiv: _model.type == 0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.type = 3;
                                safeSetState(() {});
                              },
                              child: wrapWithModel(
                                model: _model.seriesModel,
                                updateCallback: () => safeSetState(() {}),
                                child: TypeAchivItemWidget(
                                  label: 'Серия без поражений',
                                  text: widget!.achivmentDoc != null
                                      ? (widget!.achivmentDoc?.winSeries == 0
                                          ? functions.emptyString()
                                          : widget!.achivmentDoc?.winSeries
                                              ?.toString())
                                      : '',
                                  isActiv: _model.type == 3,
                                ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 16.0)),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.type = 1;
                                safeSetState(() {});
                              },
                              child: wrapWithModel(
                                model: _model.gamecountModel,
                                updateCallback: () => safeSetState(() {}),
                                child: TypeAchivItemWidget(
                                  label: 'Количество игр',
                                  text: widget!.achivmentDoc != null
                                      ? (widget!.achivmentDoc?.gameCount == 0
                                          ? functions.emptyString()
                                          : widget!.achivmentDoc?.gameCount
                                              ?.toString())
                                      : '',
                                  isActiv: _model.type == 1,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.type = 4;
                                safeSetState(() {});
                              },
                              child: wrapWithModel(
                                model: _model.winModel,
                                updateCallback: () => safeSetState(() {}),
                                child: TypeAchivItemWidget(
                                  label: 'Количество побед',
                                  text: widget!.achivmentDoc != null
                                      ? (widget!.achivmentDoc?.winsCount == 0
                                          ? functions.emptyString()
                                          : widget!.achivmentDoc?.winsCount
                                              ?.toString())
                                      : '',
                                  isActiv: _model.type == 4,
                                ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 16.0)),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.type = 2;
                                safeSetState(() {});
                              },
                              child: wrapWithModel(
                                model: _model.rateModel,
                                updateCallback: () => safeSetState(() {}),
                                child: TypeAchivItemWidget(
                                  label: 'Достижение рейтинга',
                                  text: widget!.achivmentDoc != null
                                      ? (widget!.achivmentDoc?.rate == 0.0
                                          ? functions.emptyString()
                                          : widget!.achivmentDoc?.rate
                                              ?.toString())
                                      : '',
                                  isActiv: _model.type == 2,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(),
                            ),
                          ),
                        ].divide(SizedBox(width: 16.0)),
                      ),
                    ),
                    if (widget!.achivmentDoc == null)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: wrapWithModel(
                          model: _model.mainBottomModel1,
                          updateCallback: () => safeSetState(() {}),
                          child: MainBottomWidget(
                            isActiv: (_model.uploadedLocalFile_uploadDataCwe !=
                                        null &&
                                    (_model.uploadedLocalFile_uploadDataCwe
                                            .bytes?.isNotEmpty ??
                                        false)) &&
                                (_model.textController1.text != null &&
                                    _model.textController1.text != '') &&
                                (_model.textController2.text != null &&
                                    _model.textController2.text != '') &&
                                (_model.type != null) &&
                                (_model.format != null),
                            title: 'Создать',
                            action: () async {
                              {
                                safeSetState(() => _model
                                    .isDataUploading_uploadDataI4g = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];
                                var selectedMedia = <SelectedFile>[];
                                var downloadUrls = <String>[];
                                try {
                                  selectedUploadedFiles = _model
                                          .uploadedLocalFile_uploadDataCwe
                                          .bytes!
                                          .isNotEmpty
                                      ? [_model.uploadedLocalFile_uploadDataCwe]
                                      : <FFUploadedFile>[];
                                  selectedMedia =
                                      selectedFilesFromUploadedFiles(
                                    selectedUploadedFiles,
                                  );
                                  downloadUrls = (await Future.wait(
                                    selectedMedia.map(
                                      (m) async => await uploadData(
                                          m.storagePath, m.bytes),
                                    ),
                                  ))
                                      .where((u) => u != null)
                                      .map((u) => u!)
                                      .toList();
                                } finally {
                                  _model.isDataUploading_uploadDataI4g = false;
                                }
                                if (selectedUploadedFiles.length ==
                                        selectedMedia.length &&
                                    downloadUrls.length ==
                                        selectedMedia.length) {
                                  safeSetState(() {
                                    _model.uploadedLocalFile_uploadDataI4g =
                                        selectedUploadedFiles.first;
                                    _model.uploadedFileUrl_uploadDataI4g =
                                        downloadUrls.first;
                                  });
                                } else {
                                  safeSetState(() {});
                                  return;
                                }
                              }

                              var achievementRecordReference =
                                  AchievementRecord.collection.doc();
                              await achievementRecordReference
                                  .set(createAchievementRecordData(
                                image: _model.uploadedFileUrl_uploadDataI4g,
                                name: _model.textController1.text,
                                text: _model.textController2.text,
                                type: _model.type,
                                format: _model.format,
                              ));
                              _model.newAchiv =
                                  AchievementRecord.getDocumentFromData(
                                      createAchievementRecordData(
                                        image: _model
                                            .uploadedFileUrl_uploadDataI4g,
                                        name: _model.textController1.text,
                                        text: _model.textController2.text,
                                        type: _model.type,
                                        format: _model.format,
                                      ),
                                      achievementRecordReference);
                              await Future.delayed(
                                  const Duration(milliseconds: 100));
                              if (_model.type == 0) {
                                await _model.newAchiv!.reference
                                    .update(createAchievementRecordData(
                                  maxKills: int.tryParse(
                                      _model.killsModel.textController.text),
                                ));
                              } else {
                                if (_model.type == 1) {
                                  await _model.newAchiv!.reference
                                      .update(createAchievementRecordData(
                                    gameCount: int.tryParse(_model
                                        .gamecountModel.textController.text),
                                  ));
                                } else {
                                  if (_model.type == 2) {
                                    await _model.newAchiv!.reference
                                        .update(createAchievementRecordData(
                                      rate: double.tryParse(
                                          _model.rateModel.textController.text),
                                    ));
                                  } else {
                                    if (_model.type == 3) {
                                      await _model.newAchiv!.reference
                                          .update(createAchievementRecordData(
                                        winSeries: int.tryParse(_model
                                            .seriesModel.textController.text),
                                      ));
                                    } else {
                                      if (_model.type == 4) {
                                        await _model.newAchiv!.reference
                                            .update(createAchievementRecordData(
                                          winsCount: int.tryParse(_model
                                              .winModel.textController.text),
                                        ));
                                      }
                                    }
                                  }
                                }
                              }

                              Navigator.pop(context);

                              safeSetState(() {});
                            },
                          ),
                        ),
                      ),
                    if (widget!.achivmentDoc != null)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: wrapWithModel(
                          model: _model.mainBottomModel2,
                          updateCallback: () => safeSetState(() {}),
                          child: MainBottomWidget(
                            isActiv: true,
                            title: 'Сохранить',
                            action: () async {
                              if (_model.uploadedLocalFile_uploadDataCwe !=
                                      null &&
                                  (_model.uploadedLocalFile_uploadDataCwe.bytes
                                          ?.isNotEmpty ??
                                      false)) {
                                {
                                  safeSetState(() => _model
                                      .isDataUploading_uploadData02k = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];
                                  var selectedMedia = <SelectedFile>[];
                                  var downloadUrls = <String>[];
                                  try {
                                    selectedUploadedFiles = _model
                                            .uploadedLocalFile_uploadDataCwe
                                            .bytes!
                                            .isNotEmpty
                                        ? [
                                            _model
                                                .uploadedLocalFile_uploadDataCwe
                                          ]
                                        : <FFUploadedFile>[];
                                    selectedMedia =
                                        selectedFilesFromUploadedFiles(
                                      selectedUploadedFiles,
                                    );
                                    downloadUrls = (await Future.wait(
                                      selectedMedia.map(
                                        (m) async => await uploadData(
                                            m.storagePath, m.bytes),
                                      ),
                                    ))
                                        .where((u) => u != null)
                                        .map((u) => u!)
                                        .toList();
                                  } finally {
                                    _model.isDataUploading_uploadData02k =
                                        false;
                                  }
                                  if (selectedUploadedFiles.length ==
                                          selectedMedia.length &&
                                      downloadUrls.length ==
                                          selectedMedia.length) {
                                    safeSetState(() {
                                      _model.uploadedLocalFile_uploadData02k =
                                          selectedUploadedFiles.first;
                                      _model.uploadedFileUrl_uploadData02k =
                                          downloadUrls.first;
                                    });
                                  } else {
                                    safeSetState(() {});
                                    return;
                                  }
                                }

                                await widget!.achivmentDoc!.reference
                                    .update(createAchievementRecordData(
                                  image: _model.uploadedFileUrl_uploadData02k,
                                  name: _model.textController1.text,
                                  text: _model.textController2.text,
                                  type: _model.type,
                                  format: _model.format,
                                ));
                              } else {
                                await widget!.achivmentDoc!.reference
                                    .update(createAchievementRecordData(
                                  name: _model.textController1.text,
                                  text: _model.textController2.text,
                                  type: _model.type,
                                  format: _model.format,
                                ));
                              }

                              await Future.delayed(
                                  const Duration(milliseconds: 100));

                              await widget!.achivmentDoc!.reference
                                  .update(createAchievementRecordData(
                                maxKills: _model.type == 0
                                    ? int.tryParse(
                                        _model.killsModel.textController.text)
                                    : 0,
                                gameCount: _model.type == 1
                                    ? int.tryParse(_model
                                        .gamecountModel.textController.text)
                                    : 0,
                                winSeries: _model.type == 3
                                    ? int.tryParse(
                                        _model.seriesModel.textController.text)
                                    : 0,
                                winsCount: _model.type == 4
                                    ? int.tryParse(
                                        _model.winModel.textController.text)
                                    : 0,
                                rate: (_model.type == 2
                                        ? int.tryParse(_model
                                            .rateModel.textController.text)
                                        : 0)
                                    ?.toDouble(),
                              ));
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  FFIcons.kxsquare,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
