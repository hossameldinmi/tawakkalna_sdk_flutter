import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tawakkalna_sdk_flutter/twk.dart';

void main() {
  EquatableConfig.stringify = true;
  // Initialize logger
  final logger = TwkLogger();
  logger.info('Application started', source: 'main');
  runApp(const MyApp());
}

class ApiError {
  final String method;
  final String error;
  final String stackTrace;

  ApiError({required this.method, required this.error, required this.stackTrace});

  @override
  String toString() => 'Error in $method: $error';
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tawakkalna SDK Demo',
      theme: ThemeData(primarySwatch: Colors.teal, useMaterial3: true),
      home: const TawakkalnaDemo(),
    );
  }
}

class TawakkalnaDemo extends StatefulWidget {
  const TawakkalnaDemo({super.key});

  @override
  State<TawakkalnaDemo> createState() => _TawakkalnaDemoState();
}

class _TawakkalnaDemoState extends State<TawakkalnaDemo> {
  final _twk = Twk();
  final _logger = TwkLogger();
  final Map<String, dynamic> _results = {};
  final Set<String> _loadingMethods = {};
  bool _showLogs = false;

  @override
  void initState() {
    super.initState();
    _logger.addListener(_onNewLog);
    _logger.info('Demo screen initialized', source: 'TawakkalnaDemo');
  }

  @override
  void dispose() {
    _logger.removeListener(_onNewLog);
    super.dispose();
  }

