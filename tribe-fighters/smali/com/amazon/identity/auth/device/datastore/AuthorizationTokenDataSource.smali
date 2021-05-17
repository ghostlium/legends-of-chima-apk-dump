.class public final Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;
.super Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;
.source "AuthorizationTokenDataSource.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/amazon/identity/auth/device/datastore/AbstractDataSource",
        "<",
        "Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;",
        ">;"
    }
.end annotation


# static fields
.field private static final ALL_COLUMNS:[Ljava/lang/String;

.field private static INSTANCE:Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;

.field private static final LOG_TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    const-class v0, Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;->LOG_TAG:Ljava/lang/String;

    .line 24
    sget-object v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->ALL_COLUMNS:[Ljava/lang/String;

    sput-object v0, Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;->ALL_COLUMNS:[Ljava/lang/String;

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

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 36
    const-class v1, Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;->INSTANCE:Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;

    if-nez v0, :cond_0

    .line 37
    new-instance v0, Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;

    invoke-static {p0}, Lcom/amazon/identity/auth/device/utils/MAPUtils;->getMAPdatabase(Landroid/content/Context;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    sput-object v0, Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;->INSTANCE:Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;

    .line 39
    :cond_0
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;->INSTANCE:Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;
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
    invoke-virtual {p0, p1}, Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;->cursorToObject(Landroid/database/Cursor;)Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;

    move-result-object v0

    return-object v0
.end method

.method public cursorToObject(Landroid/database/Cursor;)Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;
    .locals 7
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    const/4 v3, 0x0

    .line 85
    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v4

    if-nez v4, :cond_1

    :cond_0
    move-object v1, v3

    .line 109
    :goto_0
    return-object v1

    .line 90
    :cond_1
    :try_start_0
    invoke-static {}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;->values()[Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;

    move-result-object v4

    sget-object v5, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->TYPE:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    iget v5, v5, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->colId:I

    invoke-virtual {p0, p1, v5}, Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;->getColumnIndex(Landroid/database/Cursor;I)I

    move-result v5

    invoke-interface {p1, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    aget-object v2, v4, v5

    .line 91
    .local v2, "type":Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;
    invoke-static {v2}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationTokenFactory;->getAuthorizationToken(Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;)Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;

    move-result-object v1

    .line 92
    .local v1, "to_return":Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;
    sget-object v4, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->ID:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    iget v4, v4, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->colId:I

    invoke-virtual {p0, p1, v4}, Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;->getColumnIndex(Landroid/database/Cursor;I)I

    move-result v4

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->setId(J)V

    .line 93
    sget-object v4, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->APP_ID:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    iget v4, v4, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->colId:I

    invoke-virtual {p0, p1, v4}, Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;->getColumnIndex(Landroid/database/Cursor;I)I

    move-result v4

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->setAppFamilyId(Ljava/lang/String;)V

    .line 94
    sget-object v4, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->TOKEN:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    iget v4, v4, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->colId:I

    invoke-virtual {p0, p1, v4}, Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;->getColumnIndex(Landroid/database/Cursor;I)I

    move-result v4

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->setTokenValue(Ljava/lang/String;)V

    .line 95
    sget-object v4, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->ISO8601:Ljava/text/SimpleDateFormat;

    sget-object v5, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->CREATION_TIME:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    iget v5, v5, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->colId:I

    invoke-virtual {p0, p1, v5}, Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;->getColumnIndex(Landroid/database/Cursor;I)I

    move-result v5

    invoke-interface {p1, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->setCreationTime(Ljava/util/Date;)V

    .line 98
    sget-object v4, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->ISO8601:Ljava/text/SimpleDateFormat;

    sget-object v5, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->EXPIRATION_TIME:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    iget v5, v5, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->colId:I

    invoke-virtual {p0, p1, v5}, Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;->getColumnIndex(Landroid/database/Cursor;I)I

    move-result v5

    invoke-interface {p1, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->setExpirationTime(Ljava/util/Date;)V

    .line 101
    sget-object v4, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->MISC_DATA:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    iget v4, v4, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->colId:I

    invoke-virtual {p0, p1, v4}, Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;->getColumnIndex(Landroid/database/Cursor;I)I

    move-result v4

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->setMiscData([B)V

    .line 102
    sget-object v4, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->DIRECTED_ID:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    iget v4, v4, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->colId:I

    invoke-virtual {p0, p1, v4}, Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;->getColumnIndex(Landroid/database/Cursor;I)I

    move-result v4

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->setDirectedId(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 107
    .end local v1    # "to_return":Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;
    .end local v2    # "type":Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;
    :catch_0
    move-exception v0

    .line 108
    .local v0, "e":Ljava/lang/Exception;
    sget-object v4, Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v0}, Lcom/amazon/identity/auth/device/utils/MAPLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object v1, v3

    .line 109
    goto/16 :goto_0
.end method

.method public deleteByAppId(Ljava/lang/String;)I
    .locals 2
    .param p1, "appId"    # Ljava/lang/String;

    .prologue
    .line 75
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->APP_ID:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    iget v1, v1, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->colId:I

    aget-object v0, v0, v1

    invoke-virtual {p0, v0, p1}, Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;->deleteRowsBySingleColumn(Ljava/lang/String;Ljava/lang/String;)I

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
            "Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;",
            ">;"
        }
    .end annotation

    .prologue
    .line 48
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->APP_ID:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    iget v1, v1, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->colId:I

    aget-object v0, v0, v1

    invoke-virtual {p0, v0, p1}, Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;->findAllRowsBySingleColumn(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public findById(J)Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;
    .locals 1
    .param p1, "id"    # J

    .prologue
    .line 57
    invoke-virtual {p0, p1, p2}, Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;->findByRowId(J)Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;

    move-result-object v0

    check-cast v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;

    return-object v0
.end method

.method public findByPrimaryKey(J)Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;
    .locals 1
    .param p1, "id"    # J

    .prologue
    .line 66
    invoke-virtual {p0, p1, p2}, Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;->findByRowId(J)Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;

    move-result-object v0

    check-cast v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;

    return-object v0
.end method

.method public getAllColumns()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 120
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;->ALL_COLUMNS:[Ljava/lang/String;

    return-object v0
.end method

.method public getLogTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 80
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;->LOG_TAG:Ljava/lang/String;

    return-object v0
.end method

.method public getTableName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 115
    const-string v0, "AuthorizationToken"

    return-object v0
.end method
