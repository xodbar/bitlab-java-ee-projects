package lectures.lecture4_5.entities;

public class Student {
    private Long id;
    private String name;
    private String surname;
    private String birthDate;
    private Long cityId;
    private String cityName;


    public Student() {
    }

    public Student(Long id, String name, String surname,
                   String birthDate, Long cityId, String cityName) {
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.birthDate = birthDate;
        this.cityId = cityId;
        this.cityName = cityName;
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

    public Long getCityId() {
        return cityId;
    }

    public void setCityId(Long cityId) {
        this.cityId = cityId;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }
}
