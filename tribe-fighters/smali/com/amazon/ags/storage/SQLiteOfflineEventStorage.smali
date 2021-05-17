.class public Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "SQLiteOfflineEventStorage.java"

# interfaces
.implements Lcom/amazon/ags/storage/OfflineEventStorage;


# static fields
.field private static final DATABASE_VERSION:I = 0x2

.field private static final PRIMARY_KEY_NAME:Ljava/lang/String; = "id"

.field private static final TABLE_NAME:Ljava/lang/String; = "events"

.field private static final TAG:Ljava/lang/String;

.field private static final TEXT_KEY_NAME:Ljava/lang/String; = "text"


# instance fields
.field private final obfuscator:Lcom/amazon/ags/storage/StringObfuscator;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 30
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GC_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-class v1, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/amazon/ags/storage/StringObfuscator;Ljava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "obfuscator"    # Lcom/amazon/ags/storage/StringObfuscator;
    .param p3, "databaseName"    # Ljava/lang/String;

    .prologue
    .line 38
    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-direct {p0, p1, p3, v0, v1}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 39
    iput-object p2, p0, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->obfuscator:Lcom/amazon/ags/storage/StringObfuscator;

    .line 40
    return-void
.end method


# virtual methods
.method public final declared-synchronized getAllEvents()Ljava/util/List;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/amazon/ags/storage/OfflineEventStorage$OfflineEventJSONTuple;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/storage/OfflineEventException;
        }
    .end annotation

    .prologue
    .line 227
    monitor-enter p0

    const/4 v1, 0x0

    .line 228
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    const/4 v0, 0x0

    .line 229
    .local v0, "cursor":Landroid/database/Cursor;
    const/4 v5, 0x0

    .line 232
    .local v5, "eventsList":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/storage/OfflineEventStorage$OfflineEventJSONTuple;>;"
    :try_start_0
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 233
    .end local v5    # "eventsList":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/storage/OfflineEventStorage$OfflineEventJSONTuple;>;"
    .local v6, "eventsList":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/storage/OfflineEventStorage$OfflineEventJSONTuple;>;"
    :try_start_1
    invoke-virtual {p0}, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 234
    const-string v8, "SELECT * FROM events"

    const/4 v9, 0x0

    invoke-virtual {v1, v8, v9}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 237
    if-eqz v0, :cond_4

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v8

    if-eqz v8, :cond_4

    iget-object v8, p0, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->obfuscator:Lcom/amazon/ags/storage/StringObfuscator;

    if-eqz v8, :cond_4

    .line 239
    :cond_0
    const/4 v8, 0x0

    invoke-interface {v0, v8}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    .line 240
    .local v3, "eventId":J
    const/4 v8, 0x1

    invoke-interface {v0, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 243
    .local v7, "text":Ljava/lang/String;
    iget-object v8, p0, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->obfuscator:Lcom/amazon/ags/storage/StringObfuscator;

    invoke-interface {v8, v7}, Lcom/amazon/ags/storage/StringObfuscator;->unobfuscate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 244
    if-nez v7, :cond_3

    .line 245
    sget-object v8, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->TAG:Ljava/lang/String;

    const-string v9, "Failed to unobfuscate text."

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 246
    new-instance v8, Lcom/amazon/ags/storage/OfflineEventException;

    const-string v9, "Failed to unobfuscate text."

    invoke-direct {v8, v9}, Lcom/amazon/ags/storage/OfflineEventException;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 257
    .end local v3    # "eventId":J
    .end local v7    # "text":Ljava/lang/String;
    :catch_0
    move-exception v2

    move-object v5, v6

    .line 258
    .end local v6    # "eventsList":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/storage/OfflineEventStorage$OfflineEventJSONTuple;>;"
    .local v2, "e":Landroid/database/sqlite/SQLiteException;
    .restart local v5    # "eventsList":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/storage/OfflineEventStorage$OfflineEventJSONTuple;>;"
    :goto_0
    :try_start_2
    sget-object v8, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Failed to open SQL database: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteException;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 260
    new-instance v8, Lcom/amazon/ags/storage/OfflineEventException;

    invoke-direct {v8, v2}, Lcom/amazon/ags/storage/OfflineEventException;-><init>(Ljava/lang/Throwable;)V

    throw v8
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 270
    .end local v2    # "e":Landroid/database/sqlite/SQLiteException;
    :catchall_0
    move-exception v8

    :goto_1
    if-eqz v0, :cond_1

    .line 271
    :try_start_3
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 274
    :cond_1
    if-eqz v1, :cond_2

    .line 275
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    :cond_2
    throw v8
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 227
    :catchall_1
    move-exception v8

    :goto_2
    monitor-exit p0

    throw v8

    .line 249
    .end local v5    # "eventsList":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/storage/OfflineEventStorage$OfflineEventJSONTuple;>;"
    .restart local v3    # "eventId":J
    .restart local v6    # "eventsList":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/storage/OfflineEventStorage$OfflineEventJSONTuple;>;"
    .restart local v7    # "text":Ljava/lang/String;
    :cond_3
    :try_start_4
    sget-object v8, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "GT: eventId: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", text: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    new-instance v8, Lcom/amazon/ags/storage/OfflineEventStorage$OfflineEventJSONTuple;

    new-instance v9, Lcom/amazon/ags/storage/OfflineEventId;

    invoke-direct {v9, v3, v4}, Lcom/amazon/ags/storage/OfflineEventId;-><init>(J)V

    new-instance v10, Lorg/json/JSONObject;

    invoke-direct {v10, v7}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-direct {v8, v9, v10}, Lcom/amazon/ags/storage/OfflineEventStorage$OfflineEventJSONTuple;-><init>(Lcom/amazon/ags/storage/OfflineEventId;Lorg/json/JSONObject;)V

    invoke-interface {v6, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 252
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_4
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_4
    .catch Ljava/lang/IllegalStateException; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    move-result v8

    if-nez v8, :cond_0

    .line 270
    .end local v3    # "eventId":J
    .end local v7    # "text":Ljava/lang/String;
    :cond_4
    if-eqz v0, :cond_5

    .line 271
    :try_start_5
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 274
    :cond_5
    if-eqz v1, :cond_6

    .line 275
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    :cond_6
    monitor-exit p0

    return-object v6

    .line 261
    .end local v6    # "eventsList":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/storage/OfflineEventStorage$OfflineEventJSONTuple;>;"
    .restart local v5    # "eventsList":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/storage/OfflineEventStorage$OfflineEventJSONTuple;>;"
    :catch_1
    move-exception v2

    .line 262
    .local v2, "e":Lorg/json/JSONException;
    :goto_3
    :try_start_6
    sget-object v8, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Failed to parse JSON: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v2}, Lorg/json/JSONException;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 264
    new-instance v8, Lcom/amazon/ags/storage/OfflineEventException;

    invoke-direct {v8, v2}, Lcom/amazon/ags/storage/OfflineEventException;-><init>(Ljava/lang/Throwable;)V

    throw v8

    .line 265
    .end local v2    # "e":Lorg/json/JSONException;
    :catch_2
    move-exception v2

    .line 266
    .local v2, "e":Ljava/lang/IllegalStateException;
    :goto_4
    sget-object v8, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "SQL database is in an invalid state: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v2}, Ljava/lang/IllegalStateException;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 268
    new-instance v8, Lcom/amazon/ags/storage/OfflineEventException;

    invoke-direct {v8, v2}, Lcom/amazon/ags/storage/OfflineEventException;-><init>(Ljava/lang/Throwable;)V

    throw v8
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 270
    .end local v2    # "e":Ljava/lang/IllegalStateException;
    .end local v5    # "eventsList":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/storage/OfflineEventStorage$OfflineEventJSONTuple;>;"
    .restart local v6    # "eventsList":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/storage/OfflineEventStorage$OfflineEventJSONTuple;>;"
    :catchall_2
    move-exception v8

    move-object v5, v6

    .end local v6    # "eventsList":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/storage/OfflineEventStorage$OfflineEventJSONTuple;>;"
    .restart local v5    # "eventsList":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/storage/OfflineEventStorage$OfflineEventJSONTuple;>;"
    goto/16 :goto_1

    .line 265
    .end local v5    # "eventsList":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/storage/OfflineEventStorage$OfflineEventJSONTuple;>;"
    .restart local v6    # "eventsList":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/storage/OfflineEventStorage$OfflineEventJSONTuple;>;"
    :catch_3
    move-exception v2

    move-object v5, v6

    .end local v6    # "eventsList":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/storage/OfflineEventStorage$OfflineEventJSONTuple;>;"
    .restart local v5    # "eventsList":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/storage/OfflineEventStorage$OfflineEventJSONTuple;>;"
    goto :goto_4

    .line 261
    .end local v5    # "eventsList":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/storage/OfflineEventStorage$OfflineEventJSONTuple;>;"
    .restart local v6    # "eventsList":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/storage/OfflineEventStorage$OfflineEventJSONTuple;>;"
    :catch_4
    move-exception v2

    move-object v5, v6

    .end local v6    # "eventsList":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/storage/OfflineEventStorage$OfflineEventJSONTuple;>;"
    .restart local v5    # "eventsList":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/storage/OfflineEventStorage$OfflineEventJSONTuple;>;"
    goto :goto_3

    .line 257
    :catch_5
    move-exception v2

    goto/16 :goto_0

    .line 227
    .end local v5    # "eventsList":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/storage/OfflineEventStorage$OfflineEventJSONTuple;>;"
    .restart local v6    # "eventsList":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/storage/OfflineEventStorage$OfflineEventJSONTuple;>;"
    :catchall_3
    move-exception v8

    move-object v5, v6

    .end local v6    # "eventsList":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/storage/OfflineEventStorage$OfflineEventJSONTuple;>;"
    .restart local v5    # "eventsList":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/storage/OfflineEventStorage$OfflineEventJSONTuple;>;"
    goto/16 :goto_2
.end method

.method public final declared-synchronized getEvent(Lcom/amazon/ags/storage/OfflineEventId;)Lorg/json/JSONObject;
    .locals 11
    .param p1, "id"    # Lcom/amazon/ags/storage/OfflineEventId;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/storage/OfflineEventException;
        }
    .end annotation

    .prologue
    .line 176
    monitor-enter p0

    const/4 v0, 0x0

    .line 177
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    const/4 v8, 0x0

    .line 180
    .local v8, "cursor":Landroid/database/Cursor;
    :try_start_0
    sget-object v1, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getEvent() event id: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/amazon/ags/storage/OfflineEventId;->getId()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 182
    invoke-virtual {p0}, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 183
    const-string v1, "events"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "text"

    aput-object v4, v2, v3

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "id = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lcom/amazon/ags/storage/OfflineEventId;->getId()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 186
    if-eqz v8, :cond_5

    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 187
    const/4 v1, 0x0

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 189
    .local v10, "text":Ljava/lang/String;
    iget-object v1, p0, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->obfuscator:Lcom/amazon/ags/storage/StringObfuscator;

    if-eqz v1, :cond_2

    .line 190
    iget-object v1, p0, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->obfuscator:Lcom/amazon/ags/storage/StringObfuscator;

    invoke-interface {v1, v10}, Lcom/amazon/ags/storage/StringObfuscator;->unobfuscate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 191
    if-nez v10, :cond_2

    .line 192
    sget-object v1, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->TAG:Ljava/lang/String;

    const-string v2, "Failed to unobfuscate text."

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 193
    new-instance v1, Lcom/amazon/ags/storage/OfflineEventException;

    const-string v2, "Failed to unobfuscate text."

    invoke-direct {v1, v2}, Lcom/amazon/ags/storage/OfflineEventException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 201
    .end local v10    # "text":Ljava/lang/String;
    :catch_0
    move-exception v9

    .line 202
    .local v9, "e":Landroid/database/sqlite/SQLiteException;
    :try_start_1
    sget-object v1, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to open SQL database: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 204
    new-instance v1, Lcom/amazon/ags/storage/OfflineEventException;

    invoke-direct {v1, v9}, Lcom/amazon/ags/storage/OfflineEventException;-><init>(Ljava/lang/Throwable;)V

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 214
    .end local v9    # "e":Landroid/database/sqlite/SQLiteException;
    :catchall_0
    move-exception v1

    if-eqz v8, :cond_0

    .line 215
    :try_start_2
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 218
    :cond_0
    if-eqz v0, :cond_1

    .line 219
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    :cond_1
    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 176
    :catchall_1
    move-exception v1

    monitor-exit p0

    throw v1

    .line 197
    .restart local v10    # "text":Ljava/lang/String;
    :cond_2
    :try_start_3
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v10}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_3
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 214
    if-eqz v8, :cond_3

    .line 215
    :try_start_4
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 218
    :cond_3
    if-eqz v0, :cond_4

    .line 219
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :cond_4
    monitor-exit p0

    return-object v1

    .line 199
    .end local v10    # "text":Ljava/lang/String;
    :cond_5
    :try_start_5
    new-instance v1, Lcom/amazon/ags/storage/OfflineEventException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to get text for id: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/amazon/ags/storage/OfflineEventId;->getId()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/amazon/ags/storage/OfflineEventException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_5
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 205
    :catch_1
    move-exception v9

    .line 206
    .local v9, "e":Lorg/json/JSONException;
    :try_start_6
    sget-object v1, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to parse JSON: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v9}, Lorg/json/JSONException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 208
    new-instance v1, Lcom/amazon/ags/storage/OfflineEventException;

    invoke-direct {v1, v9}, Lcom/amazon/ags/storage/OfflineEventException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 209
    .end local v9    # "e":Lorg/json/JSONException;
    :catch_2
    move-exception v9

    .line 210
    .local v9, "e":Ljava/lang/IllegalStateException;
    sget-object v1, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "SQL database is in an invalid state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v9}, Ljava/lang/IllegalStateException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 212
    new-instance v1, Lcom/amazon/ags/storage/OfflineEventException;

    invoke-direct {v1, v9}, Lcom/amazon/ags/storage/OfflineEventException;-><init>(Ljava/lang/Throwable;)V

    throw v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0
