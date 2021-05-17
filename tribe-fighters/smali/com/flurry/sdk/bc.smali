.class public final Lcom/flurry/sdk/bc;
.super Lcom/flurry/sdk/ao;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/bc$1;,
        Lcom/flurry/sdk/bc$a;
    }
.end annotation


# static fields
.field private static final b:Ljava/lang/String;


# instance fields
.field private final c:Ljava/lang/String;

.field private final d:Ljava/lang/String;

.field private final e:Z

.field private final f:Lcom/google/ads/InterstitialAd;

.field private final g:Lcom/google/ads/AdListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    const-class v0, Lcom/flurry/sdk/bc;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flurry/sdk/bc;->b:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Landroid/os/Bundle;)V
    .locals 3

    .prologue
    .line 33
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/flurry/sdk/ao;-><init>(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V

    .line 34
    const-string v0, "com.flurry.admob.MY_AD_UNIT_ID"

    invoke-virtual {p5, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/bc;->c:Ljava/lang/String;

    .line 35
    const-string v0, "com.flurry.admob.MYTEST_AD_DEVICE_ID"

    invoke-virtual {p5, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/bc;->d:Ljava/lang/String;

    .line 36
    const-string v0, "com.flurry.admob.test"

    invoke-virtual {p5, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/flurry/sdk/bc;->e:Z

    .line 38
    new-instance v0, Lcom/flurry/sdk/bc$a;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/flurry/sdk/bc$a;-><init>(Lcom/flurry/sdk/bc;Lcom/flurry/sdk/bc$1;)V

    iput-object v0, p0, Lcom/flurry/sdk/bc;->g:Lcom/google/ads/AdListener;

    .line 39
    new-instance v1, Lcom/google/ads/InterstitialAd;

    invoke-virtual {p0}, Lcom/flurry/sdk/bc;->b()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    iget-object v2, p0, Lcom/flurry/sdk/bc;->c:Ljava/lang/String;

    invoke-direct {v1, v0, v2}, Lcom/google/ads/InterstitialAd;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/flurry/sdk/bc;->f:Lcom/google/ads/InterstitialAd;

    .line 40
    iget-object v0, p0, Lcom/flurry/sdk/bc;->f:Lcom/google/ads/InterstitialAd;

    iget-object v1, p0, Lcom/flurry/sdk/bc;->g:Lcom/google/ads/AdListener;

    invoke-virtual {v0, v1}, Lcom/google/ads/InterstitialAd;->setAdListener(Lcom/google/ads/AdListener;)V

    .line 41
    return-void
.end method

.method static synthetic a(Lcom/flurry/sdk/bc;)Lcom/google/ads/InterstitialAd;
    .locals 1

    .prologue
    .line 21
    iget-object v0, p0, Lcom/flurry/sdk/bc;->f:Lcom/google/ads/InterstitialAd;

    return-object v0
.end method

.method static synthetic f()Ljava/lang/String;
    .locals 1

    .prologue
    .line 21
    sget-object v0, Lcom/flurry/sdk/bc;->b:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public a()V
    .locals 4

    .prologue
    .line 45
    new-instance v0, Lcom/google/ads/AdRequest;

    invoke-direct {v0}, Lcom/google/ads/AdRequest;-><init>()V

    .line 46
    iget-boolean v1, p0, Lcom/flurry/sdk/bc;->e:Z

    if-eqz v1, :cond_0

    .line 47
    const/4 v1, 0x3

    sget-object v2, Lcom/flurry/sdk/bc;->b:Ljava/lang/String;

    const-string v3, "Admob AdView set to Test Mode."

    invoke-static {v1, v2, v3}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 48
    sget-object v1, Lcom/google/ads/AdRequest;->TEST_EMULATOR:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/ads/AdRequest;->addTestDevice(Ljava/lang/String;)Lcom/google/ads/AdRequest;

    .line 50
    iget-object v1, p0, Lcom/flurry/sdk/bc;->d:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 51
    iget-object v1, p0, Lcom/flurry/sdk/bc;->d:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/ads/AdRequest;->addTestDevice(Ljava/lang/String;)Lcom/google/ads/AdRequest;

    .line 54
    :cond_0
    iget-object v1, p0, Lcom/flurry/sdk/bc;->f:Lcom/google/ads/InterstitialAd;

    invoke-virtual {v1, v0}, Lcom/google/ads/InterstitialAd;->loadAd(Lcom/google/ads/AdRequest;)V

    .line 55
    return-void
.end method
