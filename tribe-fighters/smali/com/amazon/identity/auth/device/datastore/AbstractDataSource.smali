.class public abstract Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;
.super Ljava/lang/Object;
.source "AbstractDataSource.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final DELETE_SUCCEEDED:I = 0x1

.field public static final INSERT_FAILED:I = -0x1

.field private static final LOG_TAG:Ljava/lang/String;

.field private static final UPDATE_SUCCEEDED:I = 0x1


# instance fields
.field protected database:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    const-class v0, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->$assertionsDisabled:Z

    .line 21
    const-class v0, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->LOG_TAG:Ljava/lang/String;

    return-void

    .line 19
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2
    .param p1, "database"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 34
    .local p0, "this":Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;, "Lcom/amazon/identity/auth/device/datastore/AbstractDataSource<TK;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    if-nez p1, :cond_0

    .line 36
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "database can\'t be null!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 38
    :cond_0
    iput-object p1, p0, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->database:Landroid/database/sqlite/SQLiteDatabase;

    .line 39
    return-void
.end method

.method private static getWhereClause([Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "selectionFields"    # [Ljava/lang/String;
    .param p1, "selectionValues"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 231
    if-nez p0, :cond_1

    if-nez p1, :cond_1

    .line 232
    const/4 v1, 0x0

    .line 248
    :cond_0
    return-object v1

    .line 234
    :cond_1
    if-eqz p0, :cond_2

    if-nez p1, :cond_3

    .line 235
    :cond_2
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Both arguments have to be either null or not null!"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 237
    :cond_3
    array-length v2, p0

    array-length v3, p1

    if-eq v2, v3, :cond_4

    .line 238
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "selectionFields and selectionValues differ in length!"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 241
    :cond_4
    const-string v1, ""

    .line 243
    .local v1, "to_return":Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 244
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-object v3, p0, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget-object v2, p1, v0

    if-nez v2, :cond_5

    const-string v2, " IS NULL"

    :goto_1
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 245
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    array-length v2, p0

    add-int/lit8 v2, v2, -0x1

    if-eq v0, v2, :cond_6

    const-string v2, " AND "

    :goto_2
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 243
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 244
    :cond_5
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " = \'"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-object v4, p1, v0

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "\'"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 245
    :cond_6
    const-string v2, ""

    goto :goto_2
.end method


# virtual methods
.method public abstract cursorToObject(Landroid/database/Cursor;)Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            ")TK;"
        }
    .end annotation
.end method

.method public deleteAllRows()I
    .locals 1

    .prologue
    .local p0, "this":Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;, "Lcom/amazon/identity/auth/device/datastore/AbstractDataSource<TK;>;"
    const/4 v0, 0x0

    .line 200
    invoke-virtual {p0, v0, v0}, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->deleteRows([Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public deleteRow(J)Z
    .locals 5
    .param p1, "rowid"    # J

    .prologue
    .local p0, "this":Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;, "Lcom/amazon/identity/auth/device/datastore/AbstractDataSource<TK;>;"
    const/4 v0, 0x1

    .line 166
    iget-object v1, p0, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->database:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->getTableName()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "rowid = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public deleteRows([Ljava/lang/String;[Ljava/lang/String;)I
    .locals 5
    .param p1, "selectionFields"    # [Ljava/lang/String;
    .param p2, "selectionValues"    # [Ljava/lang/String;

    .prologue
    .line 176
    .local p0, "this":Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;, "Lcom/amazon/identity/auth/device/datastore/AbstractDataSource<TK;>;"
    :try_start_0
    invoke-static {p1, p2}, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->getWhereClause([Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 177
    .local v1, "whereClause":Ljava/lang/String;
    iget-object v2, p0, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->database:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->getTableName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v1, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 181
    .end local v1    # "whereClause":Ljava/lang/String;
    :goto_0
    return v2

    .line 179
    :catch_0
    move-exception v0

    .line 180
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->getLogTag()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Lcom/amazon/identity/auth/device/utils/MAPLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 181
    const/4 v2, 0x0

    goto :goto_0
.end method

.method protected deleteRowsBySingleColumn(Ljava/lang/String;Ljava/lang/String;)I
    .locals 3
    .param p1, "colName"    # Ljava/lang/String;
    .param p2, "colValue"    # Ljava/lang/String;

    .prologue
    .local p0, "this":Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;, "Lcom/amazon/identity/auth/device/datastore/AbstractDataSource<TK;>;"
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 191
    new-array v0, v1, [Ljava/lang/String;

    aput-object p1, v0, v2

    new-array v1, v1, [Ljava/lang/String;

    aput-object p2, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->deleteRows([Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public findAllRows()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<TK;>;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;, "Lcom/amazon/identity/auth/device/datastore/AbstractDataSource<TK;>;"
    const/4 v0, 0x0

    .line 140
    invoke-virtual {p0, v0, v0}, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->findAllRows([Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public findAllRows([Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;
    .locals 12
    .param p1, "selectionFields"    # [Ljava/lang/String;
    .param p2, "selectionValues"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<TK;>;"
        }
    .end annotation

    .prologue
    .line 92
    .local p0, "this":Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;, "Lcom/amazon/identity/auth/device/datastore/AbstractDataSource<TK;>;"
    const/4 v8, 0x0

    .line 93
    .local v8, "cursor":Landroid/database/Cursor;
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 96
    .local v11, "to_return":Ljava/util/List;, "Ljava/util/List<TK;>;"
    :try_start_0
    invoke-static {p1, p2}, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->getWhereClause([Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 97
    .local v3, "whereClause":Ljava/lang/String;
    iget-object v0, p0, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->database:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->getTableName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->getAllColumns()[Ljava/lang/String;

    move-result-object v2

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 99
    if-eqz v8, :cond_3

    .line 100
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    .line 103
    :goto_0
    invoke-interface {v8}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    if-nez v0, :cond_3

    .line 104
    invoke-virtual {p0, v8}, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->cursorToObject(Landroid/database/Cursor;)Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;

    move-result-object v10

    .local v10, "temp":Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;, "TK;"
    if-eqz v10, :cond_1

    .line 105
    invoke-interface {v11, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 110
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 114
    .end local v3    # "whereClause":Ljava/lang/String;
    .end local v10    # "temp":Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;, "TK;"
    :catch_0
    move-exception v9

    .line 115
    .local v9, "e":Ljava/lang/IllegalArgumentException;
    :try_start_1
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->getLogTag()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v9}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v9}, Lcom/amazon/identity/auth/device/utils/MAPLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 116
    invoke-interface {v11}, Ljava/util/List;->clear()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 119
    if-eqz v8, :cond_0

    .line 120
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 124
    .end local v9    # "e":Ljava/lang/IllegalArgumentException;
    :cond_0
    :goto_1
    return-object v11

    .line 108
    .restart local v3    # "whereClause":Ljava/lang/String;
    .restart local v10    # "temp":Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;, "TK;"
    :cond_1
    :try_start_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "cursor contains invalid object!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 119
    .end local v3    # "whereClause":Ljava/lang/String;
    .end local v10    # "temp":Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;, "TK;"
    :catchall_0
    move-exception v0

    if-eqz v8, :cond_2

    .line 120
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    :cond_2
    throw v0

    .line 119
    .restart local v3    # "whereClause":Ljava/lang/String;
    :cond_3
    if-eqz v8, :cond_0

    .line 120
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    goto :goto_1
.end method

.method protected findAllRowsBySingleColumn(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 3
    .param p1, "colName"    # Ljava/lang/String;
    .param p2, "colValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<TK;>;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;, "Lcom/amazon/identity/auth/device/datastore/AbstractDataSource<TK;>;"
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 133
    new-array v0, v1, [Ljava/lang/String;

    aput-object p1, v0, v2

    new-array v1, v1, [Ljava/lang/String;

    aput-object p2, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->findAllRows([Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public findByRowId(J)Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;
    .locals 5
    .param p1, "rowid"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)TK;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;, "Lcom/amazon/identity/auth/device/datastore/AbstractDataSource<TK;>;"
    const/4 v2, 0x1

    const/4 v4, 0x0

    .line 47
    new-array v0, v2, [Ljava/lang/String;

    const-string v1, "rowid"

    aput-object v1, v0, v4

    new-array v1, v2, [Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-virtual {p0, v0, v1}, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->findOneRow([Ljava/lang/String;[Ljava/lang/String;)Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;

    move-result-object v0

    return-object v0
.end method

.method public findOneRow([Ljava/lang/String;[Ljava/lang/String;)Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;
    .locals 11
    .param p1, "selectionFields"    # [Ljava/lang/String;
    .param p2, "selectionValues"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ")TK;"
        }
    .end annotation

    .prologue
    .line 54
    .local p0, "this":Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;, "Lcom/amazon/identity/auth/device/datastore/AbstractDataSource<TK;>;"
    const/4 v8, 0x0

    .line 55
    .local v8, "cursor":Landroid/database/Cursor;
    const/4 v10, 0x0

    .line 58
    .local v10, "to_return":Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;, "TK;"
    :try_start_0
    invoke-static {p1, p2}, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->getWhereClause([Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 59
    .local v3, "whereClause":Ljava/lang/String;
    iget-object v0, p0, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->database:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->getTableName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->getAllColumns()[Ljava/lang/String;

    move-result-object v2

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 61
    if-eqz v8, :cond_0

    .line 62
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    .line 63
    invoke-virtual {p0, v8}, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->cursorToObject(Landroid/database/Cursor;)Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v10

    .line 71
    :cond_0
    if-eqz v8, :cond_1

    .line 72
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 76
    .end local v3    # "whereClause":Ljava/lang/String;
    :cond_1
    :goto_0
    return-object v10

    .line 66
    :catch_0
    move-exception v9

    .line 67
    .local v9, "e":Ljava/lang/IllegalArgumentException;
    :try_start_1
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->getLogTag()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v9}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v9}, Lcom/amazon/identity/auth/device/utils/MAPLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 68
    const/4 v10, 0x0

    .line 71
    if-eqz v8, :cond_1

    .line 72
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .line 71
    .end local v9    # "e":Ljava/lang/IllegalArgumentException;
    :catchall_0
    move-exception v0

    if-eqz v8, :cond_2

    .line 72
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    :cond_2
    throw v0
.end method

.method protected findOneRowBySingleColumn(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;
    .locals 3
    .param p1, "colName"    # Ljava/lang/String;
    .param p2, "colValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")TK;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;, "Lcom/amazon/identity/auth/device/datastore/AbstractDataSource<TK;>;"
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 85
    new-array v0, v1, [Ljava/lang/String;

    aput-object p1, v0, v2

    new-array v1, v1, [Ljava/lang/String;

    aput-object p2, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->findOneRow([Ljava/lang/String;[Ljava/lang/String;)Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;

    move-result-object v0

    return-object v0
.end method

.method public abstract getAllColumns()[Ljava/lang/String;
.end method

.method public getColumnIndex(Landroid/database/Cursor;I)I
    .locals 2
    .param p1, "cursor"    # Landroid/database/Cursor;
    .param p2, "colIndex"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 282
    .local p0, "this":Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;, "Lcom/amazon/identity/auth/device/datastore/AbstractDataSource<TK;>;"
    sget-boolean v0, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 284
    :cond_0
    if-ltz p2, :cond_1

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->getAllColumns()[Ljava/lang/String;

    move-result-object v0

    array-length v0, v0

    if-lt p2, v0, :cond_2

    .line 285
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "colIndex is out of bound!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 287
    :cond_2
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->getAllColumns()[Ljava/lang/String;

    move-result-object v0

    aget-object v0, v0, p2

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public abstract getLogTag()Ljava/lang/String;
.end method

.method public abstract getTableName()Ljava/lang/String;
.end method

.method public insertRow(Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;)J
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)J"
        }
    .end annotation

    .prologue
    .line 149
    .local p0, "this":Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;, "Lcom/amazon/identity/auth/device/datastore/AbstractDataSource<TK;>;"
    .local p1, "object":Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;, "TK;"
    if-nez p1, :cond_0

    .line 150
    const-wide/16 v0, -0x1

    .line 157
    :goto_0
    return-wide v0

    .line 153
    :cond_0
    sget-object v2, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Insert Row table="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->getTableName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "vals="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;->getValuesForInsert()Landroid/content/ContentValues;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    iget-object v2, p0, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->database:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->getTableName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {p1}, Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;->getValuesForInsert()Landroid/content/ContentValues;

    move-result-object v5

    invoke-virtual {v2, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    .line 155
    .local v0, "rowId":J
    invoke-virtual {p1, v0, v1}, Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;->setRowId(J)V

    goto :goto_0
.end method

.method public updateRow(JLandroid/content/ContentValues;)Z
    .locals 6
    .param p1, "rowid"    # J
    .param p3, "toUpdate"    # Landroid/content/ContentValues;

    .prologue
    .local p0, "this":Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;, "Lcom/amazon/identity/auth/device/datastore/AbstractDataSource<TK;>;"
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 209
    if-nez p3, :cond_0

    .line 212
    :goto_0
    return v1

    :cond_0
    iget-object v2, p0, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->database:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->getTableName()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "rowid = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v2, v3, p3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    if-ne v2, v0, :cond_1

    :goto_1
    move v1, v0

    goto :goto_0

    :cond_1
    move v0, v1

    goto :goto_1
.end method
