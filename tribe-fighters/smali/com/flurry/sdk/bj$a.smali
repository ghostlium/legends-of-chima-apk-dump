.class final Lcom/flurry/sdk/bj$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/jumptap/adtag/JtAdViewListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/bj;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lcom/flurry/sdk/bj;


# direct methods
.method private constructor <init>(Lcom/flurry/sdk/bj;)V
    .locals 0

    .prologue
    .line 95
    iput-object p1, p0, Lcom/flurry/sdk/bj$a;->a:Lcom/flurry/sdk/bj;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/flurry/sdk/bj;Lcom/flurry/sdk/bj$1;)V
    .locals 0

    .prologue
    .line 95
    invoke-direct {p0, p1}, Lcom/flurry/sdk/bj$a;-><init>(Lcom/flurry/sdk/bj;)V

    return-void
.end method


# virtual methods
.method public onAdError(Lcom/jumptap/adtag/JtAdView;II)V
    .locals 3

    .prologue
    .line 121
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/bj;->f()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Jumptap Interstitial error."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 122
    iget-object v0, p0, Lcom/flurry/sdk/bj$a;->a:Lcom/flurry/sdk/bj;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/bj;->d(Ljava/util/Map;)V

    .line 123
    return-void
.end method

.method public onFocusChange(Lcom/jumptap/adtag/JtAdView;IZ)V
    .locals 3

    .prologue
    .line 116
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/bj;->f()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Jumptap Interstitial focus changed."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 117
    return-void
.end method

.method public onInterstitialDismissed(Lcom/jumptap/adtag/JtAdView;I)V
    .locals 3

    .prologue
    .line 110
    iget-object v0, p0, Lcom/flurry/sdk/bj$a;->a:Lcom/flurry/sdk/bj;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/bj;->c(Ljava/util/Map;)V

    .line 111
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/bj;->f()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Jumptap Interstitial dismissed."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 112
    return-void
.end method

.method public onNewAd(Lcom/jumptap/adtag/JtAdView;ILjava/lang/String;)V
    .locals 3

    .prologue
    .line 104
    iget-object v0, p0, Lcom/flurry/sdk/bj$a;->a:Lcom/flurry/sdk/bj;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/bj;->a(Ljava/util/Map;)V

    .line 105
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/bj;->f()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Jumptap Interstitial new ad."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 106
    return-void
.end method

.method public onNoAdFound(Lcom/jumptap/adtag/JtAdView;I)V
    .locals 3

    .prologue
    .line 98
    iget-object v0, p0, Lcom/flurry/sdk/bj$a;->a:Lcom/flurry/sdk/bj;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/bj;->d(Ljava/util/Map;)V

    .line 99
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/bj;->f()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Jumptap Interstitial no ad found."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 100
    return-void
.end method
