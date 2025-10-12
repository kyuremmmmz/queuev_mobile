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
  final List<String> _options = [];

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
  Future<void> createQueue(BuildContext context) async {
    

    final entity = QueuesEntity(
      name: _name.text,
      type: _options[_selectedOption!],
      
      note: '',
      index: 0,
      address: _options[_selectedOption!],
      status: '',
    );
    await useCase.callCreateQueue(entity, context);
  }

  Stream<QueuesEntity?> get queueStream => useCase.callGetQueue(
        QueuesEntity(
          name: '',
          type: '',
          note: '',
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
          note: '',
          index: 0,
          schedule: Timestamp.now(),
          timein: Timestamp.now(),
          address: '',
          status: '',
        ),
      );
  
    Stream<List<QueueDynamicEntity?>> streamDynamicListByUid(String uid) {
    return useCase.callDynamicButtons(uid); 
  }

  Stream<List<QueueDynamicEntity?>> streamDynamicListByCode(int code) {

    return useCase.callDynamicButtonsCode(code); 
  }


  void _init() {

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
