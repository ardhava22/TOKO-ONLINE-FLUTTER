import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toko_online_flutter/models/toko_model.dart';
import 'package:toko_online_flutter/services/Toko.dart';
import 'package:toko_online_flutter/widgets/alert.dart';


class TambahBarangView extends StatefulWidget {
  String title;
  TokoModel? item;
  TambahBarangView({required this.title, required this.item});


  @override
  State<TambahBarangView> createState() => _TambahBarangViewState();
}


class _TambahBarangViewState extends State<TambahBarangView> {
  TokoService barang = TokoService();
  final formKey = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController voteAverage = TextEditingController();
  TextEditingController overView = TextEditingController();
  File? selectedImage;
  bool? isLoading = false;
  Future getImage() async {
    setState(() {
      isLoading = true;
    });
    var img = await ImagePicker().pickImage(source: ImageSource.gallery);


    setState(() {
      selectedImage = File(img!.path);
      isLoading = false;
    });
    //return image;
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.item != null) {
      title.text = widget.item!.title!;
      voteAverage.text = widget.item!.voteAverage!.toString();
      overView.text = widget.item!.overview!;
      selectedImage = null;
    } else {
      title.clear();
      voteAverage.clear();
      overView.clear();
      selectedImage = null;
    }


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                    controller: title,
                    decoration: InputDecoration(label: Text("Title")),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'harus diisi';
                      } else {
                        return null;
                      }
                    }),
                TextFormField(
                    controller: voteAverage,
                    decoration: InputDecoration(label: Text("Vote Average")),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'harus diisi';
                      } else {
                        return null;
                      }
                    }),
                TextFormField(
                    controller: overView,
                    decoration: InputDecoration(label: Text("Over View")),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'harus diisi';
                      } else {
                        return null;
                      }
                    }),
                TextButton(
                    onPressed: () {
                      getImage();
                    },
                    child: Text("Select Picture")),
                selectedImage != null
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        child: Image.file(selectedImage!),
                      )
                    : isLoading == true
                        ? CircularProgressIndicator()
                        : Center(child: Text("Please Get the Images")),
               	 ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        var data = {
                          "title": title.text,
                          "voteaverage": voteAverage.text,
                          "overview": overView.text,
                        };
                        var result;
                        if (widget.item != null) {
                          result = await barang.insertBarang(
                              data, selectedImage, widget.item!.id!);
                        } else {
                          result = await barang.insertBarang(
                              data, selectedImage, null);
                        }


                        if (result.status == true) {
                          AlertMessage()
                              .showAlert(context, result.message, true);
                          Navigator.pop(context);
                          Navigator.pushReplacementNamed(context, '/barang');
                        } else {
                          AlertMessage()
                              .showAlert(context, result.message, false);
                        }
                      }
                    },
                    child: Text("Simpan"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
