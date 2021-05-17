.class final Lcom/flurry/sdk/br$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/mobclix/android/sdk/MobclixFullScreenAdViewListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/br;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lcom/flurry/sdk/br;


# direct methods
.method private constructor <init>(Lcom/flurry/sdk/br;)V
    .locals 0

    .prologue
    .line 55
    iput-object p1, p0, Lcom/flurry/sdk/br$a;->a:Lcom/flurry/sdk/br;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/flurry/sdk/br;Lcom/flurry/sdk/br$1;)V
    .locals 0

    .prologue
    .line 55
    invoke-direct {p0, p1}, Lcom/flurry/sdk/br$a;-><init>(Lcom/flurry/sdk/br;)V

    return-void
.end method


# virtual methods
.method public keywords()Ljava/lang/String;
    .locals 3

    .prologue
    .line 81
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/br;->f()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Mobclix keyword callback."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 82
    const/4 v0, 0x0

    return-object v0
.end method

.method public onDismissAd(Lcom/mobclix/android/sdk/MobclixFullScreenAdView;)V
    .locals 3

    .prologue
    .line 58
    iget-object v0, p0, Lcom/flurry/sdk/br$a;->a:Lcom/flurry/sdk/br;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/br;->c(Ljava/util/Map;)V

    .line 59
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/br;->f()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Mobclix Interstitial ad dismissed."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 60
    return-void
.end method

.method public onFailedLoad(Lcom/mobclix/android/sdk/MobclixFullScreenAdView;I)V
    .locals 3

    .prologue
    .line 64
    iget-object v0, p0, Lcom/flurry/sdk/br$a;->a:Lcom/flurry/sdk/br;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/br;->d(Ljava/util/Map;)V

    .line 65
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/br;->f()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Mobclix Interstitial ad failed to load."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 66
    return-void
.end method

.method public onFinishLoad(Lcom/mobclix/android/sdk/MobclixFullScreenAdView;)V
    .locals 3

    .prologue
    .line 70
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/br;->f()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Mobclix Interstitial ad successfully loaded."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 71
    return-void
.end method

.method public onPresentAd(Lcom/mobclix/android/sdk/MobclixFullScreenAdView;)V
    .locals 3

    .prologue
    .line 75
    iget-object v0, p0, Lcom/flurry/sdk/br$a;->a:Lcom/flurry/sdk/br;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/br;->a(Ljava/util/Map;)V

    .line 76
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/br;->f()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Mobclix Interstitial ad successfully shown."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 77
    return-void
.end method

.method public query()Ljava/lang/String;
    .locals 3

    .prologue
    .line 87
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/br;->f()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Mobclix query callback."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 88
    const/4 v0, 0x0

    return-object v0
.end method
