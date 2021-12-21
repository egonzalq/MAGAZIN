import 'package:get/get.dart';

class TaskController extends GetxController {
  final _tasks = <TaskModel>[].obs;
  TaskRepository repository = Get.find();

  List<TaskModel> get tasks => _tasks;

  @override
  omInit() {
    super.onInit();
    getAllTasks();
  }

  Future<void> addTasks(task) async {
    await repository.addTasks(tasks);
    await getAllTasks();
  }

  Future<void> getAllTasks() async {
    var list = await repository.getAllTasks();
    _tasks.value = list;
  }

  Future<void> deleteTask(id) async {
    await repository.deleteTask(id);
    await getAllTasks();
  }

  Future<void> deleteAll() async {
    await repository.deleteAll();
    await getAllTasks();
  }

  Future<void> updateTask(user) async {
    await repository.updateTask(user);
    await getAllTasks();
  }
}

class TaskRepository {
  addTasks(List<TaskModel> tasks) {}

  getAllTasks() {}

  deleteTask(id) {}

  deleteAll() {}

  updateTask(user) {}
}

class TaskModel {
 
}
