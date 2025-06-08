import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/job_model.dart';
import '../providers/job_provider.dart';

class PostJobModal extends StatefulWidget {
  const PostJobModal({super.key});

  @override
  State<PostJobModal> createState() => _PostJobModalState();
}

class _PostJobModalState extends State<PostJobModal> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _companyController = TextEditingController();
  final _locationController = TextEditingController();
  final _salaryController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _selectedJobType = 'Full-time';
  final List<String> _requirements = [];
  final List<String> _benefits = [];
  bool _isLoading = false;

  final List<String> _jobTypes = [
    'Full-time',
    'Part-time',
    'Contract',
    'Internship',
    'Remote',
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _companyController.dispose();
    _locationController.dispose();
    _salaryController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _addRequirement() {
    showDialog(
      context: context,
      builder: (context) {
        final controller = TextEditingController();
        return AlertDialog(
          title: const Text('Add Requirement'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Enter requirement'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  setState(() {
                    _requirements.add(controller.text);
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _addBenefit() {
    showDialog(
      context: context,
      builder: (context) {
        final controller = TextEditingController();
        return AlertDialog(
          title: const Text('Add Benefit'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Enter benefit'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  setState(() {
                    _benefits.add(controller.text);
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _submitJob() async {
    if (!_formKey.currentState!.validate()) return;
    if (_requirements.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please add at least one requirement')),
      );
      return;
    }
    if (_benefits.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please add at least one benefit')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      final job = JobModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: _titleController.text,
        company: _companyController.text,
        location: _locationController.text,
        salary: double.parse(_salaryController.text),
        jobType: _selectedJobType,
        description: _descriptionController.text,
        requirements: _requirements,
        benefits: _benefits,
        postedDate: DateTime.now(),
      );

      context.read<JobProvider>().addJob(job);

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Job posted successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

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
                  'Post a Job',
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
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        labelText: 'Job Title',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter job title';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _companyController,
                      decoration: const InputDecoration(
                        labelText: 'Company Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter company name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _locationController,
                      decoration: const InputDecoration(
                        labelText: 'Location',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter location';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _salaryController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Annual Salary',
                        border: OutlineInputBorder(),
                        prefixText: '\$',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter salary';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: _selectedJobType,
                      decoration: const InputDecoration(
                        labelText: 'Job Type',
                        border: OutlineInputBorder(),
                      ),
                      items: _jobTypes.map((type) {
                        return DropdownMenuItem(value: type, child: Text(type));
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _selectedJobType = value;
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _descriptionController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        labelText: 'Job Description',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter job description';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Requirements',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        TextButton.icon(
                          onPressed: _addRequirement,
                          icon: const Icon(Icons.add),
                          label: const Text('Add'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ..._requirements.map((requirement) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.check_circle_outline,
                              size: 20,
                              color: Colors.green,
                            ),
                            const SizedBox(width: 8),
                            Expanded(child: Text(requirement)),
                            IconButton(
                              icon: const Icon(Icons.delete_outline),
                              onPressed: () {
                                setState(() {
                                  _requirements.remove(requirement);
                                });
                              },
                            ),
                          ],
                        ),
                      );
                    }),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Benefits',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        TextButton.icon(
                          onPressed: _addBenefit,
                          icon: const Icon(Icons.add),
                          label: const Text('Add'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ..._benefits.map((benefit) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star_outline,
                              size: 20,
                              color: Colors.amber,
                            ),
                            const SizedBox(width: 8),
                            Expanded(child: Text(benefit)),
                            IconButton(
                              icon: const Icon(Icons.delete_outline),
                              onPressed: () {
                                setState(() {
                                  _benefits.remove(benefit);
                                });
                              },
                            ),
                          ],
                        ),
                      );
                    }),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _isLoading ? null : _submitJob,
                      child: _isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text('Post Job'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
