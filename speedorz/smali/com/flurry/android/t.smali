.class final Lcom/flurry/android/t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/ads/AdListener;


# instance fields
.field private synthetic ad:Lcom/flurry/android/dr;


# direct methods
.method synthetic constructor <init>(Lcom/flurry/android/dr;)V
    .locals 1

    .prologue
    .line 78
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/flurry/android/t;-><init>(Lcom/flurry/android/dr;B)V

    return-void
.end method

.method private constructor <init>(Lcom/flurry/android/dr;B)V
    .locals 0

    .prologue
    .line 78
    iput-object p1, p0, Lcom/flurry/android/t;->ad:Lcom/flurry/android/dr;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onDismissScreen(Lcom/google/ads/Ad;)V
    .locals 2

    .prologue
    .line 99
    iget-object v0, p0, Lcom/flurry/android/t;->ad:Lcom/flurry/android/dr;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/dr;->onAdClosed(Ljava/util/Map;)V

    .line 100
    invoke-static {}, Lcom/flurry/android/dr;->al()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Admob AdView dismissed from screen."

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    return-void
.end method

.method public final onFailedToReceiveAd(Lcom/google/ads/Ad;Lcom/google/ads/AdRequest$ErrorCode;)V
    .locals 2

    .prologue
    .line 88
    iget-object v0, p0, Lcom/flurry/android/t;->ad:Lcom/flurry/android/dr;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/dr;->onRenderFailed(Ljava/util/Map;)V

    .line 89
    invoke-static {}, Lcom/flurry/android/dr;->al()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Admob AdView failed to receive ad."

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    return-void
.end method

.method public final onLeaveApplication(Lcom/google/ads/Ad;)V
    .locals 2

    .prologue
    .line 105
    iget-object v0, p0, Lcom/flurry/android/t;->ad:Lcom/flurry/android/dr;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/dr;->onAdClicked(Ljava/util/Map;)V

    .line 106
    invoke-static {}, Lcom/flurry/android/dr;->al()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Admob AdView leave application."

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    return-void
.end method

.method public final onPresentScreen(Lcom/google/ads/Ad;)V
    .locals 2

    .prologue
    .line 94
    invoke-static {}, Lcom/flurry/android/dr;->al()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Admob AdView present on screen."

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    return-void
.end method

.method public final onReceiveAd(Lcom/google/ads/Ad;)V
    .locals 2

    .prologue
    .line 81
    iget-object v0, p0, Lcom/flurry/android/t;->ad:Lcom/flurry/android/dr;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/dr;->onAdFilled(Ljava/util/Map;)V

    .line 82
    iget-object v0, p0, Lcom/flurry/android/t;->ad:Lcom/flurry/android/dr;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/dr;->onAdShown(Ljava/util/Map;)V

    .line 83
    invoke-static {}, Lcom/flurry/android/dr;->al()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Admob AdView received ad."

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    return-void
.end method
