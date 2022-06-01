package lectures.lecture6.task3.locale;

import java.util.HashMap;

public class Locale {
    private static final HashMap<String, String> ru_RU;
    private static final HashMap<String, String> en_EN;

    static {
        ru_RU = new HashMap<>();
        ru_RU.put("lfi1", "Наименование");
        ru_RU.put("lfi11", "Ввдеите наименование");
        ru_RU.put("lfi2", "Возраст");
        ru_RU.put("lfi3", "Страна");
        ru_RU.put("lfi4", "Пол");
        ru_RU.put("lfi5", "Номер Страховки");
        ru_RU.put("lfb1", "Отправить документ");
        ru_RU.put("lfb2", "Сохранить в черновик");
        ru_RU.put("lfb3", "Удалить черновик");

        en_EN = new HashMap<>();
        en_EN.put("lfi1", "Name");
        en_EN.put("lfi11", "Enter name");
        en_EN.put("lfi2", "Age");
        en_EN.put("lfi3", "Country");
        en_EN.put("lfi4", "Gender");
        en_EN.put("lfi5", "Insurance Number");
        en_EN.put("lfb1", "Send the document");
        en_EN.put("lfb2", "Save to draft");
        en_EN.put("lfb3", "Delete draft");
    }

    public static HashMap<String, String> getLocale(String locale) {
        return (locale.equals("ru") ? ru_RU : en_EN);
    }
}
