.class final Lcom/flurry/sdk/bb$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/ads/AdListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/bb;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lcom/flurry/sdk/bb;


# direct methods
.method private constructor <init>(Lcom/flurry/sdk/bb;)V
    .locals 0

    .prologue
    .line 114
    iput-object p1, p0, Lcom/flurry/sdk/bb$a;->a:Lcom/flurry/sdk/bb;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/flurry/sdk/bb;Lcom/flurry/sdk/bb$1;)V
    .locals 0

    .prologue
    .line 114
    invoke-direct {p0, p1}, Lcom/flurry/sdk/bb$a;-><init>(Lcom/flurry/sdk/bb;)V

    return-void
.end method


# virtual methods
.method public onDismissScreen(Lcom/google/ads/Ad;)V
    .locals 3

    .prologue
    .line 134
    iget-object v0, p0, Lcom/flurry/sdk/bb$a;->a:Lcom/flurry/sdk/bb;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/bb;->onAdClosed(Ljava/util/Map;)V

    .line 135
    const/4 v0, 0x4

    invoke-static {}, Lcom/flurry/sdk/bb;->a()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Admob AdView dismissed from screen."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 136
    return-void
.end method

.method public onFailedToReceiveAd(Lcom/google/ads/Ad;Lcom/google/ads/AdRequest$ErrorCode;)V
    .locals 3

    .prologue
    .line 123
    iget-object v0, p0, Lcom/flurry/sdk/bb$a;->a:Lcom/flurry/sdk/bb;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/bb;->onRenderFailed(Ljava/util/Map;)V

    .line 124
    const/4 v0, 0x5

    invoke-static {}, Lcom/flurry/sdk/bb;->a()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Admob AdView failed to receive ad."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 125
    return-void
.end method

.method public onLeaveApplication(Lcom/google/ads/Ad;)V
    .locals 3

    .prologue
    .line 140
    iget-object v0, p0, Lcom/flurry/sdk/bb$a;->a:Lcom/flurry/sdk/bb;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/bb;->onAdClicked(Ljava/util/Map;)V

    .line 141
    const/4 v0, 0x4

    invoke-static {}, Lcom/flurry/sdk/bb;->a()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Admob AdView leave application."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 142
    return-void
.end method

.method public onPresentScreen(Lcom/google/ads/Ad;)V
    .locals 3

    .prologue
    .line 129
    const/4 v0, 0x4

    invoke-static {}, Lcom/flurry/sdk/bb;->a()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Admob AdView present on screen."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 130
    return-void
.end method

.method public onReceiveAd(Lcom/google/ads/Ad;)V
    .locals 3

    .prologue
    .line 117
    iget-object v0, p0, Lcom/flurry/sdk/bb$a;->a:Lcom/flurry/sdk/bb;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/bb;->onAdShown(Ljava/util/Map;)V

    .line 118
    const/4 v0, 0x4

    invoke-static {}, Lcom/flurry/sdk/bb;->a()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Admob AdView received ad."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 119
    return-void
.end method
