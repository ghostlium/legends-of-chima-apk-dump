.class public Lcom/amazon/ags/client/session/SessionEventQueue;
.super Ljava/lang/Object;
.source "SessionEventQueue.java"


# static fields
.field private static final QUEUE_LIMIT:I = 0x64

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private eventQueue:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/amazon/ags/client/session/SessionEvent;",
            ">;"
        }
    .end annotation
.end field

.field private sessionClient:Lcom/amazon/ags/client/session/SessionClient;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 25
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GC_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-class v1, Lcom/amazon/ags/client/session/SessionEventQueue;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/ags/client/session/SessionEventQueue;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/amazon/ags/client/session/SessionEventQueue;->eventQueue:Ljava/util/List;

    .line 28
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/amazon/ags/client/session/SessionEventQueue;->sessionClient:Lcom/amazon/ags/client/session/SessionClient;

    return-void
.end method


# virtual methods
.method public enqueue(Lcom/amazon/ags/client/session/SessionEvent;)V
    .locals 2
    .param p1, "sessionEvent"    # Lcom/amazon/ags/client/session/SessionEvent;

    .prologue
    .line 31
    monitor-enter p0

    .line 32
    :try_start_0
    iget-object v0, p0, Lcom/amazon/ags/client/session/SessionEventQueue;->sessionClient:Lcom/amazon/ags/client/session/SessionClient;

    if-nez v0, :cond_2

    .line 33
    iget-object v0, p0, Lcom/amazon/ags/client/session/SessionEventQueue;->eventQueue:Ljava/util/List;

    if-nez v0, :cond_0

    .line 34
    sget-object v0, Lcom/amazon/ags/client/session/SessionEventQueue;->TAG:Ljava/lang/String;

    const-string v1, "Unable to queue session event: queue is null"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    :goto_0
    monitor-exit p0

    .line 45
    :goto_1
    return-void

    .line 35
    :cond_0
    iget-object v0, p0, Lcom/amazon/ags/client/session/SessionEventQueue;->eventQueue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/16 v1, 0x64

    if-le v0, v1, :cond_1

    .line 37
    sget-object v0, Lcom/amazon/ags/client/session/SessionEventQueue;->TAG:Ljava/lang/String;

    const-string v1, "Unable to queue session event: queue is full"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 43
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 39
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/amazon/ags/client/session/SessionEventQueue;->eventQueue:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 43
    :cond_2
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    iget-object v0, p0, Lcom/amazon/ags/client/session/SessionEventQueue;->sessionClient:Lcom/amazon/ags/client/session/SessionClient;

    invoke-virtual {v0, p1}, Lcom/amazon/ags/client/session/SessionClient;->processSessionEvent(Lcom/amazon/ags/client/session/SessionEvent;)Lcom/amazon/ags/api/AGResponseHandle;

    goto :goto_1
.end method

.method public setSessionClient(Lcom/amazon/ags/client/session/SessionClient;Ljava/util/concurrent/ExecutorService;)V
    .locals 2
    .param p1, "sessionClient"    # Lcom/amazon/ags/client/session/SessionClient;
    .param p2, "executorService"    # Ljava/util/concurrent/ExecutorService;

    .prologue
    .line 49
    monitor-enter p0

    .line 50
    :try_start_0
    iput-object p1, p0, Lcom/amazon/ags/client/session/SessionEventQueue;->sessionClient:Lcom/amazon/ags/client/session/SessionClient;

    .line 51
    iget-object v0, p0, Lcom/amazon/ags/client/session/SessionEventQueue;->eventQueue:Ljava/util/List;

    .line 52
    .local v0, "eventQueueToProcess":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/client/session/SessionEvent;>;"
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/amazon/ags/client/session/SessionEventQueue;->eventQueue:Ljava/util/List;

    .line 53
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 54
    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 55
    new-instance v1, Lcom/amazon/ags/client/session/SessionEventQueue$1;

    invoke-direct {v1, p0, v0, p1}, Lcom/amazon/ags/client/session/SessionEventQueue$1;-><init>(Lcom/amazon/ags/client/session/SessionEventQueue;Ljava/util/List;Lcom/amazon/ags/client/session/SessionClient;)V

    invoke-interface {p2, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 63
    :cond_0
    return-void

    .line 53
    .end local v0    # "eventQueueToProcess":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/client/session/SessionEvent;>;"
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method
