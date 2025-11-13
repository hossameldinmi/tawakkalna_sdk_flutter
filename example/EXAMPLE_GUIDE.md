# Example App - Tawakkalna SDK Flutter

This example application demonstrates all available methods from both V1 and V2 APIs of the Tawakkalna SDK in a single scrollable interface.

## Features

### Single Screen Interface
- Clean, Material Design 3 UI
- Single "Load All Data" button to fetch all information
- Scrollable list of expandable cards showing results
- Each card displays a preview and can be expanded for full details

### V2 API Methods Demonstrated

1. **generateToken()** - Generate authentication token
2. **getUserFullName()** - Get user's full name (Arabic and English)
3. **getUserNationality()** - Get user's nationality information
4. **getUserFamilyMembers()** - Get list of family members
5. **getUserFamilyMembers(filters)** - Get filtered family members (e.g., age 18-30)
6. **getUserSponsors()** - Get list of sponsors

### V1 API Methods Demonstrated

1. **getUserId()** - National ID
2. **getUserType()** - User type (citizen/resident/visitor)
3. **getUserBirthDate()** - Birth date
4. **getUserMobileNumber()** - Mobile number
5. **getUserGender()** - Gender
6. **getUserLocation()** - Current location (lat/long)
7. **getUserNationality()** - Nationality name
8. **getUserNationalityIso()** - Nationality ISO code
9. **getUserFullName()** - Full name (V1 version)
10. **getUserMaritalStatus()** - Marital status
11. **getUserHealthStatus()** - Health status
12. **getUserDisabilityType()** - Disability type if any
13. **getUserBloodType()** - Blood type
14. **getUserNationalAddress()** - National address list
15. **getUserDegreeType()** - Education degree
16. **getUserOccupation()** - Occupation
17. **getUserUnPaidViolations()** - List of unpaid violations
18. **getUserPaidViolations()** - List of paid violations
19. **getUserVehicles()** - List of vehicles
20. **getUserProfilePhoto()** - Profile photo URL
21. **getUserPassports()** - Passport information
22. **getUserIdExpiryDate()** - ID expiry date
23. **getUserDocumentNumber()** - Document number
24. **getUserBirthCity()** - Birth city
25. **getUserEmail()** - Email address
26. **getUserIqamaType()** - Iqama type
27. **getDeviceInfo()** - Device information and capabilities

## Usage

1. Run the app using `flutter run`
2. Press the "Load All Data" button
3. Scroll through the results
4. Tap any card to expand and see full details

## Mock Data

The example uses the demo/mock implementation (`TwkApiV1DemoJsonImpl` and `TwkApiV2DemoJsonImpl`) by default, which loads data from:
- `/assets/mock_profile1.0.2.json`

This allows you to test all functionality without needing actual Tawakkalna integration.

## Testing

Run tests with:
```bash
flutter test
```

The tests verify:
- App loads correctly
- UI elements are present
- Load button triggers data fetch
- Results are displayed in cards

## Code Structure

### main.dart
- `MyApp` - Root application widget
- `TawakkalnaDemo` - Main demo screen (StatefulWidget)
- `_TawakkalnaDemoState` - State management and data loading
- Helper methods for building result cards and formatting values

### Key Components
- **Twk instance**: Created with default demo implementations
- **_results map**: Stores all API responses
- **_loadAllData()**: Async method that calls all V1 and V2 methods
- **_buildResultCard()**: Creates expandable cards for each result
- **_buildValueWidget()**: Formats different data types (primitives, lists, objects)

## Customization

To use real Tawakkalna integration instead of mock data:

```dart
// Instead of:
final Twk _twk = Twk();

// Use:
final Twk _twk = Twk(
  v1Api: YourRealV1Implementation(),
  v2Api: YourRealV2Implementation(),
);
```

## Next Steps

- Add individual buttons for each method
- Add input fields for methods that accept parameters
- Add export functionality for results
- Add error handling UI
- Add refresh indicators
- Add search/filter for results
