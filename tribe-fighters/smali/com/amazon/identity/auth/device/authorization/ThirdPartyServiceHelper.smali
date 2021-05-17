.class public Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;
.super Ljava/lang/Object;
.source "ThirdPartyServiceHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;,
        Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$HighestVersionedService;,
        Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$TOKEN_KEYS;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final AUTHORIZATION_SERVICE_INTENT_ACTION_NAME:Ljava/lang/String; = "com.amazon.identity.auth.device.authorization.MapAuthorizationService"

.field private static final BINDING_ERROR_MESSAGE:Ljava/lang/String; = "Binding to authorization service has timed out!"

.field private static final CONNECTION_TIMEOUT:J = 0xaL

.field static DEVO_FINGERPRINT:Ljava/lang/String; = null

.field private static final HOST_TYPE:Ljava/lang/String; = "host.type"

.field private static final LOG_TAG:Ljava/lang/String;

.field private static PROD_FINGERPRINT:Ljava/lang/String;

.field private static lock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 36
    const-class v0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->$assertionsDisabled:Z

    .line 38
    const-class v0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->LOG_TAG:Ljava/lang/String;

    .line 50
    const-string v0, "2e0b46f8d04a06ac187a2eb0429558fe"

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->DEVO_FINGERPRINT:Ljava/lang/String;

    .line 51
    const-string v0, "97e83c003bded24445aefd4c72dc4b85"

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->PROD_FINGERPRINT:Ljava/lang/String;

    .line 94
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->lock:Ljava/lang/Object;

    return-void

    .line 36
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 98
    return-void
.end method

.method static synthetic access$200()Ljava/lang/String;
    .locals 1

    .prologue
    .line 36
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->LOG_TAG:Ljava/lang/String;

    return-object v0
.end method

