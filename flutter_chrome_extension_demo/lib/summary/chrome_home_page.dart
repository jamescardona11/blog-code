import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter_chrome_extension_demo/summary/chrome_api.dart';

import 'gpt_client.dart';

class ChromeHomePage extends StatefulWidget {
  const ChromeHomePage({super.key});

  @override
  State<ChromeHomePage> createState() => _ChromePopupState();
}

class _ChromePopupState extends State<ChromeHomePage> {
  bool isLoading = false;
  final GPTClient summaryApiClient = GPTClient();

  String? summary;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Row(
          children: [
            FlutterLogo(size: 32),
            Text('Chrome Demo Extension'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Text('Choose which option to summarize'),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                  onPressed: _summaryAllPage,
                  child: const Text(
                    "All page",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                  ),
                  onPressed: _summarySelectedText,
                  child: const Text(
                    "Selected text",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Summary',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: isLoading ? const Center(child: CircularProgressIndicator()) : Text(summary ?? ''),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _summarySelectedText() async {}

  Future<void> _summaryAllPage() async {
    print('Summary all page');
    String url = await selectUrl();

    setState(() {
      isLoading = true;
    });

    summary = await summaryApiClient.getPageSummary(url) ?? 'Error fetching summary';

    setState(() {
      isLoading = false;
    });
  }

  Future<String> selectUrl() async {
    List tab = await promiseToFuture(
      query(ParameterQueryTabs(active: true, lastFocusedWindow: true)),
    );
    return tab[0].url;
  }
}
