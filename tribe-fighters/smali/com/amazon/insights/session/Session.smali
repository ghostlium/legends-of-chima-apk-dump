.class public Lcom/amazon/insights/session/Session;
.super Ljava/lang/Object;
.source "Session.java"

# interfaces
.implements Lcom/amazon/insights/core/util/JSONSerializable;


# static fields
.field private static final JSON_SESSION_ID_ATTR:Ljava/lang/String; = "session_id"

.field private static final JSON_START_TIME_ATTR:Ljava/lang/String; = "start_time"

.field private static final JSON_STOP_TIME_ATTR:Ljava/lang/String; = "stop_time"

.field protected static final SESSION_ID_APPKEY_LENGTH:I = 0x8

.field protected static final SESSION_ID_DATE_FORMAT:Ljava/lang/String; = "yyyyMMdd"

.field protected static final SESSION_ID_DELIMITER:C = '-'

.field protected static final SESSION_ID_PAD_CHAR:C = '_'

.field protected static final SESSION_ID_TIME_FORMAT:Ljava/lang/String; = "HHmmssSSS"

.field protected static final SESSION_ID_UNIQID_LENGTH:I = 0x8


# instance fields
.field private final sessionID:Ljava/lang/String;

.field private final sessionIdTimeFormat:Ljava/text/DateFormat;

.field private final startTime:J

.field private stopTime:Ljava/lang/Long;


