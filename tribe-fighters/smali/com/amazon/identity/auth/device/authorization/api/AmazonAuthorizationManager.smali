.class public Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;
.super Ljava/lang/Object;
.source "AmazonAuthorizationManager.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String;


# instance fields
.field private final SDK_VERSION:Ljava/lang/String;

.field private final mAppIdentifier:Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;

.field private final mClientId:Ljava/lang/String;

.field private final mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 93
    const-class v0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->LOG_TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/os/Bundle;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "options"    # Landroid/os/Bundle;

    .prologue
    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    new-instance v1, Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;

    invoke-direct {v1}, Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;-><init>()V

    iput-object v1, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->mAppIdentifier:Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;

    .line 102
    const-string v1, "1.0.0"

    iput-object v1, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->SDK_VERSION:Ljava/lang/String;

    .line 114
    sget-object v1, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->LOG_TAG:Ljava/lang/String;

    const-string v2, "AmazonAuthorizationManager:sdkVer=1.0.0 libVer=3.3.0"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "options="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    if-nez p1, :cond_0

    .line 116
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "context must not be null!"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 118
    :cond_0
    iput-object p1, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->mContext:Landroid/content/Context;

    .line 119
    if-nez p2, :cond_1

    .line 120
    sget-object v1, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->LOG_TAG:Ljava/lang/String;

    const-string v2, "Options bundle is null"

    invoke-static {v1, v2}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 123
    :cond_1
    iget-object v1, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->mAppIdentifier:Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;

    iget-object v2, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v2, v3}, Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;->getAppInfo(Ljava/lang/String;Landroid/content/Context;)Lcom/amazon/identity/auth/device/dataobject/AppInfo;

    move-result-object v0

    .line 124
    .local v0, "appInfo":Lcom/amazon/identity/auth/device/dataobject/AppInfo;
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->getClientId()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_3

    .line 126
    :cond_2
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Invalid API Key"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 128
    :cond_3
    invoke-virtual {v0}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->getClientId()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->mClientId:Ljava/lang/String;

    .line 129
    return-void
.end method

.method static synthetic access$000(Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;)Z
    .locals 1
    .param p0, "x0"    # Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;

    .prologue
    .line 91
    invoke-direct {p0}, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->isAPIKeyValid()Z

    move-result v0

    return v0
.end method

