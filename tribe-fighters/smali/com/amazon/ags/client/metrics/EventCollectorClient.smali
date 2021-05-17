.class public Lcom/amazon/ags/client/metrics/EventCollectorClient;
.super Ljava/lang/Object;
.source "EventCollectorClient.java"

# interfaces
.implements Lcom/amazon/ags/html5/util/GlobalState$GlobalStateListener;


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static instance:Lcom/amazon/ags/client/metrics/EventCollectorClient;


# instance fields
.field private authManager:Lcom/amazon/ags/auth/AuthManager;

.field private contentVersion:Lcom/amazon/ags/html5/content/ContentVersion;

.field private deviceInfo:Lcom/amazon/ags/html5/util/DeviceInfo;

.field private eventCollector:Lcom/amazon/ags/client/metrics/EventCollector;

.field private globalState:Lcom/amazon/ags/html5/util/GlobalState;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 29
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GC_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-class v1, Lcom/amazon/ags/client/metrics/EventCollectorClient;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->TAG:Ljava/lang/String;

    .line 37
    const/4 v0, 0x0

    sput-object v0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->instance:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    :try_start_0
    new-instance v1, Lcom/amazon/ags/client/metrics/AmazonInsightsEventCollector;

    invoke-direct {v1, p1}, Lcom/amazon/ags/client/metrics/AmazonInsightsEventCollector;-><init>(Landroid/content/Context;)V

    .line 59
    .local v1, "insightsCollector":Lcom/amazon/ags/client/metrics/AmazonInsightsEventCollector;
    iput-object v1, p0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->eventCollector:Lcom/amazon/ags/client/metrics/EventCollector;
    :try_end_0
    .catch Lcom/amazon/ags/client/metrics/IllegalConstructionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    .end local v1    # "insightsCollector":Lcom/amazon/ags/client/metrics/AmazonInsightsEventCollector;
    :goto_0
    return-void

    .line 60
    :catch_0
    move-exception v0

    .line 61
    .local v0, "e":Lcom/amazon/ags/client/metrics/IllegalConstructionException;
    sget-object v2, Lcom/amazon/ags/client/metrics/EventCollectorClient;->TAG:Ljava/lang/String;

    const-string v3, "Unable to create metrics collector. Reporting events will not work."

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public constructor <init>(Lcom/amazon/ags/client/metrics/EventCollector;Lcom/amazon/ags/html5/util/GlobalState;Lcom/amazon/ags/auth/AuthManager;Lcom/amazon/ags/html5/content/ContentVersion;Lcom/amazon/ags/html5/util/DeviceInfo;)V
    .locals 0
    .param p1, "eventCollector"    # Lcom/amazon/ags/client/metrics/EventCollector;
    .param p2, "globalState"    # Lcom/amazon/ags/html5/util/GlobalState;
    .param p3, "authManager"    # Lcom/amazon/ags/auth/AuthManager;
    .param p4, "contentVersion"    # Lcom/amazon/ags/html5/content/ContentVersion;
    .param p5, "deviceInfo"    # Lcom/amazon/ags/html5/util/DeviceInfo;

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    iput-object p1, p0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->eventCollector:Lcom/amazon/ags/client/metrics/EventCollector;

    .line 68
    iput-object p3, p0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->authManager:Lcom/amazon/ags/auth/AuthManager;

    .line 69
    iput-object p2, p0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->globalState:Lcom/amazon/ags/html5/util/GlobalState;

    .line 70
    iput-object p5, p0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->deviceInfo:Lcom/amazon/ags/html5/util/DeviceInfo;

    .line 71
    iput-object p4, p0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->contentVersion:Lcom/amazon/ags/html5/content/ContentVersion;

    .line 72
    return-void
.end method

