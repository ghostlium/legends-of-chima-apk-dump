.class public Lcom/amazon/ags/storage/AGSOfflineEventManager;
.super Ljava/lang/Object;
.source "AGSOfflineEventManager.java"

# interfaces
.implements Lcom/amazon/ags/storage/OfflineEventManager;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final networkUtil:Lcom/amazon/ags/html5/util/NetworkUtil;

.field private final serviceHelper:Lcom/amazon/ags/html5/service/ServiceHelper;

.field protected final storage:Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 24
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GC_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-class v1, Lcom/amazon/ags/storage/AGSOfflineEventManager;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/ags/storage/AGSOfflineEventManager;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;Lcom/amazon/ags/html5/util/NetworkUtil;Lcom/amazon/ags/html5/service/ServiceHelper;)V
    .locals 2
    .param p1, "storage"    # Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;
    .param p2, "networkUtil"    # Lcom/amazon/ags/html5/util/NetworkUtil;
    .param p3, "serviceHelper"    # Lcom/amazon/ags/html5/service/ServiceHelper;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p2, p0, Lcom/amazon/ags/storage/AGSOfflineEventManager;->networkUtil:Lcom/amazon/ags/html5/util/NetworkUtil;

    .line 32
    if-nez p1, :cond_0

    .line 33
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "storage must be non-null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 36
    :cond_0
    iput-object p1, p0, Lcom/amazon/ags/storage/AGSOfflineEventManager;->storage:Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;

    .line 37
    iput-object p3, p0, Lcom/amazon/ags/storage/AGSOfflineEventManager;->serviceHelper:Lcom/amazon/ags/html5/service/ServiceHelper;

    .line 38
    return-void
.end method


# virtual methods
.method public getNetworkUtil()Lcom/amazon/ags/html5/util/NetworkUtil;
    .locals 1

    .prologue
    .line 188
    iget-object v0, p0, Lcom/amazon/ags/storage/AGSOfflineEventManager;->networkUtil:Lcom/amazon/ags/html5/util/NetworkUtil;

    return-object v0
.end method

