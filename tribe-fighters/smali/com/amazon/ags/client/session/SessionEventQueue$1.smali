.class Lcom/amazon/ags/client/session/SessionEventQueue$1;
.super Ljava/lang/Object;
.source "SessionEventQueue.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/client/session/SessionEventQueue;->setSessionClient(Lcom/amazon/ags/client/session/SessionClient;Ljava/util/concurrent/ExecutorService;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/client/session/SessionEventQueue;

.field final synthetic val$eventQueueToProcess:Ljava/util/List;

.field final synthetic val$sessionClient:Lcom/amazon/ags/client/session/SessionClient;


# direct methods
.method constructor <init>(Lcom/amazon/ags/client/session/SessionEventQueue;Ljava/util/List;Lcom/amazon/ags/client/session/SessionClient;)V
    .locals 0

    .prologue
    .line 55
    iput-object p1, p0, Lcom/amazon/ags/client/session/SessionEventQueue$1;->this$0:Lcom/amazon/ags/client/session/SessionEventQueue;

    iput-object p2, p0, Lcom/amazon/ags/client/session/SessionEventQueue$1;->val$eventQueueToProcess:Ljava/util/List;

    iput-object p3, p0, Lcom/amazon/ags/client/session/SessionEventQueue$1;->val$sessionClient:Lcom/amazon/ags/client/session/SessionClient;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 57
    iget-object v2, p0, Lcom/amazon/ags/client/session/SessionEventQueue$1;->val$eventQueueToProcess:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazon/ags/client/session/SessionEvent;

    .line 58
    .local v1, "sessionEvent":Lcom/amazon/ags/client/session/SessionEvent;
    iget-object v2, p0, Lcom/amazon/ags/client/session/SessionEventQueue$1;->val$sessionClient:Lcom/amazon/ags/client/session/SessionClient;

    invoke-virtual {v2, v1}, Lcom/amazon/ags/client/session/SessionClient;->processSessionEvent(Lcom/amazon/ags/client/session/SessionEvent;)Lcom/amazon/ags/api/AGResponseHandle;

    goto :goto_0

    .line 60
    .end local v1    # "sessionEvent":Lcom/amazon/ags/client/session/SessionEvent;
    :cond_0
    return-void
.end method
