package com.keyboardTraining;

import com.keyboardTraining.model.Exercise;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
import java.io.File;

public class JaxbWorker {
    public static Exercise fromXmlToObject(String filePath) {
        try {
            // создаем объект JAXBContext - точку входа для JAXB
            JAXBContext jaxbContext = JAXBContext.newInstance(Exercise.class);
            Unmarshaller un = jaxbContext.createUnmarshaller();

            return (Exercise) un.unmarshal(new File(filePath));
        } catch (JAXBException e) {
            e.printStackTrace();
        }
        return null;
    }

    // сохраняем объект в XML файл
    public static void convertObjectToXml(Exercise exercise, String filePath) {
        try {
            JAXBContext context = JAXBContext.newInstance(Exercise.class);
            Marshaller marshaller = context.createMarshaller();
            // устанавливаем флаг для читабельного вывода XML в JAXB
            marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);

            // маршаллинг объекта в файл
            marshaller.marshal(exercise, new File(filePath));
        } catch (JAXBException e) {
            e.printStackTrace();
        }
    }
}