.method public getNextEvent()Lcom/amazon/ags/storage/OfflineEventManager$OfflineEventTuple;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/storage/OfflineEventException;
        }
    .end annotation

    .prologue
    .line 89
    iget-object v6, p0, Lcom/amazon/ags/storage/AGSOfflineEventManager;->storage:Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;

    invoke-virtual {v6}, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->peekEvent()Lcom/amazon/ags/storage/OfflineEventId;

    move-result-object v5

    .line 92
    .local v5, "nextId":Lcom/amazon/ags/storage/OfflineEventId;
    sget-object v6, Lcom/amazon/ags/storage/OfflineEventId;->Invalid:Lcom/amazon/ags/storage/OfflineEventId;

    if-ne v5, v6, :cond_0

    .line 93
    const/4 v2, 0x0

    .line 116
    :goto_0
    return-object v2

    .line 96
    :cond_0
    sget-object v6, Lcom/amazon/ags/storage/AGSOfflineEventManager;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Processing event ID: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v5}, Lcom/amazon/ags/storage/OfflineEventId;->getId()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    const/4 v2, 0x0

    .line 103
    .local v2, "eventTuple":Lcom/amazon/ags/storage/OfflineEventManager$OfflineEventTuple;
    :try_start_0
    iget-object v6, p0, Lcom/amazon/ags/storage/AGSOfflineEventManager;->storage:Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;

    invoke-virtual {v6, v5}, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->getEvent(Lcom/amazon/ags/storage/OfflineEventId;)Lorg/json/JSONObject;

    move-result-object v4

    .line 104
    .local v4, "json":Lorg/json/JSONObject;
    new-instance v1, Lcom/amazon/ags/storage/OfflineEvent;

    invoke-direct {v1, v4}, Lcom/amazon/ags/storage/OfflineEvent;-><init>(Lorg/json/JSONObject;)V

    .line 106
    .local v1, "event":Lcom/amazon/ags/storage/OfflineEvent;
    new-instance v3, Lcom/amazon/ags/storage/OfflineEventManager$OfflineEventTuple;

    invoke-direct {v3, v5, v1}, Lcom/amazon/ags/storage/OfflineEventManager$OfflineEventTuple;-><init>(Lcom/amazon/ags/storage/OfflineEventId;Lcom/amazon/ags/storage/OfflineEvent;)V
    :try_end_0
    .catch Lcom/amazon/ags/storage/OfflineEventException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .end local v2    # "eventTuple":Lcom/amazon/ags/storage/OfflineEventManager$OfflineEventTuple;
    .local v3, "eventTuple":Lcom/amazon/ags/storage/OfflineEventManager$OfflineEventTuple;
    move-object v2, v3

    .line 114
    .end local v3    # "eventTuple":Lcom/amazon/ags/storage/OfflineEventManager$OfflineEventTuple;
    .restart local v2    # "eventTuple":Lcom/amazon/ags/storage/OfflineEventManager$OfflineEventTuple;
    goto :goto_0

    .line 108
    .end local v1    # "event":Lcom/amazon/ags/storage/OfflineEvent;
    .end local v4    # "json":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 109
    .local v0, "e":Lcom/amazon/ags/storage/OfflineEventException;
    sget-object v6, Lcom/amazon/ags/storage/AGSOfflineEventManager;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Failed to process event ID: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v5}, Lcom/amazon/ags/storage/OfflineEventId;->getId()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ". Removing event. Error: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v0}, Lcom/amazon/ags/storage/OfflineEventException;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    iget-object v6, p0, Lcom/amazon/ags/storage/AGSOfflineEventManager;->storage:Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;

    invoke-virtual {v6, v5}, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->removeEvent(Lcom/amazon/ags/storage/OfflineEventId;)V

    .line 111
    throw v0

    .line 112
    .end local v0    # "e":Lcom/amazon/ags/storage/OfflineEventException;
    :catch_1
    move-exception v0

    .line 113
    .local v0, "e":Ljava/lang/Exception;
    sget-object v6, Lcom/amazon/ags/storage/AGSOfflineEventManager;->TAG:Ljava/lang/String;

    const-string v7, "Error occurred while getting the next event"

    invoke-static {v6, v7, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 43
    return-void
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 48
    return-void
.end method

.method public processOfflineEvent(Lcom/amazon/ags/storage/OfflineEventManager$OfflineEventTuple;)V
    .locals 6
    .param p1, "eventTuple"    # Lcom/amazon/ags/storage/OfflineEventManager$OfflineEventTuple;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/storage/OfflineEventException;
        }
    .end annotation

    .prologue
    .line 145
    if-nez p1, :cond_1

    .line 185
    :cond_0
    :goto_0
    return-void

    .line 149
    :cond_1
    invoke-virtual {p1}, Lcom/amazon/ags/storage/OfflineEventManager$OfflineEventTuple;->getOfflineEvent()Lcom/amazon/ags/storage/OfflineEvent;

    move-result-object v1

    .line 150
    .local v1, "event":Lcom/amazon/ags/storage/OfflineEvent;
    if-eqz v1, :cond_0

    .line 155
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 156
    .local v3, "request":Lorg/json/JSONObject;
    const-string v4, "ACTION_CODE"

    const/16 v5, 0x22

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 157
    const-string v4, "jsonEvent"

    invoke-virtual {v1}, Lcom/amazon/ags/storage/OfflineEvent;->toJson()Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 159
    const-string v4, "REQUEST_ID"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 160
    const-string v4, "REQUEST_ID"

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 163
    :cond_2
    new-instance v2, Lcom/amazon/ags/storage/OfflineEventJSONRequest;

    new-instance v4, Lcom/amazon/ags/storage/AGSOfflineEventManager$1;

    invoke-direct {v4, p0, p1}, Lcom/amazon/ags/storage/AGSOfflineEventManager$1;-><init>(Lcom/amazon/ags/storage/AGSOfflineEventManager;Lcom/amazon/ags/storage/OfflineEventManager$OfflineEventTuple;)V

    invoke-direct {v2, v3, v4}, Lcom/amazon/ags/storage/OfflineEventJSONRequest;-><init>(Lorg/json/JSONObject;Lcom/amazon/ags/storage/OfflineEventJSONRequest$OfflineEventJSONCallback;)V

    .line 181
    .local v2, "processEventRequest":Lcom/amazon/ags/storage/OfflineEventJSONRequest;
    iget-object v4, p0, Lcom/amazon/ags/storage/AGSOfflineEventManager;->serviceHelper:Lcom/amazon/ags/html5/service/ServiceHelper;

    invoke-interface {v4, v2}, Lcom/amazon/ags/html5/service/ServiceHelper;->handleRequestAsync(Lcom/amazon/ags/client/JSONRequest;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 182
    .end local v2    # "processEventRequest":Lcom/amazon/ags/storage/OfflineEventJSONRequest;
    .end local v3    # "request":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 183
    .local v0, "e":Ljava/lang/Exception;
    sget-object v4, Lcom/amazon/ags/storage/AGSOfflineEventManager;->TAG:Ljava/lang/String;

    const-string v5, "Exception encountered while handling offline event"

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public removeEvent(Lcom/amazon/ags/storage/OfflineEventId;)V
    .locals 4
    .param p1, "id"    # Lcom/amazon/ags/storage/OfflineEventId;

    .prologue
    .line 128
    if-nez p1, :cond_0

    .line 129
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "id must be non-null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 132
    :cond_0
    sget-object v0, Lcom/amazon/ags/storage/AGSOfflineEventManager;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "submitEvent() called with event ID: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/amazon/ags/storage/OfflineEventId;->getId()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    iget-object v0, p0, Lcom/amazon/ags/storage/AGSOfflineEventManager;->storage:Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;

    invoke-virtual {v0, p1}, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->removeEvent(Lcom/amazon/ags/storage/OfflineEventId;)V

    .line 135
    return-void
.end method

.method public removeNextEvent()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/storage/OfflineEventException;
        }
    .end annotation

    .prologue
    .line 80
    invoke-virtual {p0}, Lcom/amazon/ags/storage/AGSOfflineEventManager;->getNextEvent()Lcom/amazon/ags/storage/OfflineEventManager$OfflineEventTuple;

    move-result-object v0

    .line 82
    .local v0, "offlineEventTuple":Lcom/amazon/ags/storage/OfflineEventManager$OfflineEventTuple;
    if-eqz v0, :cond_0

    .line 83
    invoke-virtual {v0}, Lcom/amazon/ags/storage/OfflineEventManager$OfflineEventTuple;->getEventId()Lcom/amazon/ags/storage/OfflineEventId;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/amazon/ags/storage/AGSOfflineEventManager;->removeEvent(Lcom/amazon/ags/storage/OfflineEventId;)V

    .line 85
    :cond_0
    return-void