.end method

.method public final declared-synchronized getSize()I
    .locals 7

    .prologue
    const/4 v3, -0x1

    .line 283
    monitor-enter p0

    const/4 v1, 0x0

    .line 284
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    const/4 v0, 0x0

    .line 287
    .local v0, "cursor":Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {p0}, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 288
    const-string v4, "SELECT * FROM events"

    const/4 v5, 0x0

    invoke-virtual {v1, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 290
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result v3

    .line 299
    if-eqz v0, :cond_0

    .line 300
    :try_start_1
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 303
    :cond_0
    if-eqz v1, :cond_1

    .line 304
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_1
    :goto_0
    monitor-exit p0

    return v3

    .line 292
    :catch_0
    move-exception v2

    .line 293
    .local v2, "e":Landroid/database/sqlite/SQLiteException;
    :try_start_2
    sget-object v4, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to open SQL database: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteException;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 299
    if-eqz v0, :cond_2

    .line 300
    :try_start_3
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 303
    :cond_2
    if-eqz v1, :cond_1

    .line 304
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 283
    .end local v2    # "e":Landroid/database/sqlite/SQLiteException;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .line 295
    :catch_1
    move-exception v2

    .line 296
    .local v2, "e":Ljava/lang/IllegalStateException;
    :try_start_4
    sget-object v4, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "SQL database is in an invalid state: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Ljava/lang/IllegalStateException;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 299
    if-eqz v0, :cond_3

    .line 300
    :try_start_5
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 303
    :cond_3
    if-eqz v1, :cond_1

    .line 304
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    goto :goto_0

    .line 299
    .end local v2    # "e":Ljava/lang/IllegalStateException;
    :catchall_1
    move-exception v3

    if-eqz v0, :cond_4

    .line 300
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 303
    :cond_4
    if-eqz v1, :cond_5

    .line 304
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    :cond_5
    throw v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
.end method

.method public final onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 314
    const-string v0, "CREATE TABLE events(id INTEGER PRIMARY KEY AUTOINCREMENT, text TEXT)"

    .line 317
    .local v0, "createTableString":Ljava/lang/String;
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 318
    return-void
.end method

.method public final onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 1
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    .line 326
    const-string v0, "DROP TABLE IF EXISTS events"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 327
    invoke-virtual {p0, p1}, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->onCreate(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 328
    return-void
.end method

.method public final declared-synchronized peekEvent()Lcom/amazon/ags/storage/OfflineEventId;
    .locals 8

    .prologue
    .line 131
    monitor-enter p0

    const/4 v1, 0x0

    .line 132
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    const/4 v0, 0x0

    .line 138
    .local v0, "cursor":Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {p0}, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 139
    const-string v5, "SELECT MIN(id) FROM events"

    const/4 v6, 0x0

    invoke-virtual {v1, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 141
    if-eqz v0, :cond_4

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 142
    const/4 v5, 0x0

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    .line 145
    .local v3, "id":J
    const-wide/16 v5, 0x0

    cmp-long v5, v3, v5

    if-nez v5, :cond_2

    .line 146
    sget-object v5, Lcom/amazon/ags/storage/OfflineEventId;->Invalid:Lcom/amazon/ags/storage/OfflineEventId;
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 161
    if-eqz v0, :cond_0

    .line 162
    :try_start_1
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 165
    :cond_0
    if-eqz v1, :cond_1

    .line 166
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local v3    # "id":J
    :cond_1
    :goto_0
    monitor-exit p0

    return-object v5

    .line 149
    .restart local v3    # "id":J
    :cond_2
    :try_start_2
    new-instance v5, Lcom/amazon/ags/storage/OfflineEventId;

    invoke-direct {v5, v3, v4}, Lcom/amazon/ags/storage/OfflineEventId;-><init>(J)V
    :try_end_2
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 161
    if-eqz v0, :cond_3

    .line 162
    :try_start_3
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 165
    :cond_3
    if-eqz v1, :cond_1

    .line 166
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 131
    .end local v3    # "id":J
    :catchall_0
    move-exception v5

    monitor-exit p0

    throw v5

    .line 151
    :cond_4
    :try_start_4
    sget-object v5, Lcom/amazon/ags/storage/OfflineEventId;->Invalid:Lcom/amazon/ags/storage/OfflineEventId;
    :try_end_4
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 161
    if-eqz v0, :cond_5

    .line 162
    :try_start_5
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 165
    :cond_5
    if-eqz v1, :cond_1

    .line 166
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_0

    .line 153
    :catch_0
    move-exception v2

    .line 154
    .local v2, "e":Landroid/database/sqlite/SQLiteException;
    :try_start_6
    sget-object v5, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Failed to open SQL database: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    sget-object v5, Lcom/amazon/ags/storage/OfflineEventId;->Invalid:Lcom/amazon/ags/storage/OfflineEventId;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 161
    if-eqz v0, :cond_6

    .line 162
    :try_start_7
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 165
    :cond_6
    if-eqz v1, :cond_1

    .line 166
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_0

    .line 157
    .end local v2    # "e":Landroid/database/sqlite/SQLiteException;
    :catch_1
    move-exception v2

    .line 158
    .local v2, "e":Ljava/lang/IllegalStateException;
    :try_start_8
    sget-object v5, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "SQL database is in an invalid state: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v2}, Ljava/lang/IllegalStateException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    sget-object v5, Lcom/amazon/ags/storage/OfflineEventId;->Invalid:Lcom/amazon/ags/storage/OfflineEventId;
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 161
    if-eqz v0, :cond_7

    .line 162
    :try_start_9
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 165
    :cond_7
    if-eqz v1, :cond_1

    .line 166
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    goto :goto_0

    .line 161
    .end local v2    # "e":Ljava/lang/IllegalStateException;
    :catchall_1
    move-exception v5

    if-eqz v0, :cond_8

    .line 162
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 165
    :cond_8
    if-eqz v1, :cond_9

    .line 166
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    :cond_9
    throw v5
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0
.end method

.method public final declared-synchronized removeAllEvents()V
    .locals 5

    .prologue
    .line 332
    monitor-enter p0

    const/4 v0, 0x0

    .line 335
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    sget-object v2, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->TAG:Ljava/lang/String;

    const-string v3, "Removing all events"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 336
    invoke-virtual {p0}, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 337
    const-string v2, "DELETE FROM events"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 341
    if-eqz v0, :cond_0

    .line 342
    :try_start_1
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 345
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 338
    :catch_0
    move-exception v1

    .line 339
    .local v1, "e":Landroid/database/sqlite/SQLiteException;
    :try_start_2
    sget-object v2, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to open SQL database: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 341
    if-eqz v0, :cond_0

    .line 342
    :try_start_3
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 332
    .end local v1    # "e":Landroid/database/sqlite/SQLiteException;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 341
    :catchall_1
    move-exception v2

    if-eqz v0, :cond_1

    .line 342
    :try_start_4
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    :cond_1
    throw v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
.end method

.method public final declared-synchronized removeEvent(Lcom/amazon/ags/storage/OfflineEventId;)V
    .locals 6
    .param p1, "id"    # Lcom/amazon/ags/storage/OfflineEventId;

    .prologue
    .line 108
    monitor-enter p0

    const/4 v0, 0x0

    .line 111
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    sget-object v2, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Removing event: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lcom/amazon/ags/storage/OfflineEventId;->getId()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    invoke-virtual {p0}, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 114
    const-string v2, "events"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "id="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lcom/amazon/ags/storage/OfflineEventId;->getId()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 120
    if-eqz v0, :cond_0

    .line 121
    :try_start_1
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 124
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 115
    :catch_0
    move-exception v1

    .line 116
    .local v1, "e":Landroid/database/sqlite/SQLiteException;
    :try_start_2
    sget-object v2, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to open SQL database: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 120
    if-eqz v0, :cond_0

    .line 121
    :try_start_3
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 108
    .end local v1    # "e":Landroid/database/sqlite/SQLiteException;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 117
    :catch_1
    move-exception v1

    .line 118
    .local v1, "e":Ljava/lang/IllegalStateException;
    :try_start_4
    sget-object v2, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "SQL database is in an invalid state: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/IllegalStateException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 120
    if-eqz v0, :cond_0

    .line 121
    :try_start_5
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    goto :goto_0

    .line 120
    .end local v1    # "e":Ljava/lang/IllegalStateException;
    :catchall_1
    move-exception v2

    if-eqz v0, :cond_1

    .line 121
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    :cond_1
    throw v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
.end method

.method public final declared-synchronized storeEvent(Lorg/json/JSONObject;)Lcom/amazon/ags/storage/OfflineEventId;
    .locals 17
    .param p1, "event"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/storage/OfflineEventException;
        }
    .end annotation

    .prologue
    .line 47
    monitor-enter p0

    const/4 v1, 0x0

    .line 48
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    const/4 v9, 0x0

    .line 51
    .local v9, "cursor":Landroid/database/Cursor;
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 53
    invoke-virtual/range {p1 .. p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v11

    .line 55
    .local v11, "eventString":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->obfuscator:Lcom/amazon/ags/storage/StringObfuscator;

    if-eqz v2, :cond_2

    .line 56
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->obfuscator:Lcom/amazon/ags/storage/StringObfuscator;

    invoke-interface {v2, v11}, Lcom/amazon/ags/storage/StringObfuscator;->obfuscate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 57
    if-nez v11, :cond_2

    .line 58
    sget-object v2, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to obfuscate text: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    new-instance v2, Lcom/amazon/ags/storage/OfflineEventException;

    const-string v3, "Failed to obfuscate text."

    invoke-direct {v2, v3}, Lcom/amazon/ags/storage/OfflineEventException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 86
    .end local v11    # "eventString":Ljava/lang/String;
    :catch_0
    move-exception v10

    .line 87
    .local v10, "e":Landroid/database/sqlite/SQLiteException;
    :try_start_1
    sget-object v2, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->TAG:Ljava/lang/String;

    const-string v3, "Failed to open SQL database."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    new-instance v2, Lcom/amazon/ags/storage/OfflineEventException;

    invoke-direct {v2, v10}, Lcom/amazon/ags/storage/OfflineEventException;-><init>(Ljava/lang/Throwable;)V

    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 93
    .end local v10    # "e":Landroid/database/sqlite/SQLiteException;
    :catchall_0
    move-exception v2

    if-eqz v9, :cond_0

    .line 94
    :try_start_2
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 97
    :cond_0
    if-eqz v1, :cond_1

    .line 98
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    :cond_1
    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 47
    :catchall_1
    move-exception v2

    monitor-exit p0

    throw v2

    .line 63
    .restart local v11    # "eventString":Ljava/lang/String;
    :cond_2
    :try_start_3
    sget-object v2, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Storing event: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    new-instance v16, Landroid/content/ContentValues;

    invoke-direct/range {v16 .. v16}, Landroid/content/ContentValues;-><init>()V

    .line 67
    .local v16, "values":Landroid/content/ContentValues;
    const-string v2, "text"

    move-object/from16 v0, v16

    invoke-virtual {v0, v2, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    const-string v2, "events"

    const/4 v3, 0x0

    move-object/from16 v0, v16

    invoke-virtual {v1, v2, v3, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v14

    .line 70
    .local v14, "rowId":J
    const-wide/16 v2, -0x1

    cmp-long v2, v14, v2

    if-nez v2, :cond_3

    .line 71
    sget-object v2, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->TAG:Ljava/lang/String;

    const-string v3, "Failed to store event in database."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    new-instance v2, Lcom/amazon/ags/storage/OfflineEventException;

    const-string v3, "Failed to store event to database."

    invoke-direct {v2, v3}, Lcom/amazon/ags/storage/OfflineEventException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_3
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 89
    .end local v11    # "eventString":Ljava/lang/String;
    .end local v14    # "rowId":J
    .end local v16    # "values":Landroid/content/ContentValues;
    :catch_1
    move-exception v10

    .line 90
    .local v10, "e":Ljava/lang/IllegalStateException;
    :try_start_4
    sget-object v2, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "SQL database is in an invalid state: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v10}, Ljava/lang/IllegalStateException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    new-instance v2, Lcom/amazon/ags/storage/OfflineEventException;

    invoke-direct {v2, v10}, Lcom/amazon/ags/storage/OfflineEventException;-><init>(Ljava/lang/Throwable;)V

    throw v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 75
    .end local v10    # "e":Ljava/lang/IllegalStateException;
    .restart local v11    # "eventString":Ljava/lang/String;
    .restart local v14    # "rowId":J
    .restart local v16    # "values":Landroid/content/ContentValues;
    :cond_3
    :try_start_5
    const-string v2, "events"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "id"

    aput-object v5, v3, v4

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "rowid = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 78
    if-eqz v9, :cond_6

    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 79
    const/4 v2, 0x0

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v12

    .line 81
    .local v12, "id":J
    new-instance v2, Lcom/amazon/ags/storage/OfflineEventId;

    invoke-direct {v2, v12, v13}, Lcom/amazon/ags/storage/OfflineEventId;-><init>(J)V
    :try_end_5
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 93
    if-eqz v9, :cond_4

    .line 94
    :try_start_6
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 97
    :cond_4
    if-eqz v1, :cond_5

    .line 98
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :cond_5
    monitor-exit p0

    return-object v2

    .line 83
    .end local v12    # "id":J
    :cond_6
    :try_start_7
    sget-object v2, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->TAG:Ljava/lang/String;

    const-string v3, "Failed to get cursor to inserted item"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    new-instance v2, Lcom/amazon/ags/storage/OfflineEventException;

    const-string v3, "Failed to get cursor to inserted item"

    invoke-direct {v2, v3}, Lcom/amazon/ags/storage/OfflineEventException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_7
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_7 .. :try_end_7} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_0
.end method
