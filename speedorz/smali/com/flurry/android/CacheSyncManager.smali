.class public Lcom/flurry/android/CacheSyncManager;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/android/NetworkStateListener;


# static fields
.field private static g:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/flurry/android/AppCloudResponseHandler;",
            ">;"
        }
    .end annotation
.end field

.field private static h:Lcom/flurry/android/NetworkStateBroadcaster;


# instance fields
.field private d:Lcom/flurry/android/at;

.field private e:Lcom/flurry/android/ao;

.field private f:Lcom/flurry/android/cq;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/flurry/android/CacheSyncManager;->g:Ljava/util/HashMap;

    .line 35
    const/4 v0, 0x0

    sput-object v0, Lcom/flurry/android/CacheSyncManager;->h:Lcom/flurry/android/NetworkStateBroadcaster;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object v0, p0, Lcom/flurry/android/CacheSyncManager;->d:Lcom/flurry/android/at;

    .line 29
    iput-object v0, p0, Lcom/flurry/android/CacheSyncManager;->e:Lcom/flurry/android/ao;

    .line 30
    iput-object v0, p0, Lcom/flurry/android/CacheSyncManager;->f:Lcom/flurry/android/cq;

    .line 38
    sget-object v0, Lcom/flurry/android/fo;->hD:Lcom/flurry/android/fo;

    invoke-static {v0}, Lcom/flurry/android/FlurryAppCloud;->a(Lcom/flurry/android/fo;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/ao;

    iput-object v0, p0, Lcom/flurry/android/CacheSyncManager;->e:Lcom/flurry/android/ao;

    .line 39
    sget-object v0, Lcom/flurry/android/fo;->hE:Lcom/flurry/android/fo;

    invoke-static {v0}, Lcom/flurry/android/FlurryAppCloud;->a(Lcom/flurry/android/fo;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/at;

    iput-object v0, p0, Lcom/flurry/android/CacheSyncManager;->d:Lcom/flurry/android/at;

    .line 40
    sget-object v0, Lcom/flurry/android/fo;->hF:Lcom/flurry/android/fo;

    invoke-static {v0}, Lcom/flurry/android/FlurryAppCloud;->a(Lcom/flurry/android/fo;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/cq;

    iput-object v0, p0, Lcom/flurry/android/CacheSyncManager;->f:Lcom/flurry/android/cq;

    .line 42
    new-instance v0, Lcom/flurry/android/NetworkStateBroadcaster;

    invoke-direct {v0, p1, p0}, Lcom/flurry/android/NetworkStateBroadcaster;-><init>(Landroid/content/Context;Lcom/flurry/android/NetworkStateListener;)V

    sput-object v0, Lcom/flurry/android/CacheSyncManager;->h:Lcom/flurry/android/NetworkStateBroadcaster;

    .line 43
    return-void
.end method

.method static synthetic a(Lcom/flurry/android/CacheSyncManager;)Lcom/flurry/android/ao;
    .locals 1

    .prologue
    .line 20
    iget-object v0, p0, Lcom/flurry/android/CacheSyncManager;->e:Lcom/flurry/android/ao;

    return-object v0
.end method

.method static synthetic b(Lcom/flurry/android/CacheSyncManager;)Lcom/flurry/android/at;
    .locals 1

    .prologue
    .line 20
    iget-object v0, p0, Lcom/flurry/android/CacheSyncManager;->d:Lcom/flurry/android/at;

    return-object v0
.end method

.method static synthetic b()Ljava/util/HashMap;
    .locals 1

    .prologue
    .line 20
    sget-object v0, Lcom/flurry/android/CacheSyncManager;->g:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic c(Lcom/flurry/android/CacheSyncManager;)Lcom/flurry/android/cq;
    .locals 1

    .prologue
    .line 20
    iget-object v0, p0, Lcom/flurry/android/CacheSyncManager;->f:Lcom/flurry/android/cq;

    return-object v0
.end method


# virtual methods
.method final a()V
    .locals 1

    .prologue
    .line 46
    sget-object v0, Lcom/flurry/android/fo;->hD:Lcom/flurry/android/fo;

    invoke-static {v0}, Lcom/flurry/android/FlurryAppCloud;->a(Lcom/flurry/android/fo;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/ao;

    iput-object v0, p0, Lcom/flurry/android/CacheSyncManager;->e:Lcom/flurry/android/ao;

    .line 47
    sget-object v0, Lcom/flurry/android/fo;->hE:Lcom/flurry/android/fo;

    invoke-static {v0}, Lcom/flurry/android/FlurryAppCloud;->a(Lcom/flurry/android/fo;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/at;

    iput-object v0, p0, Lcom/flurry/android/CacheSyncManager;->d:Lcom/flurry/android/at;

    .line 48
    sget-object v0, Lcom/flurry/android/fo;->hF:Lcom/flurry/android/fo;

    invoke-static {v0}, Lcom/flurry/android/FlurryAppCloud;->a(Lcom/flurry/android/fo;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/cq;

    iput-object v0, p0, Lcom/flurry/android/CacheSyncManager;->f:Lcom/flurry/android/cq;

    .line 49
    return-void
.end method

.method public checkIfDeleted(Ljava/lang/String;)Z
    .locals 2

    .prologue
    .line 73
    iget-object v0, p0, Lcom/flurry/android/CacheSyncManager;->f:Lcom/flurry/android/cq;

    invoke-virtual {v0, p1}, Lcom/flurry/android/cq;->contains(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 75
    iget-object v0, p0, Lcom/flurry/android/CacheSyncManager;->f:Lcom/flurry/android/cq;

    invoke-virtual {v0, p1}, Lcom/flurry/android/cq;->r(Ljava/lang/String;)I

    move-result v0

    .line 76
    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 77
    const/4 v0, 0x1

    .line 80
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getNetworkStatus()Z
    .locals 1

    .prologue
    .line 61
    sget-object v0, Lcom/flurry/android/CacheSyncManager;->h:Lcom/flurry/android/NetworkStateBroadcaster;

    invoke-virtual {v0}, Lcom/flurry/android/NetworkStateBroadcaster;->isNetworkEnabled()Z

    move-result v0

    return v0
.end method

.method public getPendingData()Lcom/flurry/android/ao;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/flurry/android/CacheSyncManager;->e:Lcom/flurry/android/ao;

    return-object v0
.end method

.method public getServerData()Lcom/flurry/android/at;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/flurry/android/CacheSyncManager;->d:Lcom/flurry/android/at;

    return-object v0
.end method

.method public hasRegisteredObjects()Z
    .locals 1

    .prologue
    .line 355
    iget-object v0, p0, Lcom/flurry/android/CacheSyncManager;->f:Lcom/flurry/android/cq;

    invoke-virtual {v0}, Lcom/flurry/android/cq;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onNetworkStateChanged(Z)V
    .locals 3

    .prologue
    .line 53
    const-string v0, "CacheSyncManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onNetworkStateChanged : isNetworkEnable = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    if-eqz p1, :cond_0

    .line 55
    invoke-virtual {p0}, Lcom/flurry/android/CacheSyncManager;->synchronize()V

    .line 57
    :cond_0
    return-void
.end method

.method public registerDirtyObject(Ljava/lang/String;Lcom/flurry/android/AppCloudResponseHandler;I)V
    .locals 6

    .prologue
    const/4 v0, 0x1

    .line 84
    packed-switch p3, :pswitch_data_0

    .line 122
    :pswitch_0
    const-string v0, "CacheSyncManager"

    const-string v1, "Register Object - STATE_UP_TO_DATE or default"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    :cond_0
    :goto_0
    :pswitch_1
    if-eqz p2, :cond_1

    .line 128
    sget-object v0, Lcom/flurry/android/CacheSyncManager;->g:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    :cond_1
    iget-object v0, p0, Lcom/flurry/android/CacheSyncManager;->f:Lcom/flurry/android/cq;

    const-string v1, "CacheDirtyOperationsDB"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "--- Insert in "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v0, Lcom/flurry/android/cq;->cz:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " : ---"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v0, p1}, Lcom/flurry/android/cq;->contains(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {v0, p1}, Lcom/flurry/android/cq;->s(Ljava/lang/String;)V

    :cond_2
    iget-object v1, v0, Lcom/flurry/android/cq;->cy:Lcom/flurry/android/aq;

    invoke-virtual {v1}, Lcom/flurry/android/aq;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    const-string v3, "objectsId"

    invoke-virtual {v2, v3, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "timestamp"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v3, "value"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object v0, v0, Lcom/flurry/android/cq;->cz:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-virtual {v1, v0, v3, v2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 131
    invoke-virtual {p0}, Lcom/flurry/android/CacheSyncManager;->synchronize()V

    .line 132
    :goto_1
    return-void

    .line 90
    :pswitch_2
    iget-object v1, p0, Lcom/flurry/android/CacheSyncManager;->f:Lcom/flurry/android/cq;

    invoke-virtual {v1, p1}, Lcom/flurry/android/cq;->contains(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 92
    iget-object v1, p0, Lcom/flurry/android/CacheSyncManager;->f:Lcom/flurry/android/cq;

    invoke-virtual {v1, p1}, Lcom/flurry/android/cq;->r(Ljava/lang/String;)I

    move-result v1

    .line 93
    const/4 v2, 0x2

    if-ne v1, v2, :cond_3

    .line 96
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    const-string v1, "{code:\"400\",note:\"Object is already deleted, new one has to be created.\"}"

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 97
    new-instance v1, Lcom/flurry/android/AppCloudResponse;

    invoke-direct {v1, v0}, Lcom/flurry/android/AppCloudResponse;-><init>(Lorg/json/JSONObject;)V

    .line 98
    invoke-interface {p2, v1}, Lcom/flurry/android/AppCloudResponseHandler;->handleResponse(Lcom/flurry/android/AppCloudResponse;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_1

    .line 99
    :catch_0
    move-exception v0

    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1

    .line 101
    :catch_1
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 108
    :cond_3
    if-ne v1, v0, :cond_0

    move p3, v0

    .line 110
    goto/16 :goto_0

    .line 84
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public synchronize()V
    .locals 10

    .prologue
    const/4 v8, 0x0

    const/4 v2, 0x0

    .line 138
    iget-object v0, p0, Lcom/flurry/android/CacheSyncManager;->f:Lcom/flurry/android/cq;

    invoke-virtual {v0}, Lcom/flurry/android/cq;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_9

    .line 139
    iget-object v1, p0, Lcom/flurry/android/CacheSyncManager;->f:Lcom/flurry/android/cq;

    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    iget-object v0, v1, Lcom/flurry/android/cq;->cy:Lcom/flurry/android/aq;

    invoke-virtual {v0}, Lcom/flurry/android/aq;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iget-object v1, v1, Lcom/flurry/android/cq;->cz:Ljava/lang/String;

    move-object v3, v2

    move-object v4, v2

    move-object v5, v2

    move-object v6, v2

    move-object v7, v2

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "objectsId"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    const-string v3, "value"

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    :cond_0
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v9, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-nez v4, :cond_0

    :cond_1
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 140
    invoke-virtual {v9}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 142
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 143
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Ljava/util/Map$Entry;

    .line 144
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 145
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 147
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 345
    :pswitch_0
    const-string v0, "CacheSyncManager"

    const-string v1, "ERROR - STATE_UP_TO_DATE or default"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 151
    :pswitch_1
    iget-object v1, p0, Lcom/flurry/android/CacheSyncManager;->e:Lcom/flurry/android/ao;

    invoke-virtual {v1, v0}, Lcom/flurry/android/ao;->isUserObject(Ljava/lang/String;)Z

    move-result v6

    .line 153
    iget-object v1, p0, Lcom/flurry/android/CacheSyncManager;->e:Lcom/flurry/android/ao;

    invoke-virtual {v1, v0}, Lcom/flurry/android/ao;->getObjectById(Ljava/lang/String;)Lcom/flurry/android/caching/ObjectData;

    move-result-object v3

    .line 155
    if-nez v6, :cond_2

    if-nez v3, :cond_3

    .line 161
    :cond_2
    const-string v1, "CacheSyncManager"

    const-string v4, "create user"

    invoke-static {v1, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    new-instance v1, Lcom/flurry/android/caching/ObjectOperationData;

    invoke-direct {v1, v2}, Lcom/flurry/android/caching/ObjectOperationData;-><init>(Ljava/lang/String;)V

    move-object v4, v1

    .line 171
    :goto_1
    if-eqz v3, :cond_4

    .line 173
    invoke-virtual {v3}, Lcom/flurry/android/caching/ObjectData;->getKeyValues()Ljava/util/Vector;

    move-result-object v7

    move v3, v8

    .line 177
    :goto_2
    invoke-virtual {v7}, Ljava/util/Vector;->size()I

    move-result v1

    if-ge v3, v1, :cond_4

    .line 178
    invoke-virtual {v7, v3}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/http/NameValuePair;

    invoke-interface {v1}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v3}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/http/NameValuePair;

    invoke-interface {v1}, Lorg/apache/http/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v9, v1}, Lcom/flurry/android/caching/ObjectOperationData;->addKeyValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 177
    add-int/lit8 v1, v3, 0x1

    move v3, v1

    goto :goto_2

    .line 165
    :cond_3
    const-string v1, "CacheSyncManager"

    const-string v4, "create object"

    invoke-static {v1, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    invoke-virtual {v3}, Lcom/flurry/android/caching/ObjectData;->getCollectionName()Ljava/lang/String;

    move-result-object v4

    .line 168
    new-instance v1, Lcom/flurry/android/caching/ObjectOperationData;

    invoke-direct {v1, v2, v4}, Lcom/flurry/android/caching/ObjectOperationData;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object v4, v1

    goto :goto_1

    .line 182
    :cond_4
    invoke-static {}, Lcom/flurry/android/FlurryAppCloud;->z()Lcom/flurry/android/caching/CachingManager;

    move-result-object v1

    new-instance v3, Lcom/flurry/android/aw;

    invoke-direct {v3, p0, v0, v6}, Lcom/flurry/android/aw;-><init>(Lcom/flurry/android/CacheSyncManager;Ljava/lang/String;Z)V

    invoke-virtual {v1, v4, v3}, Lcom/flurry/android/caching/CachingManager;->saveOrCreateOperation(Lcom/flurry/android/caching/ObjectOperationData;Lcom/flurry/android/AppCloudResponseHandler;)V

    goto/16 :goto_0

    .line 226
    :pswitch_2
    iget-object v1, p0, Lcom/flurry/android/CacheSyncManager;->e:Lcom/flurry/android/ao;

    invoke-virtual {v1, v0}, Lcom/flurry/android/ao;->isUserObject(Ljava/lang/String;)Z

    move-result v1

    .line 228
    iget-object v3, p0, Lcom/flurry/android/CacheSyncManager;->e:Lcom/flurry/android/ao;

    invoke-virtual {v3, v0}, Lcom/flurry/android/ao;->getObjectById(Ljava/lang/String;)Lcom/flurry/android/caching/ObjectData;

    move-result-object v3

    .line 230
    invoke-virtual {v3}, Lcom/flurry/android/caching/ObjectData;->getId()Ljava/lang/String;

    move-result-object v4

    .line 234
    if-eqz v1, :cond_5

    .line 235
    new-instance v0, Lcom/flurry/android/caching/ObjectOperationData;

    invoke-direct {v0, v4}, Lcom/flurry/android/caching/ObjectOperationData;-><init>(Ljava/lang/String;)V

    move-object v1, v0

    .line 241
    :goto_3
    invoke-virtual {v3}, Lcom/flurry/android/caching/ObjectData;->getKeyValues()Ljava/util/Vector;

    move-result-object v6

    move v3, v8

    .line 242
    :goto_4
    invoke-virtual {v6}, Ljava/util/Vector;->size()I

    move-result v0

    if-ge v3, v0, :cond_6

    .line 243
    invoke-virtual {v6, v3}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/NameValuePair;

    invoke-interface {v0}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v3}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/NameValuePair;

    invoke-interface {v0}, Lorg/apache/http/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v7, v0}, Lcom/flurry/android/caching/ObjectOperationData;->addKeyValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 242
    add-int/lit8 v0, v3, 0x1

    move v3, v0

    goto :goto_4

    .line 238
    :cond_5
    new-instance v0, Lcom/flurry/android/caching/ObjectOperationData;

    invoke-virtual {v3}, Lcom/flurry/android/caching/ObjectData;->getCollectionName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v4, v1}, Lcom/flurry/android/caching/ObjectOperationData;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object v1, v0

    goto :goto_3

    .line 247
    :cond_6
    invoke-static {}, Lcom/flurry/android/FlurryAppCloud;->z()Lcom/flurry/android/caching/CachingManager;

    move-result-object v0

    new-instance v3, Lcom/flurry/android/ax;

    invoke-direct {v3, p0, v4, v6}, Lcom/flurry/android/ax;-><init>(Lcom/flurry/android/CacheSyncManager;Ljava/lang/String;Ljava/util/Vector;)V

    invoke-virtual {v0, v1, v3}, Lcom/flurry/android/caching/CachingManager;->saveOrCreateOperation(Lcom/flurry/android/caching/ObjectOperationData;Lcom/flurry/android/AppCloudResponseHandler;)V

    goto/16 :goto_0

    .line 295
    :pswitch_3
    const-string v1, "CacheSyncManager"

    const-string v3, "STATE_DELETED"

    invoke-static {v1, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 299
    iget-object v1, p0, Lcom/flurry/android/CacheSyncManager;->e:Lcom/flurry/android/ao;

    invoke-virtual {v1, v0}, Lcom/flurry/android/ao;->getObjectById(Ljava/lang/String;)Lcom/flurry/android/caching/ObjectData;

    move-result-object v1

    .line 301
    if-nez v1, :cond_7

    .line 302
    iget-object v1, p0, Lcom/flurry/android/CacheSyncManager;->d:Lcom/flurry/android/at;

    invoke-virtual {v1, v0}, Lcom/flurry/android/at;->getObjectById(Ljava/lang/String;)Lcom/flurry/android/caching/ObjectData;

    move-result-object v1

    .line 303
    if-nez v1, :cond_7

    .line 304
    const-string v3, "CacheSyncManager"

    const-string v4, "ERROR! on delete.., no data for ID"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_7
    move-object v3, v1

    .line 309
    if-eqz v3, :cond_8

    invoke-virtual {v3}, Lcom/flurry/android/caching/ObjectData;->isObject()Z

    move-result v1

    if-eqz v1, :cond_8

    .line 310
    new-instance v1, Lcom/flurry/android/caching/ObjectOperationData;

    invoke-virtual {v3}, Lcom/flurry/android/caching/ObjectData;->getCollectionName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v0, v3}, Lcom/flurry/android/caching/ObjectOperationData;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 316
    :goto_5
    invoke-static {}, Lcom/flurry/android/FlurryAppCloud;->z()Lcom/flurry/android/caching/CachingManager;

    move-result-object v3

    new-instance v4, Lcom/flurry/android/ba;

    invoke-direct {v4, p0, v0}, Lcom/flurry/android/ba;-><init>(Lcom/flurry/android/CacheSyncManager;Ljava/lang/String;)V

    invoke-virtual {v3, v1, v4}, Lcom/flurry/android/caching/CachingManager;->deleteOperation(Lcom/flurry/android/caching/ObjectOperationData;Lcom/flurry/android/AppCloudResponseHandler;)V

    goto/16 :goto_0

    .line 313
    :cond_8
    new-instance v1, Lcom/flurry/android/caching/ObjectOperationData;

    invoke-direct {v1, v0}, Lcom/flurry/android/caching/ObjectOperationData;-><init>(Ljava/lang/String;)V

    goto :goto_5

    .line 352
    :cond_9
    return-void

    .line 147
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_3
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public toStringAndPrint()V
    .locals 2

    .prologue
    .line 359
    const-string v0, "CacheSyncManager"

    const-string v1, "============PENDING DATA=================="

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 360
    iget-object v0, p0, Lcom/flurry/android/CacheSyncManager;->e:Lcom/flurry/android/ao;

    invoke-virtual {v0}, Lcom/flurry/android/ao;->aj()Ljava/lang/String;

    .line 362
    const-string v0, "CacheSyncManager"

    const-string v1, "============SERVER DATA=================="

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 363
    iget-object v0, p0, Lcom/flurry/android/CacheSyncManager;->d:Lcom/flurry/android/at;

    invoke-virtual {v0}, Lcom/flurry/android/at;->aj()Ljava/lang/String;

    .line 365
    const-string v0, "CacheSyncManager"

    const-string v1, "============Registered Dirty Objects=================="

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 366
    iget-object v0, p0, Lcom/flurry/android/CacheSyncManager;->f:Lcom/flurry/android/cq;

    invoke-virtual {v0}, Lcom/flurry/android/cq;->readAll()V

    .line 367
    return-void
.end method
