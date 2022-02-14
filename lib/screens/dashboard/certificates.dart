import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ilearn/models/certificate.dart';

import 'package:ilearn/models/user.dart';
import 'package:ilearn/services/database.dart';
import 'package:provider/provider.dart';

class CertificateScreen extends StatelessWidget {
  const CertificateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Certificates'),
          centerTitle: true,
          elevation: 0,
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back_ios_rounded)),
        ),
        body: Consumer<UserModel>(builder: (context, student, child) {
          return StreamBuilder<List<CertificateModel>>(
              stream: StudentDatabaseService(uid: student.uid)
                  .certificateDataStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final certificateDataList = snapshot.data;
                  return ListView.builder(
                      padding: EdgeInsets.only(top: 20),
                      physics: BouncingScrollPhysics(),
                      itemCount: certificateDataList!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 3,
                          color: Colors.green[100],
                          margin:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      certificateDataList[index].course,
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Spacer(),
                                    Column(
                                      children: [
                                        Text(
                                          "${certificateDataList[index].dateTime.day}.${certificateDataList[index].dateTime.month}.${certificateDataList[index].dateTime.year}",
                                          style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        // Text(
                                        //   "${certificateDataList[index].dateTime.hour}.${certificateDataList[index].dateTime.minute}",
                                        //   style: TextStyle(
                                        //     color: Colors.black45,
                                        //     fontSize: 10,
                                        //     fontWeight: FontWeight.w600,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Text(
                                  certificateDataList[index].certificateUrl,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              });
        }));
  }
}
