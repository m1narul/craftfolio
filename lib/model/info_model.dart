import 'dart:convert';

class InfoModel {
  final String name;
  final Map<String, String> contact;
  final String summary;
  final Map<String, List<String>> skills;
  final List<Experience> experience;
  final List<Project> projects;

  InfoModel({
    required this.name,
    required this.contact,
    required this.summary,
    required this.skills,
    required this.experience,
    required this.projects,
  });

  factory InfoModel.fromJson(Map<String, dynamic> json) {
    return InfoModel(
      name: json["name"],
      contact: Map<String, String>.from(json["contact"]),
      summary: json["summary"],
      skills: {
        "technical": List<String>.from(json["skills"]["technical"]),
        "soft": List<String>.from(json["skills"]["soft"]),
      },
      experience: (json["experience"] as List)
          .map((exp) => Experience.fromJson(exp))
          .toList(),
      projects: (json["projects"] as List)
          .map((proj) => Project.fromJson(proj))
          .toList(),
    );
  }
}

class Experience {
  final String title;
  final String company;
  final String duration;

  Experience({required this.title, required this.company, required this.duration});

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      title: json["title"],
      company: json["company"],
      duration: json["duration"],
    );
  }
}

class Project {
  final String name;
  final String description;
  final String link;

  Project({required this.name, required this.description, required this.link});

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      name: json["name"],
      description: json["description"],
      link: json["link"],
    );
  }
}
