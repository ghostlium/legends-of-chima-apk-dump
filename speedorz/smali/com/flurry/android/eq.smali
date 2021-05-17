.class final Lcom/flurry/android/eq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/millennialmedia/android/MMAdView$MMAdListener;


# instance fields
.field private synthetic gG:Lcom/flurry/android/er;


# direct methods
.method constructor <init>(Lcom/flurry/android/er;)V
    .locals 0

    .prologue
    .line 68
    iput-object p1, p0, Lcom/flurry/android/eq;->gG:Lcom/flurry/android/er;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final MMAdCachingCompleted(Lcom/millennialmedia/android/MMAdView;Z)V
    .locals 2

    .prologue
    .line 112
    invoke-static {}, Lcom/flurry/android/er;->d()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Millennial MMAdView banner caching completed."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    return-void
.end method

.method public final MMAdClickedToOverlay(Lcom/millennialmedia/android/MMAdView;)V
    .locals 2

    .prologue
    .line 93
    iget-object v0, p0, Lcom/flurry/android/eq;->gG:Lcom/flurry/android/er;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/er;->onAdClicked(Ljava/util/Map;)V

    .line 94
    invoke-static {}, Lcom/flurry/android/er;->d()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Millennial MMAdView clicked to overlay."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    return-void
.end method

.method public final MMAdFailed(Lcom/millennialmedia/android/MMAdView;)V
    .locals 2

    .prologue
    .line 72
    iget-object v0, p0, Lcom/flurry/android/eq;->gG:Lcom/flurry/android/er;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/er;->onRenderFailed(Ljava/util/Map;)V

    .line 73
    invoke-static {}, Lcom/flurry/android/er;->d()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Millennial MMAdView failed to load ad."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    return-void
.end method

.method public final MMAdOverlayLaunched(Lcom/millennialmedia/android/MMAdView;)V
    .locals 2

    .prologue
    .line 100
    invoke-static {}, Lcom/flurry/android/er;->d()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Millennial MMAdView banner overlay launched."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    return-void
.end method

.method public final MMAdRequestIsCaching(Lcom/millennialmedia/android/MMAdView;)V
    .locals 2

    .prologue
    .line 106
    invoke-static {}, Lcom/flurry/android/er;->d()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Millennial MMAdView banner request is caching."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    return-void
.end method

.method public final MMAdReturned(Lcom/millennialmedia/android/MMAdView;)V
    .locals 4

    .prologue
    .line 79
    iget-object v0, p0, Lcom/flurry/android/eq;->gG:Lcom/flurry/android/er;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/er;->onAdFilled(Ljava/util/Map;)V

    .line 80
    iget-object v0, p0, Lcom/flurry/android/eq;->gG:Lcom/flurry/android/er;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/er;->onAdShown(Ljava/util/Map;)V

    .line 81
    invoke-static {}, Lcom/flurry/android/er;->d()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Millennial MMAdView returned ad."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    return-void
.end method
