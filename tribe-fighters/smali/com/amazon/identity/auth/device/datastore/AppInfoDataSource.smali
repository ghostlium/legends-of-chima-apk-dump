.class public final Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;
.super Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;
.source "AppInfoDataSource.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/amazon/identity/auth/device/datastore/AbstractDataSource",
        "<",
        "Lcom/amazon/identity/auth/device/dataobject/AppInfo;",
        ">;"
    }
.end annotation


# static fields
.field private static final ALL_COLUMNS:[Ljava/lang/String;

.field private static INSTANCE:Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;

.field private static final LOG_TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    const-class v0, Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;->LOG_TAG:Ljava/lang/String;

    .line 21
    sget-object v0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->ALL_COLUMNS:[Ljava/lang/String;

    sput-object v0, Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;->ALL_COLUMNS:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .param p1, "database"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 26
    invoke-direct {p0, p1}, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 27
    return-void
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 33
    const-class v1, Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;->INSTANCE:Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;

    if-nez v0, :cond_0

    .line 34
    new-instance v0, Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;

    invoke-static {p0}, Lcom/amazon/identity/auth/device/utils/MAPUtils;->getMAPdatabase(Landroid/content/Context;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    sput-object v0, Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;->INSTANCE:Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;

    .line 36
    :cond_0
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;->INSTANCE:Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 33
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
    .line 17
    invoke-virtual {p0, p1}, Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;->cursorToObject(Landroid/database/Cursor;)Lcom/amazon/identity/auth/device/dataobject/AppInfo;

    move-result-object v0

    return-object v0
.end method

.method public cursorToObject(Landroid/database/Cursor;)Lcom/amazon/identity/auth/device/dataobject/AppInfo;
    .locals 6
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    const/4 v2, 0x0

    .line 109
    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v3

    if-nez v3, :cond_1

    :cond_0
    move-object v1, v2

    .line 134
    :goto_0
    return-object v1

    .line 114
    :cond_1
    :try_start_0
    new-instance v1, Lcom/amazon/identity/auth/device/dataobject/AppInfo;

    invoke-direct {v1}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;-><init>()V

    .line 116
    .local v1, "to_return":Lcom/amazon/identity/auth/device/dataobject/AppInfo;
    sget-object v3, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->ROW_ID:Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;

    iget v3, v3, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->colId:I

    invoke-virtual {p0, p1, v3}, Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;->getColumnIndex(Landroid/database/Cursor;I)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    invoke-virtual {v1, v3, v4}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->setRowId(J)V

    .line 117
    sget-object v3, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->APP_FAMILY_ID:Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;

    iget v3, v3, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->colId:I

    invoke-virtual {p0, p1, v3}, Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;->getColumnIndex(Landroid/database/Cursor;I)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->setAppFamilyId(Ljava/lang/String;)V

    .line 118
    sget-object v3, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->APP_VARIANT_ID:Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;

    iget v3, v3, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->colId:I

    invoke-virtual {p0, p1, v3}, Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;->getColumnIndex(Landroid/database/Cursor;I)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->setAppVariantId(Ljava/lang/String;)V

    .line 119
    sget-object v3, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->PACKAGE_NAME:Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;

    iget v3, v3, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->colId:I

    invoke-virtual {p0, p1, v3}, Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;->getColumnIndex(Landroid/database/Cursor;I)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->setPackageName(Ljava/lang/String;)V

    .line 120
    sget-object v3, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->ALLOWED_SCOPES:Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;

    iget v3, v3, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->colId:I

    invoke-virtual {p0, p1, v3}, Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;->getColumnIndex(Landroid/database/Cursor;I)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, ","

    invoke-static {v3, v4}, Lcom/amazon/identity/auth/device/utils/MAPUtils;->toStringArray(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->setAllowedScopes([Ljava/lang/String;)V

    .line 123
    sget-object v3, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->GRANTED_PERMISSIONS:Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;

    iget v3, v3, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->colId:I

    invoke-virtual {p0, p1, v3}, Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;->getColumnIndex(Landroid/database/Cursor;I)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, ","

    invoke-static {v3, v4}, Lcom/amazon/identity/auth/device/utils/MAPUtils;->toStringArray(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->setGrantedPermissions([Ljava/lang/String;)V

    .line 126
    sget-object v3, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->CLIENT_ID:Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;

    iget v3, v3, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->colId:I

    invoke-virtual {p0, p1, v3}, Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;->getColumnIndex(Landroid/database/Cursor;I)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->setClientId(Ljava/lang/String;)V

    .line 127
    sget-object v3, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->PAYLOAD:Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;

    iget v3, v3, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->colId:I

    invoke-virtual {p0, p1, v3}, Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;->getColumnIndex(Landroid/database/Cursor;I)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->setPayload(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 132
    .end local v1    # "to_return":Lcom/amazon/identity/auth/device/dataobject/AppInfo;
    :catch_0
    move-exception v0

    .line 133
    .local v0, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;->LOG_TAG:Ljava/lang/String;

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

    .line 134
    goto/16 :goto_0
.end method

.method public deleteByAppId(Ljava/lang/String;)I
    .locals 2
    .param p1, "appId"    # Ljava/lang/String;

    .prologue
    .line 90
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->APP_FAMILY_ID:Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;

    iget v1, v1, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->colId:I

    aget-object v0, v0, v1

    invoke-virtual {p0, v0, p1}, Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;->deleteRowsBySingleColumn(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public deleteByPackageName(Ljava/lang/String;)I
    .locals 2
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 99
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->PACKAGE_NAME:Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;

    iget v1, v1, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->colId:I

    aget-object v0, v0, v1

    invoke-virtual {p0, v0, p1}, Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;->deleteRowsBySingleColumn(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public findByAppFamilyId(Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .param p1, "appFamilyId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/amazon/identity/auth/device/dataobject/AppInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 54
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->APP_FAMILY_ID:Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;

    iget v1, v1, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->colId:I

    aget-object v0, v0, v1

    invoke-virtual {p0, v0, p1}, Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;->findAllRowsBySingleColumn(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public findByAppId(Ljava/lang/String;)Lcom/amazon/identity/auth/device/dataobject/AppInfo;
    .locals 2
    .param p1, "appId"    # Ljava/lang/String;

    .prologue
    .line 45
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->APP_FAMILY_ID:Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;

    iget v1, v1, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->colId:I

    aget-object v0, v0, v1

    invoke-virtual {p0, v0, p1}, Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;->findOneRowBySingleColumn(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;

    move-result-object v0

    check-cast v0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;

    return-object v0
.end method

.method public findByAppVariantId(Ljava/lang/String;)Lcom/amazon/identity/auth/device/dataobject/AppInfo;
    .locals 2
    .param p1, "appVariantId"    # Ljava/lang/String;

    .prologue
    .line 63
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->APP_VARIANT_ID:Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;

    iget v1, v1, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->colId:I

    aget-object v0, v0, v1

    invoke-virtual {p0, v0, p1}, Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;->findOneRowBySingleColumn(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;

    move-result-object v0

    check-cast v0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;

    return-object v0
.end method

.method public findByPackageName(Ljava/lang/String;)Lcom/amazon/identity/auth/device/dataobject/AppInfo;
    .locals 2
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 72
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->PACKAGE_NAME:Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;

    iget v1, v1, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->colId:I

    aget-object v0, v0, v1

    invoke-virtual {p0, v0, p1}, Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;->findOneRowBySingleColumn(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;

    move-result-object v0

    check-cast v0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;

    return-object v0
.end method

.method public findByPrimaryKey(Ljava/lang/String;)Lcom/amazon/identity/auth/device/dataobject/AppInfo;
    .locals 1
    .param p1, "appVariantId"    # Ljava/lang/String;

    .prologue
    .line 81
    invoke-virtual {p0, p1}, Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;->findByAppVariantId(Ljava/lang/String;)Lcom/amazon/identity/auth/device/dataobject/AppInfo;

    move-result-object v0

    return-object v0
.end method

.method public getAllColumns()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 145
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;->ALL_COLUMNS:[Ljava/lang/String;

    return-object v0
.end method

.method public getLogTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 104
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;->LOG_TAG:Ljava/lang/String;

    return-object v0
.end method

.method public getTableName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 140
    const-string v0, "AppInfo"

    return-object v0
.end method
