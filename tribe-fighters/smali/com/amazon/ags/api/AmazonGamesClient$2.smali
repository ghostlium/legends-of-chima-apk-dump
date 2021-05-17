.class Lcom/amazon/ags/api/AmazonGamesClient$2;
.super Ljava/lang/Object;
.source "AmazonGamesClient.java"

# interfaces
.implements Lcom/amazon/ags/api/AGResponseCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/api/AmazonGamesClient;->initializeSession(ZLjava/util/Date;)V
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
        "Lcom/amazon/ags/client/session/InitializeSessionResponse;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/api/AmazonGamesClient;

.field final synthetic val$reinitialize:Z

.field final synthetic val$startTime:Ljava/util/Date;


# direct methods
.method constructor <init>(Lcom/amazon/ags/api/AmazonGamesClient;ZLjava/util/Date;)V
    .locals 0

    .prologue
    .line 249
    iput-object p1, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    iput-boolean p2, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->val$reinitialize:Z

    iput-object p3, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->val$startTime:Ljava/util/Date;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onComplete(Lcom/amazon/ags/api/RequestResponse;)V
    .locals 0
    .param p1, "x0"    # Lcom/amazon/ags/api/RequestResponse;

    .prologue
    .line 249
    check-cast p1, Lcom/amazon/ags/client/session/InitializeSessionResponse;

    .end local p1    # "x0":Lcom/amazon/ags/api/RequestResponse;
    invoke-virtual {p0, p1}, Lcom/amazon/ags/api/AmazonGamesClient$2;->onComplete(Lcom/amazon/ags/client/session/InitializeSessionResponse;)V

    return-void
.end method

