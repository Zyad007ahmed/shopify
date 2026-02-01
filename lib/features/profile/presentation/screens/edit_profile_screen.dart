import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopify/features/profile/presentation/viewmodels/edit_profile_viewmodel/edit_profile_state.dart';
import '../providers/profile_provider.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    final user = ref.read(currentUserProvider);
    _nameController = TextEditingController(text: user?.name ?? '');
    _emailController = TextEditingController(text: user?.email ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(currentUserProvider);
    final editState = ref.watch(editProfileViewModelProvider);

    listenforEditingResult(context);

    if (user == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Edit Profile')),
        body: const Center(child: Text('User not found')),
      );
    }

    final isLoading =
        editState is EditProfileLoading ||
        editState is EditProfileUploadingImage;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        actions: [
          TextButton(
            onPressed: isLoading ? null : _saveProfile,
            child: const Text('Save'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Avatar Picker
              GestureDetector(
                onTap: isLoading ? null : _pickImage,
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: _selectedImage != null
                          ? FileImage(_selectedImage!)
                          : CachedNetworkImageProvider(user.avatar)
                                as ImageProvider,
                      child: user.avatar.isEmpty && _selectedImage == null
                          ? Text(
                              user.name[0].toUpperCase(),
                              style: const TextStyle(fontSize: 40),
                            )
                          : null,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    if (editState is EditProfileUploadingImage)
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.5),
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'Tap to change avatar',
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),

              const SizedBox(height: 32),

              // Name Field
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  prefixIcon: Icon(Icons.person_outline),
                ),
                enabled: !isLoading,
              ),

              const SizedBox(height: 16),

              // Email Field
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                keyboardType: TextInputType.emailAddress,
                enabled: !isLoading,
              ),

              const SizedBox(height: 32),

              // Save Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: isLoading ? null : _saveProfile,
                  child: isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
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

  void listenforEditingResult(BuildContext context) {
    ref.listen<EditProfileState>(editProfileViewModelProvider, (
      previous,
      next,
    ) {
      next.maybeWhen(
        success: (message) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(message)));
          Navigator.pop(context);
        },
        error: (message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message), backgroundColor: Colors.red),
          );
        },
        orElse: () {},
      );
    });
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1024,
      maxHeight: 1024,
      imageQuality: 85,
    );

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  void _saveProfile() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final user = ref.read(currentUserProvider);
    if (user == null) return;

    final name = _nameController.text.trim();
    final email = _emailController.text.trim();

    // Check if anything changed
    final nameChanged = name != user.name;
    final emailChanged = email != user.email;
    final avatarChanged = _selectedImage != null;

    if (!nameChanged && !emailChanged && !avatarChanged) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('No changes to save')));
      return;
    }

    ref
        .read(editProfileViewModelProvider.notifier)
        .updateProfile(
          name: nameChanged ? name : null,
          email: emailChanged ? email : null,
          avatarFile: _selectedImage,
        );
  }
}
