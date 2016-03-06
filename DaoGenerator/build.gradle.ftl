import de.greenrobot.daogenerator.DaoGenerator;
import de.greenrobot.daogenerator.Entity;
import de.greenrobot.daogenerator.Schema;

def dbVersion = 1
def daoOutputPackage = "${packageName}.db"
def daoOutputDirPath = "app/src-gen/main/java"

task daoGenerateClean(type: Delete) {
    delete "../${DS}{daoOutputDirPath}"
}

task daoGenerate {
    description "create dao"

    doLast {
        Schema schema = new Schema(dbVersion, daoOutputPackage);

        // Table Definition
        Entity indicator = schema.addEntity("Indicator");
        indicator.addLongProperty("Id").primaryKey().autoincrement().notNull().unique();
        indicator.addStringProperty("Name");
        indicator.addIntProperty("Priority");
        indicator.addDateProperty("Date");
        indicator.implementsSerializable();

        Entity entry = schema.addEntity("Entry");
        entry.addLongProperty("Id").primaryKey().autoincrement().notNull().unique();
        entry.addStringProperty("Title");
        entry.addStringProperty("Url");
        entry.implementsSerializable();

        try {
            File file = new File(daoOutputDirPath);
            if (!file.exists()) {
                file.mkdirs();
            }
            new DaoGenerator().generateAll(schema, daoOutputDirPath);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
