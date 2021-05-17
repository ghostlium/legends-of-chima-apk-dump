.class final Lcom/flurry/sdk/bi$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/jumptap/adtag/JtAdViewListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/bi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lcom/flurry/sdk/bi;


# direct methods
.method private constructor <init>(Lcom/flurry/sdk/bi;)V
    .locals 0

    .prologue
    .line 104
    iput-object p1, p0, Lcom/flurry/sdk/bi$a;->a:Lcom/flurry/sdk/bi;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/flurry/sdk/bi;Lcom/flurry/sdk/bi$1;)V
    .locals 0

    .prologue
    .line 104
    invoke-direct {p0, p1}, Lcom/flurry/sdk/bi$a;-><init>(Lcom/flurry/sdk/bi;)V

    return-void
.end method


# virtual methods
.method public onAdError(Lcom/jumptap/adtag/JtAdView;II)V
    .locals 3

    .prologue
    .line 130
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/bi;->a()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Jumptap AdView error."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 131
    iget-object v0, p0, Lcom/flurry/sdk/bi$a;->a:Lcom/flurry/sdk/bi;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/bi;->onRenderFailed(Ljava/util/Map;)V

    .line 132
    return-void
.end method

.method public onFocusChange(Lcom/jumptap/adtag/JtAdView;IZ)V
    .locals 3

    .prologue
    .line 125
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/bi;->a()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Jumptap AdView focus changed."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 126
    return-void
.end method

.method public onInterstitialDismissed(Lcom/jumptap/adtag/JtAdView;I)V
    .locals 3

    .prologue
    .line 119
    iget-object v0, p0, Lcom/flurry/sdk/bi$a;->a:Lcom/flurry/sdk/bi;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/bi;->onAdClosed(Ljava/util/Map;)V

    .line 120
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/bi;->a()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Jumptap AdView dismissed."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 121
    return-void
.end method

.method public onNewAd(Lcom/jumptap/adtag/JtAdView;ILjava/lang/String;)V
    .locals 3

    .prologue
    .line 113
    iget-object v0, p0, Lcom/flurry/sdk/bi$a;->a:Lcom/flurry/sdk/bi;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/bi;->onAdShown(Ljava/util/Map;)V

    .line 114
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/bi;->a()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Jumptap AdView new ad."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 115
    return-void
.end method

.method public onNoAdFound(Lcom/jumptap/adtag/JtAdView;I)V
    .locals 3

    .prologue
    .line 107
    iget-object v0, p0, Lcom/flurry/sdk/bi$a;->a:Lcom/flurry/sdk/bi;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/bi;->onRenderFailed(Ljava/util/Map;)V

    .line 108
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/bi;->a()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Jumptap AdView no ad found."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 109
    return-void
.end method
