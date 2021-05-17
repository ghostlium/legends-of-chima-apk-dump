.class Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster$1;
.super Ljava/lang/Object;
.source "WhispersyncEventPoster.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;->postEvent(Lcom/amazon/ags/client/whispersync/WhispersyncEvent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;

.field final synthetic val$event:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;


# direct methods
.method constructor <init>(Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;Lcom/amazon/ags/client/whispersync/WhispersyncEvent;)V
    .locals 0

    .prologue
    .line 38
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster$1;->this$0:Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;

    iput-object p2, p0, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster$1;->val$event:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 40
    sget-object v0, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster$2;->$SwitchMap$com$amazon$ags$client$whispersync$WhispersyncEvent:[I

    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster$1;->val$event:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    invoke-virtual {v1}, Lcom/amazon/ags/client/whispersync/WhispersyncEvent;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 82
    const-string v0, "GC_Whispersync"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unexpected event: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster$1;->val$event:Lcom/amazon/ags/client/whispersync/WhispersyncEvent;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    :goto_0
    return-void

    .line 42
    :pswitch_0
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster$1;->this$0:Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;

    invoke-static {v0}, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;->access$000(Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;)Lcom/amazon/ags/api/whispersync/WhispersyncEventListener;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/ags/api/whispersync/WhispersyncEventListener;->onNewCloudData()V

    goto :goto_0

    .line 46
    :pswitch_1
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster$1;->this$0:Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;

    invoke-static {v0}, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;->access$000(Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;)Lcom/amazon/ags/api/whispersync/WhispersyncEventListener;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/ags/api/whispersync/WhispersyncEventListener;->onDataUploadedToCloud()V

    goto :goto_0

    .line 50
    :pswitch_2
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster$1;->this$0:Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;

    invoke-static {v0}, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;->access$000(Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;)Lcom/amazon/ags/api/whispersync/WhispersyncEventListener;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/ags/api/whispersync/WhispersyncEventListener;->onThrottled()V

    goto :goto_0

    .line 54
    :pswitch_3
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster$1;->this$0:Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;

    invoke-static {v0}, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;->access$000(Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;)Lcom/amazon/ags/api/whispersync/WhispersyncEventListener;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/ags/api/whispersync/WhispersyncEventListener;->onDiskWriteComplete()V

    goto :goto_0

    .line 58
    :pswitch_4
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster$1;->this$0:Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;

    invoke-static {v0}, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;->access$000(Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;)Lcom/amazon/ags/api/whispersync/WhispersyncEventListener;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/ags/api/whispersync/WhispersyncEventListener;->onFirstSynchronize()V

    goto :goto_0

    .line 62
    :pswitch_5
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster$1;->this$0:Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;

    invoke-static {v0}, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;->access$000(Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;)Lcom/amazon/ags/api/whispersync/WhispersyncEventListener;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/ags/api/whispersync/WhispersyncEventListener;->onAlreadySynchronized()V

    goto :goto_0

    .line 66
    :pswitch_6
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster$1;->this$0:Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;

    invoke-static {v0}, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;->access$000(Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;)Lcom/amazon/ags/api/whispersync/WhispersyncEventListener;

    move-result-object v0

    sget-object v1, Lcom/amazon/ags/api/whispersync/FailReason;->OFFLINE:Lcom/amazon/ags/api/whispersync/FailReason;

    invoke-virtual {v0, v1}, Lcom/amazon/ags/api/whispersync/WhispersyncEventListener;->onSyncFailed(Lcom/amazon/ags/api/whispersync/FailReason;)V

    goto :goto_0

    .line 70
    :pswitch_7
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster$1;->this$0:Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;

    invoke-static {v0}, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;->access$000(Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;)Lcom/amazon/ags/api/whispersync/WhispersyncEventListener;

    move-result-object v0

    sget-object v1, Lcom/amazon/ags/api/whispersync/FailReason;->WHISPERSYNC_DISABLED:Lcom/amazon/ags/api/whispersync/FailReason;

    invoke-virtual {v0, v1}, Lcom/amazon/ags/api/whispersync/WhispersyncEventListener;->onSyncFailed(Lcom/amazon/ags/api/whispersync/FailReason;)V

    goto :goto_0

    .line 74
    :pswitch_8
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster$1;->this$0:Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;

    invoke-static {v0}, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;->access$000(Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;)Lcom/amazon/ags/api/whispersync/WhispersyncEventListener;

    move-result-object v0

    sget-object v1, Lcom/amazon/ags/api/whispersync/FailReason;->SERVICE_ERROR:Lcom/amazon/ags/api/whispersync/FailReason;

    invoke-virtual {v0, v1}, Lcom/amazon/ags/api/whispersync/WhispersyncEventListener;->onSyncFailed(Lcom/amazon/ags/api/whispersync/FailReason;)V

    goto :goto_0

    .line 78
    :pswitch_9
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster$1;->this$0:Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;

    invoke-static {v0}, Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;->access$000(Lcom/amazon/ags/client/whispersync/WhispersyncEventPoster;)Lcom/amazon/ags/api/whispersync/WhispersyncEventListener;

    move-result-object v0

    sget-object v1, Lcom/amazon/ags/api/whispersync/FailReason;->CLIENT_ERROR:Lcom/amazon/ags/api/whispersync/FailReason;

    invoke-virtual {v0, v1}, Lcom/amazon/ags/api/whispersync/WhispersyncEventListener;->onSyncFailed(Lcom/amazon/ags/api/whispersync/FailReason;)V

    goto :goto_0

    .line 40
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
    .end packed-switch
.end method
