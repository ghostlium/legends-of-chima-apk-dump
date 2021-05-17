.class final Lcom/flurry/android/af;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/mobclix/android/sdk/MobclixFullScreenAdViewListener;


# instance fields
.field private synthetic cb:Lcom/flurry/android/bq;


# direct methods
.method constructor <init>(Lcom/flurry/android/bq;)V
    .locals 0

    .prologue
    .line 30
    iput-object p1, p0, Lcom/flurry/android/af;->cb:Lcom/flurry/android/bq;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final keywords()Ljava/lang/String;
    .locals 2

    .prologue
    .line 57
    invoke-static {}, Lcom/flurry/android/bq;->d()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Mobclix keyword callback."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    const/4 v0, 0x0

    return-object v0
.end method

.method public final onDismissAd(Lcom/mobclix/android/sdk/MobclixFullScreenAdView;)V
    .locals 2

    .prologue
    .line 33
    iget-object v0, p0, Lcom/flurry/android/af;->cb:Lcom/flurry/android/bq;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/bq;->onAdClosed(Ljava/util/Map;)V

    .line 34
    invoke-static {}, Lcom/flurry/android/bq;->d()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Mobclix Interstitial ad dismissed."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    return-void
.end method

.method public final onFailedLoad(Lcom/mobclix/android/sdk/MobclixFullScreenAdView;I)V
    .locals 2

    .prologue
    .line 39
    iget-object v0, p0, Lcom/flurry/android/af;->cb:Lcom/flurry/android/bq;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/bq;->onRenderFailed(Ljava/util/Map;)V

    .line 40
    invoke-static {}, Lcom/flurry/android/bq;->d()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Mobclix Interstitial ad failed to load."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    return-void
.end method

.method public final onFinishLoad(Lcom/mobclix/android/sdk/MobclixFullScreenAdView;)V
    .locals 2

    .prologue
    .line 45
    iget-object v0, p0, Lcom/flurry/android/af;->cb:Lcom/flurry/android/bq;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/bq;->onAdFilled(Ljava/util/Map;)V

    .line 46
    invoke-static {}, Lcom/flurry/android/bq;->d()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Mobclix Interstitial ad successfully loaded."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    return-void
.end method

.method public final onPresentAd(Lcom/mobclix/android/sdk/MobclixFullScreenAdView;)V
    .locals 2

    .prologue
    .line 51
    iget-object v0, p0, Lcom/flurry/android/af;->cb:Lcom/flurry/android/bq;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/bq;->onAdShown(Ljava/util/Map;)V

    .line 52
    invoke-static {}, Lcom/flurry/android/bq;->d()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Mobclix Interstitial ad successfully shown."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    return-void
.end method

.method public final query()Ljava/lang/String;
    .locals 2

    .prologue
    .line 63
    invoke-static {}, Lcom/flurry/android/bq;->d()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Mobclix query callback."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    const/4 v0, 0x0

    return-object v0
.end method
