.class final Lcom/flurry/android/w;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/jumptap/adtag/JtAdViewListener;


# instance fields
.field private synthetic bj:Lcom/flurry/android/ev;


# direct methods
.method constructor <init>(Lcom/flurry/android/ev;)V
    .locals 0

    .prologue
    .line 66
    iput-object p1, p0, Lcom/flurry/android/w;->bj:Lcom/flurry/android/ev;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAdError(Lcom/jumptap/adtag/JtAdView;II)V
    .locals 2

    .prologue
    .line 94
    invoke-static {}, Lcom/flurry/android/ev;->d()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Jumptap Interstitial error."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    iget-object v0, p0, Lcom/flurry/android/w;->bj:Lcom/flurry/android/ev;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/ev;->onRenderFailed(Ljava/util/Map;)V

    .line 96
    return-void
.end method

.method public final onFocusChange(Lcom/jumptap/adtag/JtAdView;IZ)V
    .locals 2

    .prologue
    .line 89
    invoke-static {}, Lcom/flurry/android/ev;->d()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Jumptap Interstitial focus changed."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    return-void
.end method

.method public final onInterstitialDismissed(Lcom/jumptap/adtag/JtAdView;I)V
    .locals 2

    .prologue
    .line 83
    iget-object v0, p0, Lcom/flurry/android/w;->bj:Lcom/flurry/android/ev;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/ev;->onAdClosed(Ljava/util/Map;)V

    .line 84
    invoke-static {}, Lcom/flurry/android/ev;->d()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Jumptap Interstitial dismissed."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    return-void
.end method

.method public final onNewAd(Lcom/jumptap/adtag/JtAdView;ILjava/lang/String;)V
    .locals 2

    .prologue
    .line 76
    iget-object v0, p0, Lcom/flurry/android/w;->bj:Lcom/flurry/android/ev;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/ev;->onAdFilled(Ljava/util/Map;)V

    .line 77
    iget-object v0, p0, Lcom/flurry/android/w;->bj:Lcom/flurry/android/ev;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/ev;->onAdShown(Ljava/util/Map;)V

    .line 78
    invoke-static {}, Lcom/flurry/android/ev;->d()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Jumptap Interstitial new ad."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    return-void
.end method

.method public final onNoAdFound(Lcom/jumptap/adtag/JtAdView;I)V
    .locals 2

    .prologue
    .line 69
    iget-object v0, p0, Lcom/flurry/android/w;->bj:Lcom/flurry/android/ev;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/ev;->onRenderFailed(Ljava/util/Map;)V

    .line 70
    iget-object v0, p0, Lcom/flurry/android/w;->bj:Lcom/flurry/android/ev;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/ev;->onAdUnFilled(Ljava/util/Map;)V

    .line 71
    invoke-static {}, Lcom/flurry/android/ev;->d()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Jumptap Interstitial no ad found."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    return-void
.end method
