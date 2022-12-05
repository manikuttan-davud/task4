import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_four/model/one_tile_model.dart';
import 'package:task_four/screens/accout_information_screen.dart';
import 'package:task_four/screens/empty_screen.dart';
import 'package:task_four/services/web_services.dart';
import 'package:task_four/utils/colors.dart';
import 'package:task_four/utils/data.dart';
import 'package:task_four/utils/text_style.dart';

import '../widget/common_appbar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    Future.microtask(() async => await _initAsync());
    super.initState();
  }

  var response;
  var idToken;
  DataModel? announcementResponse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: CommonAppBar(),
        ),
        body: ListDetails(announcement: []));
  }

  _initAsync() async {
    final response = await WebAPIService().getToken();
    //final sharedprefs = await SharedPreferences.getInstance();
    // sharedprefs.setStringList('token',response['token']);
    final newToken = response.data['result']['token'].toString();

    idToken = await WebAPIService().getIdToken(customToken: newToken);
    final lastToken = idToken.data['idToken'].toString();

    announcementResponse = await WebAPIService()
        .getAnnouncementList(authorizationToken: lastToken);

    // if(lastResponse.statusCode==200){
    //  DataModel announcement=DataModel.fromJson(lastResponse.data);
    //  DataModel announcement=DataModel.fromJson(lastResponse);
  }
}
//}

class ListDetails extends StatelessWidget {
  final List announcement;
  const ListDetails({
    Key? key,
    required this.announcement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return announcement.isEmpty
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
                  data: announcement[index],
                ),
              );
            }),
            separatorBuilder: ((context, index) {
              return const Divider(
                height: 5,
                color: colorFFBABABA,
              );
            }),
            itemCount: Dummydata.length);
  }
}

class OneTile extends StatelessWidget {
  final DataModel data;
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
          data.name,
          style: tsS14C0xW700,
        ),
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: Text(
          data.role,
          style: tsS12C0xW400,
        ),
      ),
    );
  }
}
