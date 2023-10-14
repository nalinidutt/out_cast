import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Web Scraper',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const WebScraperPage(),
    );
  }
}

class WebScraperPage extends StatefulWidget {
  const WebScraperPage({super.key});

  @override
  _WebScraperPageState createState() => _WebScraperPageState();
}

class _WebScraperPageState extends State<WebScraperPage> {
  String? _scrapedData;

  Future<void> _scrapeWeb() async {
    final response = await http.get(Uri.parse('https://example.com'));
    if (response.statusCode == 200) {
      dom.Document document = parser.parse(response.body);

      // Extract data from the website using selectors
      dom.Element? titleElement = document.querySelector('title');
      setState(() {
        _scrapedData = titleElement?.text;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Web Scraper')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_scrapedData ?? 'No data scraped yet'),
            ElevatedButton(
              onPressed: _scrapeWeb,
              child: const Text('Scrape Data'),
            )
          ],
        ),
      ),
    );
  }
}
