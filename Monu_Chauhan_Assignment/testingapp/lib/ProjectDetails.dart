import 'package:flutter/material.dart';
import 'DashboardPage.dart';

class ProjectDetails extends StatelessWidget {
  final Project project;

  const ProjectDetails({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDarkMode
              ? const Color.fromARGB(255, 49, 48, 48)
              : Color.fromARGB(255, 236, 233, 233),
      appBar: AppBar(
        backgroundColor:
            isDarkMode
                ? Color.fromARGB(255, 49, 48, 48)
                : Color.fromARGB(255, 236, 233, 233),
        title: Row(
          children: [
            const SizedBox(width: 8),
            Text(
              project.projectName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color:
                  project.status == "In Progress"
                      ? Colors.green[100]
                      : Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              project.status,
              style: TextStyle(
                color:
                    project.status == "In Progress"
                        ? Colors.green[800]
                        : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Details Card with Border
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color:
                      isDarkMode
                          ? const Color.fromARGB(255, 14, 13, 13)
                          : Colors.white,
                  width: 10,
                ), // Light grey border
                borderRadius: BorderRadius.circular(12),
                color:
                    isDarkMode
                        ? Color.fromARGB(240, 49, 48, 48)
                        : Color.fromARGB(255, 236, 232, 232),
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0, // Remove elevation to rely on border
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _detailColumn("Start Date", "xx/xx/xxxx"),
                          _detailColumn("Due Date", project.dueDate),
                        ],
                      ),
                      _divider(),
                      _detailRow("Section Name", project.sectionName,isDarkMode: isDarkMode),
                      _divider(),
                      _detailRow("Issue", project.issue, isRed: true),
                      _divider(),
                      _detailRow(
                        "Description",
                        "Description as usual , not mentioned",
                        isDarkMode: isDarkMode,
                      ),
                      _divider(),
                      const Text(
                        "Attachments",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          _attachmentPreview("assets/1.jpg"),
                          _attachmentPreview("assets/2.jpg"),
                          _attachmentPreview("assets/3.jpg"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Timeline",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text("+ Update", style: TextStyle(fontSize: 16)),
                ),
              ],
            ),

            // Timeline Card with Border
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300, width: 1),
                borderRadius: BorderRadius.circular(12),
                color:
                    isDarkMode ? Color.fromARGB(255, 49, 48, 48) : Colors.white,
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Snag Created',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),

                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color:
                              isDarkMode
                                  ? Color.fromARGB(255, 49, 48, 48)
                                  : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _detailRow('Date & time', '09 Feb 2025, 10:32AM',isDarkMode: isDarkMode),
                            SizedBox(height: 8), // Space between the two rows
                            _detailColumn('Assigned by', 'Monu Chauhan'),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Snag Updated',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),

                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color:
                              isDarkMode
                                  ? Color.fromARGB(255, 49, 48, 48)
                                  : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            snagUpdateItem(),
                            SizedBox(height: 20),
                            snagUpdateItem(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Button at the Bottom
            SizedBox(
              width: double.infinity, // Makes button take full width
              child: ElevatedButton(
                onPressed: () {
                  // Add action for button here
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: 12,
                  ), // Adjust vertical padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Colors.red, // Set button background to red
                ),
                child: Text(
                  "Update",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Ensure text is white
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _detailRow(String title, String value, {bool isRed = false,bool isDarkMode=false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 14, color: Colors.grey)),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isRed ? Colors.red : (isDarkMode ?Colors.white: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return const Divider(thickness: 1, color: Colors.grey);
  }

  Widget _attachmentPreview(String path) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(path, width: 60, height: 60, fit: BoxFit.cover),
      ),
    );
  }

  Widget snagUpdateItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Snag update status and date in the same row
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.green[100],  
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "SNAG moved to In-progress by [Name]",  
                style: TextStyle(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  color: Colors.green[800],
                ),
              ),
              Text(
                "09 Feb 2025", // Replace with dynamic date if needed
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),

        // Main content row
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/2.jpg', // Replace with actual image
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),

            // Snag details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Something is changed, but what?',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '09 Feb 2025, 10:32 AM  •  Remark by [Name]',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Divider(thickness: 1, color: Colors.grey.shade300),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
