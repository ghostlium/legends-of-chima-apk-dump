.class public Lcom/amazon/ags/auth/AuthManager;
.super Ljava/lang/Object;
.source "AuthManager.java"

# interfaces
.implements Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinatorListener;


# static fields
.field private static final GC_GAME_DATA_SCOPE:[Ljava/lang/String;

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private volatile activity:Landroid/app/Activity;

.field private authorizationManager:Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;

.field private final clientConfig:Lcom/amazon/ags/html5/util/ClientConfig;

.field private gameId:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GC_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-class v1, Lcom/amazon/ags/auth/AuthManager;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/ags/auth/AuthManager;->TAG:Ljava/lang/String;

    .line 29
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "game_circle:game_data"

    aput-object v2, v0, v1

    sput-object v0, Lcom/amazon/ags/auth/AuthManager;->GC_GAME_DATA_SCOPE:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/amazon/ags/html5/util/ClientConfig;)V
    .locals 3
    .param p1, "clientConfig"    # Lcom/amazon/ags/html5/util/ClientConfig;

    .prologue
    const/4 v2, 0x0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object v2, p0, Lcom/amazon/ags/auth/AuthManager;->gameId:Ljava/lang/String;

    .line 39
    invoke-static {}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->getInstance()Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->addAGSClientInstanceCoordinatorListener(Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinatorListener;)V

    .line 40
    invoke-static {}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->getInstance()Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/ags/auth/AuthManager;->activity:Landroid/app/Activity;

    .line 41
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;

    iget-object v1, p0, Lcom/amazon/ags/auth/AuthManager;->activity:Landroid/app/Activity;

    invoke-direct {v0, v1, v2}, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;-><init>(Landroid/content/Context;Landroid/os/Bundle;)V

    iput-object v0, p0, Lcom/amazon/ags/auth/AuthManager;->authorizationManager:Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;

    .line 42
    iput-object p1, p0, Lcom/amazon/ags/auth/AuthManager;->clientConfig:Lcom/amazon/ags/html5/util/ClientConfig;

    .line 43
    return-void
.end method

.method private declared-synchronized refreshActivity()V
    .locals 3

    .prologue
    .line 51
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/amazon/ags/auth/AuthManager;->activity:Landroid/app/Activity;

    invoke-static {}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->getInstance()Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;

    move-result-object v1

    invoke-virtual {v1}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 52
    invoke-static {}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->getInstance()Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/ags/auth/AuthManager;->activity:Landroid/app/Activity;

    .line 53
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;

    iget-object v1, p0, Lcom/amazon/ags/auth/AuthManager;->activity:Landroid/app/Activity;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;-><init>(Landroid/content/Context;Landroid/os/Bundle;)V

    iput-object v0, p0, Lcom/amazon/ags/auth/AuthManager;->authorizationManager:Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    :cond_0
    monitor-exit p0

    return-void

    .line 51
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public getGameId()Ljava/lang/String;
    .locals 3

    .prologue
    .line 67
    iget-object v1, p0, Lcom/amazon/ags/auth/AuthManager;->gameId:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 69
    :try_start_0
    invoke-direct {p0}, Lcom/amazon/ags/auth/AuthManager;->refreshActivity()V

    .line 71
    iget-object v1, p0, Lcom/amazon/ags/auth/AuthManager;->authorizationManager:Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;

    invoke-virtual {v1}, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->getAppId()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/amazon/ags/auth/AuthManager;->gameId:Ljava/lang/String;
    :try_end_0
    .catch Lcom/amazon/identity/auth/device/AuthError; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/amazon/ags/auth/AuthManager;->gameId:Ljava/lang/String;

    return-object v1

    .line 72
    :catch_0
    move-exception v0

    .line 73
    .local v0, "e":Lcom/amazon/identity/auth/device/AuthError;
    sget-object v1, Lcom/amazon/ags/auth/AuthManager;->TAG:Ljava/lang/String;

    const-string v2, "Unable to get game id"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public isLoggedIn()Z
    .locals 1

    .prologue
    .line 58
    invoke-virtual {p0}, Lcom/amazon/ags/auth/AuthManager;->tryGetToken()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public logout()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 119
    invoke-direct {p0}, Lcom/amazon/ags/auth/AuthManager;->refreshActivity()V

    .line 120
    iget-object v0, p0, Lcom/amazon/ags/auth/AuthManager;->authorizationManager:Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->clearAuthorizationState(Lcom/amazon/identity/auth/device/shared/APIListener;)Ljava/util/concurrent/Future;

    .line 121
    return-void
.end method

