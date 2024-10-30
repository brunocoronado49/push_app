import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_app/domain/entities/push_message.dart';
import 'package:push_app/presentation/blocs/notifications_bloc/notifications_bloc.dart';

class DetailsScreen extends StatelessWidget {
  final String pushMessageId;

  const DetailsScreen({super.key, required this.pushMessageId});

  @override
  Widget build(BuildContext context) {
    final PushMessage? message = context.watch<NotificationsBloc>().getMessageById(pushMessageId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Push Details'),
      ),
      body: (message != null)
        ? _DetailsView(message)
        : const Center(child: Text('Notificacion no existe')),
    );
  }
}

class _DetailsView extends StatelessWidget {
  final PushMessage pushMessage;

  const _DetailsView(this.pushMessage);

  @override
  Widget build(BuildContext context) {
    final textStyke = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
        if(pushMessage.imageUrl != null)
          Image.network(pushMessage.imageUrl!),
          const SizedBox(height: 30),
          Text(pushMessage.title, style: textStyke.titleMedium),
          Text(pushMessage.body),
          const Divider(),
          Text(pushMessage.data.toString())
        ],
      ),
    );
  }
}


