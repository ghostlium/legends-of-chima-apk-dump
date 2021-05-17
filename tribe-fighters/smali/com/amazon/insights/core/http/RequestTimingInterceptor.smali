.class public Lcom/amazon/insights/core/http/RequestTimingInterceptor;
.super Ljava/lang/Object;
.source "RequestTimingInterceptor.java"

# interfaces
.implements Lcom/amazon/insights/core/http/HttpClient$Interceptor;


# static fields
.field public static final REQUESTATTEMPTS_HEADER:Ljava/lang/String; = "x-amzn-RequestAttempts"

.field public static final REQUESTTIME_HEADER:Ljava/lang/String; = "x-amzn-RequestTime"

.field public static final SERVERINFO_HEADER:Ljava/lang/String; = "x-amzn-ServerInfo"

.field private static final TIMEZONE_FORMAT:Ljava/lang/String; = "Z"

.field private static final logger:Lcom/amazon/insights/core/log/Logger;


# instance fields
.field private final connectivity:Lcom/amazon/insights/core/system/Connectivity;

.field private df:Ljava/text/DateFormat;

.field private final eventClient:Lcom/amazon/insights/event/InternalEventClient;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    const-class v0, Lcom/amazon/insights/core/http/RequestTimingInterceptor;

    invoke-static {v0}, Lcom/amazon/insights/core/log/Logger;->getLogger(Ljava/lang/Class;)Lcom/amazon/insights/core/log/Logger;

    move-result-object v0

    sput-object v0, Lcom/amazon/insights/core/http/RequestTimingInterceptor;->logger:Lcom/amazon/insights/core/log/Logger;

    return-void
.end method

.method public constructor <init>(Lcom/amazon/insights/core/system/Connectivity;Lcom/amazon/insights/event/InternalEventClient;)V
    .locals 1
    .param p1, "connectivity"    # Lcom/amazon/insights/core/system/Connectivity;
    .param p2, "eventClient"    # Lcom/amazon/insights/event/InternalEventClient;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    const-string v0, "Z"

    invoke-static {v0}, Lcom/amazon/insights/core/util/DateUtil;->createLocaleIndependentDateFormatter(Ljava/lang/String;)Ljava/text/DateFormat;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/insights/core/http/RequestTimingInterceptor;->df:Ljava/text/DateFormat;

    .line 32
    iput-object p2, p0, Lcom/amazon/insights/core/http/RequestTimingInterceptor;->eventClient:Lcom/amazon/insights/event/InternalEventClient;

    .line 33
    iput-object p1, p0, Lcom/amazon/insights/core/http/RequestTimingInterceptor;->connectivity:Lcom/amazon/insights/core/system/Connectivity;

    .line 34
    return-void
.end method