.method static synthetic access$100(Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;

    .prologue
    .line 91
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$200(Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;

    .prologue
    .line 91
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->mClientId:Ljava/lang/String;

    return-object v0
.end method

.method private authorizeWithBrowser([Ljava/lang/String;Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;)Ljava/util/concurrent/Future;
    .locals 3
    .param p1, "scopes"    # [Ljava/lang/String;
    .param p2, "listener"    # Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            "Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Landroid/os/Bundle;",
            ">;"
        }
    .end annotation

    .prologue
    .line 190
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " calling authorize with Activity: scopes="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    sget-object v0, Lcom/amazon/identity/auth/device/thread/ThreadUtils;->THREAD_POOL:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$1;

    invoke-direct {v1, p0, p2, p1}, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$1;-><init>(Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;[Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 210
    const/4 v0, 0x0

    return-object v0
.end method

.method private isAPIKeyValid()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 475
    iget-object v1, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->mAppIdentifier:Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;

    iget-object v2, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v2}, Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;->isAPIKeyValid(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->mClientId:Ljava/lang/String;

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method


# virtual methods
.method public authorize([Ljava/lang/String;Landroid/os/Bundle;Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;)Ljava/util/concurrent/Future;
    .locals 2
    .param p1, "scopes"    # [Ljava/lang/String;
    .param p2, "options"    # Landroid/os/Bundle;
    .param p3, "listener"    # Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            "Landroid/os/Bundle;",
            "Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Landroid/os/Bundle;",
            ">;"
        }
    .end annotation

    .prologue
    .line 162
    if-eqz p1, :cond_0

    array-length v0, p1

    if-nez v0, :cond_1

    .line 163
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "scopes must not be null or empty!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 166
    :cond_1
    invoke-direct {p0, p1, p3}, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->authorizeWithBrowser([Ljava/lang/String;Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;)Ljava/util/concurrent/Future;

    move-result-object v0

    return-object v0
.end method

.method public clearAuthorizationState(Lcom/amazon/identity/auth/device/shared/APIListener;)Ljava/util/concurrent/Future;
    .locals 4
    .param p1, "listener"    # Lcom/amazon/identity/auth/device/shared/APIListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/identity/auth/device/shared/APIListener;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Landroid/os/Bundle;",
            ">;"
        }
    .end annotation

    .prologue
    .line 366
    new-instance v0, Lcom/amazon/identity/auth/device/thread/AuthzCallbackFuture;

    invoke-direct {v0, p1}, Lcom/amazon/identity/auth/device/thread/AuthzCallbackFuture;-><init>(Lcom/amazon/identity/auth/device/shared/APIListener;)V

    .line 367
    .local v0, "callbackFuture":Lcom/amazon/identity/auth/device/thread/AuthzCallbackFuture;
    invoke-direct {p0}, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->isAPIKeyValid()Z

    move-result v1

    if-nez v1, :cond_0

    .line 369
    new-instance v1, Lcom/amazon/identity/auth/device/AuthError;

    const-string v2, "APIKey is invalid"

    sget-object v3, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_ACCESS_DENIED:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-direct {v1, v2, v3}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    invoke-virtual {v0, v1}, Lcom/amazon/identity/auth/device/thread/AuthzCallbackFuture;->onError(Lcom/amazon/identity/auth/device/AuthError;)V

    .line 371
    :cond_0
    sget-object v1, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->LOG_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " calling clearAuthorizationState"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 372
    sget-object v1, Lcom/amazon/identity/auth/device/thread/ThreadUtils;->THREAD_POOL:Ljava/util/concurrent/Executor;

    new-instance v2, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$3;

    invoke-direct {v2, p0, v0}, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$3;-><init>(Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;Lcom/amazon/identity/auth/device/thread/AuthzCallbackFuture;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 398
    return-object v0
.end method

.method public getAppId()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 297
    invoke-direct {p0}, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->isAPIKeyValid()Z

    move-result v2

    if-nez v2, :cond_0

    .line 299
    new-instance v2, Lcom/amazon/identity/auth/device/AuthError;

    const-string v3, "APIKey is invalid"

    sget-object v4, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_ACCESS_DENIED:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-direct {v2, v3, v4}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    throw v2

    .line 301
    :cond_0
    sget-object v2, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " calling getAppId"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 302
    new-instance v0, Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;

    invoke-direct {v0}, Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;-><init>()V

    .line 303
    .local v0, "appIdentifier":Lcom/amazon/identity/auth/device/appid/AppIdentifier;
    iget-object v2, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->mContext:Landroid/content/Context;

    invoke-interface {v0, v2, v3}, Lcom/amazon/identity/auth/device/appid/AppIdentifier;->getAppInfo(Ljava/lang/String;Landroid/content/Context;)Lcom/amazon/identity/auth/device/dataobject/AppInfo;

    move-result-object v1

    .line 304
    .local v1, "appInfo":Lcom/amazon/identity/auth/device/dataobject/AppInfo;
    if-nez v1, :cond_1

    .line 306
    const/4 v2, 0x0

    .line 308
    :goto_0
    return-object v2

    :cond_1
    invoke-virtual {v1}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->getAppFamilyId()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public getAppVariantId()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 322
    invoke-direct {p0}, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->isAPIKeyValid()Z

    move-result v2

    if-nez v2, :cond_0

    .line 324
    new-instance v2, Lcom/amazon/identity/auth/device/AuthError;

    const-string v3, "APIKey is invalid"

    sget-object v4, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_ACCESS_DENIED:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-direct {v2, v3, v4}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    throw v2

    .line 326
    :cond_0
    sget-object v2, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " calling getAppId"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 327
    new-instance v0, Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;

    invoke-direct {v0}, Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;-><init>()V

    .line 328
    .local v0, "appIdentifier":Lcom/amazon/identity/auth/device/appid/AppIdentifier;
    iget-object v2, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->mContext:Landroid/content/Context;

    invoke-interface {v0, v2, v3}, Lcom/amazon/identity/auth/device/appid/AppIdentifier;->getAppInfo(Ljava/lang/String;Landroid/content/Context;)Lcom/amazon/identity/auth/device/dataobject/AppInfo;

    move-result-object v1

    .line 329
    .local v1, "appInfo":Lcom/amazon/identity/auth/device/dataobject/AppInfo;
    if-nez v1, :cond_1

    .line 331
    const/4 v2, 0x0

    .line 333
    :goto_0
    return-object v2

    :cond_1
    invoke-virtual {v1}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->getAppVariantId()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public getProfile(Lcom/amazon/identity/auth/device/shared/APIListener;)Ljava/util/concurrent/Future;
    .locals 4
    .param p1, "listener"    # Lcom/amazon/identity/auth/device/shared/APIListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/identity/auth/device/shared/APIListener;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Landroid/os/Bundle;",
            ">;"
        }
    .end annotation

    .prologue
    .line 439
    sget-object v1, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->LOG_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " calling getProfile"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 440
    new-instance v0, Lcom/amazon/identity/auth/device/thread/AuthzCallbackFuture;

    invoke-direct {v0, p1}, Lcom/amazon/identity/auth/device/thread/AuthzCallbackFuture;-><init>(Lcom/amazon/identity/auth/device/shared/APIListener;)V

    .line 441
    .local v0, "callbackFuture":Lcom/amazon/identity/auth/device/thread/AuthzCallbackFuture;
    sget-object v1, Lcom/amazon/identity/auth/device/thread/ThreadUtils;->THREAD_POOL:Ljava/util/concurrent/Executor;

    new-instance v2, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$4;

    invoke-direct {v2, p0, v0}, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$4;-><init>(Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;Lcom/amazon/identity/auth/device/thread/AuthzCallbackFuture;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 465
    return-object v0
.end method

.method public getToken([Ljava/lang/String;Lcom/amazon/identity/auth/device/shared/APIListener;)Ljava/util/concurrent/Future;
    .locals 4
    .param p1, "scopes"    # [Ljava/lang/String;
    .param p2, "listener"    # Lcom/amazon/identity/auth/device/shared/APIListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            "Lcom/amazon/identity/auth/device/shared/APIListener;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Landroid/os/Bundle;",
            ">;"
        }
    .end annotation

    .prologue
    .line 249
    if-eqz p1, :cond_0

    array-length v1, p1

    if-nez v1, :cond_1

    .line 250
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "scopes must not be null or empty!"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 252
    :cond_1
    sget-object v1, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->LOG_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " calling getToken : scopes="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 253
    new-instance v0, Lcom/amazon/identity/auth/device/thread/AuthzCallbackFuture;

    invoke-direct {v0, p2}, Lcom/amazon/identity/auth/device/thread/AuthzCallbackFuture;-><init>(Lcom/amazon/identity/auth/device/shared/APIListener;)V

    .line 254
    .local v0, "callbackFuture":Lcom/amazon/identity/auth/device/thread/AuthzCallbackFuture;
    sget-object v1, Lcom/amazon/identity/auth/device/thread/ThreadUtils;->THREAD_POOL:Ljava/util/concurrent/Executor;

    new-instance v2, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$2;

    invoke-direct {v2, p0, v0, p1}, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$2;-><init>(Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;Lcom/amazon/identity/auth/device/thread/AuthzCallbackFuture;[Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 283
    return-object v0
.end method
