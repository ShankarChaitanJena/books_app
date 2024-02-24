import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class List_View extends StatefulWidget {
  const List_View({Key? key}) : super(key: key);

  @override
  State<List_View> createState() => _List_ViewState();
}

class _List_ViewState extends State<List_View> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> leads = [];
  List<Map<String, dynamic>> suggestions = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.post(
        Uri.parse('https://api.thenotary.app/lead/getLeads'),
        body: {"notaryId": "643074200605c500112e0902"},
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body);
        if (responseData['status'] == 1) {
          setState(() {
            leads = List.from(responseData['leads']);
            suggestions = List.from(leads); // Initialize suggestions with all leads
          });
          print('Fetched ${leads.length} leads'); // Debugging print statement
        } else {
          throw Exception('API returned status other than 1');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error fetching data: $e'); // Debugging print statement
    }
  }

  void filterLeads(String query) {
    if (query.isEmpty) {
      setState(() {
        suggestions = List.from(leads); // Show all leads when query is empty
      });
    } else {
      List<Map<String, dynamic>> filteredLeads = leads
          .where((lead) =>
              lead['firstName'].toLowerCase().contains(query.toLowerCase()) ||
              lead['lastName'].toLowerCase().contains(query.toLowerCase()))
          .toList();

      setState(() {
        suggestions = filteredLeads;
      });
    }
    print('Filtered ${suggestions.length} leads'); // Debugging print statement
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Books App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[400],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                controller: searchController,
                onChanged: (query) {
                  filterLeads(query);
                },
                decoration: InputDecoration(
                  hintText: 'Enter your search ',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: suggestions.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    '${suggestions[index]['firstName']} ${suggestions[index]['lastName']}',
                  ),
                  subtitle: Text('Email: ${suggestions[index]['email']}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


