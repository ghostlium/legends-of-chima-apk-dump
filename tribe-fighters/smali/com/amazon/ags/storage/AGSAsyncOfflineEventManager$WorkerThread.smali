.class Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager$WorkerThread;
.super Ljava/lang/Thread;
.source "AGSAsyncOfflineEventManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WorkerThread"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;


# direct methods
.method private constructor <init>(Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;)V
    .locals 0

    .prologue
    .line 79
    iput-object p1, p0, Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager$WorkerThread;->this$0:Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;
    .param p2, "x1"    # Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager$1;

    .prologue
    .line 79
    invoke-direct {p0, p1}, Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager$WorkerThread;-><init>(Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 83
    :goto_0
    invoke-virtual {p0}, Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager$WorkerThread;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager$WorkerThread;->isInterrupted()Z

    move-result v1

    if-nez v1, :cond_0

    .line 85
    :try_start_0
    invoke-static {}, Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;->access$100()J

    move-result-wide v1

    invoke-static {v1, v2}, Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager$WorkerThread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 92
    iget-object v1, p0, Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager$WorkerThread;->this$0:Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;

    invoke-static {v1}, Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;->access$200(Lcom/amazon/ags/storage/AGSAsyncOfflineEventManager;)V

    goto :goto_0

    .line 86
    :catch_0
    move-exception v0

    .line 88
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    .line 95
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_0
    const-string v1, "AGSWorkerThread"

    const-string v2, "Worker thread died."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    return-void
.end method
