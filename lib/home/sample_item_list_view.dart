import 'package:flutter/material.dart';
// import 'my_flutter_app_icons.dart';

// import '../settings/settings_view.dart';
import 'sample_item.dart';
import 'sample_item_details_view.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends StatelessWidget {
  const SampleItemListView({
    super.key,
    this.items = const [
      SampleItem("Pad Thai", "Asian", 2, "https://hips.hearstapps.com/hmg-prod/images/pad-thai-index-6477629462a38.jpg?crop=0.6666666666666666xw:1xh;center,top&resize=1200:*"), 
      SampleItem("Sushi", "Asian", 2, "https://hips.hearstapps.com/hmg-prod/images/spicy-crab-rolls4-1654808938.jpg?crop=0.668xw:1.00xh;0.167xw,0&resize=1200:*"), 
      SampleItem("Carrot Cake", "Dessert", 2, "https://static01.nyt.com/images/2020/11/01/dining/Carrot-Cake-textless/Carrot-Cake-textless-threeByTwoMediumAt2X.jpg"), 
      SampleItem("Fettucine Alfredo", "Italian", 2, "https://www.modernhoney.com/wp-content/uploads/2018/08/Fettuccine-Alfredo-Recipe-1.jpg"), 
      SampleItem("Chicken and Waffles", "American", 2, "https://www.wellseasonedstudio.com/wp-content/uploads/2019/03/Chicken-and-waffles-18.jpg"), 
      SampleItem("Butter Chicken", "Indian", 2, "https://www.cookingclassy.com/wp-content/uploads/2021/01/butter-chicken-4.jpg"), 
      SampleItem("Lamb Gyro", "Mediterranian", 2, "https://hips.hearstapps.com/hmg-prod/images/gyro-sandwich1-1650490757.jpg?crop=0.683xw:1.00xh;0.167xw,0&resize=1200:*"), 
      SampleItem("Vegetable Soup", "American", 2, "https://www.eatingbirdfood.com/wp-content/uploads/2022/08/vegetable-soup-hero.jpg"), 
      SampleItem("Mac and Cheese", "American", 0, "https://pinchofyum.com/wp-content/uploads/Instant-Pot-Mac-and-Cheese-Square.jpg"), 
      SampleItem("Pan Seared Steak", "American", 2, "https://www.spendwithpennies.com/wp-content/uploads/2022/08/1200-Perfect-Ribeye-Steak-SpendWithPennies.jpg")
      ],
  });

  static const routeName = '/';
  final List<SampleItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                // Implement your search logic here
                // You can filter the items based on the search text
                // and update the UI accordingly.
              },
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return InkWell(
                  onTap: () {
                    Navigator.restorablePushNamed(
                      context,
                      SampleItemDetailsView.routeName,
                      arguments: item,
                    );
                  },
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                          ),
                        ),
                        Image.network(
                          item.imageURL,
                          fit: BoxFit.cover,
                          height: 150,
                        ),
                        ListTile(
                          title: Text(
                            item.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(item.cuisine),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  
  
  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'sampleItemListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          switch (item.progress) {
            case 0:
              String imageURL = 'assets/images/progress0.png';
              break;
            case 1:
              String imageURL = 'assets/images/progress1.png'; 
              break;
            case 2: 
              String imageURL = 'assets/images/progress2.png';
              break;
          }

          /*return ListTile(
            title: Text('${item.title}'),
            leading: const CircleAvatar(
              // Display the Flutter Logo image asset.
              
              foregroundImage: AssetImage('assets/images/flutter_logo.png'),
            ),
            onTap: () {
              // Navigate to the details page. If the user leaves and returns to
              // the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(
                context,
                SampleItemDetailsView.routeName,
              );
            }
          );*/

          return Card(
            child: Column(
              children: [
                Image.network(item.imageURL),
                ListTile(
                  title: Text(item.title),
                  subtitle: Text(item.cuisine),
                ),
              ],
            ),
        );

        },
      ),
    );
  }*/
}
