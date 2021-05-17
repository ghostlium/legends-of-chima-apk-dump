.class public Lcom/prime31/ChartboostPlugin;
.super Lcom/prime31/ChartboostPluginBase;
.source "ChartboostPlugin.java"

# interfaces
.implements Lcom/chartboost/sdk/ChartboostDelegate;


# instance fields
.field private _shouldRequestInterstitialsInFirstSession:Z

.field private chartboost:Lcom/chartboost/sdk/Chartboost;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 12
    invoke-direct {p0}, Lcom/prime31/ChartboostPluginBase;-><init>()V

    .line 15
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/prime31/ChartboostPlugin;->_shouldRequestInterstitialsInFirstSession:Z

    .line 12
    return-void
.end method

.method static synthetic access$0(Lcom/prime31/ChartboostPlugin;)Lcom/chartboost/sdk/Chartboost;
    .locals 1

    .prologue
    .line 14
    iget-object v0, p0, Lcom/prime31/ChartboostPlugin;->chartboost:Lcom/chartboost/sdk/Chartboost;

    return-object v0
.end method

.method static synthetic access$1(Lcom/prime31/ChartboostPlugin;Lcom/chartboost/sdk/Chartboost;)V
    .locals 0

    .prologue
    .line 14
    iput-object p1, p0, Lcom/prime31/ChartboostPlugin;->chartboost:Lcom/chartboost/sdk/Chartboost;

    return-void
.end method

.method public static onBackPressed()V
    .locals 2

    .prologue
    .line 68
    invoke-static {}, Lcom/prime31/ChartboostPlugin;->instance()Lcom/prime31/ChartboostPlugin;

    move-result-object v0

    iget-object v0, v0, Lcom/prime31/ChartboostPlugin;->chartboost:Lcom/chartboost/sdk/Chartboost;

    if-eqz v0, :cond_0

    .line 70
    invoke-static {}, Lcom/prime31/ChartboostPlugin;->instance()Lcom/prime31/ChartboostPlugin;

    move-result-object v0

    new-instance v1, Lcom/prime31/ChartboostPlugin$4;

    invoke-direct {v1}, Lcom/prime31/ChartboostPlugin$4;-><init>()V

    invoke-virtual {v0, v1}, Lcom/prime31/ChartboostPlugin;->runSafelyOnUiThread(Ljava/lang/Runnable;)V

    .line 78
    :cond_0
    return-void
.end method

.method public static onDestroy()V
    .locals 2

    .prologue
    .line 38
    invoke-static {}, Lcom/prime31/ChartboostPlugin;->instance()Lcom/prime31/ChartboostPlugin;

    move-result-object v0

    iget-object v0, v0, Lcom/prime31/ChartboostPlugin;->chartboost:Lcom/chartboost/sdk/Chartboost;

    if-eqz v0, :cond_0

    .line 40
    invoke-static {}, Lcom/prime31/ChartboostPlugin;->instance()Lcom/prime31/ChartboostPlugin;

    move-result-object v0

    new-instance v1, Lcom/prime31/ChartboostPlugin$2;

    invoke-direct {v1}, Lcom/prime31/ChartboostPlugin$2;-><init>()V

    invoke-virtual {v0, v1}, Lcom/prime31/ChartboostPlugin;->runSafelyOnUiThread(Ljava/lang/Runnable;)V

    .line 48
    :cond_0
    return-void
.end method

.method public static onStart()V
    .locals 2

    .prologue
    .line 23
    invoke-static {}, Lcom/prime31/ChartboostPlugin;->instance()Lcom/prime31/ChartboostPlugin;

    move-result-object v0

    iget-object v0, v0, Lcom/prime31/ChartboostPlugin;->chartboost:Lcom/chartboost/sdk/Chartboost;

    if-eqz v0, :cond_0

    .line 25
    invoke-static {}, Lcom/prime31/ChartboostPlugin;->instance()Lcom/prime31/ChartboostPlugin;

    move-result-object v0

    new-instance v1, Lcom/prime31/ChartboostPlugin$1;

    invoke-direct {v1}, Lcom/prime31/ChartboostPlugin$1;-><init>()V

    invoke-virtual {v0, v1}, Lcom/prime31/ChartboostPlugin;->runSafelyOnUiThread(Ljava/lang/Runnable;)V

    .line 33
    :cond_0
    return-void
