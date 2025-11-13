# Tawakkalna SDK Flutter - Example App

## Overview

A comprehensive Flutter example app demonstrating all V1 and V2 API methods in a single, easy-to-use interface.

## Screenshots Description

### Main Screen
- **App Bar**: "Tawakkalna SDK Demo" title
- **Action Button**: Large teal button "Load All Data" to fetch all information
- **Results List**: Scrollable list of expandable cards showing API results

### Result Cards
Each card displays:
- **Title**: Method name (e.g., "V2: Full Name", "V1: User ID")
- **Preview**: Quick preview of the result
- **Expandable Content**: Tap to see full details
- **Formatted Data**: Clean, readable presentation of complex objects

### Data Types Handled
- ✅ Simple values (strings, numbers, booleans)
- ✅ Dates and timestamps
- ✅ Lists and arrays
- ✅ Complex objects with nested properties
- ✅ Null values

## File Structure

```
example/
├── lib/
│   └── main.dart                 # Main app with all functionality
├── test/
│   └── widget_test.dart          # Widget tests
├── android/                      # Android platform files
├── ios/                          # iOS platform files
├── web/                          # Web platform files
├── pubspec.yaml                  # Dependencies
├── README.md                     # Quick start guide
└── EXAMPLE_GUIDE.md              # Detailed documentation
```

## Code Highlights

### 1. SDK Initialization
```dart
final Twk _twk = Twk(); // Uses demo implementation by default
```

### 2. Load All Data
```dart
Future<void> _loadAllData() async {
  setState(() {
    _isLoading = true;
    _results.clear();
  });

  try {
    // V2 API calls
    _results['V2: Token'] = await _twk.v2.generateToken();
    _results['V2: Full Name'] = await _twk.v2.getUserFullName();
    // ... more V2 calls
    
    // V1 API calls
    _results['V1: User ID'] = await _twk.v1.getUserId();
    _results['V1: Full Name'] = await _twk.v1.getUserFullName();
    // ... more V1 calls
  } catch (e) {
    _results['Error'] = e.toString();
  } finally {
    setState(() => _isLoading = false);
  }
}
```

### 3. Dynamic UI Building
```dart
Widget _buildResultCard(String title, dynamic value) {
  return Card(
    child: ExpansionTile(
      title: Text(title),
      subtitle: Text(_getPreview(value)),
      children: [
        Container(
          child: _buildValueWidget(value),
        ),
      ],
    ),
  );
}
```

## API Methods Demonstrated

### V2 API (5 methods)
1. `generateToken()` - Authentication token
2. `getUserFullName()` - Bilingual name
3. `getUserNationality()` - Nationality info
4. `getUserFamilyMembers()` - Family list
5. `getUserSponsors()` - Sponsor list

### V1 API (27 methods)
1. `getUserId()` - National ID
2. `getUserType()` - User type
3. `getUserBirthDate()` - Birth date
4. `getUserMobileNumber()` - Phone
5. `getUserGender()` - Gender
6. `getUserLocation()` - GPS location
7. `getUserNationality()` - Nationality
8. `getUserNationalityIso()` - ISO code
9. `getUserFullName()` - Full name
10. `getUserMaritalStatus()` - Marital status
11. `getUserHealthStatus()` - Health status
12. `getUserDisabilityType()` - Disability info
13. `getUserBloodType()` - Blood type
14. `getUserNationalAddress()` - Address list
15. `getUserDegreeType()` - Education
16. `getUserOccupation()` - Occupation
17. `getUserUnPaidViolations()` - Unpaid violations
18. `getUserPaidViolations()` - Paid violations
19. `getUserVehicles()` - Vehicle list
20. `getUserProfilePhoto()` - Photo URL
21. `getUserPassports()` - Passport info
22. `getUserIdExpiryDate()` - ID expiry
23. `getUserDocumentNumber()` - Doc number
24. `getUserBirthCity()` - Birth city
25. `getUserEmail()` - Email
26. `getUserIqamaType()` - Iqama type
27. `getDeviceInfo()` - Device info

## Running the Example

### Option 1: From Example Directory
```bash
cd example
flutter run
```

### Option 2: From Root Directory
```bash
flutter run -d <device> example/lib/main.dart
```

### Testing
```bash
cd example
flutter test
```

### Analysis
```bash
cd example
flutter analyze
```

## Customization Ideas

### Add Individual Method Buttons
Instead of "Load All Data", create buttons for each method:
```dart
ElevatedButton(
  onPressed: () async {
    final name = await _twk.v2.getUserFullName();
    setState(() => _results['Full Name'] = name);
  },
  child: Text('Get Full Name'),
)
```

### Add Parameters UI
For methods with parameters:
```dart
// Age range sliders
RangeSlider(
  values: _ageRange,
  min: 0,
  max: 100,
  onChanged: (values) => setState(() => _ageRange = values),
)

// Gender dropdown
DropdownButton<Gender>(
  value: _selectedGender,
  items: Gender.values.map((g) => 
    DropdownMenuItem(value: g, child: Text(g.name))
  ).toList(),
  onChanged: (value) => setState(() => _selectedGender = value),
)
```

### Export Results
Add export to JSON:
```dart
IconButton(
  icon: Icon(Icons.download),
  onPressed: () {
    final json = jsonEncode(_results);
    // Save to file
  },
)
```

### Add Search/Filter
```dart
TextField(
  decoration: InputDecoration(
    labelText: 'Search results',
    prefixIcon: Icon(Icons.search),
  ),
  onChanged: (query) => _filterResults(query),
)
```

## Performance Notes

- All API calls are made simultaneously (not sequentially)
- Results are cached in memory during the session
- UI updates only when loading starts/ends
- Expandable cards prevent rendering all content at once

## Best Practices Demonstrated

✅ Proper state management with StatefulWidget
✅ Error handling with try-catch
✅ Loading states for async operations
✅ Type-safe API usage
✅ Clean separation of concerns
✅ Responsive UI design
✅ Comprehensive testing
✅ Material Design 3 guidelines

## Next Steps

1. ✅ Run the example app
2. ✅ Explore different API methods
3. ✅ Modify UI to suit your needs
4. ✅ Add your own custom implementations
5. ✅ Integrate with real Tawakkalna SDK

## Support

For issues or questions:
- Check [README.md](../README.md)
- Review [EXAMPLE_GUIDE.md](EXAMPLE_GUIDE.md)
- Open an issue on GitHub
