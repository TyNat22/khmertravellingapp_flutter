import 'package:flutter/material.dart';

import '../../model/place_model.dart';

class SearchBarHome extends StatefulWidget {
  const SearchBarHome({super.key});

  @override
  State<SearchBarHome> createState() => _SearchBarHomeState();
}

class _SearchBarHomeState extends State<SearchBarHome> {
  TextEditingController _searchController = TextEditingController();
  List<Place> _filteredPlaces = [];

  @override
  void initState() {
    super.initState();
    _filteredPlaces = topdestination; // Initially show all places
    _searchController.addListener(_filterPlaces);
  }

  void _filterPlaces() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredPlaces = topdestination.where((place) {
        return place.title.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Search Bar
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: "Search",
              hintText: "Type a place name",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          SizedBox(height: 20),
          // Filtered Results
          Expanded(
            child: _filteredPlaces.isNotEmpty
                ? ListView.builder(
                    itemCount: _filteredPlaces.length,
                    itemBuilder: (context, index) {
                      final place = _filteredPlaces[index];
                      return Card(
                        child: ListTile(
                          leading: Image.asset(
                            place.image,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(place.title),
                          subtitle: Text(place.location),
                          trailing: Text(
                            place.review,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text(
                      "No places found",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
