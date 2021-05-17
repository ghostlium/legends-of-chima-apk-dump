.class public final Lcom/flurry/sdk/be;
.super Lcom/flurry/android/AdNetworkView;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/be$1;,
        Lcom/flurry/sdk/be$a;
    }
.end annotation


# static fields
.field private static final a:Ljava/lang/String;


# instance fields
.field private final b:Ljava/lang/String;

.field private c:Lcom/inmobi/androidsdk/IMAdView;

.field private d:Lcom/inmobi/androidsdk/IMAdListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    const-class v0, Lcom/flurry/sdk/be;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flurry/sdk/be;->a:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/AdCreative;Landroid/os/Bundle;)V
    .locals 1

    .prologue
    .line 34
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/flurry/android/AdNetworkView;-><init>(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/AdCreative;)V

    .line 35
    const-string v0, "com.flurry.inmobi.MY_APP_ID"

    invoke-virtual {p5, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/be;->b:Ljava/lang/String;

    .line 36
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/be;->setFocusable(Z)V

    .line 37
    return-void
.end method

.method static synthetic a()Ljava/lang/String;
    .locals 1

    .prologue
    .line 24
    sget-object v0, Lcom/flurry/sdk/be;->a:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method getAdListener()Lcom/inmobi/androidsdk/IMAdListener;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/flurry/sdk/be;->d:Lcom/inmobi/androidsdk/IMAdListener;

    return-object v0
.end method

.method getAdView()Lcom/inmobi/androidsdk/IMAdView;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/flurry/sdk/be;->c:Lcom/inmobi/androidsdk/IMAdView;

    return-object v0
.end method

.method public initLayout()V
    .locals 8

    .prologue
    const/4 v7, -0x1

    const/high16 v6, 0x3f000000    # 0.5f

    const/4 v5, 0x3

    .line 59
    invoke-virtual {p0}, Lcom/flurry/sdk/be;->getAdCreative()Lcom/flurry/android/AdCreative;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/AdCreative;->getWidth()I

    move-result v3

    .line 60
    invoke-virtual {p0}, Lcom/flurry/sdk/be;->getAdCreative()Lcom/flurry/android/AdCreative;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/AdCreative;->getHeight()I

    move-result v1

    .line 62
    invoke-virtual {p0}, Lcom/flurry/sdk/be;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    .line 63
    iget v0, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v0, v0

    iget v4, v2, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v0, v4

    float-to-int v0, v0

    .line 64
    iget v4, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v4, v4

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    div-float v2, v4, v2

    float-to-int v2, v2

    .line 66
    if-lez v3, :cond_0

    if-le v3, v2, :cond_3

    .line 67
    :cond_0
    :goto_0
    if-lez v1, :cond_1

    if-le v1, v0, :cond_4

    .line 69
    :cond_1
    :goto_1
    new-instance v4, Landroid/graphics/Point;

    invoke-direct {v4, v2, v0}, Landroid/graphics/Point;-><init>(II)V

    invoke-static {v4}, Lcom/flurry/sdk/bf;->a(Landroid/graphics/Point;)I

    move-result v2

    .line 72
    if-eq v7, v2, :cond_5

    .line 73
    new-instance v1, Lcom/inmobi/androidsdk/IMAdView;

    invoke-virtual {p0}, Lcom/flurry/sdk/be;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    iget-object v3, p0, Lcom/flurry/sdk/be;->b:Ljava/lang/String;

    invoke-direct {v1, v0, v2, v3}, Lcom/inmobi/androidsdk/IMAdView;-><init>(Landroid/app/Activity;ILjava/lang/String;)V

    iput-object v1, p0, Lcom/flurry/sdk/be;->c:Lcom/inmobi/androidsdk/IMAdView;

    .line 75
    const/16 v1, 0x140

    .line 76
    const/16 v0, 0x32

    .line 77
    invoke-static {v2}, Lcom/flurry/sdk/bf;->a(I)Landroid/graphics/Point;

    move-result-object v2

    .line 78
    if-eqz v2, :cond_2

    .line 79
    iget v1, v2, Landroid/graphics/Point;->x:I

    .line 80
    iget v0, v2, Landroid/graphics/Point;->y:I

    .line 83
    :cond_2
    sget-object v2, Lcom/flurry/sdk/be;->a:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Determined InMobi AdSize as "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "x"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v2, v3}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 86
    invoke-virtual {p0}, Lcom/flurry/sdk/be;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    .line 87
    int-to-float v1, v1

    mul-float/2addr v1, v2

    add-float/2addr v1, v6

    float-to-int v1, v1

    .line 88
    int-to-float v0, v0

    mul-float/2addr v0, v2

    add-float/2addr v0, v6

    float-to-int v0, v0

    .line 89
    iget-object v2, p0, Lcom/flurry/sdk/be;->c:Lcom/inmobi/androidsdk/IMAdView;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v1, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3}, Lcom/inmobi/androidsdk/IMAdView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 92
    new-instance v0, Lcom/flurry/sdk/be$a;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/flurry/sdk/be$a;-><init>(Lcom/flurry/sdk/be;Lcom/flurry/sdk/be$1;)V

    iput-object v0, p0, Lcom/flurry/sdk/be;->d:Lcom/inmobi/androidsdk/IMAdListener;

    .line 93
    iget-object v0, p0, Lcom/flurry/sdk/be;->c:Lcom/inmobi/androidsdk/IMAdView;

    iget-object v1, p0, Lcom/flurry/sdk/be;->d:Lcom/inmobi/androidsdk/IMAdListener;

    invoke-virtual {v0, v1}, Lcom/inmobi/androidsdk/IMAdView;->setIMAdListener(Lcom/inmobi/androidsdk/IMAdListener;)V

    .line 94
    const/16 v0, 0x11

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/be;->setGravity(I)V

    .line 95
    iget-object v0, p0, Lcom/flurry/sdk/be;->c:Lcom/inmobi/androidsdk/IMAdView;

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/be;->addView(Landroid/view/View;)V

    .line 97
    new-instance v0, Lcom/inmobi/androidsdk/IMAdRequest;

    invoke-direct {v0}, Lcom/inmobi/androidsdk/IMAdRequest;-><init>()V

    .line 98
    iget-object v1, p0, Lcom/flurry/sdk/be;->c:Lcom/inmobi/androidsdk/IMAdView;

    invoke-virtual {v1, v0}, Lcom/inmobi/androidsdk/IMAdView;->setIMAdRequest(Lcom/inmobi/androidsdk/IMAdRequest;)V

    .line 101
    iget-object v0, p0, Lcom/flurry/sdk/be;->c:Lcom/inmobi/androidsdk/IMAdView;

    invoke-virtual {v0, v7}, Lcom/inmobi/androidsdk/IMAdView;->setRefreshInterval(I)V

    .line 104
    iget-object v0, p0, Lcom/flurry/sdk/be;->c:Lcom/inmobi/androidsdk/IMAdView;

    invoke-virtual {v0}, Lcom/inmobi/androidsdk/IMAdView;->loadNewAd()V

    .line 110
    :goto_2
    return-void

    :cond_3
    move v2, v3

    .line 66
    goto/16 :goto_0

    :cond_4
    move v0, v1

    .line 67
    goto/16 :goto_1

    .line 106
    :cond_5
    sget-object v0, Lcom/flurry/sdk/be;->a:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not find InMobi AdSize that matches size "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v5, v0, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 108
    sget-object v0, Lcom/flurry/sdk/be;->a:Ljava/lang/String;

    const-string v1, "Could not load InMobi Ad"

    invoke-static {v5, v0, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_2
.end method
