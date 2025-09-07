// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:queingapp/domain/entities/queues/queue_dynamic_entity.dart';

import 'package:queingapp/domain/entities/queues/queues_entity.dart';
import 'package:queingapp/domain/usecases/get_queue/queue_use_case.dart';

class QueueProvider with ChangeNotifier {
  final QueueUseCase useCase;

  QueueProvider({
    required this.useCase,
  }) {
    _init();
  }

  String? _address;
  final _name = TextEditingController();
  int? _selectedOption;
  List<String> _options = [];

  int? get selectedOption => _selectedOption;
  List<String> get options => _options;
  String? get address => _address;
  TextEditingController get name => _name;

  Future<void> state(int? index, bool? value) async {
    if (value == true) {
      _selectedOption = index;
    } else {
      _selectedOption = null;
    }
    notifyListeners();
  }
  Future<void> createQueue() async {
    if (_selectedOption == null || _selectedOption! >= _options.length) return;

    final entity = QueuesEntity(
      name: _name.text,
      type: _options[_selectedOption!],
      index: 0,
      address: 'SOUTHERN LUZON STATE UNIVERSITY - CATANUAN EXTENSION',
      status: '',
    );
    await useCase.callCreateQueue(entity);
  }

  Stream<QueuesEntity?> get queueStream => useCase.callGetQueue(
        QueuesEntity(
          name: '',
          type: '',
          index: 0,
          schedule: Timestamp.now(),
          timein: Timestamp.now(),
          address: '',
          status: '',
        ),
      );

  Stream<List<QueuesEntity?>> get queueStreamAsList => useCase.callGetQueueAsList(
        QueuesEntity(
          name: '',
          type: '',
          index: 0,
          schedule: Timestamp.now(),
          timein: Timestamp.now(),
          address: '',
          status: '',
        ),
      );

  Stream<List<QueueDynamicEntity?>> get streamDynamicList => useCase.callDynamicButtons();

  void _init() {
    streamDynamicList.listen((dynamicList) {
      _options = dynamicList
          .whereType<QueueDynamicEntity>()
          .map((e) => e.name)
          .where((name) => name.isNotEmpty)
          .toList();

      notifyListeners();
    });

    queueStream.listen((queue) {
      notifyListeners();
    });

    queueStreamAsList.listen((list) {
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }
}