.method private addGlobalStateAttributes(Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;)V
    .locals 3
    .param p1, "event"    # Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;

    .prologue
    .line 150
    invoke-virtual {p1}, Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;->getAttributes()Ljava/util/Map;

    move-result-object v0

    .line 152
    .local v0, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v1, p0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->globalState:Lcom/amazon/ags/html5/util/GlobalState;

    if-eqz v1, :cond_0

    .line 153
    iget-object v1, p0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->eventCollector:Lcom/amazon/ags/client/metrics/EventCollector;

    iget-object v2, p0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->globalState:Lcom/amazon/ags/html5/util/GlobalState;

    invoke-virtual {v2}, Lcom/amazon/ags/html5/util/GlobalState;->getPlayerId()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/amazon/ags/client/metrics/EventCollector;->setPlayerId(Ljava/lang/String;)V

    .line 154
    iget-object v1, p0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->eventCollector:Lcom/amazon/ags/client/metrics/EventCollector;

    iget-object v2, p0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->globalState:Lcom/amazon/ags/html5/util/GlobalState;

    invoke-virtual {v2}, Lcom/amazon/ags/html5/util/GlobalState;->isGuestMode()Z

    move-result v2

    invoke-interface {v1, v2}, Lcom/amazon/ags/client/metrics/EventCollector;->setIsGuest(Z)V

    .line 156
    sget-object v1, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->PLAYER_ID:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    invoke-virtual {v1}, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->name()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->globalState:Lcom/amazon/ags/html5/util/GlobalState;

    invoke-virtual {v2}, Lcom/amazon/ags/html5/util/GlobalState;->getPlayerId()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    sget-object v1, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->PLAYING_ANONYMOUSLY:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    invoke-virtual {v1}, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->name()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->globalState:Lcom/amazon/ags/html5/util/GlobalState;

    invoke-virtual {v2}, Lcom/amazon/ags/html5/util/GlobalState;->isGuestMode()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    sget-object v1, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->HIDDEN:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    invoke-virtual {v1}, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->name()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->globalState:Lcom/amazon/ags/html5/util/GlobalState;

    invoke-virtual {v2}, Lcom/amazon/ags/html5/util/GlobalState;->isHidden()Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    sget-object v1, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->COUNTRY_SUPPORT:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    invoke-virtual {v1}, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->name()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->globalState:Lcom/amazon/ags/html5/util/GlobalState;

    invoke-virtual {v2}, Lcom/amazon/ags/html5/util/GlobalState;->getCountrySupport()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    :cond_0
    iget-object v1, p0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->authManager:Lcom/amazon/ags/auth/AuthManager;

    if-eqz v1, :cond_1

    .line 163
    sget-object v1, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->GAME_ID:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    invoke-virtual {v1}, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->name()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->authManager:Lcom/amazon/ags/auth/AuthManager;

    invoke-virtual {v2}, Lcom/amazon/ags/auth/AuthManager;->getGameId()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    :cond_1
    iget-object v1, p0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->contentVersion:Lcom/amazon/ags/html5/content/ContentVersion;

    if-eqz v1, :cond_2

    .line 168
    sget-object v1, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->JAVASCRIPT_VERSION:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    invoke-virtual {v1}, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->name()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->contentVersion:Lcom/amazon/ags/html5/content/ContentVersion;

    invoke-virtual {v2}, Lcom/amazon/ags/html5/content/ContentVersion;->getVersion()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    :cond_2
    iget-object v1, p0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->deviceInfo:Lcom/amazon/ags/html5/util/DeviceInfo;

    if-eqz v1, :cond_3

    .line 172
    sget-object v1, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->PLATFORM:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    invoke-virtual {v1}, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->name()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->deviceInfo:Lcom/amazon/ags/html5/util/DeviceInfo;

    invoke-virtual {v2}, Lcom/amazon/ags/html5/util/DeviceInfo;->getDeviceType()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    :cond_3
    sget-object v1, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->DEVICE_ID:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    invoke-virtual {v1}, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->name()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/amazon/ags/html5/util/DeviceInfo;->getIdentifier()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    sget-object v1, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->DEVICE_MANUFACTURER:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    invoke-virtual {v1}, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->name()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/amazon/ags/html5/util/DeviceInfo;->getManufacturer()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    sget-object v1, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->DEVICE_MODEL:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    invoke-virtual {v1}, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->name()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/amazon/ags/html5/util/DeviceInfo;->getModel()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    sget-object v1, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->NATIVE_VERSION:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    invoke-virtual {v1}, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->name()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/amazon/ags/VersionInfo;->getSDKVersion()Lcom/amazon/ags/VersionInfo;

    move-result-object v2

    invoke-virtual {v2}, Lcom/amazon/ags/VersionInfo;->getVersion()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    return-void
