import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'main_bottom_model.dart';
export 'main_bottom_model.dart';

class MainBottomWidget extends StatefulWidget {
  const MainBottomWidget({
    super.key,
    bool? isActiv,
    required this.title,
    this.action,
  }) : this.isActiv = isActiv ?? false;

  final bool isActiv;
  final String? title;
  final Future Function()? action;

  @override
  State<MainBottomWidget> createState() => _MainBottomWidgetState();
}

class _MainBottomWidgetState extends State<MainBottomWidget> {
  late MainBottomModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainBottomModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () async {
        if (widget!.isActiv) {
          await widget.action?.call();
        }
      },
      text: widget!.title!,
      options: FFButtonOptions(
        width: double.infinity,
        height: 48.0,
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: valueOrDefault<Color>(
          widget!.isActiv
              ? FlutterFlowTheme.of(context).primaryText
              : FlutterFlowTheme.of(context).secondary,
          FlutterFlowTheme.of(context).secondary,
        ),
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              font: GoogleFonts.inter(
                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
              ),
              color: valueOrDefault<Color>(
                widget!.isActiv
                    ? FlutterFlowTheme.of(context).secondaryBackground
                    : FlutterFlowTheme.of(context).primaryText,
                FlutterFlowTheme.of(context).primary,
              ),
              letterSpacing: 0.0,
              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
            ),
        elevation: 0.0,
        borderRadius: BorderRadius.circular(0.0),
      ),
    );
  }
}
