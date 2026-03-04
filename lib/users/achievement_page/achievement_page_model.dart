import '/backend/backend.dart';
import '/components/achiv_item/achiv_item_widget.dart';
import '/components/create_edit_achiv/create_edit_achiv_widget.dart';
import '/components/menu/menu_widget.dart';
import '/components/zero_item/zero_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'achievement_page_widget.dart' show AchievementPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AchievementPageModel extends FlutterFlowModel<AchievementPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for menu component.
  late MenuModel menuModel;
  // Models for achiv_item dynamic component.
  late FlutterFlowDynamicModels<AchivItemModel> achivItemModels;
  // Model for zero_item component.
  late ZeroItemModel zeroItemModel;

  @override
  void initState(BuildContext context) {
    menuModel = createModel(context, () => MenuModel());
    achivItemModels = FlutterFlowDynamicModels(() => AchivItemModel());
    zeroItemModel = createModel(context, () => ZeroItemModel());
  }

  @override
  void dispose() {
    menuModel.dispose();
    achivItemModels.dispose();
    zeroItemModel.dispose();
  }
}
