import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:toko_online_flutter/models/response_data_list.dart';
import 'package:toko_online_flutter/models/response_data_map.dart';
import 'package:toko_online_flutter/models/toko_model.dart';
import 'package:toko_online_flutter/models/user_login.dart';
import 'package:toko_online_flutter/services/url.dart' as url;

class TokoService {
	UserLogin userLogin = UserLogin();
  Future getBarang() async {
    var user = await userLogin.getUserLogin();
    if (user.status == false) {
      ResponseDataList response = ResponseDataList(
          status: false, message: 'anda belum login / token invalid');
      return response;
    }
	   var uri = Uri.parse(url.BaseUrl + "/kasir/getbarang");
    Map<String, String> headers = {
      "Authorization": 'Bearer ${user.token}',
    };
    var getbarang = await http.get(uri, headers: headers);


    if (getbarang.statusCode == 200) {
      var data = json.decode(getbarang.body);
      if (data["status"] == true) {
        List barang = data["data"].map((r) => TokoModel.fromJson(r)).toList();
        ResponseDataList response = ResponseDataList(
            status: true, message: 'success load data', data: barang);
        return response;
      } else {
        ResponseDataList response =
            ResponseDataList(status: false, message: 'Failed load data');
        return response;
      }
    } else {
      ResponseDataList response = ResponseDataList(
          status: false,
          message: "gagal load barang dengan code error ${getbarang.statusCode}");
      return response;
    }
  }

  Future insertBarang(request, image, id) async {
    var user = await userLogin.getUserLogin();
    if (user.status == false) {
      ResponseDataList response = ResponseDataList(
          status: false, message: 'anda belum login / token invalid');
      return response;
    }
    Map<String, String> headers = {
      "Authorization": 'Bearer ${user.token}',
      "Content-type": "multipart/form-data",
    };
    var reponse;
    if (id == null) {
      reponse = http.MultipartRequest(
        'POST',
        Uri.parse("${url.BaseUrl}/kasir/insertbarang"),
      );
    } else {
      reponse = http.MultipartRequest(
        'POST',
        Uri.parse("${url.BaseUrl}/kasir/updatebarang/$id"),
      );
    }
    if (image != null) {
      reponse.files.add(http.MultipartFile(
          'posterpath', image.readAsBytes().asStream(), image.lengthSync(),
          filename: image.path.split('/').last));
    }
    reponse.headers.addAll(headers);
    reponse.fields['title'] = request["title"];
    reponse.fields['voteaverage'] = request["voteaverage"];
    reponse.fields['overview'] = request["overview"];


    var res = await reponse.send();
    var result = await http.Response.fromStream(res);


    if (res.statusCode == 200) {
      var data = json.decode(result.body);
      if (data["status"] == true) {
        ResponseDataMap response = ResponseDataMap(
            status: true, message: 'success insert / update data');
        return response;
      } else {
        ResponseDataMap response = ResponseDataMap(
            status: false, message: 'Failed insert / update data');
        return response;
      }
    } else {
      ResponseDataMap response = ResponseDataMap(
          status: false,
          message: "gagal load barang dengan code error ${res.statusCode}");
      return response;
    }
  }

  Future hapusBarang(context, id) async {
    var uri = Uri.parse(url.BaseUrl + "/kasir/hapusbarang/$id");
    var user = await userLogin.getUserLogin();
    if (user.status == false) {
      ResponseDataList response = ResponseDataList(
          status: false, message: 'anda belum login / token invalid');
      return response;
    }
    Map<String, String> headers = {
      "Authorization": 'Bearer ${user.token}',
    };
    var hapusBarang = await http.delete(uri, headers: headers);


    if (hapusBarang.statusCode == 200) {
      var result = json.decode(hapusBarang.body);
      if (result["status"] == true) {
        ResponseDataList response =
            ResponseDataList(status: true, message: 'success hapus data');
        return response;
      } else {
        ResponseDataList response =
            ResponseDataList(status: false, message: 'Failed hapus data');
        return response;
      }
    } else {
      ResponseDataList response = ResponseDataList(
          status: false,
          message:
              "gagal hapus barang dengan code error ${hapusBarang.statusCode}");
      return response;
    }
  }


}