.method public static clearCachedService(Landroid/content/Context;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 357
    sget-object v2, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->lock:Ljava/lang/Object;

    monitor-enter v2

    .line 359
    :try_start_0
    sget-object v1, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->LOG_TAG:Ljava/lang/String;

    const-string v3, "Clearing Highest Versioned Service"

    invoke-static {v1, v3}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 360
    invoke-static {}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$HighestVersionedService;->getMAPServiceInfo()Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;

    move-result-object v0

    .line 361
    .local v0, "mapServiceInfo":Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;
    if-eqz v0, :cond_0

    .line 363
    invoke-virtual {v0}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;->getConnection()Lcom/amazon/identity/auth/device/authorization/ThirdPartyAuthorizationServiceConnection;

    move-result-object v1

    invoke-virtual {v0}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;->getServiceIntent()Landroid/content/Intent;

    move-result-object v3

    invoke-static {p0, v1, v3}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->safeUnbind(Landroid/content/Context;Landroid/content/ServiceConnection;Landroid/content/Intent;)V

    .line 364
    const/4 v1, 0x0

    invoke-static {v1}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$HighestVersionedService;->setMAPServiceInfo(Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;)V

    .line 366
    :cond_0
    monitor-exit v2

    .line 367
    return-void

    .line 366
    .end local v0    # "mapServiceInfo":Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static getRemoteAndroidService(Landroid/content/Context;)Lcom/amazon/identity/auth/device/authorization/AmazonAuthorizationServiceInterface;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 469
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;

    invoke-direct {v0}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;-><init>()V

    .line 470
    .local v0, "helper":Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;
    sget-object v1, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->LOG_TAG:Ljava/lang/String;

    const-string v2, "Inside getRemoteAndroidService AsyncTask - Attempting remote service"

    invoke-static {v1, v2}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 471
    invoke-virtual {v0, p0}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->getAuthorizationServiceInstance(Landroid/content/Context;)Landroid/os/IInterface;

    move-result-object v1

    check-cast v1, Lcom/amazon/identity/auth/device/authorization/AmazonAuthorizationServiceInterface;

    return-object v1
.end method

.method static isProduction(Landroid/content/Context;)Z
    .locals 7
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 482
    const/4 v2, 0x0

    .line 483
    .local v2, "value":Z
    if-eqz p0, :cond_0

    .line 485
    sget-object v3, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->LOG_TAG:Ljava/lang/String;

    const-string v4, "Attempting to parse third party info from meta data"

    invoke-static {v3, v4}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 488
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0x80

    invoke-virtual {v3, v4, v5}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 489
    .local v0, "appInfo":Landroid/content/pm/ApplicationInfo;
    iget-object v3, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    if-eqz v3, :cond_0

    .line 491
    iget-object v3, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v4, "host.type"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    if-nez v3, :cond_1

    const/4 v2, 0x1

    .line 499
    .end local v0    # "appInfo":Landroid/content/pm/ApplicationInfo;
    :cond_0
    :goto_0
    return v2

    .line 491
    .restart local v0    # "appInfo":Landroid/content/pm/ApplicationInfo;
    :cond_1
    const/4 v2, 0x0

    goto :goto_0

    .line 494
    .end local v0    # "appInfo":Landroid/content/pm/ApplicationInfo;
    :catch_0
    move-exception v1

    .line 496
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    sget-object v3, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->LOG_TAG:Ljava/lang/String;

    const-string v4, "NameNotFoundException"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "key=host.type  "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method static isSameSignatureFingerprint(Ljava/lang/String;Landroid/content/pm/Signature;)Z
    .locals 7
    .param p0, "fingerprint"    # Ljava/lang/String;
    .param p1, "signature"    # Landroid/content/pm/Signature;

    .prologue
    const/4 v2, 0x0

    .line 227
    :try_start_0
    const-string v3, "X.509"

    invoke-static {v3, p1}, Lcom/amazon/identity/auth/device/appid/APIKeyDecoder;->getSignatureFingerprint(Ljava/lang/String;Landroid/content/pm/Signature;)Ljava/lang/String;

    move-result-object v1

    .line 228
    .local v1, "sigFingerprint":Ljava/lang/String;
    sget-object v3, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->LOG_TAG:Ljava/lang/String;

    const-string v4, "Expected fingerprint"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Fingerprint="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 229
    sget-object v3, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->LOG_TAG:Ljava/lang/String;

    const-string v4, "Extracted fingerprint"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Fingerprint="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 230
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/security/cert/CertificateException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    move-result v2

    .line 239
    .end local v1    # "sigFingerprint":Ljava/lang/String;
    :goto_0
    return v2

    .line 231
    :catch_0
    move-exception v0

    .line 232
    .local v0, "e":Ljava/security/cert/CertificateException;
    sget-object v3, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->LOG_TAG:Ljava/lang/String;

    const-string v4, "CertificateException getting Fingerprint. "

    invoke-virtual {v0}, Ljava/security/cert/CertificateException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 234
    .end local v0    # "e":Ljava/security/cert/CertificateException;
    :catch_1
    move-exception v0

    .line 235
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    sget-object v3, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->LOG_TAG:Ljava/lang/String;

    const-string v4, "NoSuchAlgorithmException getting Fingerprint. "

    invoke-virtual {v0}, Ljava/security/NoSuchAlgorithmException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 237
    .end local v0    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_2
    move-exception v0

    .line 238
    .local v0, "e":Ljava/io/IOException;
    sget-object v3, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->LOG_TAG:Ljava/lang/String;

    const-string v4, "IOException getting Fingerprint. "

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private static safeUnbind(Landroid/content/Context;Landroid/content/ServiceConnection;Landroid/content/Intent;)V
    .locals 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "connection"    # Landroid/content/ServiceConnection;
    .param p2, "serviceIntent"    # Landroid/content/Intent;

    .prologue
    .line 371
    const/4 v1, 0x0

    .line 372
    .local v1, "packageName":Ljava/lang/String;
    if-eqz p2, :cond_0

    .line 374
    invoke-virtual {p2}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v1

    .line 376
    :cond_0
    sget-object v2, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unbinding pkg="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/amazon/identity/auth/device/utils/MAPLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 378
    if-eqz p1, :cond_1

    .line 380
    :try_start_0
    invoke-virtual {p0, p1}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 389
    :cond_1
    :goto_0
    return-void

    .line 383
    :catch_0
    move-exception v0

    .line 387
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    sget-object v2, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->LOG_TAG:Ljava/lang/String;

    const-string v3, "IllegalArgumentException is received during unbinding from %s. Ignored."

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v1, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static unbind(Landroid/content/Context;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 335
    sget-object v2, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->lock:Ljava/lang/Object;

    monitor-enter v2

    .line 337
    :try_start_0
    sget-object v1, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->LOG_TAG:Ljava/lang/String;

    const-string v3, "Unbinding Highest Versioned Service"

    invoke-static {v1, v3}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 338
    invoke-static {}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$HighestVersionedService;->getMAPServiceInfo()Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;

    move-result-object v0

    .line 339
    .local v0, "mapServiceInfo":Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;->getConnection()Lcom/amazon/identity/auth/device/authorization/ThirdPartyAuthorizationServiceConnection;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 341
    invoke-virtual {v0}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;->getConnection()Lcom/amazon/identity/auth/device/authorization/ThirdPartyAuthorizationServiceConnection;

    move-result-object v1

    invoke-virtual {v0}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;->getServiceIntent()Landroid/content/Intent;

    move-result-object v3

    invoke-static {p0, v1, v3}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->safeUnbind(Landroid/content/Context;Landroid/content/ServiceConnection;Landroid/content/Intent;)V

    .line 342
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;->setService(Landroid/os/IInterface;)V

    .line 343
    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;->access$100(Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;Lcom/amazon/identity/auth/device/authorization/ThirdPartyAuthorizationServiceConnection;)V

    .line 344
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;->setServiceIntent(Landroid/content/Intent;)V

    .line 346
    :cond_0
    monitor-exit v2

    .line 347
    return-void

    .line 346
    .end local v0    # "mapServiceInfo":Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method


# virtual methods
.method bindHighestVersionedService(Landroid/content/Context;)Z
    .locals 13
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    const/4 v12, 0x0

    const/4 v10, 0x1

    .line 245
    invoke-static {}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$HighestVersionedService;->isServiceCacheStale()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 246
    const/4 v0, 0x0

    .line 295
    :goto_0
    return v0

    .line 248
    :cond_0
    invoke-static {}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$HighestVersionedService;->getMAPServiceInfo()Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;

    move-result-object v2

    .line 249
    .local v2, "mapServiceInfo":Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;
    invoke-static {v2}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;->access$000(Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;)Landroid/content/pm/ResolveInfo;

    move-result-object v0

    iget-object v8, v0, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    .line 250
    .local v8, "serviceInfo":Landroid/content/pm/ServiceInfo;
    new-instance v6, Landroid/content/ComponentName;

    iget-object v0, v8, Landroid/content/pm/ServiceInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    iget-object v1, v8, Landroid/content/pm/ServiceInfo;->name:Ljava/lang/String;

    invoke-direct {v6, v0, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 251
    .local v6, "componentName":Landroid/content/ComponentName;
    new-instance v4, Landroid/content/Intent;

    invoke-direct {v4}, Landroid/content/Intent;-><init>()V

    .line 252
    .local v4, "serviceIntent":Landroid/content/Intent;
    invoke-virtual {v4, v6}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 253
    new-instance v3, Lcom/amazon/identity/auth/device/authorization/ThirdPartyAuthorizationServiceConnection;

    invoke-direct {v3}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyAuthorizationServiceConnection;-><init>()V

    .line 254
    .local v3, "serviceConnection":Lcom/amazon/identity/auth/device/authorization/ThirdPartyAuthorizationServiceConnection;
    new-instance v5, Ljava/util/concurrent/CountDownLatch;

    invoke-direct {v5, v10}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 255
    .local v5, "latch":Ljava/util/concurrent/CountDownLatch;
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$1;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$1;-><init>(Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;Lcom/amazon/identity/auth/device/authorization/ThirdPartyAuthorizationServiceConnection;Landroid/content/Intent;Ljava/util/concurrent/CountDownLatch;)V

    invoke-virtual {v3, v0}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyAuthorizationServiceConnection;->setServiceListener(Lcom/amazon/identity/auth/device/authorization/AmazonServiceListener;)V

    .line 273
    invoke-virtual {p1, v4, v3, v10}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v9

    .line 274
    .local v9, "success":Z
    if-eqz v9, :cond_1

    .line 277
    :try_start_0
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Awaiting latch"

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 278
    const-wide/16 v0, 0xa

    sget-object v11, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v5, v0, v1, v11}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 279
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Unable to establish bind within timelimit = 10"

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 280
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$HighestVersionedService;->setMAPServiceInfo(Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;)V

    .line 281
    new-instance v0, Lcom/amazon/identity/auth/device/AuthError;

    const-string v1, "Binding to authorization service has timed out!"

    sget-object v10, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_THREAD:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-direct {v0, v1, v10}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    throw v0
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 284
    :catch_0
    move-exception v7

    .line 285
    .local v7, "e":Ljava/lang/InterruptedException;
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->LOG_TAG:Ljava/lang/String;

    const-string v1, "InterruptedException"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "msg+="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v7}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v0, v1, v10}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 286
    invoke-static {v12}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$HighestVersionedService;->setMAPServiceInfo(Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;)V

    .line 287
    new-instance v0, Lcom/amazon/identity/auth/device/AuthError;

    const-string v1, "Binding to authorization service has timed out!"

    sget-object v10, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_THREAD:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-direct {v0, v1, v7, v10}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    throw v0

    .line 292
    .end local v7    # "e":Ljava/lang/InterruptedException;
    :cond_1
    invoke-static {v12}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$HighestVersionedService;->setMAPServiceInfo(Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;)V

    .line 293
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Bind Service "

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v4}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v11

    invoke-virtual {v11}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v11, "unsuccessful"

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    move v0, v10

    .line 295
    goto/16 :goto_0
