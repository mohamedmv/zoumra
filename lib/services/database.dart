





import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:zoumra/Models/userdata.dart';

class DatabaseService{

  final String uid ;
 DatabaseService({this.uid});
 
  final FirebaseAuth _auth = FirebaseAuth.instance;
   final CollectionReference _userdata = Firestore.instance.collection('Information');

   //get  user id 
   Stream<User> get user{
     return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
   }

  //user from firebaseuser
  User _userFromFirebaseUser(FirebaseUser user){
    return User(uid: user.uid);
  }

  // sign in anonomesly
   Future singnInAnon() async{
   try{ AuthResult result = await _auth.signInAnonymously();
     FirebaseUser user = result.user;
     return user.uid;
     }catch(e){
       print(e.toString());
       return null;
     }
   }

   //sign out 
   Future signOut() async{
     await _auth.signOut();
   }
     
     // update user data
   Future updateInformation(Userdata userdata) async{

   await _userdata.document(uid).setData(
       {

         'nom': userdata.nom,
          'prenom': userdata.prenom,
           'bloodtype': userdata.bloodtype,
            'city': userdata.city,
             'number': userdata.number,
       }
    );
   }

  //get List of users
  Stream<List<Userdata>>  userslist(String bloodtype){
    if(bloodtype=='All'){
      return _userdata.snapshots().map(_userdataFromQuerySnapshot);
    }else{
      return _userdata.where('bloodtype', isEqualTo: bloodtype).snapshots().map(_userdataFromQuerySnapshot);
    }
   
  }

  // userdata from Querysnapshot
  List<Userdata> _userdataFromQuerySnapshot(QuerySnapshot snapshot){
   
    return snapshot.documents.map((element){
      return Userdata(
         nom: element.data['nom'],
         prenom: element.data['prenom'],
        bloodtype: element.data['bloodtype'],
         city: element.data['city'],
         number: element.data['number'],
      );
    }).toList();
  }

  // curent user data
  Stream<Userdata> get curentUserdata{
    return _userdata.document(uid).snapshots().map(_userdataFromeDocumentSnapshot);
  }

 // userdata from DocumentSnapshot
 Userdata _userdataFromeDocumentSnapshot(DocumentSnapshot snapshot){
   return Userdata(
     nom: snapshot.data['nom'],
     prenom: snapshot.data['prenom'],
     city: snapshot.data['city'],
     number: snapshot.data['number'],
     bloodtype: snapshot.data['bloodtype'],

   );
 }
  
}