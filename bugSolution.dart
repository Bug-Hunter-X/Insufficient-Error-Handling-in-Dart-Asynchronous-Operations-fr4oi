```dart
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      print(jsonData['someKey']);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } on SocketException catch (e) {
    print('Network error: $e');
  } on FormatException catch (e) {
    print('JSON decoding error: $e');
  } on Exception catch (e, StackTrace stackTrace) {
    print('An error occurred: $e
Stack trace:
$stackTrace');
  } catch (e) {
    print('Unknown error: $e'); // For unexpected errors
  }
}
```