.end method

.method public static declared-synchronized getInstance()Lcom/amazon/ags/client/metrics/EventCollectorClient;
    .locals 3

    .prologue
    .line 49
    const-class v1, Lcom/amazon/ags/client/metrics/EventCollectorClient;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->instance:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    if-nez v0, :cond_0

    .line 50
    sget-object v0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->TAG:Ljava/lang/String;

    const-string v2, "EventCollectorClient must be initialized before using"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    new-instance v0, Ljava/lang/IllegalAccessError;

    const-string v2, "EventCollectorClient must be initialized before using"

    invoke-direct {v0, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    .line 53
    :cond_0
    :try_start_1
    sget-object v0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->instance:Lcom/amazon/ags/client/metrics/EventCollectorClient;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v1

    return-object v0
.end method

.method public static declared-synchronized initialize(Landroid/content/Context;)Lcom/amazon/ags/client/metrics/EventCollectorClient;
    .locals 3
    .param p0, "appContext"    # Landroid/content/Context;

    .prologue
    .line 40
    const-class v1, Lcom/amazon/ags/client/metrics/EventCollectorClient;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->instance:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    if-eqz v0, :cond_0

    .line 41
    sget-object v0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->TAG:Ljava/lang/String;

    const-string v2, "EventCollectorClient already initialized."

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    :goto_0
    sget-object v0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->instance:Lcom/amazon/ags/client/metrics/EventCollectorClient;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 43
    :cond_0
    :try_start_1
    new-instance v0, Lcom/amazon/ags/client/metrics/EventCollectorClient;

    invoke-direct {v0, p0}, Lcom/amazon/ags/client/metrics/EventCollectorClient;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->instance:Lcom/amazon/ags/client/metrics/EventCollectorClient;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 40
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public isReportingEnabled()Z
    .locals 1

    .prologue
    .line 76
    const/4 v0, 0x1

    return v0
.end method

.method public notifyIsGuestModeSet(Z)V
    .locals 1
    .param p1, "isGuestMode"    # Z

    .prologue
    .line 194
    iget-object v0, p0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->eventCollector:Lcom/amazon/ags/client/metrics/EventCollector;

    invoke-interface {v0, p1}, Lcom/amazon/ags/client/metrics/EventCollector;->setIsGuest(Z)V

    .line 195
    return-void
.end method

.method public notifyPlayerIdSet(Ljava/lang/String;)V
    .locals 1
    .param p1, "playerId"    # Ljava/lang/String;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->eventCollector:Lcom/amazon/ags/client/metrics/EventCollector;

    invoke-interface {v0, p1}, Lcom/amazon/ags/client/metrics/EventCollector;->setPlayerId(Ljava/lang/String;)V

    .line 190
    return-void
.end method

.method public notifyStateSet(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 185
    return-void
.end method

.method public pauseInsightsSession()V
    .locals 1

    .prologue
    .line 198
    iget-object v0, p0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->eventCollector:Lcom/amazon/ags/client/metrics/EventCollector;

    invoke-interface {v0}, Lcom/amazon/ags/client/metrics/EventCollector;->pauseInsightsSession()V

    .line 199
    return-void
.end method

.method public reportGenericEvent(Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;)V
    .locals 3
    .param p1, "genericEvent"    # Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;

    .prologue
    .line 89
    iget-object v1, p0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->eventCollector:Lcom/amazon/ags/client/metrics/EventCollector;

    if-nez v1, :cond_1

    .line 90
    sget-object v1, Lcom/amazon/ags/client/metrics/EventCollectorClient;->TAG:Ljava/lang/String;

    const-string v2, "Null Event Collector in Client"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    :cond_0
    :goto_0
    return-void

    .line 95
    :cond_1
    :try_start_0
    invoke-virtual {p0}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->isReportingEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 96
    invoke-direct {p0, p1}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->addGlobalStateAttributes(Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;)V

    .line 97
    iget-object v1, p0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->eventCollector:Lcom/amazon/ags/client/metrics/EventCollector;

    invoke-interface {v1, p1}, Lcom/amazon/ags/client/metrics/EventCollector;->reportGenericEvent(Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 99
    :catch_0
    move-exception v0

    .line 100
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/amazon/ags/client/metrics/EventCollectorClient;->TAG:Ljava/lang/String;

    const-string v2, "Cannot report event."

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public resumeInsightsSession()V
    .locals 1

    .prologue
    .line 202
    iget-object v0, p0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->eventCollector:Lcom/amazon/ags/client/metrics/EventCollector;

    invoke-interface {v0}, Lcom/amazon/ags/client/metrics/EventCollector;->resumeInsightsSession()V

    .line 203
    return-void
.end method

.method public setAuthManager(Lcom/amazon/ags/auth/AuthManager;)V
    .locals 0
    .param p1, "authManager"    # Lcom/amazon/ags/auth/AuthManager;

    .prologue
    .line 132
    if-eqz p1, :cond_0

    .line 133
    iput-object p1, p0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->authManager:Lcom/amazon/ags/auth/AuthManager;

    .line 135
    :cond_0
    return-void
.end method

.method public setContentVersion(Lcom/amazon/ags/html5/content/ContentVersion;)V
    .locals 0
    .param p1, "contentVersion"    # Lcom/amazon/ags/html5/content/ContentVersion;

    .prologue
    .line 138
    if-eqz p1, :cond_0

    .line 139
    iput-object p1, p0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->contentVersion:Lcom/amazon/ags/html5/content/ContentVersion;

    .line 141
    :cond_0
    return-void
.end method

.method public setDeviceInfo(Lcom/amazon/ags/html5/util/DeviceInfo;)V
    .locals 0
    .param p1, "deviceInfo"    # Lcom/amazon/ags/html5/util/DeviceInfo;

    .prologue
    .line 144
    if-eqz p1, :cond_0

    .line 145
    iput-object p1, p0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->deviceInfo:Lcom/amazon/ags/html5/util/DeviceInfo;

    .line 147
    :cond_0
    return-void
.end method

.method public setGlobalState(Lcom/amazon/ags/html5/util/GlobalState;)V
    .locals 2
    .param p1, "globalState"    # Lcom/amazon/ags/html5/util/GlobalState;

    .prologue
    .line 124
    if-eqz p1, :cond_0

    .line 125
    iput-object p1, p0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->globalState:Lcom/amazon/ags/html5/util/GlobalState;

    .line 126
    iget-object v0, p0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->eventCollector:Lcom/amazon/ags/client/metrics/EventCollector;

    invoke-virtual {p1}, Lcom/amazon/ags/html5/util/GlobalState;->getPlayerId()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/amazon/ags/client/metrics/EventCollector;->setPlayerId(Ljava/lang/String;)V

    .line 127
    iget-object v0, p0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->eventCollector:Lcom/amazon/ags/client/metrics/EventCollector;

    invoke-virtual {p1}, Lcom/amazon/ags/html5/util/GlobalState;->isGuestMode()Z

    move-result v1

    invoke-interface {v0, v1}, Lcom/amazon/ags/client/metrics/EventCollector;->setIsGuest(Z)V

    .line 129
    :cond_0
    return-void
.end method

.method public submitEvents()V
    .locals 3

    .prologue
    .line 109
    iget-object v1, p0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->eventCollector:Lcom/amazon/ags/client/metrics/EventCollector;

    if-nez v1, :cond_1

    .line 110
    sget-object v1, Lcom/amazon/ags/client/metrics/EventCollectorClient;->TAG:Ljava/lang/String;

    const-string v2, "Null Event Collector in Client"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    :cond_0
    :goto_0
    return-void

    .line 115
    :cond_1
    :try_start_0
    invoke-virtual {p0}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->isReportingEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 116
    iget-object v1, p0, Lcom/amazon/ags/client/metrics/EventCollectorClient;->eventCollector:Lcom/amazon/ags/client/metrics/EventCollector;

    invoke-interface {v1}, Lcom/amazon/ags/client/metrics/EventCollector;->submitEvents()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 118
    :catch_0
    move-exception v0

    .line 119
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/amazon/ags/client/metrics/EventCollectorClient;->TAG:Ljava/lang/String;

    const-string v2, "Cannot submit events."

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method
