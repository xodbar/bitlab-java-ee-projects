package lectures.lecture2.task2.db;

import lectures.lecture2.task2.entities.Task;

import java.util.ArrayList;

public class DBManager {
    protected static ArrayList<Task> tasks;
    private static Long id;

    static {
        tasks = new ArrayList<>();

        tasks.add(new Task(
                1L,
                "Create Database",
                "Create database of the students system.",
                "31.05.2022",
                false
        ));
        tasks.add(new Task(
                2L,
                "Complete Bitlab tasks",
                "Complete all tasks from bitlab platform. Includes topic 1, 2 and 3",
                "31.05.2022",
                false
        ));
        tasks.add(new Task(
                3L,
                "Pass All Exams",
                "Create database of the students system.",
                "31.05.2022",
                true
        ));

        id = 4L;
    }

    public static void addTask(Task newTask) {
        tasks.add(newTask);
        id++;
    }

    public static void deleteTask(Long id) {
        int index = 0;
        boolean wasFound = false;

        for (Task task : tasks) {
            if (task.getTaskId() == id) {
                wasFound = true;
                break;
            } else index++;
        }

        if (wasFound)
            tasks.remove(index);
    }

    public static Task getTaskById(Long id) {
        Task task = null;

        for (Task currentTask : tasks)
            if (currentTask.getTaskId() == id)
                task = currentTask;

        return task;
    }

    public static void overwriteTask(Long id, Task newData) {
        boolean wasFound = false;
        int index = 0;

        for (Task task : tasks)
            if (task.getTaskId() == id) {
                wasFound = true;
                break;
            } else index++;

        if (wasFound) {
            tasks.set(index, new Task(
                    id,
                    newData.getTaskName(),
                    newData.getDescription(),
                    newData.getDeadlineDate(),
                    newData.getCompleted()
            ));
        }
    }

    public static ArrayList<Task> getAllTasks() {
        return tasks;
    }

    public static Long getLastId() {
        return id;
    }
}
