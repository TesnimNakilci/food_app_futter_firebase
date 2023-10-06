import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app_flutter/data/tips_repository.dart';
import 'package:riverpod_context/riverpod_context.dart';

import '../../application/tip_repo_provider.dart';
import '../../utils/constants/data_constant.dart';
import '../../domain/tip.dart';
import '../widgets/tip_item.dart';

final tipsProvider = FutureProvider<List<Tip>>((ref) async {
  final repository = ref.read(tipRepositoryProvider);
  return repository.getTips();
});

class TipCard extends ConsumerWidget {
  const TipCard({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tipsAsyncValue = ref.watch(tipsProvider);
    //  List<QueryDocumentSnapshot> _movieList = snapshot.data.docs;

    return tipsAsyncValue.when(
      data: (tips) {
        // Use the list of posts to display data in your UI
        return ListView.builder(
          shrinkWrap: true,
          itemCount: tips.length,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            final tip = tips[index];
            return TipItem(
              title: tip.title,
              details: tip.details,
            );
          },
        );
      },
      loading: () => CircularProgressIndicator(),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }
}