.end method

.method findAuthorizationService(Ljava/util/List;)Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;",
            ">;)",
            "Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;"
        }
    .end annotation

    .prologue
    .line 307
    .local p1, "mapServiceInfoList":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;>;"
    sget-object v3, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Number of MAP services to compare = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 308
    const/4 v2, 0x0

    .line 310
    .local v2, "serviceResult":Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;

    .line 312
    .local v1, "mapServiceInfo":Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;
    invoke-virtual {v1}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;->isPrimary()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 314
    sget-object v3, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->LOG_TAG:Ljava/lang/String;

    const-string v4, "Returning Primary Service"

    invoke-static {v3, v4}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 326
    .end local v1    # "mapServiceInfo":Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;
    :goto_1
    return-object v1

    .line 317
    .restart local v1    # "mapServiceInfo":Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;
    :cond_1
    if-nez v2, :cond_2

    .line 319
    move-object v2, v1

    goto :goto_0

    .line 321
    :cond_2
    invoke-virtual {v1}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;->getMapVersion()Lcom/amazon/identity/auth/device/utils/MAPVersion;

    move-result-object v3

    invoke-virtual {v2}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;->getMapVersion()Lcom/amazon/identity/auth/device/utils/MAPVersion;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/amazon/identity/auth/device/utils/MAPVersion;->compare(Lcom/amazon/identity/auth/device/utils/MAPVersion;)I

    move-result v3

    if-lez v3, :cond_0

    .line 323
    move-object v2, v1

    goto :goto_0

    .end local v1    # "mapServiceInfo":Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;
    :cond_3
    move-object v1, v2

    .line 326
    goto :goto_1
