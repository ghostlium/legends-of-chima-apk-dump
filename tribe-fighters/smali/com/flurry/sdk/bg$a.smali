.class final Lcom/flurry/sdk/bg$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/inmobi/androidsdk/IMAdInterstitialListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/bg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lcom/flurry/sdk/bg;


# direct methods
.method private constructor <init>(Lcom/flurry/sdk/bg;)V
    .locals 0

    .prologue
    .line 94
    iput-object p1, p0, Lcom/flurry/sdk/bg$a;->a:Lcom/flurry/sdk/bg;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/flurry/sdk/bg;Lcom/flurry/sdk/bg$1;)V
    .locals 0

    .prologue
    .line 94
    invoke-direct {p0, p1}, Lcom/flurry/sdk/bg$a;-><init>(Lcom/flurry/sdk/bg;)V

    return-void
.end method


# virtual methods
.method public onAdRequestFailed(Lcom/inmobi/androidsdk/IMAdInterstitial;Lcom/inmobi/androidsdk/IMAdRequest$ErrorCode;)V
    .locals 3

    .prologue
    .line 98
    iget-object v0, p0, Lcom/flurry/sdk/bg$a;->a:Lcom/flurry/sdk/bg;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/bg;->d(Ljava/util/Map;)V

    .line 99
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/bg;->f()Ljava/lang/String;

    move-result-object v1

    const-string v2, "InMobi imAdView ad request failed."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 100
    return-void
.end method

.method public onAdRequestLoaded(Lcom/inmobi/androidsdk/IMAdInterstitial;)V
    .locals 3

    .prologue
    .line 104
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/bg;->f()Ljava/lang/String;

    move-result-object v1

    const-string v2, "InMobi Interstitial ad request completed."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 105
    sget-object v0, Lcom/inmobi/androidsdk/IMAdInterstitial$State;->READY:Lcom/inmobi/androidsdk/IMAdInterstitial$State;

    invoke-virtual {p1}, Lcom/inmobi/androidsdk/IMAdInterstitial;->getState()Lcom/inmobi/androidsdk/IMAdInterstitial$State;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/inmobi/androidsdk/IMAdInterstitial$State;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 106
    iget-object v0, p0, Lcom/flurry/sdk/bg$a;->a:Lcom/flurry/sdk/bg;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/bg;->a(Ljava/util/Map;)V

    .line 107
    invoke-virtual {p1}, Lcom/inmobi/androidsdk/IMAdInterstitial;->show()V

    .line 109
    :cond_0
    return-void
.end method

.method public onDismissAdScreen(Lcom/inmobi/androidsdk/IMAdInterstitial;)V
    .locals 3

    .prologue
    .line 113
    iget-object v0, p0, Lcom/flurry/sdk/bg$a;->a:Lcom/flurry/sdk/bg;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/bg;->c(Ljava/util/Map;)V

    .line 114
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/bg;->f()Ljava/lang/String;

    move-result-object v1

    const-string v2, "InMobi Interstitial ad dismissed."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 115
    return-void
.end method

.method public onLeaveApplication(Lcom/inmobi/androidsdk/IMAdInterstitial;)V
    .locals 3

    .prologue
    .line 124
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/bg;->f()Ljava/lang/String;

    move-result-object v1

    const-string v2, "InMobi onLeaveApplication"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 125
    return-void
.end method

.method public onShowAdScreen(Lcom/inmobi/androidsdk/IMAdInterstitial;)V
    .locals 3

    .prologue
    .line 119
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/bg;->f()Ljava/lang/String;

    move-result-object v1

    const-string v2, "InMobi Interstitial ad shown."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 120
    return-void
.end method
