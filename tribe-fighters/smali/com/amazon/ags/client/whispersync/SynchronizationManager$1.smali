.class Lcom/amazon/ags/client/whispersync/SynchronizationManager$1;
.super Ljava/lang/Thread;
.source "SynchronizationManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/client/whispersync/SynchronizationManager;->startDiskSyncThread()V
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
    .line 78
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager$1;->this$0:Lcom/amazon/ags/client/whispersync/SynchronizationManager;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 81
    :goto_0
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager$1;->this$0:Lcom/amazon/ags/client/whispersync/SynchronizationManager;

    invoke-static {v0}, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->access$000(Lcom/amazon/ags/client/whispersync/SynchronizationManager;)Lcom/amazon/ags/client/whispersync/SyncRequestState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/ags/client/whispersync/SyncRequestState;->isDiskWriteRequested()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 82
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager$1;->this$0:Lcom/amazon/ags/client/whispersync/SynchronizationManager;

    invoke-static {v0}, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->access$000(Lcom/amazon/ags/client/whispersync/SynchronizationManager;)Lcom/amazon/ags/client/whispersync/SyncRequestState;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/amazon/ags/client/whispersync/SyncRequestState;->setDiskWriteRequested(Z)V

    .line 83
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager$1;->this$0:Lcom/amazon/ags/client/whispersync/SynchronizationManager;

    invoke-static {v0}, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->access$100(Lcom/amazon/ags/client/whispersync/SynchronizationManager;)Lcom/amazon/ags/client/whispersync/DiskSynchronizer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/ags/client/whispersync/DiskSynchronizer;->syncToDisk()V

    goto :goto_0

    .line 86
    :cond_0
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager$1;->this$0:Lcom/amazon/ags/client/whispersync/SynchronizationManager;

    invoke-static {v0}, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->access$200(Lcom/amazon/ags/client/whispersync/SynchronizationManager;)V

    .line 87
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/SynchronizationManager$1;->this$0:Lcom/amazon/ags/client/whispersync/SynchronizationManager;

    invoke-static {v0, v1}, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->access$302(Lcom/amazon/ags/client/whispersync/SynchronizationManager;Z)Z

    .line 88
    return-void
.end method
