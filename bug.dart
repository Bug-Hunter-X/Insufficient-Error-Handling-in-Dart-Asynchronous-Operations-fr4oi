```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Assuming JSON response
      final jsonData = jsonDecode(response.body);
      // Access data here
      print(jsonData['someKey']); 
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Error handling, but this is where a subtle bug can occur
    print('Error: $e'); // This prints the error, but it may not be descriptive enough
    rethrow; // Re-throw to handle error at a higher level
  }
}
```