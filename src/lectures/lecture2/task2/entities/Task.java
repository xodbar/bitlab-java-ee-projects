package lectures.lecture2.task2.entities;

public class Task {
    private Long id;
    private String name;
    private String description;
    private String deadlineDate;
    private Boolean isCompleted;


    public Task() {
    }

    public Task(Long id, String name, String description, String deadlineDate, Boolean isCompleted) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.deadlineDate = deadlineDate;
        this.isCompleted = isCompleted;
    }


    public Long getTaskId() {
        return id;
    }

    public void setTaskId(Long id) {
        this.id = id;
    }

    public String getTaskName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDeadlineDate() {
        return deadlineDate;
    }

    public void setDeadlineDate(String deadlineDate) {
        this.deadlineDate = deadlineDate;
    }

    public Boolean getCompleted() {
        return isCompleted;
    }

    public void setCompleted(Boolean completed) {
        isCompleted = completed;
    }
}