.end method

.method public static onStop()V
    .locals 2

    .prologue
    .line 53
    invoke-static {}, Lcom/prime31/ChartboostPlugin;->instance()Lcom/prime31/ChartboostPlugin;

    move-result-object v0

    iget-object v0, v0, Lcom/prime31/ChartboostPlugin;->chartboost:Lcom/chartboost/sdk/Chartboost;

    if-eqz v0, :cond_0

    .line 55
    invoke-static {}, Lcom/prime31/ChartboostPlugin;->instance()Lcom/prime31/ChartboostPlugin;

    move-result-object v0

    new-instance v1, Lcom/prime31/ChartboostPlugin$3;

    invoke-direct {v1}, Lcom/prime31/ChartboostPlugin$3;-><init>()V

    invoke-virtual {v0, v1}, Lcom/prime31/ChartboostPlugin;->runSafelyOnUiThread(Ljava/lang/Runnable;)V

    .line 63
    :cond_0
    return-void
.end method


# virtual methods
.method public cacheInterstitial(Ljava/lang/String;)V
    .locals 1
    .param p1, "location"    # Ljava/lang/String;

    .prologue
    .line 104
    iget-object v0, p0, Lcom/prime31/ChartboostPlugin;->chartboost:Lcom/chartboost/sdk/Chartboost;

    if-nez v0, :cond_0

    .line 117
    :goto_0
    return-void

    .line 107
    :cond_0
    new-instance v0, Lcom/prime31/ChartboostPlugin$6;

    invoke-direct {v0, p0, p1}, Lcom/prime31/ChartboostPlugin$6;-><init>(Lcom/prime31/ChartboostPlugin;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/prime31/ChartboostPlugin;->runSafelyOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public cacheMoreApps()V
    .locals 1

    .prologue
    .line 152
    iget-object v0, p0, Lcom/prime31/ChartboostPlugin;->chartboost:Lcom/chartboost/sdk/Chartboost;

    if-nez v0, :cond_0

    .line 162
    :goto_0
    return-void

    .line 155
    :cond_0
    new-instance v0, Lcom/prime31/ChartboostPlugin$8;

    invoke-direct {v0, p0}, Lcom/prime31/ChartboostPlugin$8;-><init>(Lcom/prime31/ChartboostPlugin;)V

    invoke-virtual {p0, v0}, Lcom/prime31/ChartboostPlugin;->runSafelyOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public didCacheInterstitial(Ljava/lang/String;)V
    .locals 1
    .param p1, "location"    # Ljava/lang/String;

    .prologue
    .line 224
    const-string v0, "didCacheInterstitial"

    invoke-virtual {p0, v0, p1}, Lcom/prime31/ChartboostPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;)V

    .line 225
    return-void
.end method

.method public didCacheMoreApps()V
    .locals 2

    .prologue
    .line 231
    const-string v0, "didCacheMoreApps"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Lcom/prime31/ChartboostPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;)V

    .line 232
    return-void
.end method

.method public didClickInterstitial(Ljava/lang/String;)V
    .locals 2
    .param p1, "location"    # Ljava/lang/String;

    .prologue
    .line 238
    const-string v0, "didFinishInterstitial"

    const-string v1, "click"

    invoke-virtual {p0, v0, v1}, Lcom/prime31/ChartboostPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;)V

    .line 239
    return-void
.end method

.method public didClickMoreApps()V
    .locals 2

    .prologue
    .line 245
    const-string v0, "didFinishMoreApps"

    const-string v1, "click"

    invoke-virtual {p0, v0, v1}, Lcom/prime31/ChartboostPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;)V

    .line 246
    return-void
.end method

.method public didCloseInterstitial(Ljava/lang/String;)V
    .locals 2
    .param p1, "location"    # Ljava/lang/String;

    .prologue
    .line 252
    const-string v0, "didFinishInterstitial"

    const-string v1, "close"

    invoke-virtual {p0, v0, v1}, Lcom/prime31/ChartboostPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;)V

    .line 253
    return-void
.end method

