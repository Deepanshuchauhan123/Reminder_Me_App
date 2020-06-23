import 'package:cloud_firestore/cloud_firestore.dart';

import 'Root_Page.dart';

class Get_Tasks{
  getData() async {
  return await Firestore.instance
      .collection('Details')
      .document(RootPageState.user)
      .collection('Tasks')
      .getDocuments();
}
}
