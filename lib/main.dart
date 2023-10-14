import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Walmart Web Scraper',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: WebScraperDemo(),
    );
  }
}

class WebScraperDemo extends StatefulWidget {
  @override
  _WebScraperDemoState createState() => _WebScraperDemoState();
}

class _WebScraperDemoState extends State<WebScraperDemo> {
  List<String> _headings = [];
  bool _loading = false;

  Future<void> _scrapeWeb() async {
    setState(() {
      _loading = true;
    });

    final response = await http.get(Uri.parse('https://example.com'));

    if (response.statusCode == 200) {
      dom.Document document = parser.parse(response.body);
      final headings = document.querySelectorAll('h1');

      setState(() {
        _headings = headings.map((h1) => h1.text).toList();
      });
    }

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web Scraper Demo'),
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _headings.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(_headings[index]));
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _scrapeWeb,
        child: Icon(Icons.cloud_download),
      ),
    );
  }
}