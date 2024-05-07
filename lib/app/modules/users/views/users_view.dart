import 'package:doctor_app/app/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/users_controller.dart';

class UsersView extends GetView<UsersController> {
  const UsersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(UsersController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('UsersView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'UsersView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddUserDialog(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AddUserDialog extends StatelessWidget {
  const AddUserDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<UsersController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 40,
          ),
          child: Form(
            key: controller.registerFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Enter register details',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: controller.fullNameController,
                  decoration: const InputDecoration(
                    labelText: 'Full name',
                    hintText: 'Enter full name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                TextFormField(
                  controller: controller.emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email address',
                    hintText: 'Enter your email address',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address';
                    } else if (!GetUtils.isEmail(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                TextFormField(
                  controller: controller.passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 8) {
                      return 'Password must be atleast 8 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                TextFormField(
                  controller: controller.addressController,
                  decoration: const InputDecoration(
                    labelText: 'Address',
                    hintText: 'Enter address',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                DropdownButtonFormField<String>(
                  items: const [
                    DropdownMenuItem(
                      value: 'user',
                      child: Text('User'),
                    ),
                    DropdownMenuItem(
                      value: 'admin',
                      child: Text('Admin'),
                    ),
                    DropdownMenuItem(
                      value: 'hospital',
                      child: Text('Hospital'),
                    ),
                  ],
                  onChanged: (v) {
                    controller.roleValue = v ?? 'user';
                    controller.update();
                  },
                  value: controller.roleValue,
                  decoration: const InputDecoration(
                    labelText: 'Role',
                    hintText: 'Select user role',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select user role';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: controller.onRegister,
                  child: const SizedBox(
                    height: 50,
                    child: Center(
                      child: Text(
                        'Register User',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 35),
              ],
            ),
          ),
        ),
      ),
    );
  }
}