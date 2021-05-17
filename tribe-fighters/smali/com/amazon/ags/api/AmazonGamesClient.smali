.class public final Lcom/amazon/ags/api/AmazonGamesClient;
.super Ljava/lang/Object;
.source "AmazonGamesClient.java"

# interfaces
.implements Lcom/amazon/ags/api/AmazonGames;


# static fields
.field private static INSTANCE:Lcom/amazon/ags/api/AmazonGamesClient; = null

.field private static final MAX_THREADS:I = 0x2

.field private static final TAG:Ljava/lang/String; = "GameCircleClient"


# instance fields
.field private achievementsClient:Lcom/amazon/ags/client/achievements/AchievementsClientImpl;

.field private contentManager:Lcom/amazon/ags/html5/content/ContentManager;

.field private eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

.field private executorService:Ljava/util/concurrent/ExecutorService;

.field private globalState:Lcom/amazon/ags/html5/util/GlobalState;

.field private initialized:Z

.field private kindleFire:Z

.field private kindleFireSoftkeyBeachballManager:Lcom/amazon/ags/client/KindleFireSoftkeyBeachballManager;

.field private leaderboardsClient:Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;

.field private playerClient:Lcom/amazon/ags/client/player/PlayerClientImpl;

.field private serviceFactory:Lcom/amazon/ags/html5/factory/ServiceFactory;

.field private sessionEventQueue:Lcom/amazon/ags/client/session/SessionEventQueue;

.field private sessionStartTime:Ljava/util/Date;

.field private uiThreadHandler:Landroid/os/Handler;

.field private variationManager:Lcom/amazon/ags/html5/content/GCVariationManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 75
    invoke-static {}, Lcom/amazon/ags/jni/AGSJniHandler;->loadLibrary()V

    .line 79
    const/4 v0, 0x0

    sput-object v0, Lcom/amazon/ags/api/AmazonGamesClient;->INSTANCE:Lcom/amazon/ags/api/AmazonGamesClient;

    return-void
.end method

.method private constructor <init>(Landroid/app/Activity;Lcom/amazon/ags/api/AmazonGamesCallback;Ljava/util/EnumSet;)V
    .locals 2
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "callback"    # Lcom/amazon/ags/api/AmazonGamesCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Lcom/amazon/ags/api/AmazonGamesCallback;",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/amazon/ags/api/AmazonGamesFeature;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p3, "features":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/amazon/ags/api/AmazonGamesFeature;>;"
    const/4 v0, 0x0

    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    iput-boolean v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->initialized:Z

    .line 87
    iput-boolean v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->kindleFire:Z

    .line 107
    new-instance v0, Lcom/amazon/ags/client/session/SessionEventQueue;

    invoke-direct {v0}, Lcom/amazon/ags/client/session/SessionEventQueue;-><init>()V

    iput-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->sessionEventQueue:Lcom/amazon/ags/client/session/SessionEventQueue;

    .line 108
    new-instance v0, Lcom/amazon/ags/html5/content/GCVariationManager;

    invoke-direct {v0}, Lcom/amazon/ags/html5/content/GCVariationManager;-><init>()V

    iput-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->variationManager:Lcom/amazon/ags/html5/content/GCVariationManager;

    .line 110
    invoke-static {p1, p2, p3}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->initialize(Landroid/app/Activity;Lcom/amazon/ags/api/AmazonGamesCallback;Ljava/util/EnumSet;)Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;

    .line 111
    const/4 v0, 0x2

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 112
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->uiThreadHandler:Landroid/os/Handler;

    .line 114
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->initialize(Landroid/content/Context;)Lcom/amazon/ags/client/metrics/EventCollectorClient;

    .line 115
    invoke-static {}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->getInstance()Lcom/amazon/ags/client/metrics/EventCollectorClient;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    .line 117
    new-instance v0, Lcom/amazon/ags/html5/util/GlobalState;

    invoke-direct {v0}, Lcom/amazon/ags/html5/util/GlobalState;-><init>()V

    iput-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->globalState:Lcom/amazon/ags/html5/util/GlobalState;

    .line 119
    new-instance v0, Lcom/amazon/ags/client/achievements/AchievementsClientImpl;

    invoke-direct {v0}, Lcom/amazon/ags/client/achievements/AchievementsClientImpl;-><init>()V

    iput-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->achievementsClient:Lcom/amazon/ags/client/achievements/AchievementsClientImpl;

    .line 120
    new-instance v0, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;

    invoke-direct {v0}, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;-><init>()V

    iput-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->leaderboardsClient:Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;

    .line 121
    new-instance v0, Lcom/amazon/ags/client/player/PlayerClientImpl;

    iget-object v1, p0, Lcom/amazon/ags/api/AmazonGamesClient;->globalState:Lcom/amazon/ags/html5/util/GlobalState;

    invoke-direct {v0, v1}, Lcom/amazon/ags/client/player/PlayerClientImpl;-><init>(Lcom/amazon/ags/html5/util/GlobalState;)V

    iput-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->playerClient:Lcom/amazon/ags/client/player/PlayerClientImpl;

    .line 122
    return-void
.end method

