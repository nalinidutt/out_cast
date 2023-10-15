import 'package:flutter/material.dart';
import 'sample_item.dart';
import 'sample_item_details_view.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends StatelessWidget {
  const SampleItemListView({
    super.key,
    this.items = const [
      SampleItem("Pad Thai", "Asian", 2, "https://hips.hearstapps.com/hmg-prod/images/pad-thai-index-6477629462a38.jpg?crop=0.6666666666666666xw:1xh;center,top&resize=1200:*", "Pad Thai is a popular Thai stir-fried noodle dish known for its sweet, salty, and tangy flavors. It typically features rice noodles stir-fried with shrimp, tofu, or chicken, along with ingredients like eggs, bean sprouts, and chopped peanuts. The dish is often seasoned with a sauce made from tamarind, fish sauce, and sugar, creating a harmonious blend of flavors and textures."), 
      SampleItem("Sushi", "Asian", 2, "https://hips.hearstapps.com/hmg-prod/images/spicy-crab-rolls4-1654808938.jpg?crop=0.668xw:1.00xh;0.167xw,0&resize=1200:*", "Sushi is a traditional Japanese dish known for its simplicity and elegance. It typically consists of vinegared rice, fresh seafood, and vegetables, often wrapped in seaweed. Sushi is appreciated for its delicate flavors and artistic presentation, making it a popular and iconic culinary choice worldwide."), 
      SampleItem("Carrot Cake", "Dessert", 2, "https://static01.nyt.com/images/2020/11/01/dining/Carrot-Cake-textless/Carrot-Cake-textless-threeByTwoMediumAt2X.jpg", ""), 
      SampleItem("Fettucine Alfredo", "Italian", 2, "https://www.modernhoney.com/wp-content/uploads/2018/08/Fettuccine-Alfredo-Recipe-1.jpg", ""), 
      SampleItem("Chicken and Waffles", "American", 2, "https://www.wellseasonedstudio.com/wp-content/uploads/2019/03/Chicken-and-waffles-18.jpg", ""), 
      SampleItem("Butter Chicken", "Indian", 2, "https://www.cookingclassy.com/wp-content/uploads/2021/01/butter-chicken-4.jpg", "Butter chicken is a popular Indian dish known for its creamy and flavorful tomato-based sauce. Tender pieces of marinated chicken are simmered in this rich sauce, which is often made with a mixture of butter, cream, and various spices, including garam masala. The dish is renowned for its luscious and mildly spicy taste, making it a beloved choice in Indian cuisine."), 
      SampleItem("Lamb Gyro", "Mediterranian", 2, "https://hips.hearstapps.com/hmg-prod/images/gyro-sandwich1-1650490757.jpg?crop=0.683xw:1.00xh;0.167xw,0&resize=1200:*", ""), 
      SampleItem("Vegetable Soup", "American", 2, "https://www.eatingbirdfood.com/wp-content/uploads/2022/08/vegetable-soup-hero.jpg", ""), 
      SampleItem("Mac and Cheese", "American", 0, "https://pinchofyum.com/wp-content/uploads/Instant-Pot-Mac-and-Cheese-Square.jpg", ""), 
      SampleItem("Pan Seared Steak", "American", 2, "https://www.spendwithpennies.com/wp-content/uploads/2022/08/1200-Perfect-Ribeye-Steak-SpendWithPennies.jpg", "")
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
              onChanged: (value) {/*
                TextEditingController _searchController = TextEditingController();
                String query = _searchController.text;
                List<String> filteredItems = [];

                setState(() {
                filteredItems = items
                    .where((item) => item.toLowerCase().contains(query.toLowerCase()))
                    .toList();
                });*/
              },
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.green,
                    width: 10.0
                    ),
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SampleItemDetailsView(item: item),
                      ),
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
                        Hero(
                          tag: item.title, // Use the same tag as in the list view
                          child: Image.network(
                            item.imageURL,
                            fit: BoxFit.cover,
                            height: 150,
                          ),
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
}

