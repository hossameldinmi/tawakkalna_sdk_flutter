# Example App - Tawakkalna SDK Flutter

This example application demonstrates all available methods from both V1 and V2 APIs of the Tawakkalna SDK through an interactive, organized interface.

## Features

### Interactive Interface
- Modern Material Design 3 UI with organized sections
- 14 categorized sections with 50+ API methods
- Individual buttons for each API method
- Split-pane layout: API buttons on left, results/logs on right
- Real-time results display with error handling
- Integrated logger with statistics and filtering
- Color-coded status indicators (success/error)

### API Methods by Category

#### Authentication (2 methods)
1. **generateToken()** - Generate authentication token
2. **authenticateBiometric()** - Authenticate with biometrics

#### Personal Information (8 methods)
1. **getUserId()** - Get user's national/Iqama ID
2. **getUserType()** - Get user type (citizen/resident/visitor)
3. **getUserFullName()** - Get full name
4. **getUserGender()** - Get user's gender
5. **getUserBirthDate()** - Get user's birth date
6. **getUserBirthCity()** - Get user's birth city
7. **getUserNationality()** - Get nationality
8. **getUserNationalityIso()** - Get nationality ISO code

#### Contact Information (4 methods)
1. **getUserMobileNumber()** - Get user's mobile number
2. **getUserEmail()** - Get user's email address
3. **getUserLocation()** - Get GPS location
4. **getUserNationalAddress()** - Get national address(es)

#### Documents (5 methods)
1. **getUserPassports()** - Get passport information
2. **getUserIdExpiryDate()** - Get ID expiry date
3. **getUserDocumentNumber()** - Get document number
4. **getUserIqamaType()** - Get Iqama type
5. **getUserProfilePhoto()** - Get user's profile photo

#### Health & Status (4 methods)
1. **getUserBloodType()** - Get blood type
2. **getUserHealthStatus()** - Get health status
3. **getUserDisabilityType()** - Get disability type
4. **getUserMaritalStatus()** - Get marital status

#### Education & Career (2 methods)
1. **getUserDegreeType()** - Get education degree type
2. **getUserOccupation()** - Get occupation

#### Family & Relationships (2 methods)
1. **getUserFamilyMembers()** - Get family members (with optional filtering)
2. **getUserSponsors()** - Get sponsors (with optional filtering)

#### Vehicles & Violations (3 methods)
1. **getUserVehicles()** - Get registered vehicles
2. **getUserUnPaidViolations()** - Get unpaid traffic violations
3. **getUserPaidViolations()** - Get paid traffic violations

#### Gallery (4 methods)
1. **getGallerySingle()** - Select single image from gallery
2. **getGalleryMulti()** - Select multiple images from gallery
3. **getGallerySingleVideo()** - Select single video from gallery
4. **getGalleryMultiVideo()** - Select multiple videos from gallery

#### Camera (2 methods)
1. **getCameraPhoto()** - Capture photo with camera
2. **getCameraVideo()** - Record video with camera

#### Files (2 methods)
1. **getFileBase64()** - Get file as base64 string
2. **getFileId()** - Get file ID

#### Permissions (5 methods)
1. **askUserLocationPermission()** - Request location permission
2. **askUserPreciseLocationPermission()** - Request precise location permission
3. **askCameraPermission()** - Request camera permission
4. **askGalleryPermission()** - Request gallery permission
5. **askPushNotificationPermission()** - Request notification permission

#### Scanner (1 method)
1. **scanCode()** - Scan QR/Barcode

#### Device Info (1 method)
1. **getDeviceInfo()** - Get device information

## Usage

### Running the Example

```bash
# For web (recommended for testing)
cd example
flutter run -d chrome

# For mobile/desktop
flutter run
```

### Using the App

1. **Select a Section**: Sections are organized in expandable cards
2. **Click Any Method Button**: Each button triggers its corresponding API call
3. **View Results**: Results appear on the right side
   - Green cards indicate success
   - Red cards indicate errors
4. **Toggle Logs**: Click the article icon in the app bar to view SDK logs
5. **Clear Results**: Use the delete icon to clear all results

### Statistics Dashboard

The app shows real-time statistics when results are present:
- **Total**: Total API calls made
- **Success**: Successful calls
- **Errors**: Failed calls

When logs are visible, it also shows:
- **Total**: Total log entries
- **Debug**: Debug messages
- **Info**: Info messages
- **Warn**: Warning messages
- **Error**: Error messages

## Mock Data

The example uses the demo/mock implementation by default:
- **TwkApiV1DemoJsonImpl** - Mock V1 API
- **TwkApiV2DemoJsonImpl** - Mock V2 API

Mock data is loaded from:
- `assets/mock_profile1.0.2.json`

This allows you to test all functionality without needing actual Tawakkalna integration.