.method public didCloseMoreApps()V
    .locals 2

    .prologue
    .line 259
    const-string v0, "didCloseMoreApps"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Lcom/prime31/ChartboostPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;)V

    .line 260
    return-void
.end method

.method public didDismissInterstitial(Ljava/lang/String;)V
    .locals 2
    .param p1, "location"    # Ljava/lang/String;

    .prologue
    .line 266
    const-string v0, "didFinishInterstitial"

    const-string v1, "dismiss"

    invoke-virtual {p0, v0, v1}, Lcom/prime31/ChartboostPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;)V

    .line 267
    return-void
.end method

.method public didDismissMoreApps()V
    .locals 2

    .prologue
    .line 273
    const-string v0, "didFinishMoreApps"

    const-string v1, "dismiss"

    invoke-virtual {p0, v0, v1}, Lcom/prime31/ChartboostPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;)V

    .line 274
    return-void
.end method

.method public didFailToLoadInterstitial(Ljava/lang/String;)V
    .locals 1
    .param p1, "location"    # Ljava/lang/String;

    .prologue
    .line 280
    const-string v0, "didFailToLoadInterstitial"

    invoke-virtual {p0, v0, p1}, Lcom/prime31/ChartboostPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;)V

    .line 281
    return-void
.end method

.method public didFailToLoadMoreApps()V
    .locals 2

    .prologue
    .line 217
    const-string v0, "didFailToLoadMoreApps"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Lcom/prime31/ChartboostPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;)V

    .line 218
    return-void
.end method

.method public didShowInterstitial(Ljava/lang/String;)V
    .locals 1
    .param p1, "location"    # Ljava/lang/String;

    .prologue
    .line 287
    const-string v0, "didShowInterstitial"

    invoke-virtual {p0, v0, p1}, Lcom/prime31/ChartboostPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;)V

    .line 288
    return-void
.end method

.method public didShowMoreApps()V
    .locals 2

    .prologue
    .line 294
    const-string v0, "didShowMoreApps"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Lcom/prime31/ChartboostPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    return-void
.end method

.method public hasCachedInterstitial(Ljava/lang/String;)Z
    .locals 1
    .param p1, "location"    # Ljava/lang/String;

    .prologue
    .line 122
    iget-object v0, p0, Lcom/prime31/ChartboostPlugin;->chartboost:Lcom/chartboost/sdk/Chartboost;

    if-nez v0, :cond_0

    .line 123
    const/4 v0, 0x0

    .line 128
    :goto_0
    return v0

    .line 125
    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1

    .line 126
    iget-object v0, p0, Lcom/prime31/ChartboostPlugin;->chartboost:Lcom/chartboost/sdk/Chartboost;

    invoke-virtual {v0, p1}, Lcom/chartboost/sdk/Chartboost;->hasCachedInterstitial(Ljava/lang/String;)Z

    move-result v0

    goto :goto_0

    .line 128
    :cond_1
    iget-object v0, p0, Lcom/prime31/ChartboostPlugin;->chartboost:Lcom/chartboost/sdk/Chartboost;

    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->hasCachedInterstitial()Z

    move-result v0

    goto :goto_0
.end method

.method public hasCachedMoreApps()Z
    .locals 1

    .prologue
    .line 167
    iget-object v0, p0, Lcom/prime31/ChartboostPlugin;->chartboost:Lcom/chartboost/sdk/Chartboost;

    if-nez v0, :cond_0

    .line 168
    const/4 v0, 0x0

    .line 170
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/prime31/ChartboostPlugin;->chartboost:Lcom/chartboost/sdk/Chartboost;

    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->hasCachedMoreApps()Z

    move-result v0

    goto :goto_0
.end method

