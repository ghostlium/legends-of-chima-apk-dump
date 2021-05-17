.class public abstract Lcom/flurry/android/AdNetworkView;
.super Lcom/flurry/sdk/h;
.source "SourceFile"


# instance fields
.field private final a:Lcom/flurry/android/AdCreative;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/flurry/android/AdCreative;)V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 22
    invoke-direct {p0, p1, v0, v0}, Lcom/flurry/sdk/h;-><init>(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;)V

    .line 23
    iput-object p2, p0, Lcom/flurry/android/AdNetworkView;->a:Lcom/flurry/android/AdCreative;

    .line 24
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/AdCreative;)V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0, p1, p2, p3}, Lcom/flurry/sdk/h;-><init>(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;)V

    .line 18
    iput-object p4, p0, Lcom/flurry/android/AdNetworkView;->a:Lcom/flurry/android/AdCreative;

    .line 19
    return-void
.end method


# virtual methods
.method public getAdCreative()Lcom/flurry/android/AdCreative;
    .locals 1

    .prologue
    .line 27
    iget-object v0, p0, Lcom/flurry/android/AdNetworkView;->a:Lcom/flurry/android/AdCreative;

    return-object v0
.end method

.method public onAdClicked(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 43
    const-string v0, "clicked"

    invoke-super {p0, v0, p1}, Lcom/flurry/sdk/h;->onEvent(Ljava/lang/String;Ljava/util/Map;)V

    .line 44
    return-void
.end method

.method public onAdClosed(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 47
    const-string v0, "adClosed"

    invoke-super {p0, v0, p1}, Lcom/flurry/sdk/h;->onEvent(Ljava/lang/String;Ljava/util/Map;)V

    .line 48
    return-void
.end method

.method public onAdFilled(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 31
    const-string v0, "filled"

    invoke-super {p0, v0, p1}, Lcom/flurry/sdk/h;->onEvent(Ljava/lang/String;Ljava/util/Map;)V

    .line 32
    return-void
.end method

.method public onAdShown(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 39
    const-string v0, "rendered"

    invoke-super {p0, v0, p1}, Lcom/flurry/sdk/h;->onEvent(Ljava/lang/String;Ljava/util/Map;)V

    .line 40
    return-void
.end method

.method public onAdUnFilled(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 35
    const-string v0, "unfilled"

    invoke-super {p0, v0, p1}, Lcom/flurry/sdk/h;->onEvent(Ljava/lang/String;Ljava/util/Map;)V

    .line 36
    return-void
.end method

.method public onRenderFailed(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 51
    const-string v0, "renderFailed"

    invoke-super {p0, v0, p1}, Lcom/flurry/sdk/h;->onEvent(Ljava/lang/String;Ljava/util/Map;)V

    .line 52
    return-void
.end method
