.class Lcom/flurry/android/eh;
.super Lcom/flurry/android/AdNetworkView;
.source "SourceFile"


# static fields
.field private static final m:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    const-class v0, Lcom/flurry/android/eh;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flurry/android/eh;->m:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lcom/flurry/android/FlurryAds;Lcom/flurry/android/ck;Lcom/flurry/android/AdCreative;)V
    .locals 1

    .prologue
    .line 27
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/flurry/android/AdNetworkView;-><init>(Landroid/content/Context;Lcom/flurry/android/FlurryAds;Lcom/flurry/android/ck;Lcom/flurry/android/AdCreative;)V

    .line 28
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/flurry/android/eh;->setFocusable(Z)V

    .line 29
    return-void
.end method

.method static synthetic d()Ljava/lang/String;
    .locals 1

    .prologue
    .line 16
    sget-object v0, Lcom/flurry/android/eh;->m:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public initLayout(Landroid/content/Context;)V
    .locals 7

    .prologue
    const/16 v1, 0x140

    const/16 v3, 0xfa

    const/high16 v6, 0x3f000000    # 0.5f

    const/16 v2, 0x12c

    const/16 v4, 0x32

    .line 54
    invoke-virtual {p0}, Lcom/flurry/android/eh;->getAdCreative()Lcom/flurry/android/AdCreative;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/AdCreative;->getHeight()I

    move-result v0

    invoke-virtual {p0}, Lcom/flurry/android/eh;->getAdCreative()Lcom/flurry/android/AdCreative;

    move-result-object v5

    invoke-virtual {v5}, Lcom/flurry/android/AdCreative;->getWidth()I

    move-result v5

    if-lt v5, v1, :cond_1

    if-lt v0, v4, :cond_1

    sget-object v0, Lcom/flurry/android/eh;->m:Ljava/lang/String;

    const-string v5, "Determined Mobclix AdSize as BANNER"

    invoke-static {v0, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/mobclix/android/sdk/MobclixMMABannerXLAdView;

    check-cast p1, Landroid/app/Activity;

    invoke-direct {v0, p1}, Lcom/mobclix/android/sdk/MobclixMMABannerXLAdView;-><init>(Landroid/content/Context;)V

    .line 109
    :goto_0
    new-instance v5, Lcom/flurry/android/am;

    invoke-direct {v5, p0}, Lcom/flurry/android/am;-><init>(Lcom/flurry/android/eh;)V

    .line 110
    invoke-virtual {v0, v5}, Lcom/mobclix/android/sdk/MobclixAdView;->addMobclixAdViewListener(Lcom/mobclix/android/sdk/MobclixAdViewListener;)Z

    .line 116
    instance-of v5, v0, Lcom/mobclix/android/sdk/MobclixMMABannerXLAdView;

    if-eqz v5, :cond_0

    .line 121
    :cond_0
    instance-of v5, v0, Lcom/mobclix/android/sdk/MobclixIABRectangleMAdView;

    if-eqz v5, :cond_3

    move v2, v3

    .line 127
    :goto_1
    invoke-virtual {p0}, Lcom/flurry/android/eh;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    .line 128
    int-to-float v1, v1

    mul-float/2addr v1, v3

    add-float/2addr v1, v6

    float-to-int v1, v1

    .line 129
    int-to-float v2, v2

    mul-float/2addr v2, v3

    add-float/2addr v2, v6

    float-to-int v2, v2

    .line 130
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v3}, Lcom/mobclix/android/sdk/MobclixAdView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 131
    const/16 v1, 0xe

    invoke-virtual {v0, v1}, Lcom/mobclix/android/sdk/MobclixAdView;->setForegroundGravity(I)V

    .line 135
    invoke-virtual {p0, v0}, Lcom/flurry/android/eh;->addView(Landroid/view/View;)V

    .line 138
    const-wide/16 v1, -0x1

    invoke-virtual {v0, v1, v2}, Lcom/mobclix/android/sdk/MobclixAdView;->setRefreshTime(J)V

    .line 139
    return-void

    .line 54
    :cond_1
    if-lt v5, v2, :cond_2

    if-lt v0, v3, :cond_2

    sget-object v0, Lcom/flurry/android/eh;->m:Ljava/lang/String;

    const-string v5, "Determined Mobclix AdSize as IAB_RECT"

    invoke-static {v0, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/mobclix/android/sdk/MobclixIABRectangleMAdView;

    check-cast p1, Landroid/app/Activity;

    invoke-direct {v0, p1}, Lcom/mobclix/android/sdk/MobclixIABRectangleMAdView;-><init>(Landroid/content/Context;)V

    goto :goto_0

    :cond_2
    sget-object v0, Lcom/flurry/android/eh;->m:Ljava/lang/String;

    const-string v5, "Could not find Mobclix AdSize that matches size"

    invoke-static {v0, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    goto :goto_0

    :cond_3
    move v1, v2

    move v2, v4

    goto :goto_1
.end method
