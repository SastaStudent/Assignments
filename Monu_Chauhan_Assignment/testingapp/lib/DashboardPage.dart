import 'package:flutter/material.dart';
import 'CreateProject.dart';
import 'ProjectDetails.dart';

class DashboardPage extends StatefulWidget {
  final VoidCallback toggleTheme;
  const DashboardPage({super.key, required this.toggleTheme});

  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  final List<Project> allProjects = [
    Project(
      projectName: "Flutter App",
      status: "In-Progress",
      dueDate: "Feb 20, 2025",
      sectionName: "Development",
      issue: "Bug in Login Page",
    ),
    Project(
      projectName: "React Website",
      status: "Completed",
      dueDate: "Jan 15, 2025",
      sectionName: "Frontend",
      issue: "No Issues",
    ),
    Project(
      projectName: "ML Model",
      status: "On-Hold",
      dueDate: "Mar 10, 2025",
      sectionName: "AI/ML",
      issue: "Dataset not available",
    ),
    Project(
      projectName: "E-commerce App",
      status: "In-Progress",
      dueDate: "Apr 5, 2025",
      sectionName: "Backend",
      issue: "Payment gateway integration",
    ),
  ];

  List<Project> filteredProjects = [];
  TextEditingController searchController = TextEditingController();
  final _selectedIndex = 3; // Default selected index (Snag)

  @override
  void initState() {
    super.initState();
    filteredProjects = allProjects;
  }

  void filterProjects(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredProjects = allProjects;
      } else {
        filteredProjects =
            allProjects.where((project) {
              return project.projectName.toLowerCase().contains(
                    query.toLowerCase(),
                  ) ||
                  project.sectionName.toLowerCase().contains(
                    query.toLowerCase(),
                  );
            }).toList();
      }
    });
  }

  void _onItemTapped(int index) {
    if (index == 3) {
      // print("Snag button tapped");
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Image.asset('assets/Images/image.png'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: widget.toggleTheme,
          ),
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: searchController,
              onChanged: filterProjects,
              decoration: InputDecoration(
                hintText: "Search projects...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: isDarkMode ? Colors.grey[800] : Colors.grey[200],
              ),
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
            ),
          ),

          // Project List
          Expanded(
            child:
                filteredProjects.isEmpty
                    ? const Center(
                      child: Text(
                        "No projects found!",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    )
                    : ListView.builder(
                      itemCount: filteredProjects.length,
                      itemBuilder: (context, index) {
                        return ProjectCard(project: filteredProjects[index]);
                      },
                    ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateSnagPage()),
          );
        },
        backgroundColor: isDarkMode ? Colors.red[400] : Colors.red,
        child: const Icon(Icons.add, color: Colors.white),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        selectedItemColor: isDarkMode ? Colors.white : Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          const BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Sprint",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.apartment),
            label: "Projects",
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: Colors.white24,
              child: Icon(
                Icons.error_outline,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            label: "Snag",
          ),
          const BottomNavigationBarItem(icon: Icon(Icons.apps), label: "More"),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

// Project Class
class Project {
  final String projectName;
  final String status;
  final String dueDate;
  final String sectionName;
  final String issue;

  Project({
    required this.projectName,
    required this.status,
    required this.dueDate,
    required this.sectionName,
    required this.issue,
  });
}

// Project Card Widget
class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProjectDetails(project: project),
          ),
        );
      },
      child: Card(
        color: isDarkMode ? Colors.grey[900] : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      project.projectName,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    project.status,
                    style: TextStyle(
                      color:
                          project.status == "Completed"
                              ? Colors.green
                              : project.status == "Pending"
                              ? Colors.orange
                              : Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Icon(Icons.more_vert),
                ],
              ),
              const SizedBox(height: 8),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Due: ${project.dueDate}",
                    style: TextStyle(
                      color: isDarkMode ? Colors.grey[400] : Colors.grey[700],
                    ),
                  ),
                  Text(
                    project.sectionName,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),

              const Divider(thickness: 1, color: Colors.grey),

              const SizedBox(height: 8),

              Text(
                project.issue,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
