import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'switch_item_model.dart';
export 'switch_item_model.dart';

class SwitchItemWidget extends StatefulWidget {
  const SwitchItemWidget({
    super.key,
    bool? isActiv,
    this.action,
    this.text,
    this.count,
    this.coutVisibility,
  }) : this.isActiv = isActiv ?? false;

  final bool isActiv;
  final Future Function()? action;
  final String? text;
  final String? count;
  final bool? coutVisibility;

  @override
  State<SwitchItemWidget> createState() => _SwitchItemWidgetState();
}

class _SwitchItemWidgetState extends State<SwitchItemWidget> {
  late SwitchItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwitchItemModel());

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
      width: 157.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  valueOrDefault<String>(
                    widget!.text,
                    'Сотрудники',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: valueOrDefault<Color>(
                          widget!.isActiv
                              ? FlutterFlowTheme.of(context).primaryText
                              : FlutterFlowTheme.of(context).secondaryText,
                          FlutterFlowTheme.of(context).secondaryText,
                        ),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
                if (widget!.coutVisibility ?? true)
                  Container(
                    decoration: BoxDecoration(
                      color: valueOrDefault<Color>(
                        widget!.isActiv
                            ? FlutterFlowTheme.of(context).primaryText
                            : FlutterFlowTheme.of(context).primaryBackground,
                        FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 2.0, 8.0, 2.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget!.count,
                          '1',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: valueOrDefault<Color>(
                                widget!.isActiv
                                    ? FlutterFlowTheme.of(context).secondary
                                    : FlutterFlowTheme.of(context).primary,
                                FlutterFlowTheme.of(context).primary,
                              ),
                              fontSize: 10.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ),
              ].divide(SizedBox(width: 4.0)),
            ),
          ),
          Container(
            width: double.infinity,
            height: 2.0,
            decoration: BoxDecoration(
              color: valueOrDefault<Color>(
                widget!.isActiv
                    ? FlutterFlowTheme.of(context).primaryText
                    : FlutterFlowTheme.of(context).secondaryBackground,
                FlutterFlowTheme.of(context).primaryBackground,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
