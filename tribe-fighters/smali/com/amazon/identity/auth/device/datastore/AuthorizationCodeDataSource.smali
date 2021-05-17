.class public final Lcom/amazon/identity/auth/device/datastore/AuthorizationCodeDataSource;
.super Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;
.source "AuthorizationCodeDataSource.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/amazon/identity/auth/device/datastore/AbstractDataSource",
        "<",
        "Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode;",
        ">;"
    }
.end annotation


# static fields
.field private static final ALL_COLUMNS:[Ljava/lang/String;

.field private static INSTANCE:Lcom/amazon/identity/auth/device/datastore/AuthorizationCodeDataSource;

.field private static final LOG_TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    const-class v0, Lcom/amazon/identity/auth/device/datastore/AuthorizationCodeDataSource;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/datastore/AuthorizationCodeDataSource;->LOG_TAG:Ljava/lang/String;

    .line 26
    sget-object v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode;->ALL_COLUMNS:[Ljava/lang/String;

    sput-object v0, Lcom/amazon/identity/auth/device/datastore/AuthorizationCodeDataSource;->ALL_COLUMNS:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .param p1, "database"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 29
    invoke-direct {p0, p1}, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 30
    return-void
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/amazon/identity/auth/device/datastore/AuthorizationCodeDataSource;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 36
    const-class v1, Lcom/amazon/identity/auth/device/datastore/AuthorizationCodeDataSource;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/AuthorizationCodeDataSource;->INSTANCE:Lcom/amazon/identity/auth/device/datastore/AuthorizationCodeDataSource;

    if-nez v0, :cond_0

    .line 37
    new-instance v0, Lcom/amazon/identity/auth/device/datastore/AuthorizationCodeDataSource;

    invoke-static {p0}, Lcom/amazon/identity/auth/device/utils/MAPUtils;->getMAPdatabase(Landroid/content/Context;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/amazon/identity/auth/device/datastore/AuthorizationCodeDataSource;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    sput-object v0, Lcom/amazon/identity/auth/device/datastore/AuthorizationCodeDataSource;->INSTANCE:Lcom/amazon/identity/auth/device/datastore/AuthorizationCodeDataSource;

    .line 39
    :cond_0
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/AuthorizationCodeDataSource;->INSTANCE:Lcom/amazon/identity/auth/device/datastore/AuthorizationCodeDataSource;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 36
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
    .line 20
    invoke-virtual {p0, p1}, Lcom/amazon/identity/auth/device/datastore/AuthorizationCodeDataSource;->cursorToObject(Landroid/database/Cursor;)Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode;

    move-result-object v0

    return-object v0
.end method

.method public cursorToObject(Landroid/database/Cursor;)Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode;
    .locals 6
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    const/4 v2, 0x0

    .line 67
    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v3

    if-nez v3, :cond_1

    :cond_0
    move-object v1, v2

    .line 82
    :goto_0
    return-object v1

    .line 72
    :cond_1
    :try_start_0
    new-instance v1, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode;

    invoke-direct {v1}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode;-><init>()V

    .line 73
    .local v1, "to_return":Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode;
    sget-object v3, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;->ROW_ID:Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;

    iget v3, v3, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;->colId:I

    invoke-virtual {p0, p1, v3}, Lcom/amazon/identity/auth/device/datastore/AuthorizationCodeDataSource;->getColumnIndex(Landroid/database/Cursor;I)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    invoke-virtual {v1, v3, v4}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode;->setId(J)V

    .line 74
    sget-object v3, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;->CODE:Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;

    iget v3, v3, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;->colId:I

    invoke-virtual {p0, p1, v3}, Lcom/amazon/identity/auth/device/datastore/AuthorizationCodeDataSource;->getColumnIndex(Landroid/database/Cursor;I)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode;->setCode(Ljava/lang/String;)V

    .line 75
    sget-object v3, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;->APP_FAMILY_ID:Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;

    iget v3, v3, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;->colId:I

    invoke-virtual {p0, p1, v3}, Lcom/amazon/identity/auth/device/datastore/AuthorizationCodeDataSource;->getColumnIndex(Landroid/database/Cursor;I)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode;->setAppId(Ljava/lang/String;)V

    .line 76
    sget-object v3, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;->AUTHORIZATION_TOKEN_ID:Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;

    iget v3, v3, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;->colId:I

    invoke-virtual {p0, p1, v3}, Lcom/amazon/identity/auth/device/datastore/AuthorizationCodeDataSource;->getColumnIndex(Landroid/database/Cursor;I)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    invoke-virtual {v1, v3, v4}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode;->setAuthorizationTokenId(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 80
    .end local v1    # "to_return":Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode;
    :catch_0
    move-exception v0

    .line 81
    .local v0, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/amazon/identity/auth/device/datastore/AuthorizationCodeDataSource;->LOG_TAG:Ljava/lang/String;

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

    .line 82
    goto :goto_0
.end method

.method public deleteByAppId(Ljava/lang/String;)I
    .locals 2
    .param p1, "appId"    # Ljava/lang/String;

    .prologue
    .line 111
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/AuthorizationCodeDataSource;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;->APP_FAMILY_ID:Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;

    iget v1, v1, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;->colId:I

    aget-object v0, v0, v1

    invoke-virtual {p0, v0, p1}, Lcom/amazon/identity/auth/device/datastore/AuthorizationCodeDataSource;->deleteRowsBySingleColumn(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public findByAppId(Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .param p1, "appId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode;",
            ">;"
        }
    .end annotation

    .prologue
    .line 102
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/AuthorizationCodeDataSource;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;->APP_FAMILY_ID:Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;

    iget v1, v1, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode$COL_INDEX;->colId:I

    aget-object v0, v0, v1

    invoke-virtual {p0, v0, p1}, Lcom/amazon/identity/auth/device/datastore/AuthorizationCodeDataSource;->findAllRowsBySingleColumn(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public findById(J)Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode;
    .locals 1
    .param p1, "id"    # J

    .prologue
    .line 53
    invoke-virtual {p0, p1, p2}, Lcom/amazon/identity/auth/device/datastore/AuthorizationCodeDataSource;->findByRowId(J)Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;

    move-result-object v0

    check-cast v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode;

    return-object v0
.end method

.method public findByPrimaryKey(J)Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode;
    .locals 1
    .param p1, "id"    # J

    .prologue
    .line 62
    invoke-virtual {p0, p1, p2}, Lcom/amazon/identity/auth/device/datastore/AuthorizationCodeDataSource;->findByRowId(J)Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;

    move-result-object v0

    check-cast v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationCode;

    return-object v0
.end method

.method public getAllColumns()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 93
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/AuthorizationCodeDataSource;->ALL_COLUMNS:[Ljava/lang/String;

    return-object v0
.end method

.method public getLogTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 44
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/AuthorizationCodeDataSource;->LOG_TAG:Ljava/lang/String;

    return-object v0
.end method

.method public getTableName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 88
    const-string v0, "AuthorizationCode"

    return-object v0
.end method
