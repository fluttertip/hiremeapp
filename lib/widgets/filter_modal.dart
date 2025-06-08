import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/job_provider.dart';

class FilterModal extends StatefulWidget {
  const FilterModal({super.key});

  @override
  State<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  String? _selectedLocation;
  String? _selectedJobType;
  RangeValues _salaryRange = const RangeValues(0, 200000);

  final List<String> _locations = [
    'San Francisco, CA',
    'New York, NY',
    'Seattle, WA',
    'Austin, TX',
    'Remote',
  ];

  final List<String> _jobTypes = [
    'Full-time',
    'Part-time',
    'Contract',
    'Internship',
    'Remote',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Filter Jobs',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          const Divider(),
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Location',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: _locations.map((location) {
                      final isSelected = location == _selectedLocation;
                      return FilterChip(
                        label: Text(location),
                        selected: isSelected,
                        onSelected: (selected) {
                          setState(() {
                            _selectedLocation = selected ? location : null;
                          });
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Job Type',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: _jobTypes.map((type) {
                      final isSelected = type == _selectedJobType;
                      return FilterChip(
                        label: Text(type),
                        selected: isSelected,
                        onSelected: (selected) {
                          setState(() {
                            _selectedJobType = selected ? type : null;
                          });
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Salary Range',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  RangeSlider(
                    values: _salaryRange,
                    min: 0,
                    max: 200000,
                    divisions: 20,
                    labels: RangeLabels(
                      '\$${_salaryRange.start.round()}',
                      '\$${_salaryRange.end.round()}',
                    ),
                    onChanged: (values) {
                      setState(() {
                        _salaryRange = values;
                      });
                    },
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      Provider.of<JobProvider>(context, listen: false).filterJobs(
                        _selectedLocation ?? '',
                        _selectedJobType ?? '',
                        _salaryRange.start,
                        _salaryRange.end,
                      );
                      Navigator.pop(context);
                    },
                    child: const Text('Apply Filters'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
