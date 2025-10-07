import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:queingapp/domain/entities/queues/queues_entity.dart';
import 'package:queingapp/presentation/provider/QueueProvider/queue_provider.dart';
import 'package:queingapp/presentation/widgets/list_views/list_content.dart';
import 'package:queingapp/utils/sanitizers.dart';
class QeueingHistoryScreen extends StatefulWidget {
  const QeueingHistoryScreen({super.key});

  @override
  State<QeueingHistoryScreen> createState() => _QeueingHistoryScreenState();
}

class _QeueingHistoryScreenState extends State<QeueingHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QueueProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('QUEUING HISTORY',
        style: GoogleFonts.dmSans(
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: StreamBuilder<List<QueuesEntity?>?>(
          stream: provider.queueStreamAsList,
          builder: (context, AsyncSnapshot<List<QueuesEntity?>?> asyncSnapshot) {
            if (asyncSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (asyncSnapshot.hasError) {
              return Center(child: Text('Error: ${asyncSnapshot.error}'));
            } else if (!asyncSnapshot.hasData || asyncSnapshot.data == null || asyncSnapshot.data!.isEmpty) {
              return const Center(child: Text('No queue data available'));
            }
            final queue = asyncSnapshot.data!;
            return ListView.separated(
              itemCount: queue.length,
              separatorBuilder: (index, context) => const SizedBox(height: 10,),
              itemBuilder:(context, index) {
                
                final castTheListAsIndex = queue[index];
                return ListContent(number: '${index+1}', title: castTheListAsIndex?.address ?? '', type: castTheListAsIndex?.type ?? '', date: Sanitizers().formatChatTimestamp(castTheListAsIndex?.schedule?.toString()));
              });
          }
        ),
      ),
    );
  }
}