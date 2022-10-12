import 'package:webview_flutter_plus/webview_flutter_plus.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MathField()));
}

class MathField extends StatefulWidget {
  @override
  MathFieldState createState() {
    return MathFieldState();
  }
}

class MathFieldState extends State<MathField> {
  late WebViewPlusController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Text('MathQuill - MathField with Matrix Example')),
        body: WebViewPlus(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: 'assets/html/mathField.html',
            onWebViewCreated: (controller) {
              this.controller = controller;
            }));
  }
}


//\begin{bmatrix}1&2\\3&4\end{bmatrix}
//\hat f(\xi) = \int_{-\infty}^\infty {f(x)e^{- 2\pi i \xi x}\mathrm{d}x}