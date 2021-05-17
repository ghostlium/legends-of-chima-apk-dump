.class public final Lcom/flurry/sdk/bb;
.super Lcom/flurry/android/AdNetworkView;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/bb$1;,
        Lcom/flurry/sdk/bb$a;
    }
.end annotation


# static fields
.field private static final a:Ljava/lang/String;


# instance fields
.field private final b:Ljava/lang/String;

.field private final c:Ljava/lang/String;

.field private final d:Z

.field private e:Lcom/google/ads/AdView;

.field private f:Lcom/google/ads/AdListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 26
    const-class v0, Lcom/flurry/sdk/bb;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flurry/sdk/bb;->a:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/AdCreative;Landroid/os/Bundle;)V
    .locals 1

    .prologue
    .line 37
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/flurry/android/AdNetworkView;-><init>(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/AdCreative;)V

    .line 38
    const-string v0, "com.flurry.admob.MY_AD_UNIT_ID"

    invoke-virtual {p5, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/bb;->b:Ljava/lang/String;

    .line 39
    const-string v0, "com.flurry.admob.MYTEST_AD_DEVICE_ID"

    invoke-virtual {p5, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/bb;->c:Ljava/lang/String;

    .line 40
    const-string v0, "com.flurry.admob.test"

    invoke-virtual {p5, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/flurry/sdk/bb;->d:Z

    .line 41
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/bb;->setFocusable(Z)V

    .line 42
    return-void
.end method

.method private a(II)Lcom/google/ads/AdSize;
    .locals 3

    .prologue
    .line 63
    const/16 v0, 0x2d8

    if-lt p1, v0, :cond_0

    const/16 v0, 0x5a

    if-lt p2, v0, :cond_0

    .line 64
    sget-object v0, Lcom/google/ads/AdSize;->IAB_LEADERBOARD:Lcom/google/ads/AdSize;

    .line 73
    :goto_0
    return-object v0

    .line 65
    :cond_0
    const/16 v0, 0x1d4

    if-lt p1, v0, :cond_1

    const/16 v0, 0x3c

    if-lt p2, v0, :cond_1

    .line 66
    sget-object v0, Lcom/google/ads/AdSize;->IAB_BANNER:Lcom/google/ads/AdSize;

    goto :goto_0

    .line 67
    :cond_1
    const/16 v0, 0x140

    if-lt p1, v0, :cond_2

    const/16 v0, 0x32

    if-lt p2, v0, :cond_2

    .line 68
    sget-object v0, Lcom/google/ads/AdSize;->BANNER:Lcom/google/ads/AdSize;

    goto :goto_0

    .line 69
    :cond_2
    const/16 v0, 0x12c

    if-lt p1, v0, :cond_3

    const/16 v0, 0xfa

    if-lt p2, v0, :cond_3

    .line 70
    sget-object v0, Lcom/google/ads/AdSize;->IAB_MRECT:Lcom/google/ads/AdSize;

    goto :goto_0

    .line 72
    :cond_3
    const/4 v0, 0x3

    sget-object v1, Lcom/flurry/sdk/bb;->a:Ljava/lang/String;

    const-string v2, "Could not find AdMob AdSize that matches size"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 73
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private a(Landroid/content/Context;II)Lcom/google/ads/AdSize;
    .locals 3

    .prologue
    .line 146
    .line 147
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 148
    iget v0, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v0, v0

    iget v2, v1, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v0, v2

    float-to-int v0, v0

    .line 149
    iget v2, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v2, v2

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    div-float v1, v2, v1

    float-to-int v1, v1

    .line 151
    if-lez p2, :cond_0

    if-le p2, v1, :cond_1

    :cond_0
    move p2, v1

    .line 152
    :cond_1
    if-lez p3, :cond_2

    if-le p3, v0, :cond_3

    :cond_2
    move p3, v0

    .line 154
    :cond_3
    invoke-direct {p0, p2, p3}, Lcom/flurry/sdk/bb;->a(II)Lcom/google/ads/AdSize;

    move-result-object v0

    .line 156
    return-object v0
.end method

.method static synthetic a()Ljava/lang/String;
    .locals 1

    .prologue
    .line 25
    sget-object v0, Lcom/flurry/sdk/bb;->a:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method getAdListener()Lcom/google/ads/AdListener;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/flurry/sdk/bb;->f:Lcom/google/ads/AdListener;

    return-object v0
.end method

.method getAdView()Lcom/google/ads/AdView;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/flurry/sdk/bb;->e:Lcom/google/ads/AdView;

    return-object v0
.end method

.method public initLayout()V
    .locals 8

    .prologue
    const/4 v7, 0x3

    .line 79
    invoke-virtual {p0}, Lcom/flurry/sdk/bb;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 80
    invoke-virtual {p0}, Lcom/flurry/sdk/bb;->getAdCreative()Lcom/flurry/android/AdCreative;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/AdCreative;->getWidth()I

    move-result v0

    .line 81
    invoke-virtual {p0}, Lcom/flurry/sdk/bb;->getAdCreative()Lcom/flurry/android/AdCreative;

    move-result-object v2

    invoke-virtual {v2}, Lcom/flurry/android/AdCreative;->getHeight()I

    move-result v2

    .line 82
    invoke-direct {p0, v1, v0, v2}, Lcom/flurry/sdk/bb;->a(Landroid/content/Context;II)Lcom/google/ads/AdSize;

    move-result-object v3

    .line 83
    if-nez v3, :cond_0

    .line 84
    const/4 v1, 0x6

    sget-object v3, Lcom/flurry/sdk/bb;->a:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Could not find Admob AdSize that matches {width = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, ", height "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "}"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v3, v0}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 112
    :goto_0
    return-void

    .line 89
    :cond_0
    sget-object v4, Lcom/flurry/sdk/bb;->a:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Determined Admob AdSize as "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " that best matches {width = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, ", height = "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "}"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v7, v4, v0}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 92
    new-instance v0, Lcom/flurry/sdk/bb$a;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Lcom/flurry/sdk/bb$a;-><init>(Lcom/flurry/sdk/bb;Lcom/flurry/sdk/bb$1;)V

    iput-object v0, p0, Lcom/flurry/sdk/bb;->f:Lcom/google/ads/AdListener;

    .line 93
    new-instance v2, Lcom/google/ads/AdView;

    move-object v0, v1

    check-cast v0, Landroid/app/Activity;

    iget-object v4, p0, Lcom/flurry/sdk/bb;->b:Ljava/lang/String;

    invoke-direct {v2, v0, v3, v4}, Lcom/google/ads/AdView;-><init>(Landroid/app/Activity;Lcom/google/ads/AdSize;Ljava/lang/String;)V

    iput-object v2, p0, Lcom/flurry/sdk/bb;->e:Lcom/google/ads/AdView;

    .line 94
    iget-object v0, p0, Lcom/flurry/sdk/bb;->e:Lcom/google/ads/AdView;

    iget-object v2, p0, Lcom/flurry/sdk/bb;->f:Lcom/google/ads/AdListener;

    invoke-virtual {v0, v2}, Lcom/google/ads/AdView;->setAdListener(Lcom/google/ads/AdListener;)V

    .line 96
    const/16 v0, 0x11

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/bb;->setGravity(I)V

    .line 97
    iget-object v0, p0, Lcom/flurry/sdk/bb;->e:Lcom/google/ads/AdView;

    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v3, v1}, Lcom/google/ads/AdSize;->getWidthInPixels(Landroid/content/Context;)I

    move-result v4

    invoke-virtual {v3, v1}, Lcom/google/ads/AdSize;->getHeightInPixels(Landroid/content/Context;)I

    move-result v1

    invoke-direct {v2, v4, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0, v2}, Lcom/flurry/sdk/bb;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 101
    new-instance v0, Lcom/google/ads/AdRequest;

    invoke-direct {v0}, Lcom/google/ads/AdRequest;-><init>()V

    .line 102
    iget-boolean v1, p0, Lcom/flurry/sdk/bb;->d:Z

    if-eqz v1, :cond_1

    .line 103
    sget-object v1, Lcom/flurry/sdk/bb;->a:Ljava/lang/String;

    const-string v2, "Admob AdView set to Test Mode."

    invoke-static {v7, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 104
    sget-object v1, Lcom/google/ads/AdRequest;->TEST_EMULATOR:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/ads/AdRequest;->addTestDevice(Ljava/lang/String;)Lcom/google/ads/AdRequest;

    .line 106
    iget-object v1, p0, Lcom/flurry/sdk/bb;->c:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 107
    iget-object v1, p0, Lcom/flurry/sdk/bb;->c:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/ads/AdRequest;->addTestDevice(Ljava/lang/String;)Lcom/google/ads/AdRequest;

    .line 111
    :cond_1
    iget-object v1, p0, Lcom/flurry/sdk/bb;->e:Lcom/google/ads/AdView;

    invoke-virtual {v1, v0}, Lcom/google/ads/AdView;->loadAd(Lcom/google/ads/AdRequest;)V

    goto/16 :goto_0
.end method