.end method

.method public submitEvent(Lcom/amazon/ags/storage/OfflineEvent;)Lcom/amazon/ags/storage/OfflineEventId;
    .locals 7
    .param p1, "event"    # Lcom/amazon/ags/storage/OfflineEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/storage/OfflineEventException;
        }
    .end annotation

    .prologue
    .line 60
    if-nez p1, :cond_0

    .line 61
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "event must be non-null."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 65
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Lcom/amazon/ags/storage/OfflineEvent;->toJson()Lorg/json/JSONObject;

    move-result-object v2

    .line 66
    .local v2, "json":Lorg/json/JSONObject;
    iget-object v3, p0, Lcom/amazon/ags/storage/AGSOfflineEventManager;->storage:Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;

    invoke-virtual {v3, v2}, Lcom/amazon/ags/storage/SQLiteOfflineEventStorage;->storeEvent(Lorg/json/JSONObject;)Lcom/amazon/ags/storage/OfflineEventId;

    move-result-object v1

    .line 68
    .local v1, "id":Lcom/amazon/ags/storage/OfflineEventId;
    sget-object v3, Lcom/amazon/ags/storage/AGSOfflineEventManager;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "submitEvent() complete. Event ID: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Lcom/amazon/ags/storage/OfflineEventId;->getId()J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    return-object v1

    .line 71
    .end local v1    # "id":Lcom/amazon/ags/storage/OfflineEventId;
    .end local v2    # "json":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 72
    .local v0, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/amazon/ags/storage/AGSOfflineEventManager;->TAG:Ljava/lang/String;

    const-string v4, "submitEvent() - Failed to convert event to JSON due to error"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 74
    new-instance v3, Lcom/amazon/ags/storage/OfflineEventException;

    invoke-direct {v3, v0}, Lcom/amazon/ags/storage/OfflineEventException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method
