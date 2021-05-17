.class public Lcom/amazon/ags/html5/javascript/ReportEventHandler;
.super Lcom/amazon/ags/html5/javascript/CallHandlerBase;
.source "ReportEventHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/ags/html5/javascript/ReportEventHandler$HandlerReply;
    }
.end annotation


# static fields
.field private static final supportedCalls:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 31
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "reportEvent"

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/amazon/ags/html5/javascript/ReportEventHandler;->supportedCalls:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>(Lcom/amazon/ags/client/metrics/EventCollectorClient;Landroid/os/Handler;)V
    .locals 1
    .param p1, "eventCollectorClient"    # Lcom/amazon/ags/client/metrics/EventCollectorClient;
    .param p2, "uiThreadHandler"    # Landroid/os/Handler;

    .prologue
    .line 36
    sget-object v0, Lcom/amazon/ags/html5/javascript/ReportEventHandler;->supportedCalls:Ljava/util/Set;

    invoke-direct {p0, p2, v0}, Lcom/amazon/ags/html5/javascript/CallHandlerBase;-><init>(Landroid/os/Handler;Ljava/util/Set;)V

    .line 37
    iput-object p1, p0, Lcom/amazon/ags/html5/javascript/ReportEventHandler;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    .line 38
    return-void
.end method

