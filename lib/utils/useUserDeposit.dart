// ignore_for_file: file_names

import '../models/Deposit.dart';

class UseUserDeposit {
  Future<List<Deposit>> getUserDeposit(request) async {
    var response = await request
        .get('http://trashsure.iyoubee.xyz/flutter/user/deposit/get/');

    var data = response;

    List<Deposit> depositList = [];
    for (var d in data) {
      if (d != null) {
        depositList.add(Deposit.fromJson(d));
      }
    }
    return depositList;
  }

  addDeposit(context, request, jenisSampah, beratSampah) async {
    var response = await request.post(
        'http://trashsure.iyoubee.xyz/flutter/user/deposit/add/',
        {"jenisSampah": jenisSampah, "beratSampah": beratSampah});

    return response['status'];
  }
}
