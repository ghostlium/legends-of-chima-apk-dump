.class Lcom/amazon/ags/client/whispersync/settings/WebOverlayWhispersyncSettingsManager$1;
.super Ljava/lang/Object;
.source "WebOverlayWhispersyncSettingsManager.java"

# interfaces
.implements Lcom/amazon/ags/api/AGResponseCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/client/whispersync/settings/WebOverlayWhispersyncSettingsManager;->isWhispersyncEnabled()Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager$YesNoMaybe;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/amazon/ags/api/AGResponseCallback",
        "<",
        "Lcom/amazon/ags/client/session/WhispersyncEnabledResponse;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/client/whispersync/settings/WebOverlayWhispersyncSettingsManager;

.field final synthetic val$countDownLatch:Ljava/util/concurrent/CountDownLatch;


# direct methods
.method constructor <init>(Lcom/amazon/ags/client/whispersync/settings/WebOverlayWhispersyncSettingsManager;Ljava/util/concurrent/CountDownLatch;)V
    .locals 0

    .prologue
    .line 39
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/settings/WebOverlayWhispersyncSettingsManager$1;->this$0:Lcom/amazon/ags/client/whispersync/settings/WebOverlayWhispersyncSettingsManager;

    iput-object p2, p0, Lcom/amazon/ags/client/whispersync/settings/WebOverlayWhispersyncSettingsManager$1;->val$countDownLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onComplete(Lcom/amazon/ags/api/RequestResponse;)V
    .locals 0
    .param p1, "x0"    # Lcom/amazon/ags/api/RequestResponse;

    .prologue
    .line 39
    check-cast p1, Lcom/amazon/ags/client/session/WhispersyncEnabledResponse;

    .end local p1    # "x0":Lcom/amazon/ags/api/RequestResponse;
    invoke-virtual {p0, p1}, Lcom/amazon/ags/client/whispersync/settings/WebOverlayWhispersyncSettingsManager$1;->onComplete(Lcom/amazon/ags/client/session/WhispersyncEnabledResponse;)V

    return-void
.end method

.method public onComplete(Lcom/amazon/ags/client/session/WhispersyncEnabledResponse;)V
    .locals 2
    .param p1, "result"    # Lcom/amazon/ags/client/session/WhispersyncEnabledResponse;

    .prologue
    .line 42
    if-eqz p1, :cond_1

    .line 43
    invoke-virtual {p1}, Lcom/amazon/ags/client/session/WhispersyncEnabledResponse;->isWhispersyncEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 44
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/settings/WebOverlayWhispersyncSettingsManager$1;->this$0:Lcom/amazon/ags/client/whispersync/settings/WebOverlayWhispersyncSettingsManager;

    sget-object v1, Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager$YesNoMaybe;->YES:Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager$YesNoMaybe;

    invoke-static {v0, v1}, Lcom/amazon/ags/client/whispersync/settings/WebOverlayWhispersyncSettingsManager;->access$002(Lcom/amazon/ags/client/whispersync/settings/WebOverlayWhispersyncSettingsManager;Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager$YesNoMaybe;)Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager$YesNoMaybe;

    .line 45
    const-string v0, "GC_Whispersync"

    const-string v1, "Whispersync is ENABLED"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    :goto_0
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/settings/WebOverlayWhispersyncSettingsManager$1;->val$countDownLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 55
    return-void

    .line 47
    :cond_0
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/settings/WebOverlayWhispersyncSettingsManager$1;->this$0:Lcom/amazon/ags/client/whispersync/settings/WebOverlayWhispersyncSettingsManager;

    sget-object v1, Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager$YesNoMaybe;->NO:Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager$YesNoMaybe;

    invoke-static {v0, v1}, Lcom/amazon/ags/client/whispersync/settings/WebOverlayWhispersyncSettingsManager;->access$002(Lcom/amazon/ags/client/whispersync/settings/WebOverlayWhispersyncSettingsManager;Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager$YesNoMaybe;)Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager$YesNoMaybe;

    .line 48
    const-string v0, "GC_Whispersync"

    const-string v1, "Whispersync is DISABLED"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 51
    :cond_1
    const-string v0, "GC_Whispersync"

    const-string v1, "Unable to determine whether Whispersync is enabled"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
