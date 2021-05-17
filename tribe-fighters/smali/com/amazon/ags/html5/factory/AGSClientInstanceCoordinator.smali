.class public final Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;
.super Ljava/lang/Object;
.source "AGSClientInstanceCoordinator.java"


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static instance:Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;


# instance fields
.field private currentActivity:Landroid/app/Activity;

.field private features:Ljava/util/EnumSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/EnumSet",
            "<",
            "Lcom/amazon/ags/api/AmazonGamesFeature;",
            ">;"
        }
    .end annotation
.end field

.field private latestAmazonGamesCallback:Lcom/amazon/ags/api/AmazonGamesCallback;

.field private listeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinatorListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 19
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GC_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-class v1, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->TAG:Ljava/lang/String;

    .line 21
    const/4 v0, 0x0

    sput-object v0, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->instance:Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;

    return-void
.end method

.method private constructor <init>(Landroid/app/Activity;Lcom/amazon/ags/api/AmazonGamesCallback;Ljava/util/EnumSet;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "amazonGamesCallback"    # Lcom/amazon/ags/api/AmazonGamesCallback;
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
    .line 54
    .local p3, "features":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/amazon/ags/api/AmazonGamesFeature;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput-object p1, p0, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->currentActivity:Landroid/app/Activity;

    .line 56
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->listeners:Ljava/util/Set;

    .line 57
    iput-object p2, p0, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->latestAmazonGamesCallback:Lcom/amazon/ags/api/AmazonGamesCallback;

    .line 58
    iput-object p3, p0, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->features:Ljava/util/EnumSet;

    .line 59
    return-void
.end method

.method public static declared-synchronized getInstance()Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;
    .locals 3

    .prologue
    .line 47
    const-class v1, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->instance:Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;

    if-nez v0, :cond_0

    .line 48
    sget-object v0, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->TAG:Ljava/lang/String;

    const-string v2, "AGSClientInstanceCoordinator must be initialized before using"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    new-instance v0, Ljava/lang/IllegalAccessError;

    const-string v2, "AGSClientInstanceCoordinator must be initialized before using"

    invoke-direct {v0, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    .line 51
    :cond_0
    :try_start_1
    sget-object v0, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->instance:Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v1

    return-object v0
.end method

.method public static declared-synchronized initialize(Landroid/app/Activity;Lcom/amazon/ags/api/AmazonGamesCallback;Ljava/util/EnumSet;)Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "amazonGamesCallback"    # Lcom/amazon/ags/api/AmazonGamesCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Lcom/amazon/ags/api/AmazonGamesCallback;",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/amazon/ags/api/AmazonGamesFeature;",
            ">;)",
            "Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;"
        }
    .end annotation

    .prologue
    .line 35
    .local p2, "features":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/amazon/ags/api/AmazonGamesFeature;>;"
    const-class v1, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->instance:Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;

    if-eqz v0, :cond_0

    .line 36
    sget-object v0, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->TAG:Ljava/lang/String;

    const-string v2, "AGSClientInstanceCoordinator already initialized."

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    sget-object v0, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->instance:Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;

    invoke-virtual {v0, p0}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->updateActivity(Landroid/app/Activity;)V

    .line 38
    sget-object v0, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->instance:Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;

    invoke-virtual {v0, p1}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->updateCallback(Lcom/amazon/ags/api/AmazonGamesCallback;)V

    .line 39
    sget-object v0, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->instance:Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;

    invoke-virtual {v0, p2}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->updateFeatures(Ljava/util/EnumSet;)V

    .line 43
    :goto_0
    sget-object v0, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->instance:Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 41
    :cond_0
    :try_start_1
    new-instance v0, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;

    invoke-direct {v0, p0, p1, p2}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;-><init>(Landroid/app/Activity;Lcom/amazon/ags/api/AmazonGamesCallback;Ljava/util/EnumSet;)V

    sput-object v0, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->instance:Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 35
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public addAGSClientInstanceCoordinatorListener(Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinatorListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinatorListener;

    .prologue
    .line 73
    iget-object v0, p0, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->listeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 74
    return-void
.end method

.method public getCurrentActivity()Landroid/app/Activity;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->currentActivity:Landroid/app/Activity;

    return-object v0
.end method

.method public getEnabledFeatures()Ljava/util/EnumSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/amazon/ags/api/AmazonGamesFeature;",
            ">;"
        }
    .end annotation

    .prologue
    .line 85
    iget-object v0, p0, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->features:Ljava/util/EnumSet;

    return-object v0
.end method

.method public getLatestCallback()Lcom/amazon/ags/api/AmazonGamesCallback;
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->latestAmazonGamesCallback:Lcom/amazon/ags/api/AmazonGamesCallback;

    return-object v0
.end method

.method public updateActivity(Landroid/app/Activity;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 66
    iput-object p1, p0, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->currentActivity:Landroid/app/Activity;

    .line 67
    iget-object v2, p0, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->listeners:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinatorListener;

    .line 68
    .local v1, "listener":Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinatorListener;
    iget-object v2, p0, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->currentActivity:Landroid/app/Activity;

    invoke-interface {v1, v2}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinatorListener;->notifyCurrentActivityChanged(Landroid/app/Activity;)V

    goto :goto_0

    .line 70
    .end local v1    # "listener":Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinatorListener;
    :cond_0
    return-void
.end method

.method public updateCallback(Lcom/amazon/ags/api/AmazonGamesCallback;)V
    .locals 0
    .param p1, "amazonGamesCallback"    # Lcom/amazon/ags/api/AmazonGamesCallback;

    .prologue
    .line 77
    iput-object p1, p0, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->latestAmazonGamesCallback:Lcom/amazon/ags/api/AmazonGamesCallback;

    .line 78
    return-void
.end method

.method public updateFeatures(Ljava/util/EnumSet;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/amazon/ags/api/AmazonGamesFeature;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 89
    .local p1, "newFeatures":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/amazon/ags/api/AmazonGamesFeature;>;"
    iput-object p1, p0, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->features:Ljava/util/EnumSet;

    .line 90
    return-void
.end method
