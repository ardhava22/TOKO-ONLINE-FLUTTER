
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:toko_online_flutter/models/response_data_list.dart';
import 'package:toko_online_flutter/services/toko.dart';
import 'package:toko_online_flutter/views/tambah_barang_view.dart';
import 'package:toko_online_flutter/widgets/alert.dart';
import 'package:toko_online_flutter/widgets/bottom_navbar.dart';

class BarangView extends StatefulWidget {
  const BarangView({super.key});

  @override
  State<BarangView> createState() => _BarangViewState();
}

class _BarangViewState extends State<BarangView> {
    TokoService barang = TokoService();
    List action =["Update", "Hapus"];
    List? stok;
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Barang"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context)
            => TambahBarangView(title: "Tambah Barang", item: null)));
          }, icon: Icon(IconlyLight.add_user))
        ],
      ),
      body: stok != null
          ? ListView.builder(
              itemCount: stok!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading:
                        Image(image: NetworkImage(stok![index].posterPath)),
                    title: Text(stok![index].title),
                    trailing:
                    PopupMenuButton(itemBuilder: (BuildContext context) {
                      return action.map((r) {
                        return PopupMenuItem(
                          onTap: () async {
                            if (r == "Update") {
                              Navigator.push(context,
                              MaterialPageRoute(builder: (context) => 
                              TambahBarangView(title: "Update Barang", item: stok![index])));
                            } else {
                              var results = await AlertMessage().showAlertDialog(context);
                              if (results != null &&
                              results.constainsKey('status')) {
                                if (results['status'] == true) {
                                  var res = await barang.hapusBarang(
                                    context, stok![index].id);
                                  if (res.status == true) {
                                    AlertMessage().showAlert(
                                      context, res.message, true);
                                    getBarang();
                                  } else {
                                    AlertMessage().showAlert(
                                      context, res.message, false);
                                  }
                                }
                              }
                            }
                          },
                          value: r,
                          child: Text(r),);
                      }).toList();
                    },),
                  ),
                );
              })
          : Center(
              child: CircularProgressIndicator(),
            ),
      bottomNavigationBar: BottomNav(1),
    );
  }

  getBarang() async {
    ResponseDataList getBarang = await barang.getBarang();
    setState(() {
      stok = getBarang.data;
    });
  }

}

