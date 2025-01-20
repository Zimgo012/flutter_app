import 'package:cloud_firestore/cloud_firestore.dart';
import './todo_model.dart';

class TodoService {
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    //Fetching todolist for user
    Future<List<TodoModel>> getTodos(String userId) async{
      final userDoc = await _firestore.collection('users').doc(userId).get();

      if(userDoc.exists){
        final todos = (userDoc.data()?['todos'] as List<dynamic>?) ?? [];
        return todos.map((todo) => TodoModel.fromFirestore(todo)).toList();
      }

      return [];
    }

    //Adding a new todo-list for the user
    Future<void> addTodo(String userId, TodoModel todo) async {
    final userDocRef = _firestore.collection('users').doc(userId);

    await _firestore.runTransaction((transaction) async {
      final snapshot = await transaction.get(userDocRef);

      if (!snapshot.exists) {
        // If the user document doesn't exist, create it with an empty todos array
        transaction.set(userDocRef, {
          'todos': [todo.toFirestore()],
        });
      } else {
        final currentTodos = (snapshot.data()?['todos'] as List<dynamic>) ?? [];
        currentTodos.add(todo.toFirestore());

        transaction.update(userDocRef, {'todos': currentTodos});
      }
    });
  }

  //Updating existing TodoList
    Future<void> updateTodo(String userId, String todoId, Map<String, dynamic> updates) async {
    final userDocRef = _firestore.collection('users').doc(userId);

    await _firestore.runTransaction((transaction) async {
      final snapshot = await transaction.get(userDocRef);

      if (snapshot.exists) {
        final currentTodos = (snapshot.data()?['todos'] as List<dynamic>) ?? [];
        final updatedTodos = currentTodos.map((todo) {
          if (todo['id'] == todoId) {
            return {...todo, ...updates};
          }
          return todo;
        }).toList();

        transaction.update(userDocRef, {'todos': updatedTodos});
      }
    });
  }

  //Deleting todoList

  Future<void> deleteTodo(String userId, String todoId) async {
    final userDocRef = _firestore.collection('users').doc(userId);

    await _firestore.runTransaction((transaction) async {
      final snapshot = await transaction.get(userDocRef);

      if (snapshot.exists) {
        final currentTodos = (snapshot.data()?['todos'] as List<dynamic>) ?? [];
        final updatedTodos = currentTodos.where((todo) => todo['id'] != todoId).toList();

        transaction.update(userDocRef, {'todos': updatedTodos});
      }
    });
  }


}