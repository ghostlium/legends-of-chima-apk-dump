.class public Lcom/amazon/insights/delivery/DefaultDeliveryClient;
.super Ljava/lang/Object;
.source "DefaultDeliveryClient.java"

# interfaces
.implements Lcom/amazon/insights/delivery/DeliveryClient;


# static fields
.field private static final CLIPPED_EVENT_LENGTH:I = 0x5

.field static final DEFAULT_EVENT_RECORD_REQUEST_RETRIES:I = 0x2

.field static final DEFAULT_MAX_SUBMISSIONS_ALLOWED:I = 0x3

.field static final DEFAULT_MAX_SUBMISSION_SIZE:J = 0x19000L

.field public static final EVENTS_DIRECTORY:Ljava/lang/String; = "events"

.field static final KEY_EVENT_RECORDER_MAX_RETRIES:Ljava/lang/String; = "eventRecorderRequestRetries"

.field static final KEY_MAX_SUBMISSIONS_ALLOWED:Ljava/lang/String; = "maxSubmissionAllowed"

.field static final KEY_MAX_SUBMISSION_SIZE:Ljava/lang/String; = "maxSubmissionSize"

.field private static final MAX_EVENT_OPERATIONS:I = 0x3e8

.field private static final MAX_SUBMIT_OPERATIONS:I = 0x64

.field static final RETRY_REQUEST_CODES:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final logger:Lcom/amazon/insights/core/log/Logger;


# instance fields
.field private final avgWriteEventTimeMillis:Ljava/util/concurrent/atomic/AtomicLong;

.field private final context:Lcom/amazon/insights/core/InsightsContext;

.field private final eventAdapter:Lcom/amazon/insights/event/adapter/EventAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/amazon/insights/event/adapter/EventAdapter",
            "<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field

.field private final eventStore:Lcom/amazon/insights/delivery/EventStore;

.field private final eventsProcessed:Ljava/util/concurrent/atomic/AtomicLong;

.field private final eventsRunnableQueue:Ljava/util/concurrent/ExecutorService;

.field private final policyFactory:Lcom/amazon/insights/delivery/policy/DeliveryPolicyFactory;

.field private final requestBuilder:Lcom/amazon/insights/delivery/ERSRequestBuilder;

.field private final submissionRunnableQueue:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 40
    const-class v0, Lcom/amazon/insights/delivery/DefaultDeliveryClient;

    invoke-static {v0}, Lcom/amazon/insights/core/log/Logger;->getLogger(Ljava/lang/Class;)Lcom/amazon/insights/core/log/Logger;

    move-result-object v0

    sput-object v0, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->logger:Lcom/amazon/insights/core/log/Logger;

    .line 63
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->RETRY_REQUEST_CODES:Ljava/util/Set;

    .line 64
    sget-object v0, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->RETRY_REQUEST_CODES:Ljava/util/Set;

    const/16 v1, 0x191

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 65
    sget-object v0, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->RETRY_REQUEST_CODES:Ljava/util/Set;

    const/16 v1, 0x194

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 66
    sget-object v0, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->RETRY_REQUEST_CODES:Ljava/util/Set;

    const/16 v1, 0x197

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 67
    sget-object v0, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->RETRY_REQUEST_CODES:Ljava/util/Set;

    const/16 v1, 0x198

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 68
    return-void
.end method