.method static synthetic access$000(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/html5/content/ContentManager;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/ags/api/AmazonGamesClient;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->contentManager:Lcom/amazon/ags/html5/content/ContentManager;

    return-object v0
.end method

.method static synthetic access$002(Lcom/amazon/ags/api/AmazonGamesClient;Lcom/amazon/ags/html5/content/ContentManager;)Lcom/amazon/ags/html5/content/ContentManager;
    .locals 0
    .param p0, "x0"    # Lcom/amazon/ags/api/AmazonGamesClient;
    .param p1, "x1"    # Lcom/amazon/ags/html5/content/ContentManager;

    .prologue
    .line 70
    iput-object p1, p0, Lcom/amazon/ags/api/AmazonGamesClient;->contentManager:Lcom/amazon/ags/html5/content/ContentManager;

    return-object p1
.end method

.method static synthetic access$100(Lcom/amazon/ags/api/AmazonGamesClient;)Ljava/util/concurrent/ExecutorService;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/ags/api/AmazonGamesClient;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->executorService:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method static synthetic access$1000()Lcom/amazon/ags/api/AmazonGamesClient;
    .locals 1

    .prologue
    .line 70
    sget-object v0, Lcom/amazon/ags/api/AmazonGamesClient;->INSTANCE:Lcom/amazon/ags/api/AmazonGamesClient;

    return-object v0
.end method

.method static synthetic access$1102(Lcom/amazon/ags/api/AmazonGamesClient;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/amazon/ags/api/AmazonGamesClient;
    .param p1, "x1"    # Z

    .prologue
    .line 70
    iput-boolean p1, p0, Lcom/amazon/ags/api/AmazonGamesClient;->initialized:Z

    return p1
.end method

.method static synthetic access$1200(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/client/achievements/AchievementsClientImpl;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/ags/api/AmazonGamesClient;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->achievementsClient:Lcom/amazon/ags/client/achievements/AchievementsClientImpl;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/ags/api/AmazonGamesClient;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->leaderboardsClient:Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/client/player/PlayerClientImpl;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/ags/api/AmazonGamesClient;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->playerClient:Lcom/amazon/ags/client/player/PlayerClientImpl;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/amazon/ags/api/AmazonGamesClient;)Z
    .locals 1
    .param p0, "x0"    # Lcom/amazon/ags/api/AmazonGamesClient;

    .prologue
    .line 70
    invoke-direct {p0}, Lcom/amazon/ags/api/AmazonGamesClient;->isKindleFire()Z

    move-result v0

    return v0
.end method

.method static synthetic access$1602(Lcom/amazon/ags/api/AmazonGamesClient;Lcom/amazon/ags/client/KindleFireSoftkeyBeachballManager;)Lcom/amazon/ags/client/KindleFireSoftkeyBeachballManager;
    .locals 0
    .param p0, "x0"    # Lcom/amazon/ags/api/AmazonGamesClient;
    .param p1, "x1"    # Lcom/amazon/ags/client/KindleFireSoftkeyBeachballManager;

    .prologue
    .line 70
    iput-object p1, p0, Lcom/amazon/ags/api/AmazonGamesClient;->kindleFireSoftkeyBeachballManager:Lcom/amazon/ags/client/KindleFireSoftkeyBeachballManager;

    return-object p1
.end method

.method static synthetic access$1700(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/client/session/SessionEventQueue;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/ags/api/AmazonGamesClient;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->sessionEventQueue:Lcom/amazon/ags/client/session/SessionEventQueue;

    return-object v0
.end method

.method static synthetic access$200(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/html5/content/GCVariationManager;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/ags/api/AmazonGamesClient;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->variationManager:Lcom/amazon/ags/html5/content/GCVariationManager;

    return-object v0
.end method

.method static synthetic access$300(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/html5/factory/ServiceFactory;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/ags/api/AmazonGamesClient;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->serviceFactory:Lcom/amazon/ags/html5/factory/ServiceFactory;

    return-object v0
.end method

.method static synthetic access$302(Lcom/amazon/ags/api/AmazonGamesClient;Lcom/amazon/ags/html5/factory/ServiceFactory;)Lcom/amazon/ags/html5/factory/ServiceFactory;
    .locals 0
    .param p0, "x0"    # Lcom/amazon/ags/api/AmazonGamesClient;
    .param p1, "x1"    # Lcom/amazon/ags/html5/factory/ServiceFactory;

    .prologue
    .line 70
    iput-object p1, p0, Lcom/amazon/ags/api/AmazonGamesClient;->serviceFactory:Lcom/amazon/ags/html5/factory/ServiceFactory;

    return-object p1
.end method

.method static synthetic access$400(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/client/metrics/EventCollectorClient;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/ags/api/AmazonGamesClient;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    return-object v0
.end method

.method static synthetic access$500(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/html5/util/GlobalState;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/ags/api/AmazonGamesClient;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->globalState:Lcom/amazon/ags/html5/util/GlobalState;

    return-object v0
.end method

.method static synthetic access$600(Lcom/amazon/ags/api/AmazonGamesClient;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/amazon/ags/api/AmazonGamesClient;
    .param p1, "x1"    # Z

    .prologue
    .line 70
    invoke-direct {p0, p1}, Lcom/amazon/ags/api/AmazonGamesClient;->setKindleFire(Z)V

    return-void
.end method

.method static synthetic access$700(Lcom/amazon/ags/api/AmazonGamesClient;ZLjava/util/Date;)V
    .locals 0
    .param p0, "x0"    # Lcom/amazon/ags/api/AmazonGamesClient;
    .param p1, "x1"    # Z
    .param p2, "x2"    # Ljava/util/Date;

    .prologue
    .line 70
    invoke-direct {p0, p1, p2}, Lcom/amazon/ags/api/AmazonGamesClient;->initializeSession(ZLjava/util/Date;)V

    return-void
.end method

.method static synthetic access$800(Lcom/amazon/ags/api/AmazonGamesClient;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/ags/api/AmazonGamesClient;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->uiThreadHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$900(Lcom/amazon/ags/api/AmazonGamesClient;ZLjava/util/Date;Ljava/util/Date;ZLcom/amazon/ags/api/AmazonGamesStatus;)V
    .locals 0
    .param p0, "x0"    # Lcom/amazon/ags/api/AmazonGamesClient;
    .param p1, "x1"    # Z
    .param p2, "x2"    # Ljava/util/Date;
    .param p3, "x3"    # Ljava/util/Date;
    .param p4, "x4"    # Z
    .param p5, "x5"    # Lcom/amazon/ags/api/AmazonGamesStatus;

    .prologue
    .line 70
    invoke-direct/range {p0 .. p5}, Lcom/amazon/ags/api/AmazonGamesClient;->reportInitializeEvent(ZLjava/util/Date;Ljava/util/Date;ZLcom/amazon/ags/api/AmazonGamesStatus;)V

    return-void
.end method

.method private static generateSignature()[B
    .locals 7

    .prologue
    .line 484
    :try_start_0
    const-class v6, Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    .line 485
    .local v2, "key1":Ljava/lang/String;
    const-class v6, Lcom/amazon/ags/html5/factory/ServiceFactory;

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    .line 486
    .local v3, "key2":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 487
    .local v1, "key":Ljava/lang/String;
    const-string v6, "UTF-8"

    invoke-virtual {v1, v6}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    .line 488
    .local v4, "keyBytes":[B
    const-string v6, "MD5"

    invoke-static {v6}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v5

    .line 490
    .local v5, "md":Ljava/security/MessageDigest;
    invoke-virtual {v5, v4}, Ljava/security/MessageDigest;->digest([B)[B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 492
    .end local v1    # "key":Ljava/lang/String;
    .end local v3    # "key2":Ljava/lang/String;
    .end local v4    # "keyBytes":[B
    .end local v5    # "md":Ljava/security/MessageDigest;
    :goto_0
    return-object v6

    .line 491
    :catch_0
    move-exception v0

    .line 492
    .local v0, "e":Ljava/lang/Exception;
    const/4 v6, 0x0

    goto :goto_0
.end method

.method public static getInstance()Lcom/amazon/ags/api/AmazonGames;
    .locals 3

    .prologue
    .line 394
    sget-object v0, Lcom/amazon/ags/api/AmazonGamesClient;->INSTANCE:Lcom/amazon/ags/api/AmazonGamesClient;

    .line 395
    .local v0, "instance":Lcom/amazon/ags/api/AmazonGames;
    sget-object v1, Lcom/amazon/ags/api/AmazonGamesClient;->INSTANCE:Lcom/amazon/ags/api/AmazonGamesClient;

    if-nez v1, :cond_1

    .line 396
    const-string v1, "GameCircleClient"

    const-string v2, "AmazonGamesClient is not initialized.  Please call AmazonGamesClient.initialize() first."

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 401
    :cond_0
    :goto_0
    return-object v0

    .line 397
    :cond_1
    sget-object v1, Lcom/amazon/ags/api/AmazonGamesClient;->INSTANCE:Lcom/amazon/ags/api/AmazonGamesClient;

    iget-boolean v1, v1, Lcom/amazon/ags/api/AmazonGamesClient;->initialized:Z

    if-nez v1, :cond_0

    .line 398
    const/4 v0, 0x0

    .line 399
    const-string v1, "GameCircleClient"

    const-string v2, "AmazonGamesClient is not ready.  Please wait for the callback before attempting to retrieve the instance."

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static getWhispersyncClient()Lcom/amazon/ags/api/whispersync/WhispersyncClient;
    .locals 1

    .prologue
    .line 409
    invoke-static {}, Lcom/amazon/ags/client/whispersync/WhispersyncClientImpl;->getInstance()Lcom/amazon/ags/client/whispersync/WhispersyncClientImpl;

    move-result-object v0

    return-object v0
.end method

.method public static declared-synchronized initialize(Landroid/app/Activity;Lcom/amazon/ags/api/AmazonGamesCallback;Ljava/util/EnumSet;)V
    .locals 12
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "callback"    # Lcom/amazon/ags/api/AmazonGamesCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Lcom/amazon/ags/api/AmazonGamesCallback;",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/amazon/ags/api/AmazonGamesFeature;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 134
    .local p2, "features":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/amazon/ags/api/AmazonGamesFeature;>;"
    const-class v11, Lcom/amazon/ags/api/AmazonGamesClient;

    monitor-enter v11

    :try_start_0
    new-instance v4, Lcom/amazon/ags/storage/EncryptionStringObfuscator;

    invoke-static {}, Lcom/amazon/ags/api/AmazonGamesClient;->generateSignature()[B

    move-result-object v0

    invoke-direct {v4, v0}, Lcom/amazon/ags/storage/EncryptionStringObfuscator;-><init>([B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 135
    .local v4, "stringObfuscator":Lcom/amazon/ags/storage/StringObfuscator;
    const/4 v6, 0x0

    .line 139
    .local v6, "apiKeyExists":Z
    :try_start_1
    new-instance v7, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;

    const/4 v0, 0x0

    invoke-direct {v7, p0, v0}, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;-><init>(Landroid/content/Context;Landroid/os/Bundle;)V

    .line 140
    .local v7, "authorizationManager":Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;
    invoke-virtual {v7}, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->getAppId()Ljava/lang/String;

    move-result-object v9

    .line 141
    .local v9, "gameId":Ljava/lang/String;
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    .line 142
    const/4 v6, 0x1

    .line 148
    .end local v7    # "authorizationManager":Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;
    .end local v9    # "gameId":Ljava/lang/String;
    :cond_0
    :goto_0
    if-eqz v6, :cond_3

    .line 149
    const/4 v3, 0x0

    .line 151
    .local v3, "reinitialize":Z
    :try_start_2
    sget-object v0, Lcom/amazon/ags/api/AmazonGamesClient;->INSTANCE:Lcom/amazon/ags/api/AmazonGamesClient;

    if-eqz v0, :cond_2

    .line 152
    const-string v0, "GameCircleClient"

    const-string v1, "AmazonGamesClient.initialize() has already been called.  Reinitializing."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 153
    const/4 v3, 0x1

    .line 159
    :goto_1
    sget-object v0, Lcom/amazon/ags/api/AmazonGamesClient;->INSTANCE:Lcom/amazon/ags/api/AmazonGamesClient;

    move-object v1, p1

    move-object v2, p0

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/amazon/ags/api/AmazonGamesClient;->initialize_internal(Lcom/amazon/ags/api/AmazonGamesCallback;Landroid/app/Activity;ZLcom/amazon/ags/storage/StringObfuscator;Ljava/util/EnumSet;)V

    .line 163
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/amazon/ags/api/AmazonGamesClient;->INSTANCE:Lcom/amazon/ags/api/AmazonGamesClient;

    iget-object v1, v1, Lcom/amazon/ags/api/AmazonGamesClient;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    invoke-static {v0, v4, v1}, Lcom/amazon/ags/client/whispersync/WhispersyncClientImpl;->initialize(Landroid/content/Context;Lcom/amazon/ags/storage/StringObfuscator;Lcom/amazon/ags/client/metrics/EventCollectorClient;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 170
    .end local v3    # "reinitialize":Z
    :cond_1
    :goto_2
    monitor-exit v11

    return-void

    .line 144
    :catch_0
    move-exception v8

    .line 145
    .local v8, "e":Ljava/lang/Exception;
    :try_start_3
    const-string v0, "GameCircleClient"

    const-string v1, "Unable to read api key.  GameCircle requires an api key to be included in \'assets/api_key.txt\'.  GameCircle will not initialize."

    invoke-static {v0, v1, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 134
    .end local v4    # "stringObfuscator":Lcom/amazon/ags/storage/StringObfuscator;
    .end local v6    # "apiKeyExists":Z
    .end local v8    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v0

    monitor-exit v11

    throw v0

    .line 155
    .restart local v3    # "reinitialize":Z
    .restart local v4    # "stringObfuscator":Lcom/amazon/ags/storage/StringObfuscator;
    .restart local v6    # "apiKeyExists":Z
    :cond_2
    :try_start_4
    const-string v0, "GameCircleClient"

    const-string v1, "AmazonGamesClient not yet initialized.  Initializing."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    new-instance v0, Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-direct {v0, p0, p1, p2}, Lcom/amazon/ags/api/AmazonGamesClient;-><init>(Landroid/app/Activity;Lcom/amazon/ags/api/AmazonGamesCallback;Ljava/util/EnumSet;)V

    sput-object v0, Lcom/amazon/ags/api/AmazonGamesClient;->INSTANCE:Lcom/amazon/ags/api/AmazonGamesClient;

    goto :goto_1

    .line 165
    .end local v3    # "reinitialize":Z
    :cond_3
    if-eqz p1, :cond_1

    .line 166
    sget-object v10, Lcom/amazon/ags/api/AmazonGamesStatus;->CANNOT_INITIALIZE:Lcom/amazon/ags/api/AmazonGamesStatus;

    .line 167
    .local v10, "status":Lcom/amazon/ags/api/AmazonGamesStatus;
    invoke-interface {p1, v10}, Lcom/amazon/ags/api/AmazonGamesCallback;->onServiceNotReady(Lcom/amazon/ags/api/AmazonGamesStatus;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_2
.end method

.method private initializeSession(ZLjava/util/Date;)V
    .locals 2
    .param p1, "reinitialize"    # Z
    .param p2, "startTime"    # Ljava/util/Date;

    .prologue
    .line 249
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->serviceFactory:Lcom/amazon/ags/html5/factory/ServiceFactory;

    invoke-virtual {v0}, Lcom/amazon/ags/html5/factory/ServiceFactory;->getSessionClient()Lcom/amazon/ags/client/session/SessionClient;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/ags/client/session/SessionClient;->initializeSession()Lcom/amazon/ags/api/AGResponseHandle;

    move-result-object v0

    new-instance v1, Lcom/amazon/ags/api/AmazonGamesClient$2;

    invoke-direct {v1, p0, p1, p2}, Lcom/amazon/ags/api/AmazonGamesClient$2;-><init>(Lcom/amazon/ags/api/AmazonGamesClient;ZLjava/util/Date;)V

    invoke-interface {v0, v1}, Lcom/amazon/ags/api/AGResponseHandle;->setCallback(Lcom/amazon/ags/api/AGResponseCallback;)V

    .line 306
    return-void
.end method

.method private declared-synchronized initialize_internal(Lcom/amazon/ags/api/AmazonGamesCallback;Landroid/app/Activity;ZLcom/amazon/ags/storage/StringObfuscator;Ljava/util/EnumSet;)V
    .locals 8
    .param p1, "amazonGamesCallback"    # Lcom/amazon/ags/api/AmazonGamesCallback;
    .param p2, "activity"    # Landroid/app/Activity;
    .param p3, "reinitialize"    # Z
    .param p4, "stringObfuscator"    # Lcom/amazon/ags/storage/StringObfuscator;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/ags/api/AmazonGamesCallback;",
            "Landroid/app/Activity;",
            "Z",
            "Lcom/amazon/ags/storage/StringObfuscator;",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/amazon/ags/api/AmazonGamesFeature;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 174
    .local p5, "features":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/amazon/ags/api/AmazonGamesFeature;>;"
    monitor-enter p0

    :try_start_0
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    iput-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->sessionStartTime:Ljava/util/Date;

    .line 175
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->sessionEventQueue:Lcom/amazon/ags/client/session/SessionEventQueue;

    new-instance v1, Lcom/amazon/ags/client/session/SessionEvent;

    const-string v3, "START_SESSION"

    invoke-direct {v1, v3}, Lcom/amazon/ags/client/session/SessionEvent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/amazon/ags/client/session/SessionEventQueue;->enqueue(Lcom/amazon/ags/client/session/SessionEvent;)V

    .line 177
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    if-eqz v0, :cond_0

    .line 178
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    invoke-virtual {v0}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->submitEvents()V

    .line 180
    :cond_0
    if-eqz p3, :cond_4

    .line 181
    invoke-static {}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->getInstance()Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->updateActivity(Landroid/app/Activity;)V

    .line 182
    invoke-static {}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->getInstance()Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->updateCallback(Lcom/amazon/ags/api/AmazonGamesCallback;)V

    .line 183
    invoke-static {}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->getInstance()Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;

    move-result-object v0

    invoke-virtual {v0, p5}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->updateFeatures(Ljava/util/EnumSet;)V

    .line 184
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->serviceFactory:Lcom/amazon/ags/html5/factory/ServiceFactory;

    if-eqz v0, :cond_1

    .line 185
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->serviceFactory:Lcom/amazon/ags/html5/factory/ServiceFactory;

    invoke-virtual {v0}, Lcom/amazon/ags/html5/factory/ServiceFactory;->onResume()V

    .line 187
    :cond_1
    invoke-static {}, Lcom/amazon/ags/api/AmazonGamesClient;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 188
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    if-eqz v0, :cond_2

    .line 189
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    invoke-virtual {v0}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->resumeInsightsSession()V

    .line 191
    :cond_2
    invoke-static {}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->getInstance()Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->getLatestCallback()Lcom/amazon/ags/api/AmazonGamesCallback;

    move-result-object v0

    sget-object v1, Lcom/amazon/ags/api/AmazonGamesClient;->INSTANCE:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-interface {v0, v1}, Lcom/amazon/ags/api/AmazonGamesCallback;->onServiceReady(Lcom/amazon/ags/api/AmazonGamesClient;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 245
    :cond_3
    :goto_0
    monitor-exit p0

    return-void

    .line 194
    :cond_4
    :try_start_1
    invoke-virtual {p2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    .line 197
    .local v2, "appContext":Landroid/content/Context;
    iget-object v7, p0, Lcom/amazon/ags/api/AmazonGamesClient;->executorService:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Lcom/amazon/ags/api/AmazonGamesClient$1;

    move-object v1, p0

    move-object v3, p2

    move-object v4, p4

    move v5, p3

    move-object v6, p1

    invoke-direct/range {v0 .. v6}, Lcom/amazon/ags/api/AmazonGamesClient$1;-><init>(Lcom/amazon/ags/api/AmazonGamesClient;Landroid/content/Context;Landroid/app/Activity;Lcom/amazon/ags/storage/StringObfuscator;ZLcom/amazon/ags/api/AmazonGamesCallback;)V

    invoke-interface {v7, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 241
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_3

    .line 242
    invoke-virtual {p2}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    new-instance v1, Lcom/amazon/ags/client/LifecycleCallbacks;

    invoke-direct {v1, p5}, Lcom/amazon/ags/client/LifecycleCallbacks;-><init>(Ljava/util/EnumSet;)V

    invoke-virtual {v0, v1}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 174
    .end local v2    # "appContext":Landroid/content/Context;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public static isInitialized()Z
    .locals 1

    .prologue
    .line 387
    sget-object v0, Lcom/amazon/ags/api/AmazonGamesClient;->INSTANCE:Lcom/amazon/ags/api/AmazonGamesClient;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/amazon/ags/api/AmazonGamesClient;->INSTANCE:Lcom/amazon/ags/api/AmazonGamesClient;

    iget-boolean v0, v0, Lcom/amazon/ags/api/AmazonGamesClient;->initialized:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isKindleFire()Z
    .locals 1

    .prologue
    .line 579
    iget-boolean v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->kindleFire:Z

    return v0
.end method

.method public static declared-synchronized release()V
    .locals 2

    .prologue
    .line 504
    const-class v1, Lcom/amazon/ags/api/AmazonGamesClient;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/amazon/ags/api/AmazonGamesClient;->INSTANCE:Lcom/amazon/ags/api/AmazonGamesClient;

    if-eqz v0, :cond_0

    .line 505
    sget-object v0, Lcom/amazon/ags/api/AmazonGamesClient;->INSTANCE:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-direct {v0}, Lcom/amazon/ags/api/AmazonGamesClient;->release_internal()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 507
    :cond_0
    monitor-exit v1

    return-void

    .line 504
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private declared-synchronized release_internal()V
    .locals 5

    .prologue
    .line 511
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/amazon/ags/api/AmazonGamesClient;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    if-eqz v1, :cond_0

    .line 512
    iget-object v1, p0, Lcom/amazon/ags/api/AmazonGamesClient;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    invoke-virtual {v1}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->pauseInsightsSession()V

    .line 514
    :cond_0
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    .line 515
    .local v0, "sessionEndTime":Ljava/util/Date;
    iget-object v1, p0, Lcom/amazon/ags/api/AmazonGamesClient;->sessionStartTime:Ljava/util/Date;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/amazon/ags/api/AmazonGamesClient;->sessionStartTime:Ljava/util/Date;

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-lez v1, :cond_1

    iget-object v1, p0, Lcom/amazon/ags/api/AmazonGamesClient;->sessionStartTime:Ljava/util/Date;

    invoke-virtual {v0, v1}, Ljava/util/Date;->after(Ljava/util/Date;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 517
    iget-object v1, p0, Lcom/amazon/ags/api/AmazonGamesClient;->sessionStartTime:Ljava/util/Date;

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-direct {p0, v1, v2}, Lcom/amazon/ags/api/AmazonGamesClient;->reportSessionEvent(Ljava/util/Date;Ljava/util/Date;)V

    .line 518
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/amazon/ags/api/AmazonGamesClient;->sessionStartTime:Ljava/util/Date;

    .line 522
    :cond_1
    iget-object v1, p0, Lcom/amazon/ags/api/AmazonGamesClient;->sessionEventQueue:Lcom/amazon/ags/client/session/SessionEventQueue;

    new-instance v2, Lcom/amazon/ags/client/session/SessionEvent;

    const-string v3, "STOP_SESSION"

    invoke-direct {v2, v3}, Lcom/amazon/ags/client/session/SessionEvent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/amazon/ags/client/session/SessionEventQueue;->enqueue(Lcom/amazon/ags/client/session/SessionEvent;)V

    .line 523
    iget-object v1, p0, Lcom/amazon/ags/api/AmazonGamesClient;->serviceFactory:Lcom/amazon/ags/html5/factory/ServiceFactory;

    if-eqz v1, :cond_2

    .line 524
    iget-object v1, p0, Lcom/amazon/ags/api/AmazonGamesClient;->serviceFactory:Lcom/amazon/ags/html5/factory/ServiceFactory;

    invoke-virtual {v1}, Lcom/amazon/ags/html5/factory/ServiceFactory;->onPause()V

    .line 527
    :cond_2
    iget-object v1, p0, Lcom/amazon/ags/api/AmazonGamesClient;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    if-eqz v1, :cond_3

    .line 528
    iget-object v1, p0, Lcom/amazon/ags/api/AmazonGamesClient;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    invoke-virtual {v1}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->submitEvents()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 530
    :cond_3
    monitor-exit p0

    return-void

    .line 511
    .end local v0    # "sessionEndTime":Ljava/util/Date;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method private reportInitializeEvent(ZLjava/util/Date;Ljava/util/Date;ZLcom/amazon/ags/api/AmazonGamesStatus;)V
    .locals 10
    .param p1, "reinitialize"    # Z
    .param p2, "startTime"    # Ljava/util/Date;
    .param p3, "endTime"    # Ljava/util/Date;
    .param p4, "success"    # Z
    .param p5, "status"    # Lcom/amazon/ags/api/AmazonGamesStatus;

    .prologue
    .line 311
    iget-object v5, p0, Lcom/amazon/ags/api/AmazonGamesClient;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    if-nez v5, :cond_0

    .line 312
    const-string v5, "GameCircleClient"

    const-string v6, "Null collector. Cannot report initialization event."

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 347
    :goto_0
    return-void

    .line 315
    :cond_0
    iget-object v5, p0, Lcom/amazon/ags/api/AmazonGamesClient;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    invoke-virtual {v5}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->isReportingEnabled()Z

    move-result v5

    if-nez v5, :cond_1

    .line 316
    const-string v5, "GameCircleClient"

    const-string v6, "Reporting is disabled. Cannot report initialization event."

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 320
    :cond_1
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 321
    .local v0, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 322
    .local v1, "countMetrics":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;"
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 324
    .local v4, "timeMetrics":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Long;>;"
    sget-object v5, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricStringValueAttributesKeys;->STATUS:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricStringValueAttributesKeys;

    invoke-virtual {v5}, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricStringValueAttributesKeys;->name()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p5}, Lcom/amazon/ags/api/AmazonGamesStatus;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 325
    const-string v5, "initializationTime"

    invoke-virtual {p3}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    invoke-virtual {p2}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    sub-long/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 327
    if-eqz p4, :cond_2

    .line 328
    const-string v5, "initializationSuccess"

    const/4 v6, 0x1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v1, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 336
    :goto_1
    if-eqz p1, :cond_3

    .line 337
    :try_start_0
    new-instance v3, Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;

    sget-object v5, Lcom/amazon/ags/constants/metrics/EventNames;->GameCircleReinitialization:Lcom/amazon/ags/constants/metrics/EventNames;

    invoke-virtual {v5}, Lcom/amazon/ags/constants/metrics/EventNames;->name()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5, v0, v1, v4}, Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V
    :try_end_0
    .catch Lcom/amazon/ags/client/metrics/IllegalConstructionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 346
    .local v3, "event":Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
    :goto_2
    iget-object v5, p0, Lcom/amazon/ags/api/AmazonGamesClient;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    invoke-virtual {v5, v3}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->reportGenericEvent(Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;)V

    goto :goto_0

    .line 330
    .end local v3    # "event":Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
    :cond_2
    const-string v5, "initializationFail"

    const/4 v6, 0x1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v1, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 339
    :cond_3
    :try_start_1
    new-instance v3, Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;

    sget-object v5, Lcom/amazon/ags/constants/metrics/EventNames;->GameCircleInitialization:Lcom/amazon/ags/constants/metrics/EventNames;

    invoke-virtual {v5}, Lcom/amazon/ags/constants/metrics/EventNames;->name()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5, v0, v1, v4}, Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V
    :try_end_1
    .catch Lcom/amazon/ags/client/metrics/IllegalConstructionException; {:try_start_1 .. :try_end_1} :catch_0

    .restart local v3    # "event":Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
    goto :goto_2

    .line 341
    .end local v3    # "event":Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
    :catch_0
    move-exception v2

    .line 342
    .local v2, "e":Lcom/amazon/ags/client/metrics/IllegalConstructionException;
    const-string v5, "GameCircleClient"

    const-string v6, "Could not construct GameCircleInitialization event. It will not be reported."

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private reportSessionEvent(Ljava/util/Date;Ljava/util/Date;)V
    .locals 11
    .param p1, "startTime"    # Ljava/util/Date;
    .param p2, "endTime"    # Ljava/util/Date;

    .prologue
    .line 351
    iget-object v7, p0, Lcom/amazon/ags/api/AmazonGamesClient;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    if-nez v7, :cond_0

    .line 352
    const-string v7, "GameCircleClient"

    const-string v8, "Null collector. Cannot report session event."

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 381
    :goto_0
    return-void

    .line 356
    :cond_0
    iget-object v7, p0, Lcom/amazon/ags/api/AmazonGamesClient;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    invoke-virtual {v7}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->isReportingEnabled()Z

    move-result v7

    if-nez v7, :cond_1

    .line 357
    const-string v7, "GameCircleClient"

    const-string v8, "Reporting is disabled. Cannot report session event."

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 361
    :cond_1
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 362
    .local v0, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 363
    .local v1, "countMetrics":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;"
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 365
    .local v6, "timeMetrics":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Long;>;"
    invoke-virtual {p2}, Ljava/util/Date;->getTime()J

    move-result-wide v7

    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v9

    sub-long v4, v7, v9

    .line 368
    .local v4, "sessionLength":J
    sget-object v7, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricStringValueAttributesKeys;->GAME_DATA_SIZE_KB:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricStringValueAttributesKeys;

    invoke-virtual {v7}, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricStringValueAttributesKeys;->name()Ljava/lang/String;

    move-result-object v7

    const-string v8, ""

    invoke-interface {v0, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 369
    sget-object v7, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricStringValueAttributesKeys;->SESSION_LENGTH:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricStringValueAttributesKeys;

    invoke-virtual {v7}, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricStringValueAttributesKeys;->name()Ljava/lang/String;

    move-result-object v7

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v0, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 370
    sget-object v7, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricStringValueAttributesKeys;->SESSION_LENGTH:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricStringValueAttributesKeys;

    invoke-virtual {v7}, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricStringValueAttributesKeys;->name()Ljava/lang/String;

    move-result-object v7

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 374
    :try_start_0
    new-instance v3, Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;

    sget-object v7, Lcom/amazon/ags/constants/metrics/EventNames;->GameSession:Lcom/amazon/ags/constants/metrics/EventNames;

    invoke-virtual {v7}, Lcom/amazon/ags/constants/metrics/EventNames;->name()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v3, v7, v0, v1, v6}, Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V
    :try_end_0
    .catch Lcom/amazon/ags/client/metrics/IllegalConstructionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 380
    .local v3, "event":Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
    iget-object v7, p0, Lcom/amazon/ags/api/AmazonGamesClient;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    invoke-virtual {v7, v3}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->reportGenericEvent(Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;)V

    goto :goto_0

    .line 375
    .end local v3    # "event":Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
    :catch_0
    move-exception v2

    .line 376
    .local v2, "e":Lcom/amazon/ags/client/metrics/IllegalConstructionException;
    const-string v7, "GameCircleClient"

    const-string v8, "Could not construct session event. It will not be reported."

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private setKindleFire(Z)V
    .locals 0
    .param p1, "kindleFire"    # Z

    .prologue
    .line 583
    iput-boolean p1, p0, Lcom/amazon/ags/api/AmazonGamesClient;->kindleFire:Z

    .line 584
    return-void
.end method

.method public static declared-synchronized shutdown()V
    .locals 2

    .prologue
    .line 540
    const-class v1, Lcom/amazon/ags/api/AmazonGamesClient;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/amazon/ags/api/AmazonGamesClient;->INSTANCE:Lcom/amazon/ags/api/AmazonGamesClient;

    if-eqz v0, :cond_0

    .line 541
    sget-object v0, Lcom/amazon/ags/api/AmazonGamesClient;->INSTANCE:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-direct {v0}, Lcom/amazon/ags/api/AmazonGamesClient;->shutdown_internal()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 543
    :cond_0
    monitor-exit v1

    return-void

    .line 540
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private declared-synchronized shutdown_internal()V
    .locals 2

    .prologue
    .line 546
    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/amazon/ags/api/AmazonGamesClient;->INSTANCE:Lcom/amazon/ags/api/AmazonGamesClient;

    if-eqz v0, :cond_1

    .line 547
    sget-object v0, Lcom/amazon/ags/api/AmazonGamesClient;->INSTANCE:Lcom/amazon/ags/api/AmazonGamesClient;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/amazon/ags/api/AmazonGamesClient;->initialized:Z

    .line 548
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->achievementsClient:Lcom/amazon/ags/client/achievements/AchievementsClientImpl;

    invoke-virtual {v0}, Lcom/amazon/ags/client/achievements/AchievementsClientImpl;->shutdown()V

    .line 549
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->leaderboardsClient:Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;

    invoke-virtual {v0}, Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;->shutdown()V

    .line 550
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->playerClient:Lcom/amazon/ags/client/player/PlayerClientImpl;

    invoke-virtual {v0}, Lcom/amazon/ags/client/player/PlayerClientImpl;->shutdown()V

    .line 552
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    if-eqz v0, :cond_0

    .line 553
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    invoke-virtual {v0}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->pauseInsightsSession()V

    .line 554
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    .line 557
    :cond_0
    invoke-direct {p0}, Lcom/amazon/ags/api/AmazonGamesClient;->release_internal()V

    .line 558
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->serviceFactory:Lcom/amazon/ags/html5/factory/ServiceFactory;

    invoke-virtual {v0}, Lcom/amazon/ags/html5/factory/ServiceFactory;->shutdown()V

    .line 559
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->serviceFactory:Lcom/amazon/ags/html5/factory/ServiceFactory;

    .line 561
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->achievementsClient:Lcom/amazon/ags/client/achievements/AchievementsClientImpl;

    .line 562
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->leaderboardsClient:Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;

    .line 563
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->playerClient:Lcom/amazon/ags/client/player/PlayerClientImpl;

    .line 565
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->sessionEventQueue:Lcom/amazon/ags/client/session/SessionEventQueue;

    .line 566
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 567
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->uiThreadHandler:Landroid/os/Handler;

    .line 569
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->sessionStartTime:Ljava/util/Date;

    .line 571
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->contentManager:Lcom/amazon/ags/html5/content/ContentManager;

    invoke-virtual {v0}, Lcom/amazon/ags/html5/content/ContentManager;->shutdown()V

    .line 572
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->contentManager:Lcom/amazon/ags/html5/content/ContentManager;

    .line 575
    :cond_1
    const/4 v0, 0x0

    sput-object v0, Lcom/amazon/ags/api/AmazonGamesClient;->INSTANCE:Lcom/amazon/ags/api/AmazonGamesClient;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 576
    monitor-exit p0

    return-void

    .line 546
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public getAchievementsClient()Lcom/amazon/ags/api/achievements/AchievementsClient;
    .locals 1

    .prologue
    .line 429
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->achievementsClient:Lcom/amazon/ags/client/achievements/AchievementsClientImpl;

    return-object v0
.end method

.method public getLeaderboardsClient()Lcom/amazon/ags/api/leaderboards/LeaderboardsClient;
    .locals 1

    .prologue
    .line 419
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->leaderboardsClient:Lcom/amazon/ags/client/leaderboards/LeaderboardsClientImpl;

    return-object v0
.end method

.method public getPlayerClient()Lcom/amazon/ags/api/player/PlayerClient;
    .locals 1

    .prologue
    .line 439
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient;->playerClient:Lcom/amazon/ags/client/player/PlayerClientImpl;

    return-object v0
.end method

.method public initializeJni()V
    .locals 0

    .prologue
    .line 447
    invoke-static {p0}, Lcom/amazon/ags/jni/AGSJniHandler;->initializeJni(Lcom/amazon/ags/api/AmazonGamesClient;)V

    .line 448
    return-void
.end method

.method public setPopUpLocation(Lcom/amazon/ags/api/overlay/PopUpLocation;)V
    .locals 1
    .param p1, "location"    # Lcom/amazon/ags/api/overlay/PopUpLocation;

    .prologue
    .line 455
    sget-object v0, Lcom/amazon/ags/html5/overlay/PopUpPrefs;->INSTANCE:Lcom/amazon/ags/html5/overlay/PopUpPrefs;

    invoke-virtual {v0, p1}, Lcom/amazon/ags/html5/overlay/PopUpPrefs;->setLocation(Lcom/amazon/ags/api/overlay/PopUpLocation;)V

    .line 456
    return-void
.end method

.method public varargs showGameCircle([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;
    .locals 4
    .param p1, "userData"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            ")",
            "Lcom/amazon/ags/api/AGResponseHandle",
            "<",
            "Lcom/amazon/ags/api/RequestResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 460
    invoke-static {}, Lcom/amazon/ags/api/AmazonGamesClient;->isInitialized()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/amazon/ags/api/AmazonGamesClient;->serviceFactory:Lcom/amazon/ags/html5/factory/ServiceFactory;

    if-eqz v1, :cond_0

    .line 461
    iget-object v1, p0, Lcom/amazon/ags/api/AmazonGamesClient;->serviceFactory:Lcom/amazon/ags/html5/factory/ServiceFactory;

    invoke-virtual {v1}, Lcom/amazon/ags/html5/factory/ServiceFactory;->getOverlayClient()Lcom/amazon/ags/client/OverlayClient;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/amazon/ags/client/OverlayClient;->showGameCircle([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;

    move-result-object v0

    .line 465
    :goto_0
    return-object v0

    .line 463
    :cond_0
    new-instance v0, Lcom/amazon/ags/client/AGResponseHandleImpl;

    invoke-direct {v0, p1}, Lcom/amazon/ags/client/AGResponseHandleImpl;-><init>([Ljava/lang/Object;)V

    .line 464
    .local v0, "handle":Lcom/amazon/ags/client/AGResponseHandleImpl;, "Lcom/amazon/ags/client/AGResponseHandleImpl<Lcom/amazon/ags/api/RequestResponse;>;"
    new-instance v1, Lcom/amazon/ags/client/RequestResponseImpl;

    const/16 v2, 0x18

    sget-object v3, Lcom/amazon/ags/api/ErrorCode;->UNRECOVERABLE:Lcom/amazon/ags/api/ErrorCode;

    invoke-direct {v1, v2, v3}, Lcom/amazon/ags/client/RequestResponseImpl;-><init>(ILcom/amazon/ags/api/ErrorCode;)V

    invoke-virtual {v0, v1}, Lcom/amazon/ags/client/AGResponseHandleImpl;->setResponse(Lcom/amazon/ags/api/RequestResponse;)V

    goto :goto_0
.end method

.method public varargs showSignInPage([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;
    .locals 4
    .param p1, "userData"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            ")",
            "Lcom/amazon/ags/api/AGResponseHandle",
            "<",
            "Lcom/amazon/ags/api/RequestResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 471
    invoke-static {}, Lcom/amazon/ags/api/AmazonGamesClient;->isInitialized()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/amazon/ags/api/AmazonGamesClient;->serviceFactory:Lcom/amazon/ags/html5/factory/ServiceFactory;

    if-eqz v1, :cond_0

    .line 472
    iget-object v1, p0, Lcom/amazon/ags/api/AmazonGamesClient;->serviceFactory:Lcom/amazon/ags/html5/factory/ServiceFactory;

    invoke-virtual {v1}, Lcom/amazon/ags/html5/factory/ServiceFactory;->getOverlayClient()Lcom/amazon/ags/client/OverlayClient;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/amazon/ags/client/OverlayClient;->showSignInPage([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;

    move-result-object v0

    .line 476
    :goto_0
    return-object v0

    .line 474
    :cond_0
    new-instance v0, Lcom/amazon/ags/client/AGResponseHandleImpl;

    invoke-direct {v0, p1}, Lcom/amazon/ags/client/AGResponseHandleImpl;-><init>([Ljava/lang/Object;)V

    .line 475
    .local v0, "handle":Lcom/amazon/ags/client/AGResponseHandleImpl;, "Lcom/amazon/ags/client/AGResponseHandleImpl<Lcom/amazon/ags/api/RequestResponse;>;"
    new-instance v1, Lcom/amazon/ags/client/RequestResponseImpl;

    const/16 v2, 0x18

    sget-object v3, Lcom/amazon/ags/api/ErrorCode;->UNRECOVERABLE:Lcom/amazon/ags/api/ErrorCode;

    invoke-direct {v1, v2, v3}, Lcom/amazon/ags/client/RequestResponseImpl;-><init>(ILcom/amazon/ags/api/ErrorCode;)V

    invoke-virtual {v0, v1}, Lcom/amazon/ags/client/AGResponseHandleImpl;->setResponse(Lcom/amazon/ags/api/RequestResponse;)V

    goto :goto_0
.end method
