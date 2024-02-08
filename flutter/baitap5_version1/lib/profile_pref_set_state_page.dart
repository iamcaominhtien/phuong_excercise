import 'package:baitap5_version1/profile.dart';
import 'package:baitap5_version1/profile_page.dart';
import 'package:baitap5_version1/profile_preference.dart';
import 'package:baitap5_version1/widgets/error_widget.dart';
import 'package:baitap5_version1/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

class ProfilePreferenceSetStatePage extends StatefulWidget {
  const ProfilePreferenceSetStatePage({super.key});

  @override
  State<ProfilePreferenceSetStatePage> createState() =>
      _ProfilePreferenceSetStatePageState();
}

class _ProfilePreferenceSetStatePageState
    extends State<ProfilePreferenceSetStatePage> {
  late Profile profile;
  bool loadData = false;
  bool error = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  void _loadData() async {
    try {
      profile = await ProfilePreference.readPreference();
      setState(() {
        loadData = true;
      });
    } catch (e) {
      setState(() {
        error = true;
      });
      print("Lỗi đọc dữ liệu: $e");
    }
  }

  Widget buildProfileWidget() {
    return ProfilePage(profile: profile);
  }

  Widget buildLoadingWidget() {
    return const LoadingWidget();
  }

  Widget errorBuildWidget() {
    return const MyErrorWidget();
  }

  Widget buildBody() {
    if (!error) {
      if (loadData) {
        return buildProfileWidget();
      } else {
        return buildLoadingWidget();
      }
    } else {
      return errorBuildWidget();
    }
  }
}
