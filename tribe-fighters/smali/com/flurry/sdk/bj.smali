.class public final Lcom/flurry/sdk/bj;
.super Lcom/flurry/sdk/ao;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/bj$1;,
        Lcom/flurry/sdk/bj$a;
    }
.end annotation


# static fields
.field private static final b:Ljava/lang/String;


# instance fields
.field private final c:Ljava/lang/String;

.field private final d:Ljava/lang/String;

.field private final e:Ljava/lang/String;

.field private f:Lcom/jumptap/adtag/JtAdInterstitial;

.field private g:Lcom/jumptap/adtag/JtAdViewListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 24
    const-class v0, Lcom/flurry/sdk/bj;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flurry/sdk/bj;->b:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Landroid/os/Bundle;)V
    .locals 1

    .prologue
    .line 35
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/flurry/sdk/ao;-><init>(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V

    .line 36
    const-string v0, "com.flurry.jumptap.PUBLISHER_ID"

    invoke-virtual {p5, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/bj;->c:Ljava/lang/String;

    .line 37
    const-string v0, "com.flurry.jumptap.INT_SPOT_ID"

    invoke-virtual {p5, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/bj;->d:Ljava/lang/String;

    .line 38
    const-string v0, "com.flurry.jumptap.INT_SITE_ID"

    invoke-virtual {p5, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/bj;->e:Ljava/lang/String;

    .line 39
    return-void
.end method

.method static synthetic f()Ljava/lang/String;
    .locals 1

    .prologue
    .line 23
    sget-object v0, Lcom/flurry/sdk/bj;->b:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public a()V
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 61
    invoke-static {}, Lcom/jumptap/adtag/JtAdWidgetSettingsFactory;->createWidgetSettings()Lcom/jumptap/adtag/JtAdWidgetSettings;

    move-result-object v1

    .line 62
    iget-object v0, p0, Lcom/flurry/sdk/bj;->c:Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/jumptap/adtag/JtAdWidgetSettings;->setPublisherId(Ljava/lang/String;)V

    .line 64
    iget-object v0, p0, Lcom/flurry/sdk/bj;->d:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 65
    iget-object v0, p0, Lcom/flurry/sdk/bj;->d:Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/jumptap/adtag/JtAdWidgetSettings;->setSpotId(Ljava/lang/String;)V

    .line 68
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/bj;->e:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 69
    iget-object v0, p0, Lcom/flurry/sdk/bj;->e:Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/jumptap/adtag/JtAdWidgetSettings;->setSiteId(Ljava/lang/String;)V

    .line 72
    :cond_1
    invoke-virtual {p0}, Lcom/flurry/sdk/bj;->b()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/flurry/sdk/el;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/jumptap/adtag/JtAdWidgetSettings;->setApplicationId(Ljava/lang/String;)V

    .line 73
    invoke-virtual {p0}, Lcom/flurry/sdk/bj;->b()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/flurry/sdk/el;->d(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/jumptap/adtag/JtAdWidgetSettings;->setApplicationVersion(Ljava/lang/String;)V

    .line 76
    invoke-virtual {v1, v2}, Lcom/jumptap/adtag/JtAdWidgetSettings;->setRefreshPeriod(I)V

    .line 78
    invoke-virtual {v1, v2}, Lcom/jumptap/adtag/JtAdWidgetSettings;->setShouldSendLocation(Z)V

    .line 82
    :try_start_0
    new-instance v2, Lcom/jumptap/adtag/JtAdInterstitial;

    invoke-virtual {p0}, Lcom/flurry/sdk/bj;->b()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    invoke-direct {v2, v0, v1}, Lcom/jumptap/adtag/JtAdInterstitial;-><init>(Landroid/content/Context;Lcom/jumptap/adtag/JtAdWidgetSettings;)V

    iput-object v2, p0, Lcom/flurry/sdk/bj;->f:Lcom/jumptap/adtag/JtAdInterstitial;

    .line 85
    new-instance v0, Lcom/flurry/sdk/bj$a;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/flurry/sdk/bj$a;-><init>(Lcom/flurry/sdk/bj;Lcom/flurry/sdk/bj$1;)V

    iput-object v0, p0, Lcom/flurry/sdk/bj;->g:Lcom/jumptap/adtag/JtAdViewListener;

    .line 86
    iget-object v0, p0, Lcom/flurry/sdk/bj;->f:Lcom/jumptap/adtag/JtAdInterstitial;

    iget-object v1, p0, Lcom/flurry/sdk/bj;->g:Lcom/jumptap/adtag/JtAdViewListener;

    invoke-virtual {v0, v1}, Lcom/jumptap/adtag/JtAdInterstitial;->setAdViewListener(Lcom/jumptap/adtag/JtAdViewListener;)V

    .line 89
    iget-object v0, p0, Lcom/flurry/sdk/bj;->f:Lcom/jumptap/adtag/JtAdInterstitial;

    invoke-virtual {v0}, Lcom/jumptap/adtag/JtAdInterstitial;->showAsPopup()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 93
    :goto_0
    return-void

    .line 90
    :catch_0
    move-exception v0

    .line 91
    const/4 v1, 0x3

    sget-object v2, Lcom/flurry/sdk/bj;->b:Ljava/lang/String;

    const-string v3, "Jumptap Exception when creating ad object: "

    invoke-static {v1, v2, v3, v0}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
