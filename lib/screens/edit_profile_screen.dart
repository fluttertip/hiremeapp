import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/profile_provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _locationController;
  late TextEditingController _bioController;
  late TextEditingController _skillsController;
  late TextEditingController _experienceController;
  late TextEditingController _educationController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    final profile = context.read<ProfileProvider>().profile;
    _nameController = TextEditingController(text: profile.name);
    _phoneController = TextEditingController(text: profile.phone);
    _locationController = TextEditingController(text: profile.location);
    _bioController = TextEditingController(text: profile.bio);
    _skillsController = TextEditingController(text: profile.skills.join(', '));
    _experienceController = TextEditingController(
      text: profile.experience
          .map((e) => '${e.position} at ${e.company} (${e.startDate} - ${e.endDate})\n${e.description}')
          .join('\n\n'),
    );
    _educationController = TextEditingController(
      text: profile.education
          .map((e) => '${e.degree} at ${e.institution}')
          .join('\n'),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    _bioController.dispose();
    _skillsController.dispose();
    _experienceController.dispose();
    _educationController.dispose();
    super.dispose();
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final profile = context.read<ProfileProvider>().profile;
      final updatedProfile = profile.copyWith(
        name: _nameController.text,
        phone: _phoneController.text,
        location: _locationController.text,
        bio: _bioController.text,
        skills: _skillsController.text.split(',').map((e) => e.trim()).toList(),
        experience: profile.experience, // Keep existing experience
        education: profile.education, // Keep existing education
      );

      await context.read<ProfileProvider>().updateProfile(updatedProfile);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profile updated successfully'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pop(context);
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
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
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
                    return 'Please enter your location';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _bioController,
                decoration: const InputDecoration(
                  labelText: 'Bio',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your bio';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _skillsController,
                decoration: const InputDecoration(
                  labelText: 'Skills',
                  border: OutlineInputBorder(),
                  hintText: 'Separate skills with commas',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your skills';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _experienceController,
                decoration: const InputDecoration(
                  labelText: 'Experience',
                  border: OutlineInputBorder(),
                  hintText: 'One experience per line',
                ),
                maxLines: 3,
                readOnly: true,
                onTap: () {
                  // TODO: Implement experience editor
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Experience editor coming soon!'),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _educationController,
                decoration: const InputDecoration(
                  labelText: 'Education',
                  border: OutlineInputBorder(),
                  hintText: 'One education per line',
                ),
                maxLines: 3,
                readOnly: true,
                onTap: () {
                  // TODO: Implement education editor
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Education editor coming soon!'),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _saveProfile,
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Save Changes'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