.end method

.method getAllAuthorizationServices(Landroid/content/Context;Ljava/util/List;)Ljava/util/List;
    .locals 20
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Landroid/content/pm/ResolveInfo;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 157
    .local p2, "intentServices":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 158
    .local v14, "mapServiceInfoList":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;>;"
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .local v13, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/content/pm/ResolveInfo;

    .line 161
    .local v9, "resolveInfo":Landroid/content/pm/ResolveInfo;
    :try_start_0
    sget-object v4, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->LOG_TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Verifying signature for pkg="

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v10, v9, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    iget-object v10, v10, Landroid/content/pm/ServiceInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v10, v10, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    iget-object v6, v9, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    iget-object v6, v6, Landroid/content/pm/ServiceInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v6, v6, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    const/16 v10, 0x40

    invoke-virtual {v4, v6, v10}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v16

    .line 163
    .local v16, "pkgSignatureInfo":Landroid/content/pm/PackageInfo;
    move-object/from16 v0, v16

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    move-object/from16 v17, v0

    .line 164
    .local v17, "signatures":[Landroid/content/pm/Signature;
    move-object/from16 v0, v17

    array-length v4, v0

    const/4 v6, 0x1

    if-ne v4, v6, :cond_1

    .line 167
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->isDevoFingerprint(Landroid/content/Context;[Landroid/content/pm/Signature;)Z

    move-result v4

    if-nez v4, :cond_2

    sget-object v4, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->PROD_FINGERPRINT:Ljava/lang/String;

    const/4 v6, 0x0

    aget-object v6, v17, v6

    invoke-static {v4, v6}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->isSameSignatureFingerprint(Ljava/lang/String;Landroid/content/pm/Signature;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 170
    sget-object v4, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->LOG_TAG:Ljava/lang/String;

    const-string v6, "Security check failure"

    const-string v10, "Signature is incorrect."

    invoke-static {v4, v6, v10}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 210
    .end local v16    # "pkgSignatureInfo":Landroid/content/pm/PackageInfo;
    .end local v17    # "signatures":[Landroid/content/pm/Signature;
    :catch_0
    move-exception v12

    .line 211
    .local v12, "e1":Landroid/content/pm/PackageManager$NameNotFoundException;
    sget-object v4, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->LOG_TAG:Ljava/lang/String;

    const-string v6, "NameNotFoundException."

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "msg="

    move-object/from16 v0, v19

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v12}, Landroid/content/pm/PackageManager$NameNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v4, v6, v10}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 177
    .end local v12    # "e1":Landroid/content/pm/PackageManager$NameNotFoundException;
    .restart local v16    # "pkgSignatureInfo":Landroid/content/pm/PackageInfo;
    .restart local v17    # "signatures":[Landroid/content/pm/Signature;
    :cond_1
    :try_start_1
    sget-object v4, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->LOG_TAG:Ljava/lang/String;

    const-string v6, "Security count failure"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Signature count ("

    move-object/from16 v0, v19

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v19, v0

    move/from16 v0, v19

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v19, ") is incorrect."

    move-object/from16 v0, v19

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v4, v6, v10}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 182
    :cond_2
    new-instance v11, Landroid/content/ComponentName;

    iget-object v4, v9, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    iget-object v4, v4, Landroid/content/pm/ServiceInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v4, v4, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    iget-object v6, v9, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    iget-object v6, v6, Landroid/content/pm/ServiceInfo;->name:Ljava/lang/String;

    invoke-direct {v11, v4, v6}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 183
    .local v11, "componentName":Landroid/content/ComponentName;
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    const/16 v6, 0x80

    invoke-virtual {v4, v11, v6}, Landroid/content/pm/PackageManager;->getServiceInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ServiceInfo;

    move-result-object v4

    iget-object v15, v4, Landroid/content/pm/ServiceInfo;->metaData:Landroid/os/Bundle;

    .line 184
    .local v15, "metaDataBundle":Landroid/os/Bundle;
    if-eqz v15, :cond_0

    .line 186
    const-string v4, "map.primary"

    invoke-virtual {v15, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v8

    .line 187
    .local v8, "isPrimary":Z
    const-string v4, "map.version"

    invoke-virtual {v15, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 188
    .local v18, "version":Ljava/lang/String;
    invoke-static/range {v18 .. v18}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_3

    if-eqz v8, :cond_0

    .line 192
    :cond_3
    if-eqz v8, :cond_5

    sget-object v5, Lcom/amazon/identity/auth/device/utils/MAPVersion;->VERSION_ZERO:Lcom/amazon/identity/auth/device/utils/MAPVersion;

    .line 193
    .local v5, "mapVersion":Lcom/amazon/identity/auth/device/utils/MAPVersion;
    :goto_1
    new-instance v7, Lcom/amazon/identity/auth/device/authorization/ThirdPartyAuthorizationServiceConnection;

    invoke-direct {v7}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyAuthorizationServiceConnection;-><init>()V

    .line 194
    .local v7, "serviceConnection":Lcom/amazon/identity/auth/device/authorization/ThirdPartyAuthorizationServiceConnection;
    new-instance v3, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;

    const/4 v6, 0x0

    new-instance v4, Landroid/content/Intent;

    invoke-direct {v4}, Landroid/content/Intent;-><init>()V

    invoke-virtual {v4, v11}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object v10

    move-object/from16 v4, p0

    invoke-direct/range {v3 .. v10}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;-><init>(Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;Lcom/amazon/identity/auth/device/utils/MAPVersion;Landroid/os/IInterface;Lcom/amazon/identity/auth/device/authorization/ThirdPartyAuthorizationServiceConnection;ZLandroid/content/pm/ResolveInfo;Landroid/content/Intent;)V

    .line 195
    .local v3, "mapServiceInfo":Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;
    if-eqz v8, :cond_6

    .line 198
    invoke-interface {v14}, Ljava/util/List;->clear()V

    .line 199
    invoke-interface {v14, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 216
    .end local v3    # "mapServiceInfo":Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;
    .end local v5    # "mapVersion":Lcom/amazon/identity/auth/device/utils/MAPVersion;
    .end local v7    # "serviceConnection":Lcom/amazon/identity/auth/device/authorization/ThirdPartyAuthorizationServiceConnection;
    .end local v8    # "isPrimary":Z
    .end local v9    # "resolveInfo":Landroid/content/pm/ResolveInfo;
    .end local v11    # "componentName":Landroid/content/ComponentName;
    .end local v15    # "metaDataBundle":Landroid/os/Bundle;
    .end local v16    # "pkgSignatureInfo":Landroid/content/pm/PackageInfo;
    .end local v17    # "signatures":[Landroid/content/pm/Signature;
    .end local v18    # "version":Ljava/lang/String;
    :cond_4
    return-object v14

    .line 192
    .restart local v8    # "isPrimary":Z
    .restart local v9    # "resolveInfo":Landroid/content/pm/ResolveInfo;
    .restart local v11    # "componentName":Landroid/content/ComponentName;
    .restart local v15    # "metaDataBundle":Landroid/os/Bundle;
    .restart local v16    # "pkgSignatureInfo":Landroid/content/pm/PackageInfo;
    .restart local v17    # "signatures":[Landroid/content/pm/Signature;
    .restart local v18    # "version":Ljava/lang/String;
    :cond_5
    new-instance v5, Lcom/amazon/identity/auth/device/utils/MAPVersion;

    move-object/from16 v0, v18

    invoke-direct {v5, v0}, Lcom/amazon/identity/auth/device/utils/MAPVersion;-><init>(Ljava/lang/String;)V

    goto :goto_1

    .line 205
    .restart local v3    # "mapServiceInfo":Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;
    .restart local v5    # "mapVersion":Lcom/amazon/identity/auth/device/utils/MAPVersion;
    .restart local v7    # "serviceConnection":Lcom/amazon/identity/auth/device/authorization/ThirdPartyAuthorizationServiceConnection;
    :cond_6
    invoke-interface {v14, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method

.method public getAuthorizationServiceInstance(Landroid/content/Context;)Landroid/os/IInterface;
    .locals 10
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 115
    sget-boolean v7, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->$assertionsDisabled:Z

    if-nez v7, :cond_0

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v7

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v8

    if-ne v7, v8, :cond_0

    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6}, Ljava/lang/AssertionError;-><init>()V

    throw v6

    .line 116
    :cond_0
    sget-object v7, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->LOG_TAG:Ljava/lang/String;

    const-string v8, "getAuthorizationServiceInstance"

    invoke-static {v7, v8}, Lcom/amazon/identity/auth/device/utils/MAPLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    sget-object v7, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->lock:Ljava/lang/Object;

    monitor-enter v7

    .line 120
    :try_start_0
    invoke-static {}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$HighestVersionedService;->getMAPServiceInfo()Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;

    move-result-object v3

    .line 121
    .local v3, "mapServiceInfo":Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;
    if-eqz v3, :cond_2

    .line 123
    invoke-virtual {v3}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;->getConnection()Lcom/amazon/identity/auth/device/authorization/ThirdPartyAuthorizationServiceConnection;

    move-result-object v8

    invoke-virtual {v3}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;->getServiceIntent()Landroid/content/Intent;

    move-result-object v9

    invoke-static {p1, v8, v9}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->safeUnbind(Landroid/content/Context;Landroid/content/ServiceConnection;Landroid/content/Intent;)V

    .line 124
    invoke-virtual {p0, p1}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->bindHighestVersionedService(Landroid/content/Context;)Z

    move-result v0

    .line 125
    .local v0, "bindSuccessful":Z
    if-eqz v0, :cond_1

    .line 126
    invoke-virtual {v3}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;->getService()Landroid/os/IInterface;

    move-result-object v6

    monitor-exit v7

    .line 152
    .end local v0    # "bindSuccessful":Z
    :goto_0
    return-object v6

    .line 130
    .restart local v0    # "bindSuccessful":Z
    :cond_1
    const/4 v8, 0x0

    invoke-static {v8}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$HighestVersionedService;->setMAPServiceInfo(Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;)V

    .line 133
    .end local v0    # "bindSuccessful":Z
    :cond_2
    monitor-exit v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 135
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    .line 137
    .local v5, "packageManager":Landroid/content/pm/PackageManager;
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 138
    .local v1, "intent":Landroid/content/Intent;
    const-string v7, "com.amazon.identity.auth.device.authorization.MapAuthorizationService"

    invoke-virtual {v1, v7}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 139
    const/4 v7, 0x0

    invoke-virtual {v5, v1, v7}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v2

    .line 140
    .local v2, "intentServices":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    sget-object v7, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->LOG_TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Number of services found : "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 142
    invoke-virtual {p0, p1, v2}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->getAllAuthorizationServices(Landroid/content/Context;Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    .line 144
    .local v4, "mapServiceInfoList":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;>;"
    invoke-virtual {p0, v4}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->findAuthorizationService(Ljava/util/List;)Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;

    move-result-object v7

    invoke-static {v7}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$HighestVersionedService;->setMAPServiceInfo(Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;)V

    .line 145
    invoke-static {}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$HighestVersionedService;->getMAPServiceInfo()Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;

    move-result-object v7

    if-nez v7, :cond_3

    .line 147
    sget-object v7, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->LOG_TAG:Ljava/lang/String;

    const-string v8, "Returning no service to use"

    invoke-static {v7, v8}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 133
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v2    # "intentServices":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    .end local v3    # "mapServiceInfo":Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;
    .end local v4    # "mapServiceInfoList":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;>;"
    .end local v5    # "packageManager":Landroid/content/pm/PackageManager;
    :catchall_0
    move-exception v6

    :try_start_1
    monitor-exit v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v6

    .line 150
    .restart local v1    # "intent":Landroid/content/Intent;
    .restart local v2    # "intentServices":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    .restart local v3    # "mapServiceInfo":Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;
    .restart local v4    # "mapServiceInfoList":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;>;"
    .restart local v5    # "packageManager":Landroid/content/pm/PackageManager;
    :cond_3
    invoke-virtual {p0, p1}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->bindHighestVersionedService(Landroid/content/Context;)Z

    .line 151
    sget-object v6, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->LOG_TAG:Ljava/lang/String;

    const-string v7, "Returning service to use"

    invoke-static {v6, v7}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 152
    invoke-static {}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$HighestVersionedService;->getMAPServiceInfo()Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;

    move-result-object v6

    invoke-virtual {v6}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;->getService()Landroid/os/IInterface;

    move-result-object v6

    goto :goto_0
.end method

.method isDevoFingerprint(Landroid/content/Context;[Landroid/content/pm/Signature;)Z
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "signatures"    # [Landroid/content/pm/Signature;

    .prologue
    const/4 v0, 0x0

    .line 221
    invoke-static {p1}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->isProduction(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->DEVO_FINGERPRINT:Ljava/lang/String;

    aget-object v2, p2, v0

    invoke-static {v1, v2}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->isSameSignatureFingerprint(Ljava/lang/String;Landroid/content/pm/Signature;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method
