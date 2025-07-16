import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trainsmarter/View/CreateExercisePage.dart';

class AddExercisePage extends StatefulWidget {
  const AddExercisePage({super.key});

  @override
  State<AddExercisePage> createState() => _AddExerciseState();
}

class _AddExerciseState extends State<AddExercisePage> {
  final SearchController _searchCtrl = SearchController();
  int _selected = 0;                           // 0 = App, 1 = Yours

  final List<String> _appExercises = [
    'Bench Press', 'Squat', 'Deadlift', 'Pull‑up', 'Overhead Press'
  ];
  final List<String> _yourExercises = [];

  List<String> get _filtered {
    final src = _selected == 0 ? _appExercises : _yourExercises;
    final q = _searchCtrl.text.toLowerCase();
    return q.isEmpty
        ? src
        : src.where((e) => e.toLowerCase().contains(q)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(24),
              sliver: SliverToBoxAdapter(
                child: Card(
                  elevation: 4,
                  color: theme.cardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'New Plan',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Segmented buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _segButton('App', 0),
                            _segButton('Yours', 1),
                          ],
                        ),
                        const SizedBox(height: 8),

                        // Search bar
                        SearchAnchor(
                          searchController: _searchCtrl,
                          builder: (_, controller) => SearchBar(
                            controller: controller,
                            hintText: 'Search',
                            leading: const Icon(Icons.search),
                            onChanged: (_) => setState(() {}),
                          ),
                          suggestionsBuilder: (_, __) => const [],
                        ),
                        const SizedBox(height: 12),


                        SizedBox(
                          height: 300,
                          child: ListView.builder(
                            itemCount: _filtered.length,
                            itemBuilder: (_, i) => ListTile(
                              title: Text(_filtered[i]),
                              trailing: const Icon(Icons.add),
                              onTap: () {
                                // Handle “add” tap
                              },
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(48),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder:
                              (_) => CreateExercisePage()
                              )
                            );
                          },
                          child: const Text(
                            'Create Exercise',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Optional spacer below the card
            const SliverPadding(padding: EdgeInsets.only(bottom: 32)),
          ],
        ),
      ),
    );
  }

  // Helper to build the segment buttons
  Widget _segButton(String label, int index) {
    final active = _selected == index;
    return TextButton(
      onPressed: () => setState(() => _selected = index),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          decoration:
          active ? TextDecoration.underline : TextDecoration.none,
        ),
      ),
    );
  }
}
