.class public final Lcom/flurry/sdk/br;
.super Lcom/flurry/sdk/ao;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/br$1;,
        Lcom/flurry/sdk/br$a;
    }
.end annotation


# static fields
.field private static final b:Ljava/lang/String;


# instance fields
.field private c:Lcom/mobclix/android/sdk/MobclixFullScreenAdView;

.field private d:Lcom/mobclix/android/sdk/MobclixFullScreenAdViewListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    const-class v0, Lcom/flurry/sdk/br;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flurry/sdk/br;->b:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Landroid/os/Bundle;)V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/flurry/sdk/ao;-><init>(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V

    .line 27
    return-void
.end method

.method static synthetic f()Ljava/lang/String;
    .locals 1

    .prologue
    .line 18
    sget-object v0, Lcom/flurry/sdk/br;->b:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public a()V
    .locals 2

    .prologue
    .line 49
    new-instance v1, Lcom/mobclix/android/sdk/MobclixFullScreenAdView;

    invoke-virtual {p0}, Lcom/flurry/sdk/br;->b()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    invoke-direct {v1, v0}, Lcom/mobclix/android/sdk/MobclixFullScreenAdView;-><init>(Landroid/app/Activity;)V

    iput-object v1, p0, Lcom/flurry/sdk/br;->c:Lcom/mobclix/android/sdk/MobclixFullScreenAdView;

    .line 50
    new-instance v0, Lcom/flurry/sdk/br$a;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/flurry/sdk/br$a;-><init>(Lcom/flurry/sdk/br;Lcom/flurry/sdk/br$1;)V

    iput-object v0, p0, Lcom/flurry/sdk/br;->d:Lcom/mobclix/android/sdk/MobclixFullScreenAdViewListener;

    .line 51
    iget-object v0, p0, Lcom/flurry/sdk/br;->c:Lcom/mobclix/android/sdk/MobclixFullScreenAdView;

    iget-object v1, p0, Lcom/flurry/sdk/br;->d:Lcom/mobclix/android/sdk/MobclixFullScreenAdViewListener;

    invoke-virtual {v0, v1}, Lcom/mobclix/android/sdk/MobclixFullScreenAdView;->addMobclixAdViewListener(Lcom/mobclix/android/sdk/MobclixFullScreenAdViewListener;)Z

    .line 52
    iget-object v0, p0, Lcom/flurry/sdk/br;->c:Lcom/mobclix/android/sdk/MobclixFullScreenAdView;

    invoke-virtual {v0}, Lcom/mobclix/android/sdk/MobclixFullScreenAdView;->requestAndDisplayAd()V

    .line 53
    return-void
.end method
