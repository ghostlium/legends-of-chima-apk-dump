.class final Lcom/flurry/sdk/bc$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/ads/AdListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/bc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lcom/flurry/sdk/bc;


# direct methods
.method private constructor <init>(Lcom/flurry/sdk/bc;)V
    .locals 0

    .prologue
    .line 75
    iput-object p1, p0, Lcom/flurry/sdk/bc$a;->a:Lcom/flurry/sdk/bc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/flurry/sdk/bc;Lcom/flurry/sdk/bc$1;)V
    .locals 0

    .prologue
    .line 75
    invoke-direct {p0, p1}, Lcom/flurry/sdk/bc$a;-><init>(Lcom/flurry/sdk/bc;)V

    return-void
.end method


# virtual methods
.method public onDismissScreen(Lcom/google/ads/Ad;)V
    .locals 3

    .prologue
    .line 98
    iget-object v0, p0, Lcom/flurry/sdk/bc$a;->a:Lcom/flurry/sdk/bc;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/bc;->c(Ljava/util/Map;)V

    .line 99
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/bc;->f()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Admob Interstitial dismissed from screen."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 100
    return-void
.end method

.method public onFailedToReceiveAd(Lcom/google/ads/Ad;Lcom/google/ads/AdRequest$ErrorCode;)V
    .locals 3

    .prologue
    .line 87
    iget-object v0, p0, Lcom/flurry/sdk/bc$a;->a:Lcom/flurry/sdk/bc;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/bc;->d(Ljava/util/Map;)V

    .line 88
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/bc;->f()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Admob Interstitial failed to receive takeover."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 89
    return-void
.end method

.method public onLeaveApplication(Lcom/google/ads/Ad;)V
    .locals 3

    .prologue
    .line 104
    iget-object v0, p0, Lcom/flurry/sdk/bc$a;->a:Lcom/flurry/sdk/bc;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/bc;->b(Ljava/util/Map;)V

    .line 105
    const/4 v0, 0x4

    invoke-static {}, Lcom/flurry/sdk/bc;->f()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Admob Interstitial leave application."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 106
    return-void
.end method

.method public onPresentScreen(Lcom/google/ads/Ad;)V
    .locals 3

    .prologue
    .line 93
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/bc;->f()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Admob Interstitial present on screen."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 94
    return-void
.end method

.method public onReceiveAd(Lcom/google/ads/Ad;)V
    .locals 3

    .prologue
    .line 78
    iget-object v0, p0, Lcom/flurry/sdk/bc$a;->a:Lcom/flurry/sdk/bc;

    invoke-static {v0}, Lcom/flurry/sdk/bc;->a(Lcom/flurry/sdk/bc;)Lcom/google/ads/InterstitialAd;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 79
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/bc;->f()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Admob Interstitial received takeover."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 80
    iget-object v0, p0, Lcom/flurry/sdk/bc$a;->a:Lcom/flurry/sdk/bc;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/bc;->a(Ljava/util/Map;)V

    .line 81
    iget-object v0, p0, Lcom/flurry/sdk/bc$a;->a:Lcom/flurry/sdk/bc;

    invoke-static {v0}, Lcom/flurry/sdk/bc;->a(Lcom/flurry/sdk/bc;)Lcom/google/ads/InterstitialAd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/ads/InterstitialAd;->show()V

    .line 83
    :cond_0
    return-void
.end method
