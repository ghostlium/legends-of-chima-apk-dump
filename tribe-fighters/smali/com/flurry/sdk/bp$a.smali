.class final Lcom/flurry/sdk/bp$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/mobclix/android/sdk/MobclixAdViewListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/bp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lcom/flurry/sdk/bp;


# direct methods
.method private constructor <init>(Lcom/flurry/sdk/bp;)V
    .locals 0

    .prologue
    .line 113
    iput-object p1, p0, Lcom/flurry/sdk/bp$a;->a:Lcom/flurry/sdk/bp;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/flurry/sdk/bp;Lcom/flurry/sdk/bp$1;)V
    .locals 0

    .prologue
    .line 113
    invoke-direct {p0, p1}, Lcom/flurry/sdk/bp$a;-><init>(Lcom/flurry/sdk/bp;)V

    return-void
.end method


# virtual methods
.method public keywords()Ljava/lang/String;
    .locals 3

    .prologue
    .line 146
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/bp;->a()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Mobclix keyword callback."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 147
    const/4 v0, 0x0

    return-object v0
.end method

.method public onAdClick(Lcom/mobclix/android/sdk/MobclixAdView;)V
    .locals 3

    .prologue
    .line 134
    iget-object v0, p0, Lcom/flurry/sdk/bp$a;->a:Lcom/flurry/sdk/bp;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/bp;->onAdClicked(Ljava/util/Map;)V

    .line 135
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/bp;->a()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Mobclix AdView ad clicked."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 136
    return-void
.end method

.method public onCustomAdTouchThrough(Lcom/mobclix/android/sdk/MobclixAdView;Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 140
    iget-object v0, p0, Lcom/flurry/sdk/bp$a;->a:Lcom/flurry/sdk/bp;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/bp;->onAdClicked(Ljava/util/Map;)V

    .line 141
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/bp;->a()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Mobclix AdView custom ad clicked."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 142
    return-void
.end method

.method public onFailedLoad(Lcom/mobclix/android/sdk/MobclixAdView;I)V
    .locals 3

    .prologue
    .line 122
    iget-object v0, p0, Lcom/flurry/sdk/bp$a;->a:Lcom/flurry/sdk/bp;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/bp;->onRenderFailed(Ljava/util/Map;)V

    .line 123
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/bp;->a()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Mobclix AdView ad failed to load."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 124
    return-void
.end method

.method public onOpenAllocationLoad(Lcom/mobclix/android/sdk/MobclixAdView;I)Z
    .locals 3

    .prologue
    .line 128
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/bp;->a()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Mobclix AdView loaded an open allocation ad."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 129
    const/4 v0, 0x1

    return v0
.end method

.method public onSuccessfulLoad(Lcom/mobclix/android/sdk/MobclixAdView;)V
    .locals 3

    .prologue
    .line 116
    iget-object v0, p0, Lcom/flurry/sdk/bp$a;->a:Lcom/flurry/sdk/bp;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/bp;->onAdShown(Ljava/util/Map;)V

    .line 117
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/bp;->a()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Mobclix AdView ad successfully loaded."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 118
    return-void
.end method

.method public query()Ljava/lang/String;
    .locals 3

    .prologue
    .line 152
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/bp;->a()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Mobclix query callback."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 153
    const/4 v0, 0x0

    return-object v0
.end method