.method public onComplete(Lcom/amazon/ags/client/session/InitializeSessionResponse;)V
    .locals 7
    .param p1, "result"    # Lcom/amazon/ags/client/session/InitializeSessionResponse;

    .prologue
    .line 253
    :try_start_0
    invoke-virtual {p1}, Lcom/amazon/ags/client/session/InitializeSessionResponse;->isError()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 254
    sget-object v5, Lcom/amazon/ags/api/AmazonGamesStatus;->CANNOT_INITIALIZE:Lcom/amazon/ags/api/AmazonGamesStatus;

    .line 255
    .local v5, "status":Lcom/amazon/ags/api/AmazonGamesStatus;
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    iget-boolean v1, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->val$reinitialize:Z

    iget-object v2, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->val$startTime:Ljava/util/Date;

    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    const/4 v4, 0x0

    invoke-static/range {v0 .. v5}, Lcom/amazon/ags/api/AmazonGamesClient;->access$900(Lcom/amazon/ags/api/AmazonGamesClient;ZLjava/util/Date;Ljava/util/Date;ZLcom/amazon/ags/api/AmazonGamesStatus;)V

    .line 256
    invoke-static {}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->getInstance()Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->getLatestCallback()Lcom/amazon/ags/api/AmazonGamesCallback;

    move-result-object v0

    invoke-interface {v0, v5}, Lcom/amazon/ags/api/AmazonGamesCallback;->onServiceNotReady(Lcom/amazon/ags/api/AmazonGamesStatus;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 300
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-static {v0}, Lcom/amazon/ags/api/AmazonGamesClient;->access$300(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/html5/factory/ServiceFactory;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-static {v0}, Lcom/amazon/ags/api/AmazonGamesClient;->access$1700(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/client/session/SessionEventQueue;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 301
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-static {v0}, Lcom/amazon/ags/api/AmazonGamesClient;->access$1700(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/client/session/SessionEventQueue;

    move-result-object v0

    iget-object v1, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-static {v1}, Lcom/amazon/ags/api/AmazonGamesClient;->access$300(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/html5/factory/ServiceFactory;

    move-result-object v1

    invoke-virtual {v1}, Lcom/amazon/ags/html5/factory/ServiceFactory;->getSessionClient()Lcom/amazon/ags/client/session/SessionClient;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-static {v2}, Lcom/amazon/ags/api/AmazonGamesClient;->access$100(Lcom/amazon/ags/api/AmazonGamesClient;)Ljava/util/concurrent/ExecutorService;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/amazon/ags/client/session/SessionEventQueue;->setSessionClient(Lcom/amazon/ags/client/session/SessionClient;Ljava/util/concurrent/ExecutorService;)V

    .line 304
    :cond_1
    return-void

    .line 257
    .end local v5    # "status":Lcom/amazon/ags/api/AmazonGamesStatus;
    :cond_2
    :try_start_1
    const-string v0, "AUTHORIZED"

    invoke-virtual {p1}, Lcom/amazon/ags/client/session/InitializeSessionResponse;->getAuthorizeResult()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-static {}, Lcom/amazon/ags/api/AmazonGamesClient;->access$1000()Lcom/amazon/ags/api/AmazonGamesClient;

    move-result-object v0

    if-eqz v0, :cond_8

    .line 258
    invoke-static {}, Lcom/amazon/ags/api/AmazonGamesClient;->access$1000()Lcom/amazon/ags/api/AmazonGamesClient;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/amazon/ags/api/AmazonGamesClient;->access$1102(Lcom/amazon/ags/api/AmazonGamesClient;Z)Z

    .line 259
    sget-object v5, Lcom/amazon/ags/api/AmazonGamesStatus;->SERVICE_CONNECTED:Lcom/amazon/ags/api/AmazonGamesStatus;

    .line 260
    .restart local v5    # "status":Lcom/amazon/ags/api/AmazonGamesStatus;
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    iget-boolean v1, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->val$reinitialize:Z

    iget-object v2, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->val$startTime:Ljava/util/Date;

    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    const/4 v4, 0x1

    invoke-static/range {v0 .. v5}, Lcom/amazon/ags/api/AmazonGamesClient;->access$900(Lcom/amazon/ags/api/AmazonGamesClient;ZLjava/util/Date;Ljava/util/Date;ZLcom/amazon/ags/api/AmazonGamesStatus;)V

    .line 262
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-static {v0}, Lcom/amazon/ags/api/AmazonGamesClient;->access$1200(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/client/achievements/AchievementsClientImpl;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 263
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-static {v0}, Lcom/amazon/ags/api/AmazonGamesClient;->access$1200(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/client/achievements/AchievementsClientImpl;

    move-result-object v0

    iget-object v1, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-static {v1}, Lcom/amazon/ags/api/AmazonGamesClient;->access$300(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/html5/factory/ServiceFactory;

    move-result-object v1

    invoke-virtual {v1}, Lcom/amazon/ags/html5/factory/ServiceFactory;->getServiceHelper()Lcom/amazon/ags/html5/service/ServiceHelper;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/amazon/ags/client/achievements/AchievementsClientImpl;->setServiceHelper(Lcom/amazon/ags/html5/service/ServiceHelper;)V

    .line 264
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-static {v0}, Lcom/amazon/ags/api/AmazonGamesClient;->access$1200(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/client/achievements/AchievementsClientImpl;

    move-result-object v0

    iget-object v1, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-static {v1}, Lcom/amazon/ags/api/AmazonGamesClient;->access$300(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/html5/factory/ServiceFactory;

    move-result-object v1

    invoke-virtual {v1}, Lcom/amazon/ags/html5/factory/ServiceFactory;->getOverlayClient()Lcom/amazon/ags/client/OverlayClient;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/amazon/ags/client/achievements/AchievementsClientImpl;->setOverlayClient(Lcom/amazon/ags/client/OverlayClient;)V

    .line 266
    :cond_3
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-static {v0}, Lcom/amazon/ags/api/AmazonGamesClient;->access$1300(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 267
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-static {v0}, Lcom/amazon/ags/api/AmazonGamesClient;->access$1300(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;

    move-result-object v0

    iget-object v1, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-static {v1}, Lcom/amazon/ags/api/AmazonGamesClient;->access$300(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/html5/factory/ServiceFactory;

    move-result-object v1

    invoke-virtual {v1}, Lcom/amazon/ags/html5/factory/ServiceFactory;->getServiceHelper()Lcom/amazon/ags/html5/service/ServiceHelper;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;->setServiceHelper(Lcom/amazon/ags/html5/service/ServiceHelper;)V

    .line 268
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-static {v0}, Lcom/amazon/ags/api/AmazonGamesClient;->access$1300(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;

    move-result-object v0

    iget-object v1, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-static {v1}, Lcom/amazon/ags/api/AmazonGamesClient;->access$300(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/html5/factory/ServiceFactory;

    move-result-object v1

    invoke-virtual {v1}, Lcom/amazon/ags/html5/factory/ServiceFactory;->getOverlayClient()Lcom/amazon/ags/client/OverlayClient;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;->setOverlayClient(Lcom/amazon/ags/client/OverlayClient;)V

    .line 270
    :cond_4
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-static {v0}, Lcom/amazon/ags/api/AmazonGamesClient;->access$1400(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/client/player/PlayerClientImpl;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 271
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-static {v0}, Lcom/amazon/ags/api/AmazonGamesClient;->access$1400(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/client/player/PlayerClientImpl;

    move-result-object v0

    iget-object v1, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-static {v1}, Lcom/amazon/ags/api/AmazonGamesClient;->access$300(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/html5/factory/ServiceFactory;

    move-result-object v1

    invoke-virtual {v1}, Lcom/amazon/ags/html5/factory/ServiceFactory;->getServiceHelper()Lcom/amazon/ags/html5/service/ServiceHelper;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/amazon/ags/client/player/PlayerClientImpl;->setServiceHelper(Lcom/amazon/ags/html5/service/ServiceHelper;)V

    .line 275
    :cond_5
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-virtual {v0}, Lcom/amazon/ags/api/AmazonGamesClient;->initializeJni()V

    .line 278
    invoke-static {}, Lcom/amazon/ags/client/whispersync/WhispersyncClientImpl;->getInstance()Lcom/amazon/ags/client/whispersync/WhispersyncClientImpl;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/ags/client/whispersync/WhispersyncClientImpl;->synchronizeOnInitialization()V

    .line 281
    invoke-static {}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->getInstance()Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v6

    .line 282
    .local v6, "application":Landroid/app/Application;
    if-eqz v6, :cond_6

    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-static {v0}, Lcom/amazon/ags/api/AmazonGamesClient;->access$1500(Lcom/amazon/ags/api/AmazonGamesClient;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 283
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    new-instance v1, Lcom/amazon/ags/client/KindleFireSoftkeyBeachballManager;

    invoke-direct {v1, v6}, Lcom/amazon/ags/client/KindleFireSoftkeyBeachballManager;-><init>(Landroid/app/Application;)V

    invoke-static {v0, v1}, Lcom/amazon/ags/api/AmazonGamesClient;->access$1602(Lcom/amazon/ags/api/AmazonGamesClient;Lcom/amazon/ags/client/KindleFireSoftkeyBeachballManager;)Lcom/amazon/ags/client/KindleFireSoftkeyBeachballManager;

    .line 286
    :cond_6
    invoke-static {}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->getInstance()Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->getLatestCallback()Lcom/amazon/ags/api/AmazonGamesCallback;

    move-result-object v0

    invoke-static {}, Lcom/amazon/ags/api/AmazonGamesClient;->access$1000()Lcom/amazon/ags/api/AmazonGamesClient;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/amazon/ags/api/AmazonGamesCallback;->onServiceReady(Lcom/amazon/ags/api/AmazonGamesClient;)V

    .line 287
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-static {v0}, Lcom/amazon/ags/api/AmazonGamesClient;->access$400(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/client/metrics/EventCollectorClient;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 288
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-static {v0}, Lcom/amazon/ags/api/AmazonGamesClient;->access$400(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/client/metrics/EventCollectorClient;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->resumeInsightsSession()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_0

    .line 300
    .end local v5    # "status":Lcom/amazon/ags/api/AmazonGamesStatus;
    .end local v6    # "application":Landroid/app/Application;
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-static {v1}, Lcom/amazon/ags/api/AmazonGamesClient;->access$300(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/html5/factory/ServiceFactory;

    move-result-object v1

    if-eqz v1, :cond_7

    iget-object v1, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-static {v1}, Lcom/amazon/ags/api/AmazonGamesClient;->access$1700(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/client/session/SessionEventQueue;

    move-result-object v1

    if-eqz v1, :cond_7

    .line 301
    iget-object v1, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-static {v1}, Lcom/amazon/ags/api/AmazonGamesClient;->access$1700(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/client/session/SessionEventQueue;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-static {v2}, Lcom/amazon/ags/api/AmazonGamesClient;->access$300(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/html5/factory/ServiceFactory;

    move-result-object v2

    invoke-virtual {v2}, Lcom/amazon/ags/html5/factory/ServiceFactory;->getSessionClient()Lcom/amazon/ags/client/session/SessionClient;

    move-result-object v2

    iget-object v3, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-static {v3}, Lcom/amazon/ags/api/AmazonGamesClient;->access$100(Lcom/amazon/ags/api/AmazonGamesClient;)Ljava/util/concurrent/ExecutorService;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/amazon/ags/client/session/SessionEventQueue;->setSessionClient(Lcom/amazon/ags/client/session/SessionClient;Ljava/util/concurrent/ExecutorService;)V

    :cond_7
    throw v0

    .line 292
    :cond_8
    :try_start_2
    sget-object v5, Lcom/amazon/ags/api/AmazonGamesStatus;->NOT_AUTHORIZED:Lcom/amazon/ags/api/AmazonGamesStatus;

    .line 293
    .restart local v5    # "status":Lcom/amazon/ags/api/AmazonGamesStatus;
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    iget-boolean v1, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->val$reinitialize:Z

    iget-object v2, p0, Lcom/amazon/ags/api/AmazonGamesClient$2;->val$startTime:Ljava/util/Date;

    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    const/4 v4, 0x0

    invoke-static/range {v0 .. v5}, Lcom/amazon/ags/api/AmazonGamesClient;->access$900(Lcom/amazon/ags/api/AmazonGamesClient;ZLjava/util/Date;Ljava/util/Date;ZLcom/amazon/ags/api/AmazonGamesStatus;)V

    .line 294
    invoke-static {}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->getInstance()Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->getLatestCallback()Lcom/amazon/ags/api/AmazonGamesCallback;

    move-result-object v0

    invoke-interface {v0, v5}, Lcom/amazon/ags/api/AmazonGamesCallback;->onServiceNotReady(Lcom/amazon/ags/api/AmazonGamesStatus;)V

    .line 295
    invoke-static {}, Lcom/amazon/ags/api/AmazonGamesClient;->shutdown()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_0
.end method