# direct methods
.method protected constructor <init>(Lcom/amazon/insights/core/InsightsContext;)V
    .locals 4
    .param p1, "context"    # Lcom/amazon/insights/core/InsightsContext;

    .prologue
    const/4 v3, 0x0

    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-object v3, p0, Lcom/amazon/insights/session/Session;->stopTime:Ljava/lang/Long;

    .line 96
    const-string v0, "A valid InsightsContext must be provided!"

    invoke-static {p1, v0}, Lcom/amazon/insights/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyyMMdd-HHmmssSSS"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    iput-object v0, p0, Lcom/amazon/insights/session/Session;->sessionIdTimeFormat:Ljava/text/DateFormat;

    .line 99
    iget-object v0, p0, Lcom/amazon/insights/session/Session;->sessionIdTimeFormat:Ljava/text/DateFormat;

    const-string v1, "UTC"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 101
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/amazon/insights/session/Session;->startTime:J

    .line 102
    iput-object v3, p0, Lcom/amazon/insights/session/Session;->stopTime:Ljava/lang/Long;

    .line 103
    invoke-virtual {p0, p1}, Lcom/amazon/insights/session/Session;->generateSessionID(Lcom/amazon/insights/core/InsightsContext;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/insights/session/Session;->sessionID:Ljava/lang/String;

    .line 104
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "sessionID"    # Ljava/lang/String;
    .param p2, "startTime"    # Ljava/lang/String;
    .param p3, "stopTime"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-object v5, p0, Lcom/amazon/insights/session/Session;->stopTime:Ljava/lang/Long;

    .line 116
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v2, "yyyyMMdd-HHmmssSSS"

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    iput-object v1, p0, Lcom/amazon/insights/session/Session;->sessionIdTimeFormat:Ljava/text/DateFormat;

    .line 117
    iget-object v1, p0, Lcom/amazon/insights/session/Session;->sessionIdTimeFormat:Ljava/text/DateFormat;

    const-string v2, "UTC"

    invoke-static {v2}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 119
    new-instance v0, Ljava/util/Scanner;

    invoke-direct {v0, p2}, Ljava/util/Scanner;-><init>(Ljava/lang/String;)V

    .line 120
    .local v0, "s":Ljava/util/Scanner;
    invoke-virtual {v0}, Ljava/util/Scanner;->nextLong()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/amazon/insights/session/Session;->startTime:J

    .line 121
    new-instance v0, Ljava/util/Scanner;

    .end local v0    # "s":Ljava/util/Scanner;
    invoke-direct {v0, p3}, Ljava/util/Scanner;-><init>(Ljava/lang/String;)V

    .line 122
    .restart local v0    # "s":Ljava/util/Scanner;
    invoke-virtual {v0}, Ljava/util/Scanner;->nextLong()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iput-object v1, p0, Lcom/amazon/insights/session/Session;->stopTime:Ljava/lang/Long;

    .line 123
    iput-object p1, p0, Lcom/amazon/insights/session/Session;->sessionID:Ljava/lang/String;

    .line 125
    iget-object v1, p0, Lcom/amazon/insights/session/Session;->stopTime:Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    const-wide/high16 v3, -0x8000000000000000L

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    .line 126
    iput-object v5, p0, Lcom/amazon/insights/session/Session;->stopTime:Ljava/lang/Long;

    .line 128
    :cond_0
    return-void
.end method

.method public static getSessionFromSerializedSession(Ljava/lang/String;)Lcom/amazon/insights/session/Session;
    .locals 8
    .param p0, "serializedSession"    # Ljava/lang/String;

    .prologue
    .line 69
    const/4 v2, 0x0

    .line 70
    .local v2, "s":Lcom/amazon/insights/session/Session;
    invoke-static {p0}, Lcom/amazon/insights/core/util/StringUtil;->isBlank(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    move-object v3, v2

    .line 85
    .end local v2    # "s":Lcom/amazon/insights/session/Session;
    .local v3, "s":Lcom/amazon/insights/session/Session;
    :goto_0
    return-object v3

    .line 75
    .end local v3    # "s":Lcom/amazon/insights/session/Session;
    .restart local v2    # "s":Lcom/amazon/insights/session/Session;
    :cond_0
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 76
    .local v1, "json":Lorg/json/JSONObject;
    const-string v7, "session_id"

    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 77
    .local v4, "sessionID":Ljava/lang/String;
    const-string v7, "start_time"

    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 78
    .local v5, "startTime":Ljava/lang/String;
    const-string v7, "stop_time"

    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 80
    .local v6, "stopTime":Ljava/lang/String;
    new-instance v3, Lcom/amazon/insights/session/Session;

    invoke-direct {v3, v4, v5, v6}, Lcom/amazon/insights/session/Session;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v2    # "s":Lcom/amazon/insights/session/Session;
    .restart local v3    # "s":Lcom/amazon/insights/session/Session;
    move-object v2, v3

    .end local v1    # "json":Lorg/json/JSONObject;
    .end local v3    # "s":Lcom/amazon/insights/session/Session;
    .end local v4    # "sessionID":Ljava/lang/String;
    .end local v5    # "startTime":Ljava/lang/String;
    .end local v6    # "stopTime":Ljava/lang/String;
    .restart local v2    # "s":Lcom/amazon/insights/session/Session;
    :goto_1
    move-object v3, v2

    .line 85
    .end local v2    # "s":Lcom/amazon/insights/session/Session;
    .restart local v3    # "s":Lcom/amazon/insights/session/Session;
    goto :goto_0

    .line 81
    .end local v3    # "s":Lcom/amazon/insights/session/Session;
    .restart local v2    # "s":Lcom/amazon/insights/session/Session;
    :catch_0
    move-exception v0

    .line 82
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1
.end method

.method public static newInstance(Lcom/amazon/insights/core/InsightsContext;)Lcom/amazon/insights/session/Session;
    .locals 1
    .param p0, "context"    # Lcom/amazon/insights/core/InsightsContext;

    .prologue
    .line 57
    new-instance v0, Lcom/amazon/insights/session/Session;

    invoke-direct {v0, p0}, Lcom/amazon/insights/session/Session;-><init>(Lcom/amazon/insights/core/InsightsContext;)V

    return-object v0
.end method


# virtual methods
.method public generateSessionID(Lcom/amazon/insights/core/InsightsContext;)Ljava/lang/String;
    .locals 9
    .param p1, "context"    # Lcom/amazon/insights/core/InsightsContext;

    .prologue
    const/16 v8, 0x5f

    const/16 v7, 0x2d

    const/16 v6, 0x8

    .line 189
    invoke-interface {p1}, Lcom/amazon/insights/core/InsightsContext;->getCredentials()Lcom/amazon/insights/InsightsCredentials;

    move-result-object v3

    invoke-interface {v3}, Lcom/amazon/insights/InsightsCredentials;->getApplicationKey()Ljava/lang/String;

    move-result-object v0

    .line 190
    .local v0, "appKey":Ljava/lang/String;
    invoke-interface {p1}, Lcom/amazon/insights/core/InsightsContext;->getUniqueId()Lcom/amazon/insights/core/idresolver/Id;

    move-result-object v3

    invoke-virtual {v3}, Lcom/amazon/insights/core/idresolver/Id;->getValue()Ljava/lang/String;

    move-result-object v2

    .line 191
    .local v2, "uniqID":Ljava/lang/String;
    iget-object v3, p0, Lcom/amazon/insights/session/Session;->sessionIdTimeFormat:Ljava/text/DateFormat;

    iget-wide v4, p0, Lcom/amazon/insights/session/Session;->startTime:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/text/DateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 193
    .local v1, "time":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v0, v6, v8}, Lcom/amazon/insights/core/util/StringUtil;->trimOrPadString(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {v2, v6, v8}, Lcom/amazon/insights/core/util/StringUtil;->trimOrPadString(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public getSessionDuration()Ljava/lang/Number;
    .locals 5

    .prologue
    .line 167
    iget-object v0, p0, Lcom/amazon/insights/session/Session;->stopTime:Ljava/lang/Long;

    .line 168
    .local v0, "time":Ljava/lang/Long;
    if-nez v0, :cond_0

    .line 169
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    .line 172
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    iget-wide v3, p0, Lcom/amazon/insights/session/Session;->startTime:J

    cmp-long v1, v1, v3

    if-gez v1, :cond_1

    .line 173
    const-wide/16 v1, 0x0

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .line 176
    :goto_0
    return-object v1

    :cond_1
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    iget-wide v3, p0, Lcom/amazon/insights/session/Session;->startTime:J

    sub-long/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    goto :goto_0
.end method

.method public getSessionID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 226
    iget-object v0, p0, Lcom/amazon/insights/session/Session;->sessionID:Ljava/lang/String;

    return-object v0
.end method

.method public getStartTime()J
    .locals 2

    .prologue
    .line 229
    iget-wide v0, p0, Lcom/amazon/insights/session/Session;->startTime:J

    return-wide v0
.end method

.method public getStopTime()Ljava/lang/Long;
    .locals 1

    .prologue
    .line 232
    iget-object v0, p0, Lcom/amazon/insights/session/Session;->stopTime:Ljava/lang/Long;

    return-object v0
.end method

.method public isPaused()Z
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lcom/amazon/insights/session/Session;->stopTime:Ljava/lang/Long;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public pause()V
    .locals 2

    .prologue
    .line 145
    invoke-virtual {p0}, Lcom/amazon/insights/session/Session;->isPaused()Z

    move-result v0

    if-nez v0, :cond_0

    .line 146
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/insights/session/Session;->stopTime:Ljava/lang/Long;

    .line 148
    :cond_0
    return-void
.end method

.method public resume()V
    .locals 1

    .prologue
    .line 155
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/amazon/insights/session/Session;->stopTime:Ljava/lang/Long;

    .line 156
    return-void
.end method

.method public toJSONObject()Lorg/json/JSONObject;
    .locals 5

    .prologue
    .line 202
    iget-object v1, p0, Lcom/amazon/insights/session/Session;->stopTime:Ljava/lang/Long;

    .line 203
    .local v1, "stopT":Ljava/lang/Long;
    if-nez v1, :cond_0

    .line 204
    const-wide/high16 v2, -0x8000000000000000L

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .line 207
    :cond_0
    new-instance v0, Lcom/amazon/insights/core/util/JSONBuilder;

    invoke-direct {v0, p0}, Lcom/amazon/insights/core/util/JSONBuilder;-><init>(Ljava/lang/Object;)V

    .line 208
    .local v0, "builder":Lcom/amazon/insights/core/util/JSONBuilder;
    const-string v2, "session_id"

    iget-object v3, p0, Lcom/amazon/insights/session/Session;->sessionID:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Lcom/amazon/insights/core/util/JSONBuilder;->withAttribute(Ljava/lang/String;Ljava/lang/Object;)Lcom/amazon/insights/core/util/JSONBuilder;

    .line 209
    const-string v2, "start_time"

    iget-wide v3, p0, Lcom/amazon/insights/session/Session;->startTime:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/amazon/insights/core/util/JSONBuilder;->withAttribute(Ljava/lang/String;Ljava/lang/Object;)Lcom/amazon/insights/core/util/JSONBuilder;

    .line 210
    const-string v2, "stop_time"

    invoke-virtual {v0, v2, v1}, Lcom/amazon/insights/core/util/JSONBuilder;->withAttribute(Ljava/lang/String;Ljava/lang/Object;)Lcom/amazon/insights/core/util/JSONBuilder;

    .line 211
    invoke-virtual {v0}, Lcom/amazon/insights/core/util/JSONBuilder;->toJSONObject()Lorg/json/JSONObject;

    move-result-object v2

    return-object v2
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 215
    invoke-virtual {p0}, Lcom/amazon/insights/session/Session;->toJSONObject()Lorg/json/JSONObject;

    move-result-object v1

    .line 217
    .local v1, "json":Lorg/json/JSONObject;
    const/4 v2, 0x4

    :try_start_0
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 219
    :goto_0
    return-object v2

    .line 218
    :catch_0
    move-exception v0

    .line 219
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method
