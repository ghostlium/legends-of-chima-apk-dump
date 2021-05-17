.class Lcom/amazon/ags/storage/AGSOfflineEventManager$1;
.super Ljava/lang/Object;
.source "AGSOfflineEventManager.java"

# interfaces
.implements Lcom/amazon/ags/storage/OfflineEventJSONRequest$OfflineEventJSONCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/storage/AGSOfflineEventManager;->processOfflineEvent(Lcom/amazon/ags/storage/OfflineEventManager$OfflineEventTuple;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/storage/AGSOfflineEventManager;

.field final synthetic val$eventTuple:Lcom/amazon/ags/storage/OfflineEventManager$OfflineEventTuple;


# direct methods
.method constructor <init>(Lcom/amazon/ags/storage/AGSOfflineEventManager;Lcom/amazon/ags/storage/OfflineEventManager$OfflineEventTuple;)V
    .locals 0

    .prologue
    .line 163
    iput-object p1, p0, Lcom/amazon/ags/storage/AGSOfflineEventManager$1;->this$0:Lcom/amazon/ags/storage/AGSOfflineEventManager;

    iput-object p2, p0, Lcom/amazon/ags/storage/AGSOfflineEventManager$1;->val$eventTuple:Lcom/amazon/ags/storage/OfflineEventManager$OfflineEventTuple;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onRecoverableError()V
    .locals 0

    .prologue
    .line 172
    return-void
.end method

.method public onSuccess()V
    .locals 2

    .prologue
    .line 167
    iget-object v0, p0, Lcom/amazon/ags/storage/AGSOfflineEventManager$1;->this$0:Lcom/amazon/ags/storage/AGSOfflineEventManager;

    iget-object v1, p0, Lcom/amazon/ags/storage/AGSOfflineEventManager$1;->val$eventTuple:Lcom/amazon/ags/storage/OfflineEventManager$OfflineEventTuple;

    invoke-virtual {v1}, Lcom/amazon/ags/storage/OfflineEventManager$OfflineEventTuple;->getEventId()Lcom/amazon/ags/storage/OfflineEventId;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/amazon/ags/storage/AGSOfflineEventManager;->removeEvent(Lcom/amazon/ags/storage/OfflineEventId;)V

    .line 168
    return-void
.end method

.method public onUnrecoverableError()V
    .locals 2

    .prologue
    .line 176
    iget-object v0, p0, Lcom/amazon/ags/storage/AGSOfflineEventManager$1;->this$0:Lcom/amazon/ags/storage/AGSOfflineEventManager;

    iget-object v1, p0, Lcom/amazon/ags/storage/AGSOfflineEventManager$1;->val$eventTuple:Lcom/amazon/ags/storage/OfflineEventManager$OfflineEventTuple;

    invoke-virtual {v1}, Lcom/amazon/ags/storage/OfflineEventManager$OfflineEventTuple;->getEventId()Lcom/amazon/ags/storage/OfflineEventId;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/amazon/ags/storage/AGSOfflineEventManager;->removeEvent(Lcom/amazon/ags/storage/OfflineEventId;)V

    .line 177
    return-void
.end method
