.class final Lcom/flurry/android/fn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/ads/AdListener;


# instance fields
.field private synthetic hC:Lcom/flurry/android/dt;


# direct methods
.method synthetic constructor <init>(Lcom/flurry/android/dt;)V
    .locals 1

    .prologue
    .line 50
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/flurry/android/fn;-><init>(Lcom/flurry/android/dt;B)V

    return-void
.end method

.method private constructor <init>(Lcom/flurry/android/dt;B)V
    .locals 0

    .prologue
    .line 50
    iput-object p1, p0, Lcom/flurry/android/fn;->hC:Lcom/flurry/android/dt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onDismissScreen(Lcom/google/ads/Ad;)V
    .locals 2

    .prologue
    .line 74
    iget-object v0, p0, Lcom/flurry/android/fn;->hC:Lcom/flurry/android/dt;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/dt;->onAdClosed(Ljava/util/Map;)V

    .line 75
    invoke-static {}, Lcom/flurry/android/dt;->am()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Admob Interstitial dismissed from screen."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    return-void
.end method

.method public final onFailedToReceiveAd(Lcom/google/ads/Ad;Lcom/google/ads/AdRequest$ErrorCode;)V
    .locals 2

    .prologue
    .line 63
    iget-object v0, p0, Lcom/flurry/android/fn;->hC:Lcom/flurry/android/dt;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/dt;->onRenderFailed(Ljava/util/Map;)V

    .line 64
    invoke-static {}, Lcom/flurry/android/dt;->am()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Admob Interstitial failed to receive takeover."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    return-void
.end method

.method public final onLeaveApplication(Lcom/google/ads/Ad;)V
    .locals 2

    .prologue
    .line 80
    iget-object v0, p0, Lcom/flurry/android/fn;->hC:Lcom/flurry/android/dt;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/dt;->onAdClicked(Ljava/util/Map;)V

    .line 81
    invoke-static {}, Lcom/flurry/android/dt;->am()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Admob Interstitial leave application."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    return-void
.end method

.method public final onPresentScreen(Lcom/google/ads/Ad;)V
    .locals 2

    .prologue
    .line 69
    invoke-static {}, Lcom/flurry/android/dt;->am()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Admob Interstitial present on screen."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    return-void
.end method

.method public final onReceiveAd(Lcom/google/ads/Ad;)V
    .locals 2

    .prologue
    .line 53
    iget-object v0, p0, Lcom/flurry/android/fn;->hC:Lcom/flurry/android/dt;

    invoke-static {v0}, Lcom/flurry/android/dt;->a(Lcom/flurry/android/dt;)Lcom/google/ads/InterstitialAd;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 54
    iget-object v0, p0, Lcom/flurry/android/fn;->hC:Lcom/flurry/android/dt;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/dt;->onAdFilled(Ljava/util/Map;)V

    .line 55
    invoke-static {}, Lcom/flurry/android/dt;->am()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Admob Interstitial received takeover."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    iget-object v0, p0, Lcom/flurry/android/fn;->hC:Lcom/flurry/android/dt;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/dt;->onAdShown(Ljava/util/Map;)V

    .line 57
    iget-object v0, p0, Lcom/flurry/android/fn;->hC:Lcom/flurry/android/dt;

    invoke-static {v0}, Lcom/flurry/android/dt;->a(Lcom/flurry/android/dt;)Lcom/google/ads/InterstitialAd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/ads/InterstitialAd;->show()V

    .line 59
    :cond_0
    return-void
.end method
