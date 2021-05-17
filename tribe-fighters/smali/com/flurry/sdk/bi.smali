.class public Lcom/flurry/sdk/bi;
.super Lcom/flurry/android/AdNetworkView;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/bi$1;,
        Lcom/flurry/sdk/bi$a;
    }
.end annotation


# static fields
.field private static final a:Ljava/lang/String;


# instance fields
.field private final b:Ljava/lang/String;

.field private final c:Ljava/lang/String;

.field private final d:Ljava/lang/String;

.field private e:Lcom/jumptap/adtag/JtAdView;

.field private f:Lcom/jumptap/adtag/JtAdViewListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    const-class v0, Lcom/flurry/sdk/bi;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flurry/sdk/bi;->a:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/AdCreative;Landroid/os/Bundle;)V
    .locals 1

    .prologue
    .line 36
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/flurry/android/AdNetworkView;-><init>(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/AdCreative;)V

    .line 37
    const-string v0, "com.flurry.jumptap.PUBLISHER_ID"

    invoke-virtual {p5, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/bi;->b:Ljava/lang/String;

    .line 38
    const-string v0, "com.flurry.jumptap.SPOT_ID"

    invoke-virtual {p5, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/bi;->c:Ljava/lang/String;

    .line 39
    const-string v0, "com.flurry.jumptap.SITE_ID"

    invoke-virtual {p5, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/bi;->d:Ljava/lang/String;

    .line 41
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/bi;->setFocusable(Z)V

    .line 42
    return-void
.end method

.method static synthetic a()Ljava/lang/String;
    .locals 1

    .prologue
    .line 24
    sget-object v0, Lcom/flurry/sdk/bi;->a:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method getAdListener()Lcom/jumptap/adtag/JtAdViewListener;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/flurry/sdk/bi;->f:Lcom/jumptap/adtag/JtAdViewListener;

    return-object v0
.end method

.method getAdView()Lcom/jumptap/adtag/JtAdView;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/flurry/sdk/bi;->e:Lcom/jumptap/adtag/JtAdView;

    return-object v0
.end method

.method public initLayout()V
    .locals 7

    .prologue
    const/4 v6, 0x3

    const/4 v2, 0x0

    const/high16 v5, 0x3f000000    # 0.5f

    .line 64
    invoke-static {}, Lcom/jumptap/adtag/JtAdWidgetSettingsFactory;->createWidgetSettings()Lcom/jumptap/adtag/JtAdWidgetSettings;

    move-result-object v1

    .line 65
    iget-object v0, p0, Lcom/flurry/sdk/bi;->b:Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/jumptap/adtag/JtAdWidgetSettings;->setPublisherId(Ljava/lang/String;)V

    .line 67
    iget-object v0, p0, Lcom/flurry/sdk/bi;->c:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 68
    iget-object v0, p0, Lcom/flurry/sdk/bi;->c:Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/jumptap/adtag/JtAdWidgetSettings;->setSpotId(Ljava/lang/String;)V

    .line 71
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/bi;->d:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 72
    iget-object v0, p0, Lcom/flurry/sdk/bi;->d:Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/jumptap/adtag/JtAdWidgetSettings;->setSiteId(Ljava/lang/String;)V

    .line 75
    :cond_1
    invoke-virtual {p0}, Lcom/flurry/sdk/bi;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/flurry/sdk/el;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/jumptap/adtag/JtAdWidgetSettings;->setApplicationId(Ljava/lang/String;)V

    .line 76
    invoke-virtual {p0}, Lcom/flurry/sdk/bi;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/flurry/sdk/el;->d(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/jumptap/adtag/JtAdWidgetSettings;->setApplicationVersion(Ljava/lang/String;)V

    .line 79
    invoke-virtual {v1, v2}, Lcom/jumptap/adtag/JtAdWidgetSettings;->setRefreshPeriod(I)V

    .line 81
    invoke-virtual {v1, v2}, Lcom/jumptap/adtag/JtAdWidgetSettings;->setShouldSendLocation(Z)V

    .line 82
    const/16 v0, 0x11

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/bi;->setGravity(I)V

    .line 85
    :try_start_0
    new-instance v2, Lcom/jumptap/adtag/JtAdView;

    invoke-virtual {p0}, Lcom/flurry/sdk/bi;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    invoke-direct {v2, v0, v1}, Lcom/jumptap/adtag/JtAdView;-><init>(Landroid/content/Context;Lcom/jumptap/adtag/JtAdWidgetSettings;)V

    iput-object v2, p0, Lcom/flurry/sdk/bi;->e:Lcom/jumptap/adtag/JtAdView;

    .line 87
    invoke-virtual {p0}, Lcom/flurry/sdk/bi;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 88
    const/4 v1, 0x3

    sget-object v2, Lcom/flurry/sdk/bi;->a:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "scale is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 89
    const/high16 v1, 0x43a00000    # 320.0f

    mul-float/2addr v1, v0

    add-float/2addr v1, v5

    float-to-int v1, v1

    .line 90
    const/high16 v2, 0x42480000    # 50.0f

    mul-float/2addr v0, v2

    add-float/2addr v0, v5

    float-to-int v0, v0

    .line 91
    iget-object v2, p0, Lcom/flurry/sdk/bi;->e:Lcom/jumptap/adtag/JtAdView;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v1, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3}, Lcom/jumptap/adtag/JtAdView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 94
    new-instance v0, Lcom/flurry/sdk/bi$a;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/flurry/sdk/bi$a;-><init>(Lcom/flurry/sdk/bi;Lcom/flurry/sdk/bi$1;)V

    iput-object v0, p0, Lcom/flurry/sdk/bi;->f:Lcom/jumptap/adtag/JtAdViewListener;

    .line 95
    iget-object v0, p0, Lcom/flurry/sdk/bi;->e:Lcom/jumptap/adtag/JtAdView;

    iget-object v1, p0, Lcom/flurry/sdk/bi;->f:Lcom/jumptap/adtag/JtAdViewListener;

    invoke-virtual {v0, v1}, Lcom/jumptap/adtag/JtAdView;->setAdViewListener(Lcom/jumptap/adtag/JtAdViewListener;)V

    .line 98
    iget-object v0, p0, Lcom/flurry/sdk/bi;->e:Lcom/jumptap/adtag/JtAdView;

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/bi;->addView(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 102
    :goto_0
    return-void

    .line 99
    :catch_0
    move-exception v0

    .line 100
    sget-object v1, Lcom/flurry/sdk/bi;->a:Ljava/lang/String;

    const-string v2, "Jumptap Exception when creating ad object: "

    invoke-static {v6, v1, v2, v0}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