.method public constructor <init>(Lcom/amazon/insights/core/InsightsContext;Lcom/amazon/insights/delivery/policy/DeliveryPolicyFactory;Ljava/util/concurrent/ExecutorService;Ljava/util/concurrent/ExecutorService;Lcom/amazon/insights/delivery/ERSRequestBuilder;Lcom/amazon/insights/delivery/EventStore;Lcom/amazon/insights/event/adapter/EventAdapter;)V
    .locals 3
    .param p1, "context"    # Lcom/amazon/insights/core/InsightsContext;
    .param p2, "policyFactory"    # Lcom/amazon/insights/delivery/policy/DeliveryPolicyFactory;
    .param p3, "eventsRunnableQueue"    # Ljava/util/concurrent/ExecutorService;
    .param p4, "submissionRunnableQueue"    # Ljava/util/concurrent/ExecutorService;
    .param p5, "requestBuilder"    # Lcom/amazon/insights/delivery/ERSRequestBuilder;
    .param p6, "eventStore"    # Lcom/amazon/insights/delivery/EventStore;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/insights/core/InsightsContext;",
            "Lcom/amazon/insights/delivery/policy/DeliveryPolicyFactory;",
            "Ljava/util/concurrent/ExecutorService;",
            "Ljava/util/concurrent/ExecutorService;",
            "Lcom/amazon/insights/delivery/ERSRequestBuilder;",
            "Lcom/amazon/insights/delivery/EventStore;",
            "Lcom/amazon/insights/event/adapter/EventAdapter",
            "<",
            "Lorg/json/JSONObject;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 83
    .local p7, "eventAdapter":Lcom/amazon/insights/event/adapter/EventAdapter;, "Lcom/amazon/insights/event/adapter/EventAdapter<Lorg/json/JSONObject;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v1, 0x19

    invoke-direct {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    iput-object v0, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->avgWriteEventTimeMillis:Ljava/util/concurrent/atomic/AtomicLong;

    .line 60
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    iput-object v0, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->eventsProcessed:Ljava/util/concurrent/atomic/AtomicLong;

    .line 84
    iput-object p2, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->policyFactory:Lcom/amazon/insights/delivery/policy/DeliveryPolicyFactory;

    .line 85
    iput-object p3, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->eventsRunnableQueue:Ljava/util/concurrent/ExecutorService;

    .line 86
    iput-object p4, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->submissionRunnableQueue:Ljava/util/concurrent/ExecutorService;

    .line 87
    iput-object p1, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->context:Lcom/amazon/insights/core/InsightsContext;

    .line 88
    iput-object p5, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->requestBuilder:Lcom/amazon/insights/delivery/ERSRequestBuilder;

    .line 89
    iput-object p6, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->eventStore:Lcom/amazon/insights/delivery/EventStore;

    .line 90
    iput-object p7, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->eventAdapter:Lcom/amazon/insights/event/adapter/EventAdapter;

    .line 91
    return-void
.end method

.method static synthetic access$000(Lcom/amazon/insights/delivery/DefaultDeliveryClient;)Lcom/amazon/insights/event/adapter/EventAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/insights/delivery/DefaultDeliveryClient;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->eventAdapter:Lcom/amazon/insights/event/adapter/EventAdapter;

    return-object v0
.end method

.method static synthetic access$100(Lcom/amazon/insights/delivery/DefaultDeliveryClient;)Lcom/amazon/insights/delivery/EventStore;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/insights/delivery/DefaultDeliveryClient;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->eventStore:Lcom/amazon/insights/delivery/EventStore;

    return-object v0
.end method

.method static synthetic access$200()Lcom/amazon/insights/core/log/Logger;
    .locals 1

    .prologue
    .line 36
    sget-object v0, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->logger:Lcom/amazon/insights/core/log/Logger;

    return-object v0
.end method

.method static synthetic access$300(Lcom/amazon/insights/delivery/DefaultDeliveryClient;JJ)V
    .locals 0
    .param p0, "x0"    # Lcom/amazon/insights/delivery/DefaultDeliveryClient;
    .param p1, "x1"    # J
    .param p3, "x2"    # J

    .prologue
    .line 36
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->calculateAndSetAverageWriteEventTime(JJ)V

    return-void
.end method

.method static synthetic access$400(Lcom/amazon/insights/delivery/DefaultDeliveryClient;)J
    .locals 2
    .param p0, "x0"    # Lcom/amazon/insights/delivery/DefaultDeliveryClient;

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->getSubmissionLatchWaitTime()J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$500(Lcom/amazon/insights/delivery/DefaultDeliveryClient;)Lcom/amazon/insights/core/InsightsContext;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/insights/delivery/DefaultDeliveryClient;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->context:Lcom/amazon/insights/core/InsightsContext;

    return-object v0
.end method

.method static synthetic access$600(Lcom/amazon/insights/delivery/DefaultDeliveryClient;Lorg/json/JSONArray;Ljava/util/List;)Z
    .locals 1
    .param p0, "x0"    # Lcom/amazon/insights/delivery/DefaultDeliveryClient;
    .param p1, "x1"    # Lorg/json/JSONArray;
    .param p2, "x2"    # Ljava/util/List;

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->submitEvents(Lorg/json/JSONArray;Ljava/util/List;)Z

    move-result v0

    return v0
.end method

.method private calculateAndSetAverageWriteEventTime(JJ)V
    .locals 14
    .param p1, "origEventsProcessed"    # J
    .param p3, "enqueueTimeMillis"    # J

    .prologue
    .line 125
    iget-object v10, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->eventsProcessed:Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v11, 0x1

    invoke-virtual {v10, v11, v12}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    move-result-wide v2

    .line 126
    .local v2, "currentEventsProcessed":J
    sub-long v8, v2, p1

    .line 127
    .local v8, "eventsWrittenDelta":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    sub-long v6, v10, p3

    .line 128
    .local v6, "durationInMillis":J
    long-to-double v10, v6

    long-to-double v12, v8

    div-double v4, v10, v12

    .line 129
    .local v4, "decimalAvg":D
    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v10

    double-to-long v0, v10

    .line 130
    .local v0, "avg":J
    iget-object v10, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->avgWriteEventTimeMillis:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v10, v0, v1}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 131
    return-void
