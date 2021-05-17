.class public Lcom/amazon/ags/client/whispersync/settings/WebOverlayWhispersyncSettingsManager;
.super Ljava/lang/Object;
.source "WebOverlayWhispersyncSettingsManager.java"

# interfaces
.implements Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager;


# static fields
.field private static final TAG:Ljava/lang/String; = "GC_Whispersync"

.field private static final WEB_OVERLAY_CALL_TIMEOUT_SECONDS:J = 0x1L


# instance fields
.field private isWhispersyncEnabled:Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager$YesNoMaybe;

.field private final sessionClient:Lcom/amazon/ags/client/session/SessionClient;


# direct methods
.method public constructor <init>(Lcom/amazon/ags/client/session/SessionClient;)V
    .locals 1
    .param p1, "sessionClient"    # Lcom/amazon/ags/client/session/SessionClient;

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    sget-object v0, Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager$YesNoMaybe;->MAYBE:Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager$YesNoMaybe;

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/settings/WebOverlayWhispersyncSettingsManager;->isWhispersyncEnabled:Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager$YesNoMaybe;

    .line 29
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/settings/WebOverlayWhispersyncSettingsManager;->sessionClient:Lcom/amazon/ags/client/session/SessionClient;

    .line 30
    return-void
.end method

.method static synthetic access$002(Lcom/amazon/ags/client/whispersync/settings/WebOverlayWhispersyncSettingsManager;Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager$YesNoMaybe;)Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager$YesNoMaybe;
    .locals 0
    .param p0, "x0"    # Lcom/amazon/ags/client/whispersync/settings/WebOverlayWhispersyncSettingsManager;
    .param p1, "x1"    # Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager$YesNoMaybe;

    .prologue
    .line 18
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/settings/WebOverlayWhispersyncSettingsManager;->isWhispersyncEnabled:Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager$YesNoMaybe;

    return-object p1
.end method


# virtual methods
.method public isWhispersyncEnabled()Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager$YesNoMaybe;
    .locals 7

    .prologue
    .line 34
    const-string v4, "GC_Whispersync"

    const-string v5, "Checking whether Whispersync is enabled"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    iget-object v4, p0, Lcom/amazon/ags/client/whispersync/settings/WebOverlayWhispersyncSettingsManager;->sessionClient:Lcom/amazon/ags/client/session/SessionClient;

    invoke-virtual {v4}, Lcom/amazon/ags/client/session/SessionClient;->isWhispersyncEnabled()Lcom/amazon/ags/api/AGResponseHandle;

    move-result-object v2

    .line 38
    .local v2, "responseHandle":Lcom/amazon/ags/api/AGResponseHandle;, "Lcom/amazon/ags/api/AGResponseHandle<Lcom/amazon/ags/client/session/WhispersyncEnabledResponse;>;"
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v4, 0x1

    invoke-direct {v0, v4}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 39
    .local v0, "countDownLatch":Ljava/util/concurrent/CountDownLatch;
    new-instance v4, Lcom/amazon/ags/client/whispersync/settings/WebOverlayWhispersyncSettingsManager$1;

    invoke-direct {v4, p0, v0}, Lcom/amazon/ags/client/whispersync/settings/WebOverlayWhispersyncSettingsManager$1;-><init>(Lcom/amazon/ags/client/whispersync/settings/WebOverlayWhispersyncSettingsManager;Ljava/util/concurrent/CountDownLatch;)V

    invoke-interface {v2, v4}, Lcom/amazon/ags/api/AGResponseHandle;->setCallback(Lcom/amazon/ags/api/AGResponseCallback;)V

    .line 59
    const-wide/16 v4, 0x1

    :try_start_0
    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v4, v5, v6}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z

    move-result v3

    .line 60
    .local v3, "success":Z
    if-nez v3, :cond_0

    .line 61
    const-string v4, "GC_Whispersync"

    const-string v5, "Timed-out determining whether Whispersync is enabled"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    .end local v3    # "success":Z
    :cond_0
    :goto_0
    iget-object v4, p0, Lcom/amazon/ags/client/whispersync/settings/WebOverlayWhispersyncSettingsManager;->isWhispersyncEnabled:Lcom/amazon/ags/client/whispersync/settings/WhispersyncUserSettingsManager$YesNoMaybe;

    return-object v4

    .line 63
    :catch_0
    move-exception v1

    .line 65
    .local v1, "e":Ljava/lang/InterruptedException;
    const-string v4, "GC_Whispersync"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Thread interrupted when waiting for Whispersync enabled state ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/InterruptedException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0
.end method