.method private convertAttributes(Lorg/json/JSONObject;)Ljava/util/Map;
    .locals 7
    .param p1, "attributesJSON"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 121
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 123
    .local v3, "returnMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez p1, :cond_1

    .line 124
    iget-object v4, p0, Lcom/amazon/ags/html5/javascript/ReportEventHandler;->TAG:Ljava/lang/String;

    const-string v5, "Null attributes json."

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 141
    :cond_0
    return-object v3

    .line 129
    :cond_1
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .line 130
    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_2
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 131
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 132
    .local v2, "key":Ljava/lang/String;
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 134
    :try_start_0
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 135
    :catch_0
    move-exception v0

    .line 136
    .local v0, "e":Lorg/json/JSONException;
    iget-object v4, p0, Lcom/amazon/ags/html5/javascript/ReportEventHandler;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Invalid value for key: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " in json: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private convertCounts(Lorg/json/JSONObject;)Ljava/util/Map;
    .locals 7
    .param p1, "countsJSON"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 145
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 147
    .local v3, "returnMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;"
    if-nez p1, :cond_1

    .line 148
    iget-object v4, p0, Lcom/amazon/ags/html5/javascript/ReportEventHandler;->TAG:Ljava/lang/String;

    const-string v5, "Null counts json."

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    :cond_0
    return-object v3

    .line 153
    :cond_1
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .line 154
    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_2
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 155
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 156
    .local v2, "key":Ljava/lang/String;
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 158
    :try_start_0
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 159
    :catch_0
    move-exception v0

    .line 160
    .local v0, "e":Lorg/json/JSONException;
    iget-object v4, p0, Lcom/amazon/ags/html5/javascript/ReportEventHandler;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Invalid value for key: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " in json: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private convertTimes(Lorg/json/JSONObject;)Ljava/util/Map;
    .locals 7
    .param p1, "timesJSON"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .prologue
    .line 169
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 171
    .local v3, "returnMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Long;>;"
    if-nez p1, :cond_1

    .line 172
    iget-object v4, p0, Lcom/amazon/ags/html5/javascript/ReportEventHandler;->TAG:Ljava/lang/String;

    const-string v5, "Null times json."

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 189
    :cond_0
    return-object v3

    .line 177
    :cond_1
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .line 178
    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_2
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 179
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 180
    .local v2, "key":Ljava/lang/String;
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 182
    :try_start_0
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-interface {v3, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 183
    :catch_0
    move-exception v0

    .line 184
    .local v0, "e":Lorg/json/JSONException;
    iget-object v4, p0, Lcom/amazon/ags/html5/javascript/ReportEventHandler;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Invalid value for key: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " in json: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method


# virtual methods
.method protected handleMessage(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Z
    .locals 3
    .param p1, "rid"    # Ljava/lang/String;
    .param p2, "nativeCallType"    # Ljava/lang/String;
    .param p3, "request"    # Lorg/json/JSONObject;

    .prologue
    .line 42
    const-string v1, "reportEvent"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 43
    const/4 v1, 0x0

    .line 52
    :goto_0
    return v1

    .line 47
    :cond_0
    invoke-virtual {p0, p3}, Lcom/amazon/ags/html5/javascript/ReportEventHandler;->reportEvent(Lorg/json/JSONObject;)Lcom/amazon/ags/html5/javascript/ReportEventHandler$HandlerReply;

    move-result-object v0

    .line 50
    .local v0, "reply":Lcom/amazon/ags/html5/javascript/ReportEventHandler$HandlerReply;
    invoke-virtual {v0}, Lcom/amazon/ags/html5/javascript/ReportEventHandler$HandlerReply;->getReplyMsg()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lcom/amazon/ags/html5/javascript/ReportEventHandler$HandlerReply;->getResult()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, p1, v1, v2}, Lcom/amazon/ags/html5/javascript/ReportEventHandler;->sendReply(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    const/4 v1, 0x1

    goto :goto_0
.end method

.method protected reportEvent(Lorg/json/JSONObject;)Lcom/amazon/ags/html5/javascript/ReportEventHandler$HandlerReply;
    .locals 13
    .param p1, "request"    # Lorg/json/JSONObject;

    .prologue
    .line 56
    iget-object v10, p0, Lcom/amazon/ags/html5/javascript/ReportEventHandler;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    if-nez v10, :cond_0

    .line 57
    iget-object v10, p0, Lcom/amazon/ags/html5/javascript/ReportEventHandler;->TAG:Ljava/lang/String;

    const-string v11, "EventCollector is null. We will not report the event."

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    new-instance v10, Lcom/amazon/ags/html5/javascript/ReportEventHandler$HandlerReply;

    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    const-string v12, "ERROR"

    invoke-direct {v10, p0, v11, v12}, Lcom/amazon/ags/html5/javascript/ReportEventHandler$HandlerReply;-><init>(Lcom/amazon/ags/html5/javascript/ReportEventHandler;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 117
    :goto_0
    return-object v10

    .line 61
    :cond_0
    iget-object v10, p0, Lcom/amazon/ags/html5/javascript/ReportEventHandler;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    invoke-virtual {v10}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->isReportingEnabled()Z

    move-result v10

    if-nez v10, :cond_1

    .line 62
    iget-object v10, p0, Lcom/amazon/ags/html5/javascript/ReportEventHandler;->TAG:Ljava/lang/String;

    const-string v11, "Reporting is disabled. Cannot report javascript event."

    invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    new-instance v10, Lcom/amazon/ags/html5/javascript/ReportEventHandler$HandlerReply;

    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    const-string v12, "SUCCESS"

    invoke-direct {v10, p0, v11, v12}, Lcom/amazon/ags/html5/javascript/ReportEventHandler$HandlerReply;-><init>(Lcom/amazon/ags/html5/javascript/ReportEventHandler;Lorg/json/JSONObject;Ljava/lang/String;)V

    goto :goto_0

    .line 67
    :cond_1
    if-nez p1, :cond_2

    .line 68
    iget-object v10, p0, Lcom/amazon/ags/html5/javascript/ReportEventHandler;->TAG:Ljava/lang/String;

    const-string v11, "request is null. We will not report the event."

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    new-instance v10, Lcom/amazon/ags/html5/javascript/ReportEventHandler$HandlerReply;

    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    const-string v12, "REQUEST_ERROR"

    invoke-direct {v10, p0, v11, v12}, Lcom/amazon/ags/html5/javascript/ReportEventHandler$HandlerReply;-><init>(Lcom/amazon/ags/html5/javascript/ReportEventHandler;Lorg/json/JSONObject;Ljava/lang/String;)V

    goto :goto_0

    .line 74
    :cond_2
    :try_start_0
    const-string v10, "parameters"

    invoke-virtual {p1, v10}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    .line 80
    .local v7, "parameters":Lorg/json/JSONObject;
    const-string v10, "eventAttributes"

    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 81
    .local v1, "attributesJSON":Lorg/json/JSONObject;
    const-string v10, "eventCountMetrics"

    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 82
    .local v3, "countMetricsJSON":Lorg/json/JSONObject;
    const-string v10, "eventTimeMetrics"

    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    .line 84
    .local v9, "timeMetricsJSON":Lorg/json/JSONObject;
    sget-object v10, Lcom/amazon/ags/constants/NativeCallKeys;->EVENT_NAME:Ljava/lang/String;

    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 85
    .local v5, "eventName":Ljava/lang/String;
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_3

    .line 86
    iget-object v10, p0, Lcom/amazon/ags/html5/javascript/ReportEventHandler;->TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v12, Lcom/amazon/ags/constants/NativeCallKeys;->EVENT_NAME:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " key returns no value. This event cannot be constructed. Request: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    new-instance v10, Lcom/amazon/ags/html5/javascript/ReportEventHandler$HandlerReply;

    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    const-string v12, "REQUEST_ERROR"

    invoke-direct {v10, p0, v11, v12}, Lcom/amazon/ags/html5/javascript/ReportEventHandler$HandlerReply;-><init>(Lcom/amazon/ags/html5/javascript/ReportEventHandler;Lorg/json/JSONObject;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 75
    .end local v1    # "attributesJSON":Lorg/json/JSONObject;
    .end local v3    # "countMetricsJSON":Lorg/json/JSONObject;
    .end local v5    # "eventName":Ljava/lang/String;
    .end local v7    # "parameters":Lorg/json/JSONObject;
    .end local v9    # "timeMetricsJSON":Lorg/json/JSONObject;
    :catch_0
    move-exception v4

    .line 76
    .local v4, "e":Lorg/json/JSONException;
    iget-object v10, p0, Lcom/amazon/ags/html5/javascript/ReportEventHandler;->TAG:Ljava/lang/String;

    const-string v11, "No parameters for request. We will not report the event."

    invoke-static {v10, v11, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 77
    new-instance v10, Lcom/amazon/ags/html5/javascript/ReportEventHandler$HandlerReply;

    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    const-string v12, "REQUEST_ERROR"

    invoke-direct {v10, p0, v11, v12}, Lcom/amazon/ags/html5/javascript/ReportEventHandler$HandlerReply;-><init>(Lcom/amazon/ags/html5/javascript/ReportEventHandler;Lorg/json/JSONObject;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 91
    .end local v4    # "e":Lorg/json/JSONException;
    .restart local v1    # "attributesJSON":Lorg/json/JSONObject;
    .restart local v3    # "countMetricsJSON":Lorg/json/JSONObject;
    .restart local v5    # "eventName":Ljava/lang/String;
    .restart local v7    # "parameters":Lorg/json/JSONObject;
    .restart local v9    # "timeMetricsJSON":Lorg/json/JSONObject;
    :cond_3
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 92
    .local v0, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 93
    .local v2, "countMetrics":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;"
    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 95
    .local v8, "timeMetrics":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Long;>;"
    if-eqz v1, :cond_4

    .line 96
    invoke-direct {p0, v1}, Lcom/amazon/ags/html5/javascript/ReportEventHandler;->convertAttributes(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object v0

    .line 99
    :cond_4
    if-eqz v3, :cond_5

    .line 100
    invoke-direct {p0, v3}, Lcom/amazon/ags/html5/javascript/ReportEventHandler;->convertCounts(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object v2

    .line 103
    :cond_5
    if-eqz v9, :cond_6

    .line 104
    invoke-direct {p0, v9}, Lcom/amazon/ags/html5/javascript/ReportEventHandler;->convertTimes(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object v8

    .line 109
    :cond_6
    :try_start_1
    new-instance v6, Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;

    invoke-direct {v6, v5, v0, v2, v8}, Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V

    .line 110
    .local v6, "genericEvent":Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
    iget-object v10, p0, Lcom/amazon/ags/html5/javascript/ReportEventHandler;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    invoke-virtual {v10, v6}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->reportGenericEvent(Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;)V
    :try_end_1
    .catch Lcom/amazon/ags/client/metrics/IllegalConstructionException; {:try_start_1 .. :try_end_1} :catch_1

    .line 117
    new-instance v10, Lcom/amazon/ags/html5/javascript/ReportEventHandler$HandlerReply;

    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    const-string v12, "SUCCESS"

    invoke-direct {v10, p0, v11, v12}, Lcom/amazon/ags/html5/javascript/ReportEventHandler$HandlerReply;-><init>(Lcom/amazon/ags/html5/javascript/ReportEventHandler;Lorg/json/JSONObject;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 111
    .end local v6    # "genericEvent":Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
    :catch_1
    move-exception v4

    .line 112
    .local v4, "e":Lcom/amazon/ags/client/metrics/IllegalConstructionException;
    iget-object v10, p0, Lcom/amazon/ags/html5/javascript/ReportEventHandler;->TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Unable to create event correctly. Request: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 113
    new-instance v10, Lcom/amazon/ags/html5/javascript/ReportEventHandler$HandlerReply;

    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    const-string v12, "REQUEST_ERROR"

    invoke-direct {v10, p0, v11, v12}, Lcom/amazon/ags/html5/javascript/ReportEventHandler$HandlerReply;-><init>(Lcom/amazon/ags/html5/javascript/ReportEventHandler;Lorg/json/JSONObject;Ljava/lang/String;)V

    goto/16 :goto_0
.end method
