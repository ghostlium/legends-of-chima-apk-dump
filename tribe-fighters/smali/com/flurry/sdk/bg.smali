.class public Lcom/flurry/sdk/bg;
.super Lcom/flurry/sdk/ao;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/bg$1;,
        Lcom/flurry/sdk/bg$a;
    }
.end annotation


# static fields
.field private static final b:Ljava/lang/String;

.field private static final c:Ljava/lang/reflect/Method;


# instance fields
.field private final d:Ljava/lang/String;

.field private e:Lcom/inmobi/androidsdk/IMAdInterstitial;

.field private f:Lcom/inmobi/androidsdk/IMAdInterstitialListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    const-class v0, Lcom/flurry/sdk/bg;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flurry/sdk/bg;->b:Ljava/lang/String;

    .line 23
    invoke-static {}, Lcom/flurry/sdk/bg;->g()Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lcom/flurry/sdk/bg;->c:Ljava/lang/reflect/Method;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Landroid/os/Bundle;)V
    .locals 1

    .prologue
    .line 32
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/flurry/sdk/ao;-><init>(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V

    .line 33
    const-string v0, "com.flurry.inmobi.MY_APP_ID"

    invoke-virtual {p5, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/bg;->d:Ljava/lang/String;

    .line 34
    return-void
.end method

.method private a(Lcom/inmobi/androidsdk/IMAdInterstitial;Lcom/inmobi/androidsdk/IMAdInterstitialListener;)V
    .locals 3

    .prologue
    .line 66
    if-nez p1, :cond_1

    .line 77
    :cond_0
    :goto_0
    return-void

    .line 71
    :cond_1
    :try_start_0
    sget-object v0, Lcom/flurry/sdk/bg;->c:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_0

    .line 72
    sget-object v0, Lcom/flurry/sdk/bg;->c:Ljava/lang/reflect/Method;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 74
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method static synthetic f()Ljava/lang/String;
    .locals 1

    .prologue
    .line 21
    sget-object v0, Lcom/flurry/sdk/bg;->b:Ljava/lang/String;

    return-object v0
.end method

.method private static g()Ljava/lang/reflect/Method;
    .locals 7

    .prologue
    .line 80
    const/4 v1, 0x0

    .line 81
    const-class v0, Lcom/inmobi/androidsdk/IMAdInterstitial;

    invoke-virtual {v0}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v3

    .line 82
    array-length v4, v3

    const/4 v0, 0x0

    move v2, v0

    :goto_0
    if-ge v2, v4, :cond_2

    aget-object v0, v3, v2

    .line 83
    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v5

    .line 84
    const-string v6, "setIMAdInterstitialListener"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    const-string v6, "setImAdInterstitialListener"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 91
    :cond_0
    :goto_1
    return-object v0

    .line 82
    :cond_1
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_0

    :cond_2
    move-object v0, v1

    goto :goto_1
.end method


# virtual methods
.method public a()V
    .locals 3

    .prologue
    .line 56
    new-instance v1, Lcom/inmobi/androidsdk/IMAdInterstitial;

    invoke-virtual {p0}, Lcom/flurry/sdk/bg;->b()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    iget-object v2, p0, Lcom/flurry/sdk/bg;->d:Ljava/lang/String;

    invoke-direct {v1, v0, v2}, Lcom/inmobi/androidsdk/IMAdInterstitial;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/flurry/sdk/bg;->e:Lcom/inmobi/androidsdk/IMAdInterstitial;

    .line 57
    new-instance v0, Lcom/flurry/sdk/bg$a;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/flurry/sdk/bg$a;-><init>(Lcom/flurry/sdk/bg;Lcom/flurry/sdk/bg$1;)V

    iput-object v0, p0, Lcom/flurry/sdk/bg;->f:Lcom/inmobi/androidsdk/IMAdInterstitialListener;

    .line 58
    iget-object v0, p0, Lcom/flurry/sdk/bg;->e:Lcom/inmobi/androidsdk/IMAdInterstitial;

    iget-object v1, p0, Lcom/flurry/sdk/bg;->f:Lcom/inmobi/androidsdk/IMAdInterstitialListener;

    invoke-direct {p0, v0, v1}, Lcom/flurry/sdk/bg;->a(Lcom/inmobi/androidsdk/IMAdInterstitial;Lcom/inmobi/androidsdk/IMAdInterstitialListener;)V

    .line 60
    new-instance v0, Lcom/inmobi/androidsdk/IMAdRequest;

    invoke-direct {v0}, Lcom/inmobi/androidsdk/IMAdRequest;-><init>()V

    .line 61
    iget-object v1, p0, Lcom/flurry/sdk/bg;->e:Lcom/inmobi/androidsdk/IMAdInterstitial;

    invoke-virtual {v1, v0}, Lcom/inmobi/androidsdk/IMAdInterstitial;->loadNewAd(Lcom/inmobi/androidsdk/IMAdRequest;)V

    .line 62
    return-void
.end method
