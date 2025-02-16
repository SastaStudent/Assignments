import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateSnagPage extends StatefulWidget {
  const CreateSnagPage({super.key});

  @override
  CreateSnagPageState createState() => CreateSnagPageState();
}

class CreateSnagPageState extends State<CreateSnagPage> {
  String? selectedProject;
  final List<String> projects = ["Project A", "Project B", "Project C"];

  String? selectedSection;
  final List<String> sections = ["Section A", "Section B", "Section C"];

  String? selectedAssignTo;
  final List<String> assignToList = ["Person A", "Person B", "Person C"];

  String? selectedStatus;
  final List<String> statuses = ["Open", "In-Progress", "On-Hold"];

  final TextEditingController dueDateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  int descriptionCharCount = 0;

  // Function to show date picker
  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        dueDateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    InputDecoration inputDecoration = InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      filled: true,
      fillColor: isDarkMode ? Colors.grey[800] : Colors.white,
      hintStyle: TextStyle(
        color: isDarkMode ? Colors.grey[400] : Colors.black54,
      ),
    );

    TextStyle labelStyle = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: isDarkMode ? Colors.white : Colors.black,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Snag"),
        backgroundColor:
            isDarkMode
                ? Colors.black
                : const Color.fromARGB(255, 255, 255, 255),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Project Name", style: labelStyle),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: selectedProject,
              hint: const Text("Select a Project"),
              borderRadius: BorderRadius.circular(15),
              items:
                  projects.map((String project) {
                    return DropdownMenuItem(
                      value: project,
                      child: Text(project),
                    );
                  }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedProject = newValue;
                });
              },
              decoration: inputDecoration,
            ),
            const SizedBox(height: 10),

            Text("Section", style: labelStyle),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: selectedSection,
              hint: const Text("Select Section"),
              borderRadius: BorderRadius.circular(15),
              items:
                  sections.map((String section) {
                    return DropdownMenuItem(
                      value: section,
                      child: Text(section),
                    );
                  }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedSection = newValue;
                });
              },
              decoration: inputDecoration,
            ),
            const SizedBox(height: 10),

            Text("Assign To", style: labelStyle),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: selectedAssignTo,
              hint: const Text("Select Assignee"),
              borderRadius: BorderRadius.circular(15),
              items:
                  assignToList.map((String assign) {
                    return DropdownMenuItem(value: assign, child: Text(assign));
                  }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedAssignTo = newValue;
                });
              },
              decoration: inputDecoration,
            ),
            const SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Due Date", style: labelStyle),
                      const SizedBox(height: 8),
                      TextField(
                        controller: dueDateController,
                        readOnly: true,
                        onTap: () => _selectDate(context),
                        decoration: inputDecoration.copyWith(
                          hintText: "Select Due Date",
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.calendar_today,
                              color: Colors.blue,
                            ),
                            onPressed: () => _selectDate(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Status", style: labelStyle),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        value: selectedStatus,
                        hint: const Text("Select Status"),
                        items:
                            statuses.map((String status) {
                              return DropdownMenuItem(
                                value: status,
                                child: Text(status),
                              );
                            }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedStatus = newValue;
                          });
                        },
                        decoration: inputDecoration,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            Text("Description", style: labelStyle),
            const SizedBox(height: 8),
            TextField(
              controller: descriptionController,
              maxLines: 5,
              onChanged: (text) {
                setState(() {
                  descriptionCharCount = text.length;
                });
              },
              decoration: inputDecoration.copyWith(
                hintText: "Enter a detailed description...",
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "$descriptionCharCount/150 characters",
              style: TextStyle(
                fontSize: 12,
                color: isDarkMode ? Colors.grey[400] : Colors.grey,
              ),
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.red),
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text("Snag Created Successfully!"),
                          backgroundColor:
                              isDarkMode ? Colors.grey[800] : Colors.red,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text(
                      "Create",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