.method public init(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 1
    .param p1, "appId"    # Ljava/lang/String;
    .param p2, "appSignature"    # Ljava/lang/String;
    .param p3, "shouldRequestInterstitialsInFirstSession"    # Z

    .prologue
    .line 86
    iput-boolean p3, p0, Lcom/prime31/ChartboostPlugin;->_shouldRequestInterstitialsInFirstSession:Z

    .line 88
    new-instance v0, Lcom/prime31/ChartboostPlugin$5;

    invoke-direct {v0, p0, p1, p2}, Lcom/prime31/ChartboostPlugin$5;-><init>(Lcom/prime31/ChartboostPlugin;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/prime31/ChartboostPlugin;->runSafelyOnUiThread(Ljava/lang/Runnable;)V

    .line 99
    return-void
.end method

.method public shouldDisplayInterstitial(Ljava/lang/String;)Z
    .locals 1
    .param p1, "location"    # Ljava/lang/String;

    .prologue
    .line 301
    const-string v0, "didShowInterstitial"

    invoke-virtual {p0, v0, p1}, Lcom/prime31/ChartboostPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;)V

    .line 303
    const/4 v0, 0x1

    return v0
.end method

.method public shouldDisplayLoadingViewForMoreApps()Z
    .locals 1

    .prologue
    .line 310
    const/4 v0, 0x1

    return v0
.end method

.method public shouldDisplayMoreApps()Z
    .locals 1

    .prologue
    .line 317
    const/4 v0, 0x1

    return v0
.end method

.method public shouldRequestInterstitial(Ljava/lang/String;)Z
    .locals 1
    .param p1, "location"    # Ljava/lang/String;

    .prologue
    .line 324
    const/4 v0, 0x1

    return v0
.end method

.method public shouldRequestInterstitialsInFirstSession()Z
    .locals 1

    .prologue
    .line 331
    iget-boolean v0, p0, Lcom/prime31/ChartboostPlugin;->_shouldRequestInterstitialsInFirstSession:Z

    return v0
.end method

.method public shouldRequestMoreApps()Z
    .locals 1

    .prologue
    .line 338
    const/4 v0, 0x1

    return v0
.end method

.method public showInterstitial(Ljava/lang/String;)V
    .locals 1
    .param p1, "location"    # Ljava/lang/String;

    .prologue
    .line 134
    iget-object v0, p0, Lcom/prime31/ChartboostPlugin;->chartboost:Lcom/chartboost/sdk/Chartboost;

    if-nez v0, :cond_0

    .line 147
    :goto_0
    return-void

    .line 137
    :cond_0
    new-instance v0, Lcom/prime31/ChartboostPlugin$7;

    invoke-direct {v0, p0, p1}, Lcom/prime31/ChartboostPlugin$7;-><init>(Lcom/prime31/ChartboostPlugin;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/prime31/ChartboostPlugin;->runSafelyOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public showMoreApps()V
    .locals 1

    .prologue
    .line 176
    iget-object v0, p0, Lcom/prime31/ChartboostPlugin;->chartboost:Lcom/chartboost/sdk/Chartboost;

    if-nez v0, :cond_0

    .line 186
    :goto_0
    return-void

    .line 179
    :cond_0
    new-instance v0, Lcom/prime31/ChartboostPlugin$9;

    invoke-direct {v0, p0}, Lcom/prime31/ChartboostPlugin$9;-><init>(Lcom/prime31/ChartboostPlugin;)V

    invoke-virtual {p0, v0}, Lcom/prime31/ChartboostPlugin;->runSafelyOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public trackEvent(Ljava/lang/String;DLjava/lang/String;)V
    .locals 6
    .param p1, "eventIdentifier"    # Ljava/lang/String;
    .param p2, "value"    # D
    .param p4, "jsonMetaData"    # Ljava/lang/String;

    .prologue
    .line 191
    if-eqz p4, :cond_0

    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p0, p4}, Lcom/prime31/ChartboostPlugin;->fromJSON(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v5

    .line 193
    .local v5, "meta":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_0
    new-instance v0, Lcom/prime31/ChartboostPlugin$10;

    move-object v1, p0

    move-object v2, p1

    move-wide v3, p2

    invoke-direct/range {v0 .. v5}, Lcom/prime31/ChartboostPlugin$10;-><init>(Lcom/prime31/ChartboostPlugin;Ljava/lang/String;DLjava/util/HashMap;)V

    invoke-virtual {p0, v0}, Lcom/prime31/ChartboostPlugin;->runSafelyOnUiThread(Ljava/lang/Runnable;)V

    .line 207
    return-void

    .line 191
    .end local v5    # "meta":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_0
    const/4 v5, 0x0

    goto :goto_0
.end method