.end method

.method private getBatchedItems()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 262
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 263
    .local v0, "batchedEvents":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v2, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->eventStore:Lcom/amazon/insights/delivery/EventStore;

    invoke-interface {v2}, Lcom/amazon/insights/delivery/EventStore;->iterator()Lcom/amazon/insights/delivery/EventStore$EventIterator;

    move-result-object v1

    .line 264
    .local v1, "iter":Lcom/amazon/insights/delivery/EventStore$EventIterator;
    :goto_0
    invoke-interface {v1}, Lcom/amazon/insights/delivery/EventStore$EventIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 265
    invoke-interface {v1}, Lcom/amazon/insights/delivery/EventStore$EventIterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 267
    :cond_0
    return-object v0
.end method

.method private getSubmissionLatchWaitTime()J
    .locals 4

    .prologue
    .line 135
    iget-object v0, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->avgWriteEventTimeMillis:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    long-to-double v0, v0

    const-wide/high16 v2, 0x3ff8000000000000L    # 1.5

    mul-double/2addr v0, v2

    double-to-long v0, v0

    return-wide v0
.end method

.method public static newInstance(Lcom/amazon/insights/core/InsightsContext;Z)Lcom/amazon/insights/delivery/DefaultDeliveryClient;
    .locals 13
    .param p0, "context"    # Lcom/amazon/insights/core/InsightsContext;
    .param p1, "allowWANDelivery"    # Z

    .prologue
    const-wide/16 v3, 0x0

    const/4 v1, 0x1

    .line 74
    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v6, Ljava/util/concurrent/LinkedBlockingQueue;

    const/16 v2, 0x3e8

    invoke-direct {v6, v2}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>(I)V

    new-instance v7, Ljava/util/concurrent/ThreadPoolExecutor$DiscardPolicy;

    invoke-direct {v7}, Ljava/util/concurrent/ThreadPoolExecutor$DiscardPolicy;-><init>()V

    move v2, v1

    invoke-direct/range {v0 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/RejectedExecutionHandler;)V

    .line 75
    .local v0, "eventsExService":Ljava/util/concurrent/ExecutorService;
    new-instance v5, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v10, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v11, Ljava/util/concurrent/LinkedBlockingQueue;

    const/16 v2, 0x64

    invoke-direct {v11, v2}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>(I)V

    new-instance v12, Ljava/util/concurrent/ThreadPoolExecutor$DiscardPolicy;

    invoke-direct {v12}, Ljava/util/concurrent/ThreadPoolExecutor$DiscardPolicy;-><init>()V

    move v6, v1

    move v7, v1

    move-wide v8, v3

    invoke-direct/range {v5 .. v12}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/RejectedExecutionHandler;)V

    .line 76
    .local v5, "submissionsExService":Ljava/util/concurrent/ExecutorService;
    new-instance v6, Lcom/amazon/insights/delivery/ERSRequestBuilder;

    invoke-direct {v6, p0}, Lcom/amazon/insights/delivery/ERSRequestBuilder;-><init>(Lcom/amazon/insights/core/InsightsContext;)V

    .line 77
    .local v6, "requestBuilder":Lcom/amazon/insights/delivery/ERSRequestBuilder;
    new-instance v3, Lcom/amazon/insights/delivery/policy/DefaultDeliveryPolicyFactory;

    invoke-direct {v3, p0, p1}, Lcom/amazon/insights/delivery/policy/DefaultDeliveryPolicyFactory;-><init>(Lcom/amazon/insights/core/InsightsContext;Z)V

    .line 80
    .local v3, "policyFactory":Lcom/amazon/insights/delivery/policy/DeliveryPolicyFactory;
    new-instance v1, Lcom/amazon/insights/delivery/DefaultDeliveryClient;

    invoke-static {p0}, Lcom/amazon/insights/delivery/FileEventStore;->newInstance(Lcom/amazon/insights/core/InsightsContext;)Lcom/amazon/insights/delivery/FileEventStore;

    move-result-object v7

    new-instance v8, Lcom/amazon/insights/event/adapter/JSONEventAdapter;

    invoke-direct {v8}, Lcom/amazon/insights/event/adapter/JSONEventAdapter;-><init>()V

    move-object v2, p0

    move-object v4, v0

    invoke-direct/range {v1 .. v8}, Lcom/amazon/insights/delivery/DefaultDeliveryClient;-><init>(Lcom/amazon/insights/core/InsightsContext;Lcom/amazon/insights/delivery/policy/DeliveryPolicyFactory;Ljava/util/concurrent/ExecutorService;Ljava/util/concurrent/ExecutorService;Lcom/amazon/insights/delivery/ERSRequestBuilder;Lcom/amazon/insights/delivery/EventStore;Lcom/amazon/insights/event/adapter/EventAdapter;)V

    return-object v1
