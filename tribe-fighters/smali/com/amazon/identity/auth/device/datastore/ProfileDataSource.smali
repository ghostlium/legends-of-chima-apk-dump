.class public Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;
.super Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;
.source "ProfileDataSource.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/amazon/identity/auth/device/datastore/AbstractDataSource",
        "<",
        "Lcom/amazon/identity/auth/device/dataobject/Profile;",
        ">;"
    }
.end annotation


# static fields
.field private static final ALL_COLUMNS:[Ljava/lang/String;

.field private static INSTANCE:Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;

.field private static final LOG_TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 14
    const-class v0, Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;->LOG_TAG:Ljava/lang/String;

    .line 16
    sget-object v0, Lcom/amazon/identity/auth/device/dataobject/Profile;->ALL_COLUMNS:[Ljava/lang/String;

    sput-object v0, Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;->ALL_COLUMNS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .param p1, "database"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 21
    invoke-direct {p0, p1}, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 22
    return-void
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 28
    const-class v1, Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;->INSTANCE:Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;

    if-nez v0, :cond_0

    .line 29
    new-instance v0, Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;

    invoke-static {p0}, Lcom/amazon/identity/auth/device/utils/MAPUtils;->getMAPdatabase(Landroid/content/Context;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    sput-object v0, Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;->INSTANCE:Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;

    .line 31
    :cond_0
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;->INSTANCE:Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 28
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public bridge synthetic cursorToObject(Landroid/database/Cursor;)Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;
    .locals 1
    .param p1, "x0"    # Landroid/database/Cursor;

    .prologue
    .line 12
    invoke-virtual {p0, p1}, Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;->cursorToObject(Landroid/database/Cursor;)Lcom/amazon/identity/auth/device/dataobject/Profile;

    move-result-object v0

    return-object v0
.end method

.method public cursorToObject(Landroid/database/Cursor;)Lcom/amazon/identity/auth/device/dataobject/Profile;
    .locals 6
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    const/4 v2, 0x0

    .line 51
    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v3

    if-nez v3, :cond_1

    :cond_0
    move-object v1, v2

    .line 67
    :goto_0
    return-object v1

    .line 56
    :cond_1
    :try_start_0
    new-instance v1, Lcom/amazon/identity/auth/device/dataobject/Profile;

    invoke-direct {v1}, Lcom/amazon/identity/auth/device/dataobject/Profile;-><init>()V

    .line 57
    .local v1, "profile":Lcom/amazon/identity/auth/device/dataobject/Profile;
    sget-object v3, Lcom/amazon/identity/auth/device/dataobject/Profile$COL_INDEX;->ID:Lcom/amazon/identity/auth/device/dataobject/Profile$COL_INDEX;

    iget v3, v3, Lcom/amazon/identity/auth/device/dataobject/Profile$COL_INDEX;->colId:I

    invoke-virtual {p0, p1, v3}, Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;->getColumnIndex(Landroid/database/Cursor;I)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    invoke-virtual {v1, v3, v4}, Lcom/amazon/identity/auth/device/dataobject/Profile;->setId(J)V

    .line 58
    sget-object v3, Lcom/amazon/identity/auth/device/dataobject/Profile$COL_INDEX;->APP_ID:Lcom/amazon/identity/auth/device/dataobject/Profile$COL_INDEX;

    iget v3, v3, Lcom/amazon/identity/auth/device/dataobject/Profile$COL_INDEX;->colId:I

    invoke-virtual {p0, p1, v3}, Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;->getColumnIndex(Landroid/database/Cursor;I)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/amazon/identity/auth/device/dataobject/Profile;->setAppId(Ljava/lang/String;)V

    .line 59
    sget-object v3, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->ISO8601:Ljava/text/SimpleDateFormat;

    sget-object v4, Lcom/amazon/identity/auth/device/dataobject/Profile$COL_INDEX;->EXPIRATION_TIME:Lcom/amazon/identity/auth/device/dataobject/Profile$COL_INDEX;

    iget v4, v4, Lcom/amazon/identity/auth/device/dataobject/Profile$COL_INDEX;->colId:I

    invoke-virtual {p0, p1, v4}, Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;->getColumnIndex(Landroid/database/Cursor;I)I

    move-result v4

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/amazon/identity/auth/device/dataobject/Profile;->setExpirationTime(Ljava/util/Date;)V

    .line 61
    sget-object v3, Lcom/amazon/identity/auth/device/dataobject/Profile$COL_INDEX;->DATA:Lcom/amazon/identity/auth/device/dataobject/Profile$COL_INDEX;

    iget v3, v3, Lcom/amazon/identity/auth/device/dataobject/Profile$COL_INDEX;->colId:I

    invoke-virtual {p0, p1, v3}, Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;->getColumnIndex(Landroid/database/Cursor;I)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/amazon/identity/auth/device/dataobject/Profile;->setData(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 65
    .end local v1    # "profile":Lcom/amazon/identity/auth/device/dataobject/Profile;
    :catch_0
    move-exception v0

    .line 66
    .local v0, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v0}, Lcom/amazon/identity/auth/device/utils/MAPLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object v1, v2

    .line 67
    goto :goto_0
.end method

.method public getAllColumns()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 46
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;->ALL_COLUMNS:[Ljava/lang/String;

    return-object v0
.end method

.method public getLogTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 36
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;->LOG_TAG:Ljava/lang/String;

    return-object v0
.end method

.method public getProfile(Ljava/lang/String;)Lcom/amazon/identity/auth/device/dataobject/Profile;
    .locals 1
    .param p1, "appId"    # Ljava/lang/String;

    .prologue
    .line 77
    const-string v0, "AppId"

    invoke-virtual {p0, v0, p1}, Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;->findOneRowBySingleColumn(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;

    move-result-object v0

    check-cast v0, Lcom/amazon/identity/auth/device/dataobject/Profile;

    return-object v0
.end method

.method public getTableName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 41
    const-string v0, "Profile"

    return-object v0
.end method
