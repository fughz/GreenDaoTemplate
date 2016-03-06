package ${packageName}.utils;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;

import ${packageName}.db.DaoMaster;
import ${packageName}.db.DaoSession;

public class GreenDaoUtils extends DaoMaster.DevOpenHelper {

    private static final String DB_NAME = "appdb";

    private SQLiteDatabase db = null;
    private DaoMaster daoMaster = null;
    private DaoSession daoSession = null;

    public GreenDaoUtils(Context context, SQLiteDatabase.CursorFactory factory) {
        super(context, DB_NAME, factory);

        // onCreate呼び出しのためにデータベース作成
        this.getDatabase();
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        super.onCreate(db);

        DaoMaster daoMaster = new DaoMaster(db);
        DaoSession daoSession = daoMaster.newSession();
    }

    @Override
    public void onUpgrade(SQLiteDatabase arg0, int arg1, int arg2) {
    }

    public SQLiteDatabase getDatabase() {
        if (this.db == null) {
            this.db = this.getWritableDatabase();
        }

        return this.db;
    }

    public DaoMaster getDaoMaster() {
        if (this.daoMaster == null) {
            this.daoMaster = new DaoMaster(this.getDatabase());
        }

        return this.daoMaster;
    }

    public DaoSession getDaoSession() {
        if (this.daoSession == null) {
            this.daoSession = this.getDaoMaster().newSession();
        }

        return this.daoSession;
    }
}

