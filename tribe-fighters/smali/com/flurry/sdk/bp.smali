.class public final Lcom/flurry/sdk/bp;
.super Lcom/flurry/android/AdNetworkView;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/bp$1;,
        Lcom/flurry/sdk/bp$c;,
        Lcom/flurry/sdk/bp$d;,
        Lcom/flurry/sdk/bp$b;,
        Lcom/flurry/sdk/bp$a;
    }
.end annotation


# static fields
.field private static final a:Ljava/lang/String;

.field private static final b:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/flurry/sdk/bp$b;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private c:Lcom/mobclix/android/sdk/MobclixAdView;

.field private d:Lcom/mobclix/android/sdk/MobclixAdViewListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    const-class v0, Lcom/flurry/sdk/bp;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flurry/sdk/bp;->a:Ljava/lang/String;

    .line 26
    invoke-static {}, Lcom/flurry/sdk/bp;->b()Landroid/util/SparseArray;

    move-result-object v0

    sput-object v0, Lcom/flurry/sdk/bp;->b:Landroid/util/SparseArray;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/AdCreative;Landroid/os/Bundle;)V
    .locals 1

    .prologue
    .line 33
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/flurry/android/AdNetworkView;-><init>(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/AdCreative;)V

    .line 34
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/bp;->setFocusable(Z)V

    .line 35
    return-void
.end method

.method private static a(Landroid/content/Context;I)Lcom/mobclix/android/sdk/MobclixAdView;
    .locals 2

    .prologue
    .line 105
    const/4 v1, 0x0

    .line 106
    sget-object v0, Lcom/flurry/sdk/bp;->b:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/bp$b;

    .line 107
    if-eqz v0, :cond_0

    .line 108
    invoke-interface {v0, p0}, Lcom/flurry/sdk/bp$b;->a(Landroid/content/Context;)Lcom/mobclix/android/sdk/MobclixAdView;

    move-result-object v0

    .line 110
    :goto_0
    return-object v0

    :cond_0
    move-object v0, v1

    goto :goto_0
.end method

.method static synthetic a()Ljava/lang/String;
    .locals 1

    .prologue
    .line 24
    sget-object v0, Lcom/flurry/sdk/bp;->a:Ljava/lang/String;

    return-object v0
.end method

.method private static b()Landroid/util/SparseArray;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/SparseArray",
            "<",
            "Lcom/flurry/sdk/bp$b;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 97
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 98
    const/4 v1, 0x1

    new-instance v2, Lcom/flurry/sdk/bp$d;

    invoke-direct {v2, v3}, Lcom/flurry/sdk/bp$d;-><init>(Lcom/flurry/sdk/bp$1;)V

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 99
    const/4 v1, 0x2

    new-instance v2, Lcom/flurry/sdk/bp$c;

    invoke-direct {v2, v3}, Lcom/flurry/sdk/bp$c;-><init>(Lcom/flurry/sdk/bp$1;)V

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 101
    return-object v0
.end method


# virtual methods
.method getAdListener()Lcom/mobclix/android/sdk/MobclixAdViewListener;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/flurry/sdk/bp;->d:Lcom/mobclix/android/sdk/MobclixAdViewListener;

    return-object v0
.end method

.method getAdView()Lcom/mobclix/android/sdk/MobclixAdView;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/flurry/sdk/bp;->c:Lcom/mobclix/android/sdk/MobclixAdView;

    return-object v0
.end method

