import '/backend/backend.dart';
import '/components/menu/menu_widget.dart';
import '/components/new_user_list_item/new_user_list_item_widget.dart';
import '/components/switch_item/switch_item_widget.dart';
import '/components/user_list_item/user_list_item_widget.dart';
import '/components/zero_item/zero_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'users_page_widget.dart' show UsersPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UsersPageModel extends FlutterFlowModel<UsersPageWidget> {
  ///  Local state fields for this page.

  int switchIndex = 0;

  ///  State fields for stateful widgets in this page.

  // Model for menu component.
  late MenuModel menuModel;
  // Model for switch_item component.
  late SwitchItemModel switchItemModel1;
  // Model for switch_item component.
  late SwitchItemModel switchItemModel2;
  // Models for user_list_item dynamic component.
  late FlutterFlowDynamicModels<UserListItemModel> userListItemModels;
  // Models for newUser_list_item dynamic component.
  late FlutterFlowDynamicModels<NewUserListItemModel> newUserListItemModels;

  @override
  void initState(BuildContext context) {
    menuModel = createModel(context, () => MenuModel());
    switchItemModel1 = createModel(context, () => SwitchItemModel());
    switchItemModel2 = createModel(context, () => SwitchItemModel());
    userListItemModels = FlutterFlowDynamicModels(() => UserListItemModel());
    newUserListItemModels =
        FlutterFlowDynamicModels(() => NewUserListItemModel());
  }

  @override
  void dispose() {
    menuModel.dispose();
    switchItemModel1.dispose();
    switchItemModel2.dispose();
    userListItemModels.dispose();
    newUserListItemModels.dispose();
  }
}
