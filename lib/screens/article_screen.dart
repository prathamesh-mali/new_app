import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticlePage extends StatefulWidget {
  final String articleUrl;
  const ArticlePage({required this.articleUrl, super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  bool _error = false;
  bool _isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          if (!_error)
            WebView(
              onWebResourceError: (error) {
                setState(() {
                  _error = true;
                });
              },
              onPageFinished: (finish) {
                setState(() {
                  _isLoading = false;
                });
              },
              initialUrl: widget.articleUrl,
              javascriptMode: JavascriptMode.unrestricted,
            ),
          if (_error)
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline),
                  Text("Opps! something went wrong Please try again.")
                ],
              ),
            ),
          _isLoading
              ? const SpinKitThreeBounce(
                  color: Colors.grey,
                  size: 20,
                )
              : Stack()
        ],
      ),
    );
  }
}