.method public initLayout()V
    .locals 7

    .prologue
    const/4 v3, 0x6

    const/high16 v6, 0x3f000000    # 0.5f

    .line 57
    new-instance v0, Landroid/graphics/Point;

    invoke-virtual {p0}, Lcom/flurry/sdk/bp;->getAdCreative()Lcom/flurry/android/AdCreative;

    move-result-object v1

    invoke-virtual {v1}, Lcom/flurry/android/AdCreative;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Lcom/flurry/sdk/bp;->getAdCreative()Lcom/flurry/android/AdCreative;

    move-result-object v2

    invoke-virtual {v2}, Lcom/flurry/android/AdCreative;->getHeight()I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/graphics/Point;-><init>(II)V

    invoke-static {v0}, Lcom/flurry/sdk/bq;->a(Landroid/graphics/Point;)I

    move-result v2

    .line 59
    const/4 v0, -0x1

    if-ne v0, v2, :cond_0

    .line 60
    sget-object v0, Lcom/flurry/sdk/bp;->a:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Could not find Mobclix AdSize that matches {width = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/flurry/sdk/bp;->getAdCreative()Lcom/flurry/android/AdCreative;

    move-result-object v2

    invoke-virtual {v2}, Lcom/flurry/android/AdCreative;->getWidth()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", height "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/flurry/sdk/bp;->getAdCreative()Lcom/flurry/android/AdCreative;

    move-result-object v2

    invoke-virtual {v2}, Lcom/flurry/android/AdCreative;->getHeight()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "}"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v0, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 94
    :goto_0
    return-void

    .line 65
    :cond_0
    invoke-virtual {p0}, Lcom/flurry/sdk/bp;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v2}, Lcom/flurry/sdk/bp;->a(Landroid/content/Context;I)Lcom/mobclix/android/sdk/MobclixAdView;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/bp;->c:Lcom/mobclix/android/sdk/MobclixAdView;

    .line 66
    iget-object v0, p0, Lcom/flurry/sdk/bp;->c:Lcom/mobclix/android/sdk/MobclixAdView;

    if-nez v0, :cond_1

    .line 67
    sget-object v0, Lcom/flurry/sdk/bp;->a:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Could not create Mobclix view that matches {width = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/flurry/sdk/bp;->getAdCreative()Lcom/flurry/android/AdCreative;

    move-result-object v2

    invoke-virtual {v2}, Lcom/flurry/android/AdCreative;->getWidth()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", height "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/flurry/sdk/bp;->getAdCreative()Lcom/flurry/android/AdCreative;

    move-result-object v2

    invoke-virtual {v2}, Lcom/flurry/android/AdCreative;->getHeight()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "}"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v0, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 72
    :cond_1
    new-instance v0, Lcom/flurry/sdk/bp$a;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/flurry/sdk/bp$a;-><init>(Lcom/flurry/sdk/bp;Lcom/flurry/sdk/bp$1;)V

    iput-object v0, p0, Lcom/flurry/sdk/bp;->d:Lcom/mobclix/android/sdk/MobclixAdViewListener;

    .line 73
    iget-object v0, p0, Lcom/flurry/sdk/bp;->c:Lcom/mobclix/android/sdk/MobclixAdView;

    iget-object v1, p0, Lcom/flurry/sdk/bp;->d:Lcom/mobclix/android/sdk/MobclixAdViewListener;

    invoke-virtual {v0, v1}, Lcom/mobclix/android/sdk/MobclixAdView;->addMobclixAdViewListener(Lcom/mobclix/android/sdk/MobclixAdViewListener;)Z

    .line 75
    const/16 v1, 0x140

    .line 76
    const/16 v0, 0x32

    .line 77
    invoke-static {v2}, Lcom/flurry/sdk/bq;->a(I)Landroid/graphics/Point;

    move-result-object v2

    .line 78
    if-eqz v2, :cond_2

    .line 79
    iget v1, v2, Landroid/graphics/Point;->x:I

    .line 80
    iget v0, v2, Landroid/graphics/Point;->y:I

    .line 83
    :cond_2
    const/4 v2, 0x3

    sget-object v3, Lcom/flurry/sdk/bp;->a:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Determined Mobclix AdSize as "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "x"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 85
    invoke-virtual {p0}, Lcom/flurry/sdk/bp;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    .line 86
    int-to-float v1, v1

    mul-float/2addr v1, v2

    add-float/2addr v1, v6

    float-to-int v1, v1

    .line 87
    int-to-float v0, v0

    mul-float/2addr v0, v2

    add-float/2addr v0, v6

    float-to-int v0, v0

    .line 88
    iget-object v2, p0, Lcom/flurry/sdk/bp;->c:Lcom/mobclix/android/sdk/MobclixAdView;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v1, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3}, Lcom/mobclix/android/sdk/MobclixAdView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 89
    const/16 v0, 0x11

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/bp;->setGravity(I)V

    .line 91
    iget-object v0, p0, Lcom/flurry/sdk/bp;->c:Lcom/mobclix/android/sdk/MobclixAdView;

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/bp;->addView(Landroid/view/View;)V

    .line 92
    iget-object v0, p0, Lcom/flurry/sdk/bp;->c:Lcom/mobclix/android/sdk/MobclixAdView;

    const-wide/16 v1, -0x1

    invoke-virtual {v0, v1, v2}, Lcom/mobclix/android/sdk/MobclixAdView;->setRefreshTime(J)V

    .line 93
    iget-object v0, p0, Lcom/flurry/sdk/bp;->c:Lcom/mobclix/android/sdk/MobclixAdView;

    invoke-virtual {v0}, Lcom/mobclix/android/sdk/MobclixAdView;->getAd()V

    goto/16 :goto_0
.end method