### Mock Data Features
- Realistic Saudi Arabian user profiles
- Multiple family members with diverse demographics
- Vehicle registrations and traffic violations
- Passport and document information
- National addresses in Saudi format
- Health and education data
- Gallery images and file data

## Testing

Run tests with:
```bash
flutter test
```

The tests verify:
- App loads correctly
- UI elements are present
- API calls can be triggered
- Results are displayed correctly
- Error handling works

## Code Structure

### main.dart

#### Main Components
- **MyApp** - Root application widget with Material Design 3 theme
- **TawakkalnaDemo** - Main demo screen (StatefulWidget)
- **_TawakkalnaDemoState** - State management and API call handling

#### Key State Variables
- `_twk` - TwkHelper instance with default mock implementations
- `_logger` - TwkLogger instance for debugging
- `_results` - Map storing all API call results
- `_loadingMethods` - Set tracking currently loading methods
- `_showLogs` - Boolean controlling log viewer visibility

#### Key Methods
- `_callMethod()` - Generic method to call any API with error handling
- `_buildSection()` - Creates expandable section cards
- `_buildMethodButton()` - Creates individual API method buttons
- `_buildResultCard()` - Creates expandable result cards
- `_buildValueWidget()` - Formats different data types for display
- `_buildLogsView()` - Displays SDK logs with filtering
- `_buildImageThumbnail()` - Displays image thumbnails for TwkFile objects

### UI Features

#### Result Display
- **Expandable Cards**: Each result is shown in an expandable card
- **Type Detection**: Automatically formats different data types
  - Primitives (strings, numbers, booleans)
  - Lists (arrays of items)
  - Objects (structured data)
  - Images (TwkFile with binary data)
- **Error Display**: Detailed error messages with stack traces
- **Selectable Text**: All results are selectable for copying

#### Image Handling
- Gallery and camera results show image thumbnails
- 150x150px thumbnails with metadata
- Image file name and MIME type displayed
- Multiple images shown in a grid layout

## Customization

### Using Real Tawakkalna Integration

To use real Tawakkalna integration instead of mock data:

```dart
// In main.dart, replace:
final _twk = TwkHelper();

// With:
final _twk = TwkHelper(
  v1Api: TwkApiV1SdkImpl(),
  v2Api: TwkApiV2SdkImpl(),
);
```

### Web Platform Setup

For web deployment, ensure your `web/index.html` includes the appropriate JavaScript bridge:

```html
<!-- For development with mock data -->
<script src="assets/packages/tawakkalna_sdk_flutter/assets/web/twkhelper_mock.js"></script>

<!-- For production in Tawakkalna app -->
<script src="assets/packages/tawakkalna_sdk_flutter/assets/web/twkhelper.js"></script>
```

### Customizing the Logger

```dart
// Enable/disable logging
TwkLogger.instance.setEnabled(true);

// Listen to log events
TwkLogger.instance.addListener(() {
  // Handle new logs
});

// Clear logs
TwkLogger.instance.clear();

// Get statistics
final stats = TwkLogger.instance.getStatistics();
```

## Advanced Features

### Filtered Queries

Some methods support filtering parameters:

```dart
// Get family members aged 18-30
_buildMethodButton(
  'Family (18-30)',
  'Family (Filtered)',
  Icons.filter_list,
  () => _twk.getUserFamilyMembers(minAge: 18, maxAge: 30),
)

// Get female family members
await _twk.getUserFamilyMembers(gender: Gender.female);

// Get adult sponsors
await _twk.getUserSponsors(minAge: 25, maxAge: 65);
```

### Error Handling

All API calls are wrapped with try-catch:
- Errors are displayed in red cards
- Full error message and stack trace available
- Logger records all errors for debugging

### Performance

- Individual method calls prevent unnecessary data loading
- Results are cached in the state
- Loading indicators show active operations
- Memory-efficient image handling

## Best Practices

1. **Test with Mock Data First**: Always test with mock implementation before deploying
2. **Check Logs**: Use the integrated logger to debug issues
3. **Handle Errors**: The app demonstrates proper error handling patterns
4. **Clear Results**: Clear results between test sessions to avoid confusion
5. **Monitor Performance**: Watch for memory usage with large result sets

## Troubleshooting

### Issue: API returns no data
- Verify you're using the correct implementation (mock vs SDK)
- Check the logs for error messages
- Ensure mock data file is properly loaded

### Issue: Images not displaying
- Check that TwkFile objects have valid binary data
- Verify MIME types are correct
- Check browser console for image loading errors

### Issue: Web platform not working
- Ensure JavaScript bridge file is included in web/index.html
- Check browser console for JavaScript errors
- Verify assets are properly loaded

## Next Steps

Potential enhancements:
- Add search functionality for results
- Add export/download results feature
- Add comparison between V1 and V2 API results
- Add performance metrics
- Add request/response time tracking
- Add dark mode support