  void _onNewLog(LogEntry log) {
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _callMethod(String key, Future<dynamic> Function() apiCall) async {
    setState(() {
      _loadingMethods.add(key);
    });

    _logger.debug('Calling API method: $key', source: 'API Call');

    try {
      final result = await apiCall();
      _logger.info('API call succeeded: $key', source: 'API Call', data: result);
      setState(() {
        _results[key] = result;
      });
    } catch (e, stackTrace) {
      _logger.error('API call failed: $key', source: 'API Call', data: e.toString());
      setState(() {
        _results[key] = ApiError(method: key, error: e.toString(), stackTrace: stackTrace.toString());
      });
    } finally {
      setState(() {
        _loadingMethods.remove(key);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final errorCount = _results.values.whereType<ApiError>().length;
    final successCount = _results.length - errorCount;
    final logStats = _logger.getStatistics();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tawakkalna SDK Demo'),
        elevation: 2,
        actions: [
          IconButton(
            icon: Icon(_showLogs ? Icons.article : Icons.article_outlined),
            tooltip: _showLogs ? 'Hide Logs' : 'Show Logs',
            onPressed: () {
              setState(() {
                _showLogs = !_showLogs;
              });
              _logger.debug('Toggled logs view: $_showLogs', source: 'UI');
            },
          ),
          if (_showLogs && _logger.logs.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.cleaning_services),
              tooltip: 'Clear Logs',
              onPressed: () {
                setState(() {
                  _logger.clear();
                });
                _logger.info('Logs cleared', source: 'UI');
              },
            ),
          if (_results.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_sweep),
              tooltip: 'Clear All Results',
              onPressed: () {
                setState(() => _results.clear());
                _logger.info('Results cleared', source: 'UI');
              },
            ),
        ],
      ),
      body: Row(
        children: [
          // Left sidebar with buttons
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                border: Border(right: BorderSide(color: Colors.grey[300]!)),
              ),
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  if (_results.isNotEmpty) ...[
                    Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: errorCount > 0 ? Colors.orange[50] : Colors.green[50],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: errorCount > 0 ? Colors.orange[300]! : Colors.green[300]!),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildCompactStat('Total', _results.length.toString(), Colors.blue, Icons.list),
                          _buildCompactStat('Success', successCount.toString(), Colors.green, Icons.check_circle),
                          _buildCompactStat('Errors', errorCount.toString(), Colors.red, Icons.error),
                        ],
                      ),
                    ),
                  ],
                  if (_showLogs) ...[
                    Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.blue[300]!),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildCompactStat('Total', logStats['total'].toString(), Colors.blue, Icons.list_alt),
                              _buildCompactStat('Debug', logStats['debug'].toString(), Colors.grey, Icons.bug_report),
                              _buildCompactStat('Info', logStats['info'].toString(), Colors.teal, Icons.info),
                              _buildCompactStat('Warn', logStats['warning'].toString(), Colors.orange, Icons.warning),
                              _buildCompactStat('Error', logStats['error'].toString(), Colors.red, Icons.error),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                  _buildSection('V2 API Methods', Icons.api, Colors.purple, [
                    _buildMethodButton('Generate Token', 'V2: Token', Icons.vpn_key, () => _twk.generateToken()),
                    _buildMethodButton('Get Full Name', 'V2: Full Name', Icons.person, () => _twk.getUserFullName()),
                    _buildMethodButton(
                      'Get Nationality',
                      'V2: Nationality',
                      Icons.flag,
                      () => _twk.getUserNationality(),
                    ),
                    _buildMethodButton(
                      'Get Family Members',
                      'V2: Family Members',
                      Icons.family_restroom,
                      () => _twk.getUserFamilyMembers(),
                    ),
                    _buildMethodButton(
                      'Get Family (18-30)',
                      'V2: Family (Filtered)',
                      Icons.filter_list,
                      () => _twk.getUserFamilyMembers(minAge: 18, maxAge: 30),
                    ),
                    _buildMethodButton('Get Sponsors', 'V2: Sponsors', Icons.business, () => _twk.getUserSponsors()),
                  ]),
                  const SizedBox(height: 16),
                  _buildSection('V1 Personal Info', Icons.person_outline, Colors.blue, [
                    _buildMethodButton('User ID', 'V1: User ID', Icons.badge, () => _twk.getUserId()),
                    _buildMethodButton('User Type', 'V1: User Type', Icons.category, () => _twk.getUserType()),
                    _buildMethodButton('Full Name', 'V1: Full Name', Icons.person, () => _twk.getUserFullName()),
                    _buildMethodButton('Gender', 'V1: Gender', Icons.wc, () => _twk.getUserGender()),
                    _buildMethodButton('Birth Date', 'V1: Birth Date', Icons.cake, () => _twk.getUserBirthDate()),
                    _buildMethodButton(
                      'Birth City',
                      'V1: Birth City',
                      Icons.location_city,
                      () => _twk.getUserBirthCity(),
                    ),
                    _buildMethodButton('Nationality', 'V1: Nationality', Icons.flag, () => _twk.getUserNationality()),
                    _buildMethodButton(
                      'Nationality ISO',
                      'V1: Nationality ISO',
                      Icons.outlined_flag,
                      () => _twk.getUserNationalityIso(),
                    ),
                  ]),
                  const SizedBox(height: 16),
                  _buildSection('V1 Contact Info', Icons.contact_page, Colors.orange, [
                    _buildMethodButton(
                      'Mobile Number',
                      'V1: Mobile Number',
                      Icons.phone,
                      () => _twk.getUserMobileNumber(),
                    ),
                    _buildMethodButton('Email', 'V1: Email', Icons.email, () => _twk.getUserEmail()),
                    _buildMethodButton('Location', 'V1: Location', Icons.location_on, () => _twk.getUserLocation()),
                    _buildMethodButton(
                      'National Address',
                      'V1: National Address',
                      Icons.home,
                      () => _twk.getUserNationalAddress(),
                    ),
                  ]),
                  const SizedBox(height: 16),
                  _buildSection('V1 Documents', Icons.description, Colors.teal, [
                    _buildMethodButton(
                      'Passports',
                      'V1: Passports',
                      Icons.airplane_ticket,
                      () => _twk.getUserPassports(),
                    ),
                    _buildMethodButton(
                      'ID Expiry Date',
                      'V1: ID Expiry Date',
                      Icons.event,
                      () => _twk.getUserIdExpiryDate(),
                    ),
                    _buildMethodButton(
                      'Document Number',
                      'V1: Document Number',
                      Icons.numbers,
                      () => _twk.getUserDocumentNumber(),
                    ),
                    _buildMethodButton(
                      'Iqama Type',
                      'V1: Iqama Type',
                      Icons.card_membership,
                      () => _twk.getUserIqamaType(),
                    ),
                    _buildMethodButton(
                      'Profile Photo',
                      'V1: Profile Photo',
                      Icons.photo,
                      () => _twk.getUserProfilePhoto(),
                    ),
                  ]),
                  const SizedBox(height: 16),
                  _buildSection('V1 Health & Status', Icons.health_and_safety, Colors.red, [
                    _buildMethodButton('Blood Type', 'V1: Blood Type', Icons.bloodtype, () => _twk.getUserBloodType()),
                    _buildMethodButton(
                      'Health Status',
                      'V1: Health Status',
                      Icons.medical_services,
                      () => _twk.getUserHealthStatus(),
                    ),
                    _buildMethodButton(
                      'Disability Type',
                      'V1: Disability Type',
                      Icons.accessible,
                      () => _twk.getUserDisabilityType(),
                    ),
                    _buildMethodButton(
                      'Marital Status',
                      'V1: Marital Status',
                      Icons.favorite,
                      () => _twk.getUserMaritalStatus(),
                    ),
                  ]),
                  const SizedBox(height: 16),
                  _buildSection('V1 Education & Career', Icons.school, Colors.indigo, [
                    _buildMethodButton('Degree Type', 'V1: Degree Type', Icons.school, () => _twk.getUserDegreeType()),
                    _buildMethodButton('Occupation', 'V1: Occupation', Icons.work, () => _twk.getUserOccupation()),
                  ]),
                  const SizedBox(height: 16),
                  _buildSection('V1 Vehicles & Violations', Icons.directions_car, Colors.brown, [
                    _buildMethodButton('Vehicles', 'V1: Vehicles', Icons.car_rental, () => _twk.getUserVehicles()),
                    _buildMethodButton(
                      'Unpaid Violations',
                      'V1: Unpaid Violations',
                      Icons.warning,
                      () => _twk.getUserUnPaidViolations(),
                    ),
                    _buildMethodButton(
                      'Paid Violations',
                      'V1: Paid Violations',
                      Icons.check_circle_outline,
                      () => _twk.getUserPaidViolations(),
                    ),
                  ]),
                  const SizedBox(height: 16),
                  _buildSection('V1 Device Info', Icons.devices, Colors.cyan, [
                    _buildMethodButton(
                      'Device Info',
                      'V1: Device Info',
                      Icons.phone_android,
                      () => _twk.getDeviceInfo(),
                    ),
                  ]),
                ],
              ),
            ),
          ),
          // Right side with results or logs
          Expanded(
            flex: 3,
            child: _showLogs
                ? _buildLogsView()
                : _results.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.touch_app, size: 64, color: Colors.grey[400]),
                        const SizedBox(height: 16),
                        Text(
                          'Tap any button to call an API method',
                          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _results.length,
                    itemBuilder: (context, index) {
                      final key = _results.keys.elementAt(index);
                      final value = _results[key];
                      return _buildResultCard(key, value);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, IconData icon, Color color, List<Widget> buttons) {
    return Card(
      elevation: 1,
      child: ExpansionTile(
        initiallyExpanded: true,
        leading: Icon(icon, color: color),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: color),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: buttons),
          ),
        ],
      ),
    );
  }

  Widget _buildMethodButton(String label, String key, IconData icon, Future<dynamic> Function() apiCall) {
    final isLoading = _loadingMethods.contains(key);
    final hasResult = _results.containsKey(key);
    final isError = hasResult && _results[key] is ApiError;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ElevatedButton.icon(
        onPressed: isLoading ? null : () => _callMethod(key, apiCall),
        icon: isLoading
            ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
            : Icon(hasResult ? (isError ? Icons.error : Icons.check_circle) : icon, size: 18),
        label: Text(label, style: const TextStyle(fontSize: 13)),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 40),
          alignment: Alignment.centerLeft,
          backgroundColor: hasResult ? (isError ? Colors.red[100] : Colors.green[50]) : null,
          foregroundColor: hasResult ? (isError ? Colors.red[900] : Colors.green[900]) : null,
        ),
      ),
    );
  }

  Widget _buildCompactStat(String label, String value, Color color, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
        ),
        Text(label, style: TextStyle(fontSize: 10, color: Colors.grey[700])),
      ],
    );
  }

  Widget _buildResultCard(String title, dynamic value) {
    final isError = value is ApiError;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      color: isError ? Colors.red[50] : null,
      child: ExpansionTile(
        leading: isError
            ? const Icon(Icons.error, color: Colors.red)
            : const Icon(Icons.check_circle, color: Colors.green),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: isError ? Colors.red[900] : null),
        ),
        subtitle: Text(
          _getPreview(value),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 12, color: isError ? Colors.red[700] : Colors.grey),
        ),
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isError ? Colors.red[50] : Colors.grey[50],
              border: Border(top: BorderSide(color: isError ? Colors.red[200]! : Colors.grey[300]!)),
            ),
            child: _buildValueWidget(value),
          ),
        ],
      ),
    );
  }

  String _getPreview(dynamic value) {
    if (value == null) return 'null';
    if (value is ApiError) return '❌ ${value.error.split('\n').first}';
    if (value is List) return '${value.length} items';
    if (value is Map) return '${value.length} fields';
    final str = value.toString();
    return str.length > 50 ? '${str.substring(0, 50)}...' : str;
  }

  Widget _buildValueWidget(dynamic value) {
    if (value == null) {
      return const Text(
        'null',
        style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
      );
    }

    // Handle errors specially
    if (value is ApiError) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.red[100],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.red[300]!),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.error_outline, color: Colors.red[900], size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'Error Details',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red[900], fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text('Method: ${value.method}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                const SizedBox(height: 8),
                Text(
                  'Error:',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red[900], fontSize: 13),
                ),
                const SizedBox(height: 4),
                SelectableText(
                  value.error,
                  style: const TextStyle(fontFamily: 'monospace', fontSize: 12, color: Colors.black87),
                ),
                const SizedBox(height: 12),
                ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  title: Text(
                    'Stack Trace',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red[900], fontSize: 12),
                  ),
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
                      child: SelectableText(
                        value.stackTrace,
                        style: const TextStyle(fontFamily: 'monospace', fontSize: 10, color: Colors.black54),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    }

    if (value is List) {
      if (value.isEmpty) {
        return const Text(
          '[] (Empty list)',
          style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
        );
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: value.asMap().entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Item ${entry.key + 1}',
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                  ),
                  const SizedBox(height: 8),
                  Text(_formatValue(entry.value), style: const TextStyle(fontFamily: 'monospace')),
                ],
              ),
            ),
          );
        }).toList(),
      );
    }

    return SelectableText(_formatValue(value), style: const TextStyle(fontFamily: 'monospace', fontSize: 13));
  }

  String _formatValue(dynamic value) {
    if (value == null) return 'null';

    // Handle custom objects with toString()
    final str = value.toString();

    // If it's already formatted (contains newlines), return as is
    if (str.contains('\n')) {
      return str;
    }

    // For simple values, just return the string
    return str;
  }

  Widget _buildLogsView() {
    final logs = _logger.logs;

    if (logs.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.article_outlined, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'No logs yet',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Logs will appear here as you interact with the SDK',
              style: TextStyle(fontSize: 12, color: Colors.grey[500]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: logs.length,
      reverse: true, // Show newest logs at the top
      itemBuilder: (context, index) {
        final log = logs[logs.length - 1 - index];
        return _buildLogEntry(log);
      },
    );
  }

  Widget _buildLogEntry(LogEntry log) {
    Color levelColor;
    Color backgroundColor;

    switch (log.level) {
      case LogLevel.debug:
        levelColor = Colors.grey[700]!;
        backgroundColor = Colors.grey[50]!;
        break;
      case LogLevel.info:
        levelColor = Colors.teal[700]!;
        backgroundColor = Colors.teal[50]!;
        break;
      case LogLevel.warning:
        levelColor = Colors.orange[700]!;
        backgroundColor = Colors.orange[50]!;
        break;
      case LogLevel.error:
        levelColor = Colors.red[700]!;
        backgroundColor = Colors.red[50]!;
        break;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      color: backgroundColor,
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(log.levelIcon, style: const TextStyle(fontSize: 16)),
                const SizedBox(width: 8),
                Text(
                  log.levelName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: levelColor),
                ),
                const SizedBox(width: 12),
                Text(
                  log.timeString,
                  style: TextStyle(fontFamily: 'monospace', fontSize: 11, color: Colors.grey[600]),
                ),
                if (log.source != null) ...[
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: levelColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: levelColor.withOpacity(0.3)),
                    ),
                    child: Text(
                      log.source!,
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: levelColor),
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 8),
            SelectableText(log.message, style: const TextStyle(fontSize: 13, height: 1.4)),
            if (log.data != null) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.black.withOpacity(0.1)),
                ),
                child: SelectableText(
                  log.data.toString(),
                  style: const TextStyle(fontFamily: 'monospace', fontSize: 11, color: Colors.black87),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
