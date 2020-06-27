import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';

// ignore: must_be_immutable
class CustomHtml extends StatelessWidget {
  String textHTML;

  CustomHtml(this.textHTML);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
      child: Html(
        data: textHTML,
        //Optional parameters:
        style: {
          "html": Style(
            backgroundColor: Colors.white,
            //color: Colors.white,
          ),
          "h1": Style(
            textAlign: TextAlign.center,
          ),
          "table": Style(
            backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
          ),
          "tr": Style(
            border: Border(bottom: BorderSide(color: Colors.grey)),
          ),
          "th": Style(
            padding: EdgeInsets.all(6),
            backgroundColor: Colors.grey,
          ),
          "td": Style(
            padding: EdgeInsets.all(6),
          ),
          "var": Style(fontFamily: 'serif'),
        },
        customRender: {
          "flutter": (RenderContext context, Widget child, attributes, _) {
            return FlutterLogo(
              style: (attributes['horizontal'] != null)
                  ? FlutterLogoStyle.horizontal
                  : FlutterLogoStyle.markOnly,
              textColor: context.style.color,
              size: context.style.fontSize.size * 5,
            );
          },
        },
        onLinkTap: (url) {
          print("Opening $url...");
        },
        onImageTap: (src) {
          print(src);
        },
        onImageError: (exception, stackTrace) {
          print(exception);
        },
      ),
    ));
  }
}
