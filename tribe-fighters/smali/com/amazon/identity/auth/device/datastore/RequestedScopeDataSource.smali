.class public final Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;
.super Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;
.source "RequestedScopeDataSource.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/amazon/identity/auth/device/datastore/AbstractDataSource",
        "<",
        "Lcom/amazon/identity/auth/device/dataobject/RequestedScope;",
        ">;"
    }
.end annotation


# static fields
.field private static final ALL_COLUMNS:[Ljava/lang/String;

.field private static INSTANCE:Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;

.field private static final LOG_TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 24
    const-class v0, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->LOG_TAG:Ljava/lang/String;

    .line 26
    sget-object v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->ALL_COLUMNS:[Ljava/lang/String;

    sput-object v0, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->ALL_COLUMNS:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .param p1, "database"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 32
    return-void
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 38
    const-class v1, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->INSTANCE:Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;

    if-nez v0, :cond_0

    .line 39
    new-instance v0, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;

    invoke-static {p0}, Lcom/amazon/identity/auth/device/utils/MAPUtils;->getMAPdatabase(Landroid/content/Context;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    sput-object v0, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->INSTANCE:Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;

    .line 41
    :cond_0
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->INSTANCE:Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 38
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
    .line 22
    invoke-virtual {p0, p1}, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->cursorToObject(Landroid/database/Cursor;)Lcom/amazon/identity/auth/device/dataobject/RequestedScope;

    move-result-object v0

    return-object v0
.end method

.method public cursorToObject(Landroid/database/Cursor;)Lcom/amazon/identity/auth/device/dataobject/RequestedScope;
    .locals 6
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    const/4 v2, 0x0

    .line 139
    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v3

    if-nez v3, :cond_1

    :cond_0
    move-object v1, v2

    .line 158
    :goto_0
    return-object v1

    .line 144
    :cond_1
    :try_start_0
    new-instance v1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;

    invoke-direct {v1}, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;-><init>()V

    .line 146
    .local v1, "to_return":Lcom/amazon/identity/auth/device/dataobject/RequestedScope;
    sget-object v3, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->ROW_ID:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;

    iget v3, v3, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->colId:I

    invoke-virtual {p0, p1, v3}, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->getColumnIndex(Landroid/database/Cursor;I)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    invoke-virtual {v1, v3, v4}, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->setRowId(J)V

    .line 147
    sget-object v3, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->SCOPE:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;

    iget v3, v3, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->colId:I

    invoke-virtual {p0, p1, v3}, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->getColumnIndex(Landroid/database/Cursor;I)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->setScopeValue(Ljava/lang/String;)V

    .line 148
    sget-object v3, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->APP_FAMILY_ID:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;

    iget v3, v3, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->colId:I

    invoke-virtual {p0, p1, v3}, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->getColumnIndex(Landroid/database/Cursor;I)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->setAppFamilyId(Ljava/lang/String;)V

    .line 149
    sget-object v3, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->DIRECTED_ID:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;

    iget v3, v3, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->colId:I

    invoke-virtual {p0, p1, v3}, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->getColumnIndex(Landroid/database/Cursor;I)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->setDirectedId(Ljava/lang/String;)V

    .line 150
    sget-object v3, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->AUTHORIZATION_ACCESS_TOKEN_ID:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;

    iget v3, v3, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->colId:I

    invoke-virtual {p0, p1, v3}, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->getColumnIndex(Landroid/database/Cursor;I)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    invoke-virtual {v1, v3, v4}, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->setAuthorizationAccessTokenId(J)V

    .line 151
    sget-object v3, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->AUTHORIZATION_REFRESH_TOKEN_ID:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;

    iget v3, v3, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->colId:I

    invoke-virtual {p0, p1, v3}, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->getColumnIndex(Landroid/database/Cursor;I)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    invoke-virtual {v1, v3, v4}, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->setAuthorizationRefreshTokenId(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 156
    .end local v1    # "to_return":Lcom/amazon/identity/auth/device/dataobject/RequestedScope;
    :catch_0
    move-exception v0

    .line 157
    .local v0, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->LOG_TAG:Ljava/lang/String;

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

    .line 158
    goto :goto_0
.end method

.method public deleteByAppId(Ljava/lang/String;)I
    .locals 2
    .param p1, "appId"    # Ljava/lang/String;

    .prologue
    .line 120
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->APP_FAMILY_ID:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;

    iget v1, v1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->colId:I

    aget-object v0, v0, v1

    invoke-virtual {p0, v0, p1}, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->deleteRowsBySingleColumn(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public deleteByDirectedId(Ljava/lang/String;)I
    .locals 2
    .param p1, "directedId"    # Ljava/lang/String;

    .prologue
    .line 129
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->DIRECTED_ID:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;

    iget v1, v1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->colId:I

    aget-object v0, v0, v1

    invoke-virtual {p0, v0, p1}, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->deleteRowsBySingleColumn(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public deleteByScope(Ljava/lang/String;)I
    .locals 2
    .param p1, "scopeValue"    # Ljava/lang/String;

    .prologue
    .line 111
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->SCOPE:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;

    iget v1, v1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->colId:I

    aget-object v0, v0, v1

    invoke-virtual {p0, v0, p1}, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->deleteRowsBySingleColumn(Ljava/lang/String;Ljava/lang/String;)I

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
            "Lcom/amazon/identity/auth/device/dataobject/RequestedScope;",
            ">;"
        }
    .end annotation

    .prologue
    .line 59
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->APP_FAMILY_ID:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;

    iget v1, v1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->colId:I

    aget-object v0, v0, v1

    invoke-virtual {p0, v0, p1}, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->findAllRowsBySingleColumn(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public findByAuthorizationAccessTokenId(J)Ljava/util/List;
    .locals 3
    .param p1, "atzTokenId"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Ljava/util/List",
            "<",
            "Lcom/amazon/identity/auth/device/dataobject/RequestedScope;",
            ">;"
        }
    .end annotation

    .prologue
    .line 77
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->AUTHORIZATION_ACCESS_TOKEN_ID:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;

    iget v1, v1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->colId:I

    aget-object v0, v0, v1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->findAllRowsBySingleColumn(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public findByAuthorizationRefreshTokenId(J)Ljava/util/List;
    .locals 3
    .param p1, "atzTokenId"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Ljava/util/List",
            "<",
            "Lcom/amazon/identity/auth/device/dataobject/RequestedScope;",
            ">;"
        }
    .end annotation

    .prologue
    .line 86
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->AUTHORIZATION_REFRESH_TOKEN_ID:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;

    iget v1, v1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->colId:I

    aget-object v0, v0, v1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->findAllRowsBySingleColumn(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public findByDirectedId(Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .param p1, "directedId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/amazon/identity/auth/device/dataobject/RequestedScope;",
            ">;"
        }
    .end annotation

    .prologue
    .line 68
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->DIRECTED_ID:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;

    iget v1, v1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->colId:I

    aget-object v0, v0, v1

    invoke-virtual {p0, v0, p1}, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->findAllRowsBySingleColumn(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public findByPrimaryKey(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/identity/auth/device/dataobject/RequestedScope;
    .locals 8
    .param p1, "scopeValue"    # Ljava/lang/String;
    .param p2, "appId"    # Ljava/lang/String;
    .param p3, "directedId"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 95
    new-array v0, v7, [Ljava/lang/String;

    sget-object v2, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v3, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->SCOPE:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;

    iget v3, v3, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->colId:I

    aget-object v2, v2, v3

    aput-object v2, v0, v4

    sget-object v2, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v3, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->APP_FAMILY_ID:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;

    iget v3, v3, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->colId:I

    aget-object v2, v2, v3

    aput-object v2, v0, v5

    sget-object v2, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v3, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->DIRECTED_ID:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;

    iget v3, v3, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->colId:I

    aget-object v2, v2, v3

    aput-object v2, v0, v6

    .line 98
    .local v0, "selectionFields":[Ljava/lang/String;
    new-array v1, v7, [Ljava/lang/String;

    aput-object p1, v1, v4

    aput-object p2, v1, v5

    aput-object p3, v1, v6

    .line 102
    .local v1, "selectionValues":[Ljava/lang/String;
    invoke-virtual {p0, v0, v1}, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->findOneRow([Ljava/lang/String;[Ljava/lang/String;)Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;

    move-result-object v2

    check-cast v2, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;

    return-object v2
.end method

.method public findByScope(Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .param p1, "scopeValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/amazon/identity/auth/device/dataobject/RequestedScope;",
            ">;"
        }
    .end annotation

    .prologue
    .line 50
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->SCOPE:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;

    iget v1, v1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->colId:I

    aget-object v0, v0, v1

    invoke-virtual {p0, v0, p1}, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->findAllRowsBySingleColumn(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getAllColumns()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 169
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->ALL_COLUMNS:[Ljava/lang/String;

    return-object v0
.end method

.method public getLogTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 134
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->LOG_TAG:Ljava/lang/String;

    return-object v0
.end method

.method public getTableName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 164
    const-string v0, "RequestedScope"

    return-object v0
.end method
