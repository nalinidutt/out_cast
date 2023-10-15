import 'package:flutter/material.dart';
import 'package:trial4/src/sample_feature/sample_item.dart';

class SampleItemDetailsView extends StatelessWidget {
  final SampleItem? item;

  const SampleItemDetailsView({Key? key, this.item}) : super(key: key);

  static const routeName = '/sample_item';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('${item?.title ?? "Unknown"}'),
        backgroundColor: Color.fromARGB(255, 111, 211, 114),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              child: Image.network(
                item?.imageURL ?? "",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item?.title ?? "No Title",
                    style: TextStyle(
                      fontSize: 28, // Increase title font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10), // Reduce spacing between title and cuisine
                  Text(
                    'Cuisine: ${item?.cuisine ?? "No Cuisine"}',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey, // Use a subdued color
                    ),
                  ),
                  SizedBox(height: 16), // Reduce spacing between cuisine and description
                  Text(
                    'Description:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${item?.description ?? "No Description"}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey, // Use a subdued color
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Recipe:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Step 1:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${item?.step1 ?? ""}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey, // Use a subdued color
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Step 2:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${item?.step2 ?? ""}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey, // Use a subdued color
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Step 3:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${item?.step3 ?? ""}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey, // Use a subdued color
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Step 4:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${item?.step4 ?? ""}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey, // Use a subdued color
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Step 5:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${item?.step5 ?? ""}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey, // Use a subdued color
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
