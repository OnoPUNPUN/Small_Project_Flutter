import 'package:cgpa_calculator/widgets/crouse_card.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController crouseNameController = TextEditingController();
  final TextEditingController creaditController = TextEditingController();
  final TextEditingController markController = TextEditingController();
  late double totalMarks = 0;
  late int totalCreadit = 0;
  late double cgpa = 0;

  final List<Map<String, dynamic>> courses = [];

  @override
  void dispose() {
    crouseNameController.dispose();
    creaditController.dispose();
    markController.dispose();
    super.dispose();
  }

  void _addCourse() {
    final name = crouseNameController.text.trim();
    final credit = int.tryParse(creaditController.text.trim());
    final mark = double.tryParse(markController.text.trim());

    if (name.isNotEmpty && credit != null && mark != null) {
      totalMarks += mark;
      totalCreadit += credit;
      setState(() {
        courses.add({'name': name, 'credit': credit, 'mark': mark});
      });
      crouseNameController.clear();
      creaditController.clear();
      markController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade400.withValues(alpha: 0.9),
        elevation: 0,
        title: const Text(
          'CGPA Calculator',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addCourse,
        backgroundColor: Colors.deepPurple,
        tooltip: 'Add Course',
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFD1C4E9), Color(0xFFEDE7F6)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 16,
                    ),
                    child: Column(
                      children: [
                        TextField(
                          controller: crouseNameController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.book_rounded,
                              color: Colors.deepPurple,
                            ),
                            hintText: 'Enter Course Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade100,
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          controller: creaditController,
                          keyboardType: const TextInputType.numberWithOptions(),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.confirmation_number,
                              color: Colors.deepPurple,
                            ),
                            hintText: 'Enter Number of Credits',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade100,
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          controller: markController,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.grade,
                              color: Colors.deepPurple,
                            ),
                            hintText: 'Enter Mark',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade100,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Expanded(
                  child:
                      courses.isEmpty
                          ? Center(
                            child: Text(
                              'No courses added yet!',
                              style: TextStyle(
                                color: Colors.deepPurple.shade200,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                          : ListView.separated(
                            itemBuilder: (context, index) {
                              final course = courses[index];
                              return CrouseCard(
                                courseName: course['name'],
                                credit: course['credit'],
                                mark: course['mark'],
                              );
                            },
                            separatorBuilder:
                                (context, index) =>
                                    const SizedBox(height: 12.0),
                            itemCount: courses.length,
                          ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
