.class final Lcom/flurry/android/r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/jumptap/adtag/JtAdViewListener;


# instance fields
.field private synthetic S:Lcom/flurry/android/d;


# direct methods
.method constructor <init>(Lcom/flurry/android/d;)V
    .locals 0

    .prologue
    .line 76
    iput-object p1, p0, Lcom/flurry/android/r;->S:Lcom/flurry/android/d;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAdError(Lcom/jumptap/adtag/JtAdView;II)V
    .locals 2

    .prologue
    .line 104
    invoke-static {}, Lcom/flurry/android/d;->d()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Jumptap AdView error."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    iget-object v0, p0, Lcom/flurry/android/r;->S:Lcom/flurry/android/d;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/d;->onRenderFailed(Ljava/util/Map;)V

    .line 106
    return-void
.end method

.method public final onFocusChange(Lcom/jumptap/adtag/JtAdView;IZ)V
    .locals 2

    .prologue
    .line 99
    invoke-static {}, Lcom/flurry/android/d;->d()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Jumptap AdView focus changed."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    return-void
.end method

.method public final onInterstitialDismissed(Lcom/jumptap/adtag/JtAdView;I)V
    .locals 2

    .prologue
    .line 93
    iget-object v0, p0, Lcom/flurry/android/r;->S:Lcom/flurry/android/d;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/d;->onAdClosed(Ljava/util/Map;)V

    .line 94
    invoke-static {}, Lcom/flurry/android/d;->d()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Jumptap AdView dismissed."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    return-void
.end method

.method public final onNewAd(Lcom/jumptap/adtag/JtAdView;ILjava/lang/String;)V
    .locals 2

    .prologue
    .line 86
    iget-object v0, p0, Lcom/flurry/android/r;->S:Lcom/flurry/android/d;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/d;->onAdFilled(Ljava/util/Map;)V

    .line 87
    iget-object v0, p0, Lcom/flurry/android/r;->S:Lcom/flurry/android/d;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/d;->onAdShown(Ljava/util/Map;)V

    .line 88
    invoke-static {}, Lcom/flurry/android/d;->d()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Jumptap AdView new ad."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    return-void
.end method

.method public final onNoAdFound(Lcom/jumptap/adtag/JtAdView;I)V
    .locals 2

    .prologue
    .line 79
    iget-object v0, p0, Lcom/flurry/android/r;->S:Lcom/flurry/android/d;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/d;->onRenderFailed(Ljava/util/Map;)V

    .line 80
    iget-object v0, p0, Lcom/flurry/android/r;->S:Lcom/flurry/android/d;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/d;->onAdUnFilled(Ljava/util/Map;)V

    .line 81
    invoke-static {}, Lcom/flurry/android/d;->d()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Jumptap AdView no ad found."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    return-void
.end method