.end method

.method private submitEvents(Lorg/json/JSONArray;Ljava/util/List;)Z
    .locals 13
    .param p1, "eventArray"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            "Ljava/util/List",
            "<",
            "Lcom/amazon/insights/delivery/policy/DeliveryPolicy;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .local p2, "policies":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/insights/delivery/policy/DeliveryPolicy;>;"
    const/4 v10, 0x2

    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 222
    const/4 v5, 0x0

    .line 224
    .local v5, "submitted":Z
    iget-object v7, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->requestBuilder:Lcom/amazon/insights/delivery/ERSRequestBuilder;

    invoke-virtual {v7, p1}, Lcom/amazon/insights/delivery/ERSRequestBuilder;->createHttpRequest(Lorg/json/JSONArray;)Lcom/amazon/insights/core/http/HttpClient$Request;

    move-result-object v2

    .line 225
    .local v2, "request":Lcom/amazon/insights/core/http/HttpClient$Request;
    if-nez v2, :cond_0

    .line 226
    sget-object v7, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v8, "There was an error when building the http request"

    invoke-virtual {v7, v8}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;)V

    move v6, v5

    .line 256
    .end local v5    # "submitted":Z
    .local v6, "submitted":I
    :goto_0
    return v6

    .line 230
    .end local v6    # "submitted":I
    .restart local v5    # "submitted":Z
    :cond_0
    iget-object v7, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->context:Lcom/amazon/insights/core/InsightsContext;

    invoke-interface {v7}, Lcom/amazon/insights/core/InsightsContext;->getConfiguration()Lcom/amazon/insights/core/configuration/Configuration;

    move-result-object v7

    const-string v8, "eventRecorderRequestRetries"

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v7, v8, v9}, Lcom/amazon/insights/core/configuration/Configuration;->optInt(Ljava/lang/String;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 231
    .local v3, "requestRetries":I
    iget-object v7, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->context:Lcom/amazon/insights/core/InsightsContext;

    invoke-interface {v7}, Lcom/amazon/insights/core/InsightsContext;->getHttpClient()Lcom/amazon/insights/core/http/HttpClient;

    move-result-object v7

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v7, v2, v8}, Lcom/amazon/insights/core/http/HttpClient;->execute(Lcom/amazon/insights/core/http/HttpClient$Request;Ljava/lang/Integer;)Lcom/amazon/insights/core/http/HttpClient$Response;

    move-result-object v4

    .line 233
    .local v4, "response":Lcom/amazon/insights/core/http/HttpClient$Response;
    if-nez v4, :cond_1

    .line 234
    sget-object v7, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v8, "The http request returned a null http response"

    invoke-virtual {v7, v8}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;)V

    move v6, v5

    .line 235
    .restart local v6    # "submitted":I
    goto :goto_0

    .line 238
    .end local v6    # "submitted":I
    :cond_1
    invoke-interface {v4}, Lcom/amazon/insights/core/http/HttpClient$Response;->getCode()I

    move-result v7

    div-int/lit8 v7, v7, 0x64

    if-ne v7, v10, :cond_2

    .line 239
    sget-object v7, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v8, "Success from EventService: %d"

    new-array v9, v12, [Ljava/lang/Object;

    invoke-interface {v4}, Lcom/amazon/insights/core/http/HttpClient$Response;->getCode()I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v9, v11

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/amazon/insights/core/log/Logger;->i(Ljava/lang/String;)V

    .line 240
    sget-object v7, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v8, "Successful submission of %d events"

    new-array v9, v12, [Ljava/lang/Object;

    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v9, v11

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/amazon/insights/core/log/Logger;->devi(Ljava/lang/String;)V

    .line 241
    const/4 v5, 0x1

    .line 252
    :goto_1
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazon/insights/delivery/policy/DeliveryPolicy;

    .line 253
    .local v1, "policy":Lcom/amazon/insights/delivery/policy/DeliveryPolicy;
    invoke-interface {v1, v5}, Lcom/amazon/insights/delivery/policy/DeliveryPolicy;->handleDeliveryAttempt(Z)V

    goto :goto_2

    .line 242
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "policy":Lcom/amazon/insights/delivery/policy/DeliveryPolicy;
    :cond_2
    invoke-interface {v4}, Lcom/amazon/insights/core/http/HttpClient$Response;->getCode()I

    move-result v7

    div-int/lit8 v7, v7, 0x64

    const/4 v8, 0x4

    if-ne v7, v8, :cond_3

    sget-object v7, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->RETRY_REQUEST_CODES:Ljava/util/Set;

    invoke-interface {v4}, Lcom/amazon/insights/core/http/HttpClient$Response;->getCode()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_3

    .line 243
    sget-object v7, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v8, "Failed to submit events to EventService: %d"

    new-array v9, v12, [Ljava/lang/Object;

    invoke-interface {v4}, Lcom/amazon/insights/core/http/HttpClient$Response;->getCode()I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v9, v11

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/amazon/insights/core/log/Logger;->i(Ljava/lang/String;)V

    .line 244
    sget-object v7, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v8, "Failed submission of %d events"

    new-array v9, v12, [Ljava/lang/Object;

    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v9, v11

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/amazon/insights/core/log/Logger;->devi(Ljava/lang/String;)V

    .line 245
    const/4 v5, 0x1

    goto :goto_1

    .line 247
    :cond_3
    sget-object v7, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->logger:Lcom/amazon/insights/core/log/Logger;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Unable to successfully deliver events to server. Response code ("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-interface {v4}, Lcom/amazon/insights/core/http/HttpClient$Response;->getCode()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ") "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {v4}, Lcom/amazon/insights/core/http/HttpUtil;->getMessageForResponse(Lcom/amazon/insights/core/http/HttpClient$Response;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V

    .line 248
    sget-object v7, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->logger:Lcom/amazon/insights/core/log/Logger;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Recieved a bad response: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/amazon/insights/core/log/Logger;->w(Ljava/lang/String;)V

    goto/16 :goto_1

    .restart local v0    # "i$":Ljava/util/Iterator;
    :cond_4
    move v6, v5

    .line 256
    .restart local v6    # "submitted":I
    goto/16 :goto_0
.end method


# virtual methods
.method public attemptDelivery()V
    .locals 4

    .prologue
    .line 140
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 141
    .local v2, "policies":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/insights/delivery/policy/DeliveryPolicy;>;"
    iget-object v3, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->policyFactory:Lcom/amazon/insights/delivery/policy/DeliveryPolicyFactory;

    invoke-interface {v3}, Lcom/amazon/insights/delivery/policy/DeliveryPolicyFactory;->newForceSubmissionTimePolicy()Lcom/amazon/insights/delivery/policy/DeliveryPolicy;

    move-result-object v1

    .line 142
    .local v1, "forceSubmissionPolicy":Lcom/amazon/insights/delivery/policy/DeliveryPolicy;
    iget-object v3, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->policyFactory:Lcom/amazon/insights/delivery/policy/DeliveryPolicyFactory;

    invoke-interface {v3}, Lcom/amazon/insights/delivery/policy/DeliveryPolicyFactory;->newConnectivityPolicy()Lcom/amazon/insights/delivery/policy/DeliveryPolicy;

    move-result-object v0

    .line 143
    .local v0, "connectivityPolicy":Lcom/amazon/insights/delivery/policy/DeliveryPolicy;
    if-eqz v0, :cond_0

    .line 144
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 146
    :cond_0
    if-eqz v1, :cond_1

    .line 147
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 149
    :cond_1
    invoke-virtual {p0, v2}, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->attemptDelivery(Ljava/util/List;)V

    .line 150
    return-void
.end method

.method public attemptDelivery(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/amazon/insights/delivery/policy/DeliveryPolicy;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 153
    .local p1, "policies":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/insights/delivery/policy/DeliveryPolicy;>;"
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 154
    .local v0, "submitWaitLatch":Ljava/util/concurrent/CountDownLatch;
    iget-object v1, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->eventsRunnableQueue:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lcom/amazon/insights/delivery/DefaultDeliveryClient$2;

    invoke-direct {v2, p0, v0}, Lcom/amazon/insights/delivery/DefaultDeliveryClient$2;-><init>(Lcom/amazon/insights/delivery/DefaultDeliveryClient;Ljava/util/concurrent/CountDownLatch;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 161
    iget-object v1, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->submissionRunnableQueue:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lcom/amazon/insights/delivery/DefaultDeliveryClient$3;

    invoke-direct {v2, p0, p1, v0}, Lcom/amazon/insights/delivery/DefaultDeliveryClient$3;-><init>(Lcom/amazon/insights/delivery/DefaultDeliveryClient;Ljava/util/List;Ljava/util/concurrent/CountDownLatch;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 219
    return-void
.end method

.method public batchedEvents()[Ljava/lang/String;
    .locals 6

    .prologue
    .line 272
    new-instance v2, Ljava/util/concurrent/CountDownLatch;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 273
    .local v2, "eventsReadyLatch":Ljava/util/concurrent/CountDownLatch;
    iget-object v3, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->eventsRunnableQueue:Ljava/util/concurrent/ExecutorService;

    new-instance v4, Lcom/amazon/insights/delivery/DefaultDeliveryClient$4;

    invoke-direct {v4, p0, v2}, Lcom/amazon/insights/delivery/DefaultDeliveryClient$4;-><init>(Lcom/amazon/insights/delivery/DefaultDeliveryClient;Ljava/util/concurrent/CountDownLatch;)V

    invoke-interface {v3, v4}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 280
    const-wide/16 v3, 0xa

    :try_start_0
    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, v3, v4, v5}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 285
    :goto_0
    invoke-direct {p0}, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->getBatchedItems()Ljava/util/List;

    move-result-object v0

    .line 286
    .local v0, "batchedEvents":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0}, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->getBatchedItems()Ljava/util/List;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    new-array v4, v4, [Ljava/lang/String;

    invoke-interface {v3, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    return-object v3

    .line 281
    .end local v0    # "batchedEvents":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catch_0
    move-exception v1

    .line 282
    .local v1, "e":Ljava/lang/InterruptedException;
    sget-object v3, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v4, "timeout waiting for batchedEvents"

    invoke-virtual {v3, v4, v1}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public enqueueEventForDelivery(Lcom/amazon/insights/event/InternalEvent;)V
    .locals 8
    .param p1, "event"    # Lcom/amazon/insights/event/InternalEvent;

    .prologue
    .line 100
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    .line 101
    .local v5, "startEnqueueTimeMillis":J
    iget-object v0, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->eventsProcessed:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v3

    .line 102
    .local v3, "origEventsProcessed":J
    iget-object v7, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->eventsRunnableQueue:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Lcom/amazon/insights/delivery/DefaultDeliveryClient$1;

    move-object v1, p0

    move-object v2, p1

    invoke-direct/range {v0 .. v6}, Lcom/amazon/insights/delivery/DefaultDeliveryClient$1;-><init>(Lcom/amazon/insights/delivery/DefaultDeliveryClient;Lcom/amazon/insights/event/InternalEvent;JJ)V

    invoke-interface {v7, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 122
    return-void
.end method

.method public notify(Lcom/amazon/insights/event/InternalEvent;)V
    .locals 0
    .param p1, "event"    # Lcom/amazon/insights/event/InternalEvent;

    .prologue
    .line 95
    invoke-virtual {p0, p1}, Lcom/amazon/insights/delivery/DefaultDeliveryClient;->enqueueEventForDelivery(Lcom/amazon/insights/event/InternalEvent;)V

    .line 96
    return-void
.end method
