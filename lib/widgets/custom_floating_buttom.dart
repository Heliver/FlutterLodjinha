import 'package:flutter/material.dart';
import 'package:lodjinha/services/product_service.dart';

// ignore: must_be_immutable
class CustomFloatingButtom extends StatefulWidget {
  double top;
  double right;
  String messageOk;
  String messageError;
  int productId;

  CustomFloatingButtom(
      this.top, this.right, this.messageOk, this.messageError, this.productId);

  @override
  _CustomFloatingButtomState createState() => _CustomFloatingButtomState();
}

class _CustomFloatingButtomState extends State<CustomFloatingButtom> {
  final ProductService productService = ProductService();
  bool _isButtonDisabled = true;
  Color colorButton;

  @override
  void initState() {
    super.initState();
    _isButtonDisabled = true;
  }

  oneClickButton() {
    _isButtonDisabled ? getData() : dialogMultiClick();
  }

  dialogMultiClick() {
    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              content: Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 0.0),
                  child: Text(
                    "Parabéns, seu produto já foi reservado, agora é só aguardar.",
                    style: TextStyle(color: Colors.grey[500]),
                  )),
              actions: <Widget>[
                FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  getData() async {
    setState(() {
      _isButtonDisabled = false;
    });

    var resp = await productService.reservationProduct(widget.productId);
    String message;
    if (resp["result"] == "success") {
      message = widget.messageOk;
      setState(() {
        colorButton = Colors.green;
      });
    } else {
      message = widget.messageError;
    }

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              content: Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 0.0),
                  child: Text(
                    message,
                    style: TextStyle(color: Colors.grey[500]),
                  )),
              actions: <Widget>[
                FlatButton(
                  onPressed: (){
                    Navigator.pop(context);
                    Navigator.of(context).pop(false);
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: widget.top,
      right: widget.right,
      child: Container(
        height: 70.0,
        width: 70.0,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: colorButton,
            onPressed: () {
              oneClickButton();
            },
            child: Icon(Icons.check),
          ),
        ),
      ),
    );
  }
}
