import 'package:flutter/material.dart';
import 'package:trial4/src/sample_feature/sample_item.dart';

class SampleItemDetailsView extends StatelessWidget {
  final SampleItem? item;

  const SampleItemDetailsView({Key? key, this.item}) : super(key: key);

  static const routeName = '/sample_item';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green, // Use a subtle color
        centerTitle: true, // Center the title
        title: Text(item?.title ?? "Unknown"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              child: Image.network(
                item?.imageURL ?? "placeholder_image_url", // Use a placeholder image
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cuisine: ${item?.cuisine ?? "No Cuisine"}',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey, // Use a subdued color
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Description:',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${item?.description ?? "No Description"}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Recipe:',
                    style: TextStyle(
                      fontSize: 18,
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