.method private declared-synchronized getTimeZone()Ljava/lang/String;
    .locals 2

    .prologue
    .line 46
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/amazon/insights/core/http/RequestTimingInterceptor;->df:Ljava/text/DateFormat;

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private recordRequestTimeEvent(Lcom/amazon/insights/core/http/HttpClient$Response;)V
    .locals 16
    .param p1, "response"    # Lcom/amazon/insights/core/http/HttpClient$Response;

    .prologue
    .line 51
    if-nez p1, :cond_1

    .line 114
    :cond_0
    :goto_0
    return-void

    .line 55
    :cond_1
    :try_start_0
    invoke-interface/range {p1 .. p1}, Lcom/amazon/insights/core/http/HttpClient$Response;->getOriginatingRequest()Lcom/amazon/insights/core/http/HttpClient$Request;

    move-result-object v4

    .line 56
    .local v4, "request":Lcom/amazon/insights/core/http/HttpClient$Request;
    if-eqz v4, :cond_0

    .line 60
    invoke-interface {v4}, Lcom/amazon/insights/core/http/HttpClient$Request;->getUrl()Ljava/lang/String;

    move-result-object v11

    .line 61
    .local v11, "url":Ljava/lang/String;
    const-string v12, "x-amzn-RequestTime"

    move-object/from16 v0, p1

    invoke-interface {v0, v12}, Lcom/amazon/insights/core/http/HttpClient$Response;->getHeader(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 62
    .local v9, "responseTimeStr":Ljava/lang/String;
    const-wide/16 v7, 0x0

    .line 63
    .local v7, "responseTime":J
    if-eqz v9, :cond_2

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/String;->length()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v12

    if-lez v12, :cond_2

    .line 65
    :try_start_1
    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-wide v7

    .line 70
    :cond_2
    :goto_1
    :try_start_2
    const-string v12, "x-amzn-RequestAttempts"

    move-object/from16 v0, p1

    invoke-interface {v0, v12}, Lcom/amazon/insights/core/http/HttpClient$Response;->getHeader(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 71
    .local v6, "requestAttemptsStr":Ljava/lang/String;
    const/4 v5, 0x0

    .line 72
    .local v5, "requestAttempts":I
    if-eqz v6, :cond_3

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/String;->length()I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    move-result v12

    if-lez v12, :cond_3

    .line 74
    :try_start_3
    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    move-result v5

    .line 79
    :cond_3
    :goto_2
    :try_start_4
    const-string v12, "x-amzn-ServerInfo"

    move-object/from16 v0, p1

    invoke-interface {v0, v12}, Lcom/amazon/insights/core/http/HttpClient$Response;->getHeader(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 80
    .local v10, "serverInfo":Ljava/lang/String;
    invoke-static {v9}, Lcom/amazon/insights/core/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_0

    .line 81
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/amazon/insights/core/http/RequestTimingInterceptor;->eventClient:Lcom/amazon/insights/event/InternalEventClient;

    if-eqz v12, :cond_0

    .line 85
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/amazon/insights/core/http/RequestTimingInterceptor;->eventClient:Lcom/amazon/insights/event/InternalEventClient;

    const-string v13, "_httpRequestTiming"

    invoke-interface {v12, v13}, Lcom/amazon/insights/event/InternalEventClient;->createEvent(Ljava/lang/String;)Lcom/amazon/insights/Event;

    move-result-object v12

    const-string v13, "url"

    invoke-interface {v12, v13, v11}, Lcom/amazon/insights/Event;->withAttribute(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/insights/Event;

    move-result-object v12

    const-string v13, "responseCode"

    invoke-interface/range {p1 .. p1}, Lcom/amazon/insights/core/http/HttpClient$Response;->getCode()I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v14

    invoke-interface {v12, v13, v14}, Lcom/amazon/insights/Event;->withAttribute(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/insights/Event;

    move-result-object v12

    const-string v13, "timeZone"

    invoke-direct/range {p0 .. p0}, Lcom/amazon/insights/core/http/RequestTimingInterceptor;->getTimeZone()Ljava/lang/String;

    move-result-object v14

    invoke-interface {v12, v13, v14}, Lcom/amazon/insights/Event;->withAttribute(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/insights/Event;

    move-result-object v12

    const-string v13, "attempts"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-interface {v12, v13, v14}, Lcom/amazon/insights/Event;->withMetric(Ljava/lang/String;Ljava/lang/Number;)Lcom/amazon/insights/Event;

    move-result-object v12

    const-string v13, "totalTime"

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    invoke-interface {v12, v13, v14}, Lcom/amazon/insights/Event;->withMetric(Ljava/lang/String;Ljava/lang/Number;)Lcom/amazon/insights/Event;

    move-result-object v12

    const-string v13, "requestSize"

    invoke-interface/range {p1 .. p1}, Lcom/amazon/insights/core/http/HttpClient$Response;->getRequestSize()J

    move-result-wide v14

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    invoke-interface {v12, v13, v14}, Lcom/amazon/insights/Event;->withMetric(Ljava/lang/String;Ljava/lang/Number;)Lcom/amazon/insights/Event;

    move-result-object v12

    const-string v13, "responseSize"

    invoke-interface/range {p1 .. p1}, Lcom/amazon/insights/core/http/HttpClient$Response;->getResponseSize()J

    move-result-wide v14

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    invoke-interface {v12, v13, v14}, Lcom/amazon/insights/Event;->withMetric(Ljava/lang/String;Ljava/lang/Number;)Lcom/amazon/insights/Event;

    move-result-object v3

    .line 94
    .local v3, "recordEvent":Lcom/amazon/insights/Event;
    const-string v1, "UNKNOWN"

    .line 95
    .local v1, "connectionType":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/amazon/insights/core/http/RequestTimingInterceptor;->connectivity:Lcom/amazon/insights/core/system/Connectivity;

    if-eqz v12, :cond_4

    .line 96
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/amazon/insights/core/http/RequestTimingInterceptor;->connectivity:Lcom/amazon/insights/core/system/Connectivity;

    invoke-interface {v12}, Lcom/amazon/insights/core/system/Connectivity;->hasWifi()Z

    move-result v12

    if-eqz v12, :cond_6

    .line 97
    const-string v1, "WIFI"

    .line 103
    :cond_4
    :goto_3
    const-string v12, "network"

    invoke-interface {v3, v12, v1}, Lcom/amazon/insights/Event;->withAttribute(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/insights/Event;

    .line 105
    if-eqz v10, :cond_5

    .line 106
    const-string v12, "serverInfo"

    invoke-interface {v3, v12, v10}, Lcom/amazon/insights/Event;->withAttribute(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/insights/Event;

    .line 109
    :cond_5
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/amazon/insights/core/http/RequestTimingInterceptor;->eventClient:Lcom/amazon/insights/event/InternalEventClient;

    const/4 v13, 0x0

    invoke-interface {v12, v3, v13}, Lcom/amazon/insights/event/InternalEventClient;->recordEvent(Lcom/amazon/insights/Event;Z)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    goto/16 :goto_0

    .line 111
    .end local v1    # "connectionType":Ljava/lang/String;
    .end local v3    # "recordEvent":Lcom/amazon/insights/Event;
    .end local v4    # "request":Lcom/amazon/insights/core/http/HttpClient$Request;
    .end local v5    # "requestAttempts":I
    .end local v6    # "requestAttemptsStr":Ljava/lang/String;
    .end local v7    # "responseTime":J
    .end local v9    # "responseTimeStr":Ljava/lang/String;
    .end local v10    # "serverInfo":Ljava/lang/String;
    .end local v11    # "url":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 112
    .local v2, "e":Ljava/lang/Exception;
    sget-object v12, Lcom/amazon/insights/core/http/RequestTimingInterceptor;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v13, "Unable to record _RequestTime event"

    invoke-virtual {v12, v13, v2}, Lcom/amazon/insights/core/log/Logger;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 98
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v1    # "connectionType":Ljava/lang/String;
    .restart local v3    # "recordEvent":Lcom/amazon/insights/Event;
    .restart local v4    # "request":Lcom/amazon/insights/core/http/HttpClient$Request;
    .restart local v5    # "requestAttempts":I
    .restart local v6    # "requestAttemptsStr":Ljava/lang/String;
    .restart local v7    # "responseTime":J
    .restart local v9    # "responseTimeStr":Ljava/lang/String;
    .restart local v10    # "serverInfo":Ljava/lang/String;
    .restart local v11    # "url":Ljava/lang/String;
    :cond_6
    :try_start_5
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/amazon/insights/core/http/RequestTimingInterceptor;->connectivity:Lcom/amazon/insights/core/system/Connectivity;

    invoke-interface {v12}, Lcom/amazon/insights/core/system/Connectivity;->hasWAN()Z

    move-result v12

    if-eqz v12, :cond_4

    .line 99
    const-string v1, "WAN"
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    goto :goto_3

    .line 75
    .end local v1    # "connectionType":Ljava/lang/String;
    .end local v3    # "recordEvent":Lcom/amazon/insights/Event;
    .end local v10    # "serverInfo":Ljava/lang/String;
    :catch_1
    move-exception v12

    goto/16 :goto_2

    .line 66
    .end local v5    # "requestAttempts":I
    .end local v6    # "requestAttemptsStr":Ljava/lang/String;
    :catch_2
    move-exception v12

    goto/16 :goto_1
.end method


# virtual methods
.method public after(Lcom/amazon/insights/core/http/HttpClient$Response;)V
    .locals 0
    .param p1, "response"    # Lcom/amazon/insights/core/http/HttpClient$Response;

    .prologue
    .line 42
    invoke-direct {p0, p1}, Lcom/amazon/insights/core/http/RequestTimingInterceptor;->recordRequestTimeEvent(Lcom/amazon/insights/core/http/HttpClient$Response;)V

    .line 43
    return-void
.end method

.method public before(Lcom/amazon/insights/core/http/HttpClient$Request;)V
    .locals 0
    .param p1, "request"    # Lcom/amazon/insights/core/http/HttpClient$Request;

    .prologue
    .line 38
    return-void
.end method
