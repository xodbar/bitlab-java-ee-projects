package lectures.lecture3.entities;

public class Student {
    private Long id;
    private String name;
    private String surname;
    private String birthDate;
    private String city;


    public Student() {
    }

    public Student(Long id, String name, String surname,
                   String birthDate, String city) {
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.birthDate = birthDate;
        this.city = city;
    }


    public Long getStudentId() {
        return id;
    }

    public void setStudentId(Long id) {
        this.id = id;
    }

    public String getStudentName() {
        return name;
    }

    public void setStudentName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
}
