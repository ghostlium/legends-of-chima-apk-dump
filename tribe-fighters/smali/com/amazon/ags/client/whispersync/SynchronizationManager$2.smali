.class Lcom/amazon/ags/client/whispersync/SynchronizationManager$2;
.super Ljava/lang/Thread;
.source "SynchronizationManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/client/whispersync/SynchronizationManager;->startCloudSyncThread()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/client/whispersync/SynchronizationManager;


# direct methods
.method constructor <init>(Lcom/amazon/ags/client/whispersync/SynchronizationManager;)V
    .locals 0

    .prologue
    .line 105
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager$2;->this$0:Lcom/amazon/ags/client/whispersync/SynchronizationManager;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 108
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager$2;->this$0:Lcom/amazon/ags/client/whispersync/SynchronizationManager;

    invoke-static {v0}, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->access$000(Lcom/amazon/ags/client/whispersync/SynchronizationManager;)Lcom/amazon/ags/client/whispersync/SyncRequestState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/ags/client/whispersync/SyncRequestState;->isCloudWriteRequested()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 109
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager$2;->this$0:Lcom/amazon/ags/client/whispersync/SynchronizationManager;

    invoke-static {v0}, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->access$000(Lcom/amazon/ags/client/whispersync/SynchronizationManager;)Lcom/amazon/ags/client/whispersync/SyncRequestState;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/amazon/ags/client/whispersync/SyncRequestState;->setCloudWriteRequested(Z)V

    .line 110
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager$2;->this$0:Lcom/amazon/ags/client/whispersync/SynchronizationManager;

    invoke-static {v0}, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->access$400(Lcom/amazon/ags/client/whispersync/SynchronizationManager;)Lcom/amazon/ags/client/whispersync/CloudSynchronizer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/ags/client/whispersync/CloudSynchronizer;->syncToCloud()V

    .line 112
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager$2;->this$0:Lcom/amazon/ags/client/whispersync/SynchronizationManager;

    invoke-static {v0}, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->access$000(Lcom/amazon/ags/client/whispersync/SynchronizationManager;)Lcom/amazon/ags/client/whispersync/SyncRequestState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/ags/client/whispersync/SyncRequestState;->isDiskWriteRequested()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 113
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager$2;->this$0:Lcom/amazon/ags/client/whispersync/SynchronizationManager;

    invoke-virtual {v0}, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->flush()V

    goto :goto_0

    .line 116
    :cond_1
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager$2;->this$0:Lcom/amazon/ags/client/whispersync/SynchronizationManager;

    invoke-static {v0, v1}, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->access$502(Lcom/amazon/ags/client/whispersync/SynchronizationManager;Z)Z

    .line 117
    return-void
.end method
