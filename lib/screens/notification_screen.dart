import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_four/model/one_tile_model.dart';
import 'package:task_four/screens/accout_information_screen.dart';
import 'package:task_four/screens/empty_screen.dart';
import 'package:task_four/services/web_services.dart';
import 'package:task_four/utils/colors.dart';
import 'package:task_four/utils/text_style.dart';

import '../widget/common_appbar.dart';

class NotificationScreen extends StatefulWidget {
  static const String route = '/notifications_screen';
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  RxBool isLoading = false.obs;

  @override
  void initState() {
    Future.microtask(() async => await _initAsync());
    super.initState();
  }

  var response;
  var idToken;
  AnnouncementModel? announcementResponse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: CommonAppBar(),
        ),
        body: Obx(() {
          return isLoading.value
              ? Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 40.w,
                    height: 40.w,
                    child: const CircularProgressIndicator(),
                  ),
                )
              : ListDetails(announcement: announcementResponse);
        }));
  }

  _initAsync() async {
    isLoading.value = true;
    //TODO: CREATE A MODEL FOR CUSTOM TOKEN RESPONSE
    final response = await WebAPIService().getToken();
    final newToken = response.data['result']['token'].toString();
    //TODO: CREATE A MODEL FOR ID TOKEN RESPONSE
    idToken = await WebAPIService().getIdToken(customToken: newToken);
    final lastToken = idToken.data['idToken'].toString();
    announcementResponse = await WebAPIService()
        .getAnnouncementList(authorizationToken: lastToken);
    isLoading.value = false;
  }
}

class ListDetails extends StatelessWidget {
  final AnnouncementModel? announcement;
  const ListDetails({
    Key? key,
    required this.announcement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (announcement?.result?.data?.isEmpty ?? true)
        ? const EmptyScreen()
        : ListView.separated(
            itemBuilder: ((context, index) {
              return InkWell(
                onTap: (() => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AccountScreen()),
                    )),
                child: OneTile(
                  data: announcement?.result?.data?[index],
                ),
              );
            }),
            separatorBuilder: ((context, index) {
              return const Divider(
                height: 5,
                color: colorFFBABABA,
              );
            }),
            itemCount: announcement!.result!.data!.length);
  }
}

class OneTile extends StatelessWidget {
  final Announcement? data;
  const OneTile({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: Text(
          data?.createdBy?.name ?? '',
          style: tsS14C0xW700,
        ),
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: Text(
          data?.subject ?? '',
          style: tsS12C0xW400,
        ),
      ),
    );
  }
}
