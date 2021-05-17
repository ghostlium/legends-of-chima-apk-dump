.class final Lcom/flurry/sdk/be$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/inmobi/androidsdk/IMAdListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/be;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lcom/flurry/sdk/be;


# direct methods
.method private constructor <init>(Lcom/flurry/sdk/be;)V
    .locals 0

    .prologue
    .line 112
    iput-object p1, p0, Lcom/flurry/sdk/be$a;->a:Lcom/flurry/sdk/be;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/flurry/sdk/be;Lcom/flurry/sdk/be$1;)V
    .locals 0

    .prologue
    .line 112
    invoke-direct {p0, p1}, Lcom/flurry/sdk/be$a;-><init>(Lcom/flurry/sdk/be;)V

    return-void
.end method


# virtual methods
.method public onAdRequestCompleted(Lcom/inmobi/androidsdk/IMAdView;)V
    .locals 3

    .prologue
    .line 135
    iget-object v0, p0, Lcom/flurry/sdk/be$a;->a:Lcom/flurry/sdk/be;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/be;->onAdShown(Ljava/util/Map;)V

    .line 136
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/be;->a()Ljava/lang/String;

    move-result-object v1

    const-string v2, "InMobi imAdView ad request completed."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 137
    return-void
.end method

.method public onAdRequestFailed(Lcom/inmobi/androidsdk/IMAdView;Lcom/inmobi/androidsdk/IMAdRequest$ErrorCode;)V
    .locals 4

    .prologue
    .line 127
    iget-object v0, p0, Lcom/flurry/sdk/be$a;->a:Lcom/flurry/sdk/be;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/be;->onRenderFailed(Ljava/util/Map;)V

    .line 128
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/be;->a()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "InMobi imAdView ad request failed. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p2}, Lcom/inmobi/androidsdk/IMAdRequest$ErrorCode;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 131
    return-void
.end method

.method public onDismissAdScreen(Lcom/inmobi/androidsdk/IMAdView;)V
    .locals 3

    .prologue
    .line 121
    iget-object v0, p0, Lcom/flurry/sdk/be$a;->a:Lcom/flurry/sdk/be;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/be;->onAdClosed(Ljava/util/Map;)V

    .line 122
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/be;->a()Ljava/lang/String;

    move-result-object v1

    const-string v2, "InMobi imAdView dismiss ad."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 123
    return-void
.end method

.method public onLeaveApplication(Lcom/inmobi/androidsdk/IMAdView;)V
    .locals 3

    .prologue
    .line 141
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/be;->a()Ljava/lang/String;

    move-result-object v1

    const-string v2, "InMobi onLeaveApplication"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 142
    return-void
.end method

.method public onShowAdScreen(Lcom/inmobi/androidsdk/IMAdView;)V
    .locals 3

    .prologue
    .line 115
    iget-object v0, p0, Lcom/flurry/sdk/be$a;->a:Lcom/flurry/sdk/be;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/be;->onAdClicked(Ljava/util/Map;)V

    .line 116
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/be;->a()Ljava/lang/String;

    move-result-object v1

    const-string v2, "InMobi imAdView ad shown."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 117
    return-void
.end method
