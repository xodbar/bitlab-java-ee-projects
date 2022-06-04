package sprint.sprint2uc.entities;

public class Language {
    private Long id;
    private String name;
    private String code;


    public Language() {
    }

    public Language(Long id, String name, String code) {
        this.id = id;
        this.name = name;
        this.code = code;
    }

    public Long getLanguageId() {
        return id;
    }

    public void setLanguageId(Long id) {
        this.id = id;
    }

    public String getLanguageName() {
        return name;
    }

    public void setLanguageName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