.method public declared-synchronized notifyCurrentActivityChanged(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 47
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/amazon/ags/auth/AuthManager;->refreshActivity()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    monitor-exit p0

    return-void

    .line 47
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public tryGetToken()Ljava/lang/String;
    .locals 8

    .prologue
    const/4 v4, 0x0

    .line 84
    invoke-direct {p0}, Lcom/amazon/ags/auth/AuthManager;->refreshActivity()V

    .line 85
    iget-object v5, p0, Lcom/amazon/ags/auth/AuthManager;->authorizationManager:Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;

    sget-object v6, Lcom/amazon/ags/auth/AuthManager;->GC_GAME_DATA_SCOPE:[Ljava/lang/String;

    invoke-virtual {v5, v6, v4}, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->getToken([Ljava/lang/String;Lcom/amazon/identity/auth/device/shared/APIListener;)Ljava/util/concurrent/Future;

    move-result-object v2

    .line 86
    .local v2, "result":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Landroid/os/Bundle;>;"
    if-nez v2, :cond_0

    .line 87
    sget-object v5, Lcom/amazon/ags/auth/AuthManager;->TAG:Ljava/lang/String;

    const-string v6, "getToken returned null."

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    :goto_0
    return-object v4

    .line 91
    :cond_0
    :try_start_0
    iget-object v5, p0, Lcom/amazon/ags/auth/AuthManager;->clientConfig:Lcom/amazon/ags/html5/util/ClientConfig;

    const-string v6, "AUTH_GET_TOKEN_TIMEOUT_MILLIS"

    invoke-virtual {v5, v6}, Lcom/amazon/ags/html5/util/ClientConfig;->get(Ljava/lang/String;)J

    move-result-wide v5

    sget-object v7, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v2, v5, v6, v7}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Bundle;

    .line 92
    .local v0, "bundle":Landroid/os/Bundle;
    if-nez v0, :cond_1

    .line 93
    sget-object v5, Lcom/amazon/ags/auth/AuthManager;->TAG:Ljava/lang/String;

    const-string v6, "getToken Future returned null."

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_2

    goto :goto_0

    .line 104
    .end local v0    # "bundle":Landroid/os/Bundle;
    :catch_0
    move-exception v1

    .line 105
    .local v1, "e":Ljava/lang/InterruptedException;
    sget-object v5, Lcom/amazon/ags/auth/AuthManager;->TAG:Ljava/lang/String;

    const-string v6, "getToken was interrupted"

    invoke-static {v5, v6, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 97
    .end local v1    # "e":Ljava/lang/InterruptedException;
    .restart local v0    # "bundle":Landroid/os/Bundle;
    :cond_1
    :try_start_1
    sget-object v5, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->FUTURE:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    iget-object v5, v5, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->val:Ljava/lang/String;

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v3

    check-cast v3, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;

    .line 98
    .local v3, "successOrFail":Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;
    sget-object v5, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;->SUCCESS:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;

    if-ne v3, v5, :cond_2

    .line 99
    sget-object v5, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->TOKEN:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    iget-object v5, v5, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->val:Ljava/lang/String;

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    .line 101
    :cond_2
    sget-object v5, Lcom/amazon/ags/auth/AuthManager;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "getToken failed with code "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_0

    .line 106
    .end local v0    # "bundle":Landroid/os/Bundle;
    .end local v3    # "successOrFail":Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;
    :catch_1
    move-exception v1

    .line 107
    .local v1, "e":Ljava/util/concurrent/ExecutionException;
    sget-object v5, Lcom/amazon/ags/auth/AuthManager;->TAG:Ljava/lang/String;

    const-string v6, "getToken failed"

    invoke-static {v5, v6, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 108
    .end local v1    # "e":Ljava/util/concurrent/ExecutionException;
    :catch_2
    move-exception v1

    .line 109
    .local v1, "e":Ljava/util/concurrent/TimeoutException;
    sget-object v5, Lcom/amazon/ags/auth/AuthManager;->TAG:Ljava/lang/String;

    const-string v6, "getToken timed out"

    invoke-static {v5, v6, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public tryLogin(Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;)V
    .locals 3
    .param p1, "callback"    # Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;

    .prologue
    .line 136
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 137
    .local v0, "options":Landroid/os/Bundle;
    sget-object v1, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->BROWSER_AUTHORIZATION:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    iget-object v1, v1, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->val:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 139
    invoke-direct {p0}, Lcom/amazon/ags/auth/AuthManager;->refreshActivity()V

    .line 140
    iget-object v1, p0, Lcom/amazon/ags/auth/AuthManager;->authorizationManager:Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;

    sget-object v2, Lcom/amazon/ags/auth/AuthManager;->GC_GAME_DATA_SCOPE:[Ljava/lang/String;

    invoke-virtual {v1, v2, v0, p1}, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->authorize([Ljava/lang/String;Landroid/os/Bundle;Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;)Ljava/util/concurrent/Future;

    .line 141
    return-void
.end method
