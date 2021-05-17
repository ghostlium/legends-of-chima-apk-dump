.class public Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;
.super Ljava/lang/Object;
.source "AsynchronousReplyMessenger.java"


# static fields
.field private static final REQUEST_TIMEOUT_MILLIS:J = 0x2710L

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final pendingMessages:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/amazon/ags/client/JSONRequest;",
            ">;"
        }
    .end annotation
.end field

.field private final scheduledExecutorService:Ljava/util/concurrent/ScheduledExecutorService;

.field private final uiThreadHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GC_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-class v1, Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/os/Handler;Ljava/util/concurrent/ScheduledExecutorService;)V
    .locals 1
    .param p1, "uiThreadHandler"    # Landroid/os/Handler;
    .param p2, "scheduledExecutorService"    # Ljava/util/concurrent/ScheduledExecutorService;

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;->pendingMessages:Ljava/util/Map;

    .line 42
    iput-object p1, p0, Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;->uiThreadHandler:Landroid/os/Handler;

    .line 43
    iput-object p2, p0, Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;->scheduledExecutorService:Ljava/util/concurrent/ScheduledExecutorService;

    .line 44
    return-void
.end method

.method static synthetic access$000(Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;->pendingMessages:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    .prologue
    .line 26
    sget-object v0, Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private scheduleTimeoutTask(Ljava/lang/String;)V
    .locals 5
    .param p1, "requestId"    # Ljava/lang/String;

    .prologue
    .line 66
    new-instance v0, Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger$1;

    invoke-direct {v0, p0, p1}, Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger$1;-><init>(Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;Ljava/lang/String;)V

    .line 88
    .local v0, "timeoutTask":Ljava/lang/Runnable;
    iget-object v1, p0, Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;->scheduledExecutorService:Ljava/util/concurrent/ScheduledExecutorService;

    const-wide/16 v2, 0x2710

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v1, v0, v2, v3, v4}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 89
    return-void
.end method


# virtual methods
.method public addAsyncRequest(Lcom/amazon/ags/client/JSONRequest;)V
    .locals 4
    .param p1, "asyncRequest"    # Lcom/amazon/ags/client/JSONRequest;

    .prologue
    .line 47
    if-nez p1, :cond_0

    .line 63
    :goto_0
    return-void

    .line 53
    :cond_0
    :try_start_0
    invoke-interface {p1}, Lcom/amazon/ags/client/JSONRequest;->getRequest()Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "REQUEST_ID"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 57
    .local v1, "requestId":Ljava/lang/String;
    if-nez v1, :cond_1

    .line 58
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Messages must contain a request id"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 54
    .end local v1    # "requestId":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 55
    .local v0, "e":Lorg/json/JSONException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Unable to get request id"

    invoke-direct {v2, v3, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 61
    .end local v0    # "e":Lorg/json/JSONException;
    .restart local v1    # "requestId":Ljava/lang/String;
    :cond_1
    invoke-direct {p0, v1}, Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;->scheduleTimeoutTask(Ljava/lang/String;)V

    .line 62
    iget-object v2, p0, Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;->pendingMessages:Ljava/util/Map;

    invoke-interface {v2, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public sendReply(Lorg/json/JSONObject;)V
    .locals 6
    .param p1, "reply"    # Lorg/json/JSONObject;

    .prologue
    .line 92
    if-nez p1, :cond_0

    .line 93
    sget-object v3, Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;->TAG:Ljava/lang/String;

    const-string v4, "Null reply recieved"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    :goto_0
    return-void

    .line 99
    :cond_0
    :try_start_0
    const-string v3, "REQUEST_ID"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 104
    .local v2, "requestId":Ljava/lang/String;
    if-nez v2, :cond_1

    .line 105
    sget-object v3, Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;->TAG:Ljava/lang/String;

    const-string v4, "sendReply received a null request id"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 100
    .end local v2    # "requestId":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 101
    .local v1, "e":Lorg/json/JSONException;
    sget-object v3, Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;->TAG:Ljava/lang/String;

    const-string v4, "Unable to get request id"

    invoke-static {v3, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 109
    .end local v1    # "e":Lorg/json/JSONException;
    .restart local v2    # "requestId":Ljava/lang/String;
    :cond_1
    iget-object v3, p0, Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;->pendingMessages:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/ags/client/JSONRequest;

    .line 110
    .local v0, "asyncRequest":Lcom/amazon/ags/client/JSONRequest;
    if-eqz v0, :cond_2

    .line 111
    iget-object v3, p0, Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;->uiThreadHandler:Landroid/os/Handler;

    new-instance v4, Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger$2;

    invoke-direct {v4, p0, v0, p1}, Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger$2;-><init>(Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;Lcom/amazon/ags/client/JSONRequest;Lorg/json/JSONObject;)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 118
    :cond_2
    sget-object v3, Lcom/amazon/ags/html5/service/AsynchronousReplyMessenger;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "No pending message found for message id "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
