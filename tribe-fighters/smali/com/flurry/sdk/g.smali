.class public Lcom/flurry/sdk/g;
.super Lcom/flurry/sdk/h;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnKeyListener;
.implements Landroid/media/MediaPlayer$OnCompletionListener;
.implements Landroid/media/MediaPlayer$OnErrorListener;
.implements Landroid/media/MediaPlayer$OnPreparedListener;
.implements Lcom/flurry/sdk/ad;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "SetJavaScriptEnabled"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/g$a;,
        Lcom/flurry/sdk/g$b;
    }
.end annotation


# static fields
.field private static b:Ljava/lang/String;


# instance fields
.field private A:Z

.field private B:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;",
            ">;"
        }
    .end annotation
.end field

.field private C:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/flurry/sdk/e;",
            ">;"
        }
    .end annotation
.end field

.field private D:Ljava/util/concurrent/ExecutorService;

.field private E:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field a:Ljava/lang/String;

.field private final c:Ljava/lang/String;

.field private final d:Ljava/lang/String;

.field private e:Landroid/app/ProgressDialog;

.field private f:Lcom/flurry/sdk/aa;

.field private g:Lcom/flurry/sdk/f;

.field private h:Z

.field private i:Landroid/webkit/WebView;

.field private j:I

.field private k:Z

.field private l:Landroid/webkit/WebViewClient;

.field private m:Landroid/webkit/WebChromeClient;

.field private n:Landroid/view/View;

.field private o:I

.field private p:Landroid/webkit/WebChromeClient$CustomViewCallback;

.field private q:Landroid/app/Dialog;

.field private r:Landroid/widget/FrameLayout;

.field private s:I

.field private t:Landroid/app/Dialog;

.field private u:Landroid/widget/FrameLayout;

.field private v:Z

.field private w:Z

.field private x:Z

.field private y:Landroid/app/AlertDialog;

.field private z:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 86
    const-string v0, "market"

    sput-object v0, Lcom/flurry/sdk/g;->b:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;I)V
    .locals 4

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 686
    invoke-direct {p0, p1, p2, p3}, Lcom/flurry/sdk/h;-><init>(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;)V

    .line 88
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/g;->c:Ljava/lang/String;

    .line 89
    const-string v0, "mraid.js"

    iput-object v0, p0, Lcom/flurry/sdk/g;->d:Ljava/lang/String;

    .line 128
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/flurry/sdk/g;->a:Ljava/lang/String;

    .line 687
    invoke-virtual {p0, v1}, Lcom/flurry/sdk/g;->setClickable(Z)V

    .line 689
    invoke-virtual {p0, p4}, Lcom/flurry/sdk/g;->setAdUnit(Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V

    .line 690
    invoke-virtual {p0, p5}, Lcom/flurry/sdk/g;->setAdFrameIndex(I)V

    .line 692
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getContext()Landroid/content/Context;

    move-result-object v0

    instance-of v0, v0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    .line 693
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 694
    invoke-virtual {v0}, Landroid/app/Activity;->getRequestedOrientation()I

    move-result v0

    iput v0, p0, Lcom/flurry/sdk/g;->j:I

    .line 697
    :cond_0
    new-instance v0, Lcom/flurry/sdk/ff;

    const-string v3, "FlurryAds"

    invoke-direct {v0, v3, v1}, Lcom/flurry/sdk/ff;-><init>(Ljava/lang/String;I)V

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/g;->D:Ljava/util/concurrent/ExecutorService;

    .line 700
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 701
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->d()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/g;->z:Ljava/util/List;

    .line 702
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->e()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne v0, v1, :cond_2

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/flurry/sdk/g;->A:Z

    .line 703
    iget-boolean v0, p0, Lcom/flurry/sdk/g;->A:Z

    if-eqz v0, :cond_1

    .line 705
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/g;->C:Ljava/util/Map;

    .line 706
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/g;->B:Ljava/util/Map;

    .line 707
    iget-object v0, p0, Lcom/flurry/sdk/g;->C:Ljava/util/Map;

    invoke-virtual {p3}, Lcom/flurry/sdk/e;->b()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 708
    iget-object v1, p0, Lcom/flurry/sdk/g;->B:Ljava/util/Map;

    invoke-virtual {p4}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->d()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->g()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 711
    :cond_1
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/g;->E:Ljava/util/List;

    .line 716
    :goto_1
    return-void

    :cond_2
    move v0, v2

    .line 702
    goto :goto_0

    .line 714
    :cond_3
    const/4 v0, 0x3

    iget-object v1, p0, Lcom/flurry/sdk/g;->c:Ljava/lang/String;

    const-string v2, "adunit is Null"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method static synthetic a(Lcom/flurry/sdk/g;I)I
    .locals 0

    .prologue
    .line 82
    iput p1, p0, Lcom/flurry/sdk/g;->o:I

    return p1
.end method

.method static synthetic a(Lcom/flurry/sdk/g;Landroid/app/Dialog;)Landroid/app/Dialog;
    .locals 0

    .prologue
    .line 82
    iput-object p1, p0, Lcom/flurry/sdk/g;->q:Landroid/app/Dialog;

    return-object p1
.end method

.method static synthetic a(Lcom/flurry/sdk/g;Landroid/view/View;)Landroid/view/View;
    .locals 0

    .prologue
    .line 82
    iput-object p1, p0, Lcom/flurry/sdk/g;->n:Landroid/view/View;

    return-object p1
.end method

.method static synthetic a(Lcom/flurry/sdk/g;Landroid/webkit/WebChromeClient$CustomViewCallback;)Landroid/webkit/WebChromeClient$CustomViewCallback;
    .locals 0

    .prologue
    .line 82
    iput-object p1, p0, Lcom/flurry/sdk/g;->p:Landroid/webkit/WebChromeClient$CustomViewCallback;

    return-object p1
.end method

.method static synthetic a(Lcom/flurry/sdk/g;Landroid/widget/FrameLayout;)Landroid/widget/FrameLayout;
    .locals 0

    .prologue
    .line 82
    iput-object p1, p0, Lcom/flurry/sdk/g;->r:Landroid/widget/FrameLayout;

    return-object p1
.end method

.method static synthetic a(Lcom/flurry/sdk/g;Ljava/lang/String;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;
    .locals 1

    .prologue
    .line 82
    invoke-direct {p0, p1}, Lcom/flurry/sdk/g;->c(Ljava/lang/String;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v0

    return-object v0
.end method

.method static synthetic a(Lcom/flurry/sdk/g;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/flurry/sdk/g;->c:Ljava/lang/String;

    return-object v0
.end method

.method private a(Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 1594
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 1595
    const-string v0, "\'{\"adComponents\":["

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1597
    iget-object v0, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object v0

    .line 1598
    invoke-static {v0}, Lcom/flurry/sdk/bv;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1599
    invoke-static {v2, v0}, Lcom/flurry/sdk/bv;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1601
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 1602
    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1604
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    .line 1605
    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->d()Ljava/util/List;

    move-result-object v0

    const/4 v5, 0x0

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->d()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1610
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_1

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_1

    if-eq v3, v2, :cond_1

    .line 1611
    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 1614
    :cond_1
    invoke-static {v0}, Lcom/flurry/sdk/fh;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1615
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1617
    const-string v0, ","

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 1620
    :cond_2
    const-string v0, "]}\'"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1621
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private a(Ljava/lang/String;II)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "II)",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1626
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getPlatformModule()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->b()Lcom/flurry/sdk/u;

    move-result-object v0

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v1

    invoke-virtual {v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->b()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p2, p3}, Lcom/flurry/sdk/u;->a(Ljava/lang/String;II)Ljava/util/List;

    move-result-object v2

    .line 1627
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    .line 1629
    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->d()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 1631
    iget-object v4, p0, Lcom/flurry/sdk/g;->B:Ljava/util/Map;

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->d()Ljava/util/List;

    move-result-object v1

    const/4 v5, 0x0

    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;

    invoke-virtual {v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->g()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v4, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 1634
    :cond_1
    return-object v2
.end method

.method private a(II)V
    .locals 7

    .prologue
    const/4 v4, 0x3

    const/4 v6, 0x1

    const/4 v5, -0x1

    .line 1322
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getContext()Landroid/content/Context;

    move-result-object v0

    instance-of v0, v0, Landroid/app/Activity;

    if-nez v0, :cond_1

    .line 1324
    iget-object v0, p0, Lcom/flurry/sdk/g;->c:Ljava/lang/String;

    const-string v1, "no activity present"

    invoke-static {v4, v0, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 1384
    :cond_0
    :goto_0
    return-void

    .line 1328
    :cond_1
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 1330
    iget-object v1, p0, Lcom/flurry/sdk/g;->t:Landroid/app/Dialog;

    if-nez v1, :cond_0

    .line 1335
    iget-object v1, p0, Lcom/flurry/sdk/g;->c:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "expand("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 1337
    iget-object v1, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    invoke-virtual {p0, v1}, Lcom/flurry/sdk/g;->indexOfChild(Landroid/view/View;)I

    move-result v1

    if-eq v5, v1, :cond_2

    .line 1339
    iget-object v1, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    invoke-virtual {p0, v1}, Lcom/flurry/sdk/g;->removeView(Landroid/view/View;)V

    .line 1342
    :cond_2
    invoke-virtual {v0}, Landroid/app/Activity;->getRequestedOrientation()I

    move-result v1

    iput v1, p0, Lcom/flurry/sdk/g;->s:I

    .line 1344
    iget-object v1, p0, Lcom/flurry/sdk/g;->u:Landroid/widget/FrameLayout;

    if-nez v1, :cond_3

    .line 1346
    new-instance v1, Landroid/widget/FrameLayout;

    invoke-direct {v1, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/flurry/sdk/g;->u:Landroid/widget/FrameLayout;

    .line 1347
    iget-object v1, p0, Lcom/flurry/sdk/g;->u:Landroid/widget/FrameLayout;

    const/high16 v2, -0x1000000

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    .line 1348
    iget-object v1, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-nez v1, :cond_3

    .line 1350
    iget-object v1, p0, Lcom/flurry/sdk/g;->u:Landroid/widget/FrameLayout;

    iget-object v2, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v4, 0x11

    invoke-direct {v3, v5, v5, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1356
    :cond_3
    iget-object v1, p0, Lcom/flurry/sdk/g;->t:Landroid/app/Dialog;

    if-nez v1, :cond_4

    .line 1358
    new-instance v1, Landroid/app/Dialog;

    const v2, 0x103000a

    invoke-direct {v1, v0, v2}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    iput-object v1, p0, Lcom/flurry/sdk/g;->t:Landroid/app/Dialog;

    .line 1360
    iget-object v1, p0, Lcom/flurry/sdk/g;->t:Landroid/app/Dialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-static {v1}, Lcom/flurry/sdk/bw;->a(Landroid/view/Window;)V

    .line 1361
    iget-object v1, p0, Lcom/flurry/sdk/g;->t:Landroid/app/Dialog;

    iget-object v2, p0, Lcom/flurry/sdk/g;->u:Landroid/widget/FrameLayout;

    new-instance v3, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v3, v5, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, v3}, Landroid/app/Dialog;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1364
    iget-object v1, p0, Lcom/flurry/sdk/g;->t:Landroid/app/Dialog;

    new-instance v2, Lcom/flurry/sdk/g$4;

    invoke-direct {v2, p0}, Lcom/flurry/sdk/g$4;-><init>(Lcom/flurry/sdk/g;)V

    invoke-virtual {v1, v2}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 1375
    iget-object v1, p0, Lcom/flurry/sdk/g;->t:Landroid/app/Dialog;

    invoke-virtual {v1, v6}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 1376
    iget-object v1, p0, Lcom/flurry/sdk/g;->t:Landroid/app/Dialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->show()V

    .line 1381
    :cond_4
    invoke-static {}, Lcom/flurry/sdk/bs;->a()I

    move-result v1

    invoke-static {v0, v1, v6}, Lcom/flurry/sdk/bs;->a(Landroid/app/Activity;IZ)Z

    .line 1383
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getPlatformModule()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v1

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v2

    invoke-virtual {v2}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->b()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Landroid/content/Context;Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method private a(Lcom/flurry/sdk/a;)V
    .locals 3

    .prologue
    .line 1310
    iget-object v0, p0, Lcom/flurry/sdk/g;->E:Ljava/util/List;

    iget-object v1, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    iget-object v1, v1, Lcom/flurry/sdk/p;->a:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    .line 1312
    iget-object v0, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "javascript:flurryadapter.callComplete(\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    iget-object v2, v2, Lcom/flurry/sdk/p;->a:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\');"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 1313
    iget-object v0, p0, Lcom/flurry/sdk/g;->E:Ljava/util/List;

    iget-object v1, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    iget-object v1, v1, Lcom/flurry/sdk/p;->a:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 1315
    :cond_0
    return-void
.end method

.method private a(Lcom/flurry/sdk/a;I)V
    .locals 4

    .prologue
    .line 720
    iget-boolean v0, p0, Lcom/flurry/sdk/g;->A:Z

    if-nez v0, :cond_2

    .line 722
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdFrameIndex()I

    move-result v0

    if-eq p2, v0, :cond_0

    iget-object v0, p0, Lcom/flurry/sdk/g;->z:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p2, v0, :cond_0

    .line 724
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->d()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;

    .line 725
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getCurrentFormat()Ljava/lang/String;

    move-result-object v1

    .line 726
    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->e()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdSpaceLayout;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdSpaceLayout;->e()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 727
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 729
    const-string v1, "takeover"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 731
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getPlatformModule()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdLog()Lcom/flurry/sdk/e;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/impl/ads/FlurryAdModule;->b(Lcom/flurry/sdk/e;)V

    .line 732
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getPlatformModule()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V

    .line 734
    new-instance v0, Landroid/content/Intent;

    invoke-static {}, Lcom/flurry/sdk/eg;->a()Lcom/flurry/sdk/eg;

    move-result-object v1

    invoke-virtual {v1}, Lcom/flurry/sdk/eg;->b()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 735
    const-string v1, "frameIndex"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 736
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getPlatformModule()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v1

    invoke-virtual {v1}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a()Lcom/flurry/sdk/q;

    move-result-object v1

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v3

    invoke-virtual {v3}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->b()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v0, v3}, Lcom/flurry/sdk/q;->a(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;)Z

    .line 764
    :cond_0
    :goto_0
    return-void

    .line 741
    :cond_1
    invoke-virtual {p0, p2}, Lcom/flurry/sdk/g;->setAdFrameIndex(I)V

    .line 742
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->initLayout()V

    goto :goto_0

    .line 748
    :cond_2
    iget-object v0, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    iget-object v0, v0, Lcom/flurry/sdk/p;->b:Ljava/util/Map;

    const-string v1, "guid"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 749
    if-eqz v0, :cond_0

    .line 751
    invoke-direct {p0, v0}, Lcom/flurry/sdk/g;->c(Ljava/lang/String;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/g;->setAdUnit(Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V

    .line 752
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->d()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/g;->z:Ljava/util/List;

    .line 753
    iget-object v0, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    iget-object v0, v0, Lcom/flurry/sdk/p;->d:Lcom/flurry/sdk/e;

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/g;->setAdLog(Lcom/flurry/sdk/e;)V

    .line 754
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->d()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 756
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getPlatformModule()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V

    .line 757
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getPlatformModule()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdLog()Lcom/flurry/sdk/e;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/impl/ads/FlurryAdModule;->b(Lcom/flurry/sdk/e;)V

    .line 759
    :cond_3
    invoke-virtual {p0, p2}, Lcom/flurry/sdk/g;->setAdFrameIndex(I)V

    .line 760
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/flurry/sdk/g;->A:Z

    .line 761
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->initLayout()V

    goto :goto_0
.end method

.method private a(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 961
    new-instance v0, Lcom/flurry/sdk/g$1;

    invoke-direct {v0, p0, p1}, Lcom/flurry/sdk/g$1;-><init>(Lcom/flurry/sdk/g;Ljava/lang/String;)V

    .line 1045
    iget-object v1, p0, Lcom/flurry/sdk/g;->D:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1, v0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 1046
    return-void
.end method

.method static synthetic a(Lcom/flurry/sdk/g;Z)Z
    .locals 0

    .prologue
    .line 82
    iput-boolean p1, p0, Lcom/flurry/sdk/g;->w:Z

    return p1
.end method

.method static synthetic b(Lcom/flurry/sdk/g;)Landroid/webkit/WebView;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    return-object v0
.end method

.method static synthetic b(Lcom/flurry/sdk/g;Ljava/lang/String;)Lcom/flurry/sdk/e;
    .locals 1

    .prologue
    .line 82
    invoke-direct {p0, p1}, Lcom/flurry/sdk/g;->b(Ljava/lang/String;)Lcom/flurry/sdk/e;

    move-result-object v0

    return-object v0
.end method

.method private b(Ljava/lang/String;)Lcom/flurry/sdk/e;
    .locals 2

    .prologue
    .line 1640
    iget-object v0, p0, Lcom/flurry/sdk/g;->C:Ljava/util/Map;

    if-nez v0, :cond_1

    .line 1642
    const/4 v0, 0x0

    .line 1651
    :cond_0
    :goto_0
    return-object v0

    .line 1645
    :cond_1
    iget-object v0, p0, Lcom/flurry/sdk/g;->C:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/e;

    .line 1646
    if-nez v0, :cond_0

    .line 1648
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getPlatformModule()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/flurry/sdk/bt;->a(Lcom/flurry/android/impl/ads/FlurryAdModule;Ljava/lang/String;)Lcom/flurry/sdk/e;

    move-result-object v0

    .line 1649
    iget-object v1, p0, Lcom/flurry/sdk/g;->C:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method private b(II)V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x0

    .line 1388
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getContext()Landroid/content/Context;

    move-result-object v0

    instance-of v0, v0, Landroid/app/Activity;

    if-nez v0, :cond_1

    .line 1390
    iget-object v0, p0, Lcom/flurry/sdk/g;->c:Ljava/lang/String;

    const-string v1, "no activity present"

    invoke-static {v5, v0, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 1427
    :cond_0
    :goto_0
    return-void

    .line 1394
    :cond_1
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 1396
    iget-object v1, p0, Lcom/flurry/sdk/g;->t:Landroid/app/Dialog;

    if-eqz v1, :cond_0

    .line 1401
    iget-object v1, p0, Lcom/flurry/sdk/g;->c:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "collapse("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v5, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 1402
    iget-object v1, p0, Lcom/flurry/sdk/g;->t:Landroid/app/Dialog;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/flurry/sdk/g;->t:Landroid/app/Dialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1404
    iget-object v1, p0, Lcom/flurry/sdk/g;->t:Landroid/app/Dialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->hide()V

    .line 1405
    iget-object v1, p0, Lcom/flurry/sdk/g;->t:Landroid/app/Dialog;

    invoke-virtual {v1, v4}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 1406
    iget-object v1, p0, Lcom/flurry/sdk/g;->t:Landroid/app/Dialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->dismiss()V

    .line 1408
    :cond_2
    iput-object v4, p0, Lcom/flurry/sdk/g;->t:Landroid/app/Dialog;

    .line 1410
    iget v1, p0, Lcom/flurry/sdk/g;->s:I

    invoke-static {v0, v1}, Lcom/flurry/sdk/bs;->a(Landroid/app/Activity;I)V

    .line 1412
    iget-object v1, p0, Lcom/flurry/sdk/g;->u:Landroid/widget/FrameLayout;

    if-eqz v1, :cond_4

    .line 1414
    iget-object v1, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    if-eqz v1, :cond_3

    const/4 v1, -0x1

    iget-object v2, p0, Lcom/flurry/sdk/g;->u:Landroid/widget/FrameLayout;

    iget-object v3, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->indexOfChild(Landroid/view/View;)I

    move-result v2

    if-eq v1, v2, :cond_3

    .line 1416
    iget-object v1, p0, Lcom/flurry/sdk/g;->u:Landroid/widget/FrameLayout;

    iget-object v2, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 1418
    :cond_3
    iput-object v4, p0, Lcom/flurry/sdk/g;->u:Landroid/widget/FrameLayout;

    .line 1421
    :cond_4
    iget-object v1, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-nez v1, :cond_5

    .line 1423
    iget-object v1, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    invoke-virtual {p0, v1}, Lcom/flurry/sdk/g;->addView(Landroid/view/View;)V

    .line 1426
    :cond_5
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getPlatformModule()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v1

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v2

    invoke-virtual {v2}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->b()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lcom/flurry/android/impl/ads/FlurryAdModule;->b(Landroid/content/Context;Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method static synthetic b(Lcom/flurry/sdk/g;Z)Z
    .locals 0

    .prologue
    .line 82
    iput-boolean p1, p0, Lcom/flurry/sdk/g;->v:Z

    return p1
.end method

.method private c(Ljava/lang/String;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;
    .locals 1

    .prologue
    .line 1656
    iget-object v0, p0, Lcom/flurry/sdk/g;->B:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 1658
    const/4 v0, 0x0

    .line 1661
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/g;->B:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    goto :goto_0
.end method

.method static synthetic c(Lcom/flurry/sdk/g;)V
    .locals 0

    .prologue
    .line 82
    invoke-direct {p0}, Lcom/flurry/sdk/g;->h()V

    return-void
.end method

.method static synthetic d(Lcom/flurry/sdk/g;)Z
    .locals 1

    .prologue
    .line 82
    iget-boolean v0, p0, Lcom/flurry/sdk/g;->w:Z

    return v0
.end method

.method static synthetic e(Lcom/flurry/sdk/g;)V
    .locals 0

    .prologue
    .line 82
    invoke-direct {p0}, Lcom/flurry/sdk/g;->m()V

    return-void
.end method

.method static synthetic f()Ljava/lang/String;
    .locals 1

    .prologue
    .line 82
    sget-object v0, Lcom/flurry/sdk/g;->b:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic f(Lcom/flurry/sdk/g;)Z
    .locals 1

    .prologue
    .line 82
    iget-boolean v0, p0, Lcom/flurry/sdk/g;->v:Z

    return v0
.end method

.method static synthetic g(Lcom/flurry/sdk/g;)V
    .locals 0

    .prologue
    .line 82
    invoke-direct {p0}, Lcom/flurry/sdk/g;->p()V

    return-void
.end method

.method private declared-synchronized g()Z
    .locals 1

    .prologue
    .line 490
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/flurry/sdk/g;->k:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized h()V
    .locals 1

    .prologue
    .line 495
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/sdk/g;->g()Z

    move-result v0

    if-nez v0, :cond_0

    .line 497
    invoke-direct {p0}, Lcom/flurry/sdk/g;->j()V

    .line 498
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/flurry/sdk/g;->setFlurryJsEnvInitialized(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 500
    :cond_0
    monitor-exit p0

    return-void

    .line 495
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method static synthetic h(Lcom/flurry/sdk/g;)V
    .locals 0

    .prologue
    .line 82
    invoke-direct {p0}, Lcom/flurry/sdk/g;->q()V

    return-void
.end method

.method private declared-synchronized i()V
    .locals 1

    .prologue
    .line 504
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    invoke-direct {p0, v0}, Lcom/flurry/sdk/g;->setFlurryJsEnvInitialized(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 505
    monitor-exit p0

    return-void

    .line 504
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method static synthetic i(Lcom/flurry/sdk/g;)V
    .locals 0

    .prologue
    .line 82
    invoke-direct {p0}, Lcom/flurry/sdk/g;->w()V

    return-void
.end method

.method private j()V
    .locals 3

    .prologue
    .line 509
    const/4 v0, 0x3

    iget-object v1, p0, Lcom/flurry/sdk/g;->c:Ljava/lang/String;

    const-string v2, "initializeFlurryJsEnv"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 511
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 512
    const-string v1, "javascript:(function() {"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 513
    const-string v1, "var Hogan={};(function(Hogan,useArrayBuffer){Hogan.Template=function(renderFunc,text,compiler,options){this.r=renderFunc||this.r;this.c=compiler;this.options=options;this.text=text||\"\";this.buf=useArrayBuffer?[]:\"\"};Hogan.Template.prototype={r:function(context,partials,indent){return\"\"},v:hoganEscape,t:coerceToString,render:function render(context,partials,indent){return this.ri([context],partials||{},indent)},ri:function(context,partials,indent){return this.r(context,partials,indent)},rp:function(name,context,partials,indent){var partial=partials[name];if(!partial)return\"\";if(this.c&&typeof partial==\"string\")partial=this.c.compile(partial,this.options);return partial.ri(context,partials,indent)},rs:function(context,partials,section){var tail=context[context.length-1];if(!isArray(tail)){section(context,partials,this);return}for(var i=0;i<tail.length;i++){context.push(tail[i]);section(context,partials,this);context.pop()}},s:function(val,ctx,partials,inverted,start,end,tags){var pass;if(isArray(val)&&val.length===0)return false;if(typeof val==\"function\")val=this.ls(val,ctx,partials,inverted,start,end,tags);pass=val===\"\"||!!val;if(!inverted&&pass&&ctx)ctx.push(typeof val==\"object\"?val:ctx[ctx.length-1]);return pass},d:function(key,ctx,partials,returnFound){var names=key.split(\".\"),val=this.f(names[0],ctx,partials,returnFound),cx=null;if(key===\".\"&&isArray(ctx[ctx.length-2]))return ctx[ctx.length-1];for(var i=1;i<names.length;i++)if(val&&typeof val==\"object\"&&names[i]in val){cx=val;val=val[names[i]]}else val=\"\";if(returnFound&&!val)return false;if(!returnFound&&typeof val==\"function\"){ctx.push(cx);val=this.lv(val,ctx,partials);ctx.pop()}return val},f:function(key,ctx,partials,returnFound){var val=false,v=null,found=false;for(var i=ctx.length-1;i>=0;i--){v=ctx[i];if(v&&typeof v==\"object\"&&key in v){val=v[key];found=true;break}}if(!found)return returnFound?false:\"\";if(!returnFound&&typeof val==\"function\")val=this.lv(val,ctx,partials);return val},ho:function(val,cx,partials,text,tags){var compiler=this.c;var options=this.options;options.delimiters=tags;var t=val.call(cx,text,function(t){return compiler.compile(t,options).render(cx,partials)});this.b(compiler.compile(t.toString(),options).render(cx,partials));return false},b:useArrayBuffer?function(s){this.buf.push(s)}:function(s){this.buf+=s},fl:useArrayBuffer?function(){var r=this.buf.join(\"\");this.buf=[];return r}:function(){var r=this.buf;this.buf=\"\";return r},ls:function(val,ctx,partials,inverted,start,end,tags){var cx=ctx[ctx.length-1],t=null;if(!inverted&&this.c&&val.length>0)return this.ho(val,cx,partials,this.text.substring(start,end),tags);t=val.call(cx);if(typeof t==\"function\")if(inverted)return true;else if(this.c)return this.ho(t,cx,partials,this.text.substring(start,end),tags);return t},lv:function(val,ctx,partials){var cx=ctx[ctx.length-1];var result=val.call(cx);if(typeof result==\"function\")result=result.call(cx);result=coerceToString(result);if(this.c&&~result.indexOf(\"{{\"))return this.c.compile(result,this.options).render(cx,partials);return result}};var rAmp=/&/g,rLt=/</g,rGt=/>/g,rApos=/\\\'/g,rQuot=/\\\"/g,hChars=/[&<>\\\"\\\']/;function coerceToString(val){return String(val===null||val===undefined?\"\":val)}function hoganEscape(str){str=coerceToString(str);return hChars.test(str)?str.replace(rAmp,\"&amp;\").replace(rLt,\"&lt;\").replace(rGt,\"&gt;\").replace(rApos,\"&#39;\").replace(rQuot,\"&quot;\"):str}var isArray=Array.isArray||function(a){return Object.prototype.toString.call(a)===\"[object Array]\"}})(typeof exports!==\"undefined\"?exports:Hogan);(function(Hogan){var rIsWhitespace=/\\S/,rQuot=/\\\"/g,rNewline=/\\n/g,rCr=/\\r/g,rSlash=/\\\\/g,tagTypes={\"#\":1,\"^\":2,\"/\":3,\"!\":4,\">\":5,\"<\":6,\"=\":7,\"_v\":8,\"{\":9,\"&\":10};Hogan.scan=function scan(text,delimiters){var len=text.length,IN_TEXT=0,IN_TAG_TYPE=1,IN_TAG=2,state=IN_TEXT,tagType=null,tag=null,buf=\"\",tokens=[],seenTag=false,i=0,lineStart=0,otag=\"{{\",ctag=\"}}\";function addBuf(){if(buf.length>0){tokens.push(new String(buf));buf=\"\"}}function lineIsWhitespace(){var isAllWhitespace=true;for(var j=lineStart;j<tokens.length;j++){isAllWhitespace=tokens[j].tag&&tagTypes[tokens[j].tag]<tagTypes[\"_v\"]||!tokens[j].tag&&tokens[j].match(rIsWhitespace)===null;if(!isAllWhitespace)return false}return isAllWhitespace}function filterLine(haveSeenTag,noNewLine){addBuf();if(haveSeenTag&&lineIsWhitespace())for(var j=lineStart,next;j<tokens.length;j++){if(!tokens[j].tag){if((next=tokens[j+1])&&next.tag==\">\")next.indent=tokens[j].toString();tokens.splice(j,1)}}else if(!noNewLine)tokens.push({tag:\"\\n\"});seenTag=false;lineStart=tokens.length}function changeDelimiters(text,index){var close=\"=\"+ctag,closeIndex=text.indexOf(close,index),delimiters=trim(text.substring(text.indexOf(\"=\",index)+1,closeIndex)).split(\" \");otag=delimiters[0];ctag=delimiters[1];return closeIndex+close.length-1}if(delimiters){delimiters=delimiters.split(\" \");otag=delimiters[0];ctag=delimiters[1]}for(i=0;i<len;i++)if(state==IN_TEXT)if(tagChange(otag,text,i)){--i;addBuf();state=IN_TAG_TYPE}else if(text.charAt(i)==\"\\n\")filterLine(seenTag);else buf+=text.charAt(i);else if(state==IN_TAG_TYPE){i+=otag.length-1;tag=tagTypes[text.charAt(i+1)];tagType=tag?text.charAt(i+1):\"_v\";if(tagType==\"=\"){i=changeDelimiters(text,i);state=IN_TEXT}else{if(tag)i++;state=IN_TAG}seenTag=i}else if(tagChange(ctag,text,i)){tokens.push({tag:tagType,n:trim(buf),otag:otag,ctag:ctag,i:tagType==\"/\"?seenTag-ctag.length:i+otag.length});buf=\"\";i+=ctag.length-1;state=IN_TEXT;if(tagType==\"{\")if(ctag==\"}}\")i++;else cleanTripleStache(tokens[tokens.length-1])}else buf+=text.charAt(i);filterLine(seenTag,true);return tokens};function cleanTripleStache(token){if(token.n.substr(token.n.length-1)===\"}\")token.n=token.n.substring(0,token.n.length-1)}function trim(s){if(s.trim)return s.trim();return s.replace(/^\\s*|\\s*$/g,\"\")}function tagChange(tag,text,index){if(text.charAt(index)!=tag.charAt(0))return false;for(var i=1,l=tag.length;i<l;i++)if(text.charAt(index+i)!=tag.charAt(i))return false;return true}function buildTree(tokens,kind,stack,customTags){var instructions=[],opener=null,token=null;while(tokens.length>0){token=tokens.shift();if(token.tag==\"#\"||token.tag==\"^\"||isOpener(token,customTags)){stack.push(token);token.nodes=buildTree(tokens,token.tag,stack,customTags);instructions.push(token)}else if(token.tag==\"/\"){if(stack.length===0)throw new Error(\"Closing tag without opener: /\"+token.n);opener=stack.pop();if(token.n!=opener.n&&!isCloser(token.n,opener.n,customTags))throw new Error(\"Nesting error: \"+opener.n+\" vs. \"+token.n);opener.end=token.i;return instructions}else instructions.push(token)}if(stack.length>0)throw new Error(\"missing closing tag: \"+stack.pop().n);return instructions}function isOpener(token,tags){for(var i=0,l=tags.length;i<l;i++)if(tags[i].o==token.n){token.tag=\"#\";return true}}function isCloser(close,open,tags){for(var i=0,l=tags.length;i<l;i++)if(tags[i].c==close&&tags[i].o==open)return true}function writeCode(tree){return\'var _=this;_.b(i=i||\"\");\'+walk(tree)+\"return _.fl();\"}Hogan.generate=function(code,text,options){if(options.asString)return\"function(c,p,i){\"+code+\";}\";return new Hogan.Template(new Function(\"c\",\"p\",\"i\",code),text,Hogan,options)};function esc(s){return s.replace(rSlash,\"\\\\\\\\\").replace(rQuot,\'\\\\\"\').replace(rNewline,\"\\\\n\").replace(rCr,\"\\\\r\")}function chooseMethod(s){return~s.indexOf(\".\")?\"d\":\"f\"}function walk(tree){var code=\"\";for(var i=0,l=tree.length;i<l;i++){var tag=tree[i].tag;if(tag==\"#\")code+=section(tree[i].nodes,tree[i].n,chooseMethod(tree[i].n),tree[i].i,tree[i].end,tree[i].otag+\" \"+tree[i].ctag);else if(tag==\"^\")code+=invertedSection(tree[i].nodes,tree[i].n,chooseMethod(tree[i].n));else if(tag==\"<\"||tag==\">\")code+=partial(tree[i]);else if(tag==\"{\"||tag==\"&\")code+=tripleStache(tree[i].n,chooseMethod(tree[i].n));else if(tag==\"\\n\")code+=text(\'\"\\\\n\"\'+(tree.length-1==i?\"\":\" + i\"));else if(tag==\"_v\")code+=variable(tree[i].n,chooseMethod(tree[i].n));else if(tag===undefined)code+=text(\'\"\'+esc(tree[i])+\'\"\')}return code}function section(nodes,id,method,start,end,tags){return\"if(_.s(_.\"+method+\'(\"\'+esc(id)+\'\",c,p,1),\'+\"c,p,0,\"+start+\",\"+end+\',\"\'+tags+\'\")){\'+\"_.rs(c,p,\"+\"function(c,p,_){\"+walk(nodes)+\"});c.pop();}\"}function invertedSection(nodes,id,method){return\"if(!_.s(_.\"+method+\'(\"\'+esc(id)+\'\",c,p,1),c,p,1,0,0,\"\")){\'+walk(nodes)+\"};\"}function partial(tok){return\'_.b(_.rp(\"\'+esc(tok.n)+\'\",c,p,\"\'+(tok.indent||\"\")+\'\"));\'}function tripleStache(id,method){return\"_.b(_.t(_.\"+method+\'(\"\'+esc(id)+\'\",c,p,0)));\'}function variable(id,method){return\"_.b(_.v(_.\"+method+\'(\"\'+esc(id)+\'\",c,p,0)));\'}function text(id){return\"_.b(\"+id+\");\"}Hogan.parse=function(tokens,text,options){options=options||{};return buildTree(tokens,\"\",[],options.sectionTags||[])},Hogan.cache={};Hogan.compile=function(text,options){options=options||{};var key=text+\"||\"+!!options.asString;var t=this.cache[key];if(t)return t;t=this.generate(writeCode(this.parse(this.scan(text,options.delimiters),text,options)),text,options);return this.cache[key]=t}})(typeof exports!==\"undefined\"?exports:Hogan);"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 514
    const-string v1, "var flurryBridgeCtor=function(w){var flurryadapter={};flurryadapter.flurryCallQueue=[];flurryadapter.flurryCallInProgress=false;flurryadapter.callComplete=function(cmd){if(this.flurryCallQueue.length==0){this.flurryCallInProgress=false;return}var adapterCall=this.flurryCallQueue.splice(0,1)[0];this.executeNativeCall(adapterCall);return\"OK\"};flurryadapter.executeCall=function(command){var adapterCall=\"flurry://flurrycall?event=\"+command;var value;for(var i=1;i<arguments.length;i+=2){value=arguments[i+1];if(value==null)continue;adapterCall+=\"&\"+arguments[i]+\"=\"+escape(value)}if(this.flurryCallInProgress)this.flurryCallQueue.push(adapterCall);else this.executeNativeCall(adapterCall)};flurryadapter.executeNativeCall=function(adapterCall){if(adapterCall.length==0)return;this.flurryCallInProgress=true;w.location=adapterCall};return flurryadapter};"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 515
    const-string v1, "window.Hogan=Hogan;window.flurryadapter=flurryBridgeCtor(window);"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 516
    const-string v1, "window.flurryAdapterAvailable=true;if(typeof window.FlurryAdapterReady === \'function\'){window.FlurryAdapterReady();}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 517
    const-string v1, "})();"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 519
    iget-object v1, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    if-eqz v1, :cond_0

    .line 520
    iget-object v1, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 522
    :cond_0
    return-void
.end method

.method static synthetic j(Lcom/flurry/sdk/g;)V
    .locals 0

    .prologue
    .line 82
    invoke-direct {p0}, Lcom/flurry/sdk/g;->i()V

    return-void
.end method

.method private k()V
    .locals 7

    .prologue
    const/4 v6, 0x3

    .line 526
    iget-object v0, p0, Lcom/flurry/sdk/g;->c:Ljava/lang/String;

    const-string v1, "activateFlurryJsEnv"

    invoke-static {v6, v0, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 528
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getCurrentContent()Ljava/lang/String;

    move-result-object v0

    .line 531
    iget-boolean v1, p0, Lcom/flurry/sdk/g;->A:Z

    if-nez v1, :cond_1

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_1

    const-string v1, "{}"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 536
    iget-object v1, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object v1

    .line 537
    invoke-static {v1}, Lcom/flurry/sdk/bv;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 538
    invoke-static {v2, v1}, Lcom/flurry/sdk/bv;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 539
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    if-eq v1, v2, :cond_0

    .line 540
    iget-object v3, p0, Lcom/flurry/sdk/g;->c:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "content before {{mustached}} tags replacement = \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v3, v4}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 541
    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 542
    iget-object v1, p0, Lcom/flurry/sdk/g;->c:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "content after {{mustached}} tags replacement = \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v6, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 545
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 546
    const-string v2, "javascript:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 547
    const-string v2, "(function(){"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 548
    const-string v2, "if(!window.Hogan){var Hogan={};(function(Hogan,useArrayBuffer){Hogan.Template=function(renderFunc,text,compiler,options){this.r=renderFunc||this.r;this.c=compiler;this.options=options;this.text=text||\"\";this.buf=useArrayBuffer?[]:\"\"};Hogan.Template.prototype={r:function(context,partials,indent){return\"\"},v:hoganEscape,t:coerceToString,render:function render(context,partials,indent){return this.ri([context],partials||{},indent)},ri:function(context,partials,indent){return this.r(context,partials,indent)},rp:function(name,context,partials,indent){var partial=partials[name];if(!partial)return\"\";if(this.c&&typeof partial==\"string\")partial=this.c.compile(partial,this.options);return partial.ri(context,partials,indent)},rs:function(context,partials,section){var tail=context[context.length-1];if(!isArray(tail)){section(context,partials,this);return}for(var i=0;i<tail.length;i++){context.push(tail[i]);section(context,partials,this);context.pop()}},s:function(val,ctx,partials,inverted,start,end,tags){var pass;if(isArray(val)&&val.length===0)return false;if(typeof val==\"function\")val=this.ls(val,ctx,partials,inverted,start,end,tags);pass=val===\"\"||!!val;if(!inverted&&pass&&ctx)ctx.push(typeof val==\"object\"?val:ctx[ctx.length-1]);return pass},d:function(key,ctx,partials,returnFound){var names=key.split(\".\"),val=this.f(names[0],ctx,partials,returnFound),cx=null;if(key===\".\"&&isArray(ctx[ctx.length-2]))return ctx[ctx.length-1];for(var i=1;i<names.length;i++)if(val&&typeof val==\"object\"&&names[i]in val){cx=val;val=val[names[i]]}else val=\"\";if(returnFound&&!val)return false;if(!returnFound&&typeof val==\"function\"){ctx.push(cx);val=this.lv(val,ctx,partials);ctx.pop()}return val},f:function(key,ctx,partials,returnFound){var val=false,v=null,found=false;for(var i=ctx.length-1;i>=0;i--){v=ctx[i];if(v&&typeof v==\"object\"&&key in v){val=v[key];found=true;break}}if(!found)return returnFound?false:\"\";if(!returnFound&&typeof val==\"function\")val=this.lv(val,ctx,partials);return val},ho:function(val,cx,partials,text,tags){var compiler=this.c;var options=this.options;options.delimiters=tags;var t=val.call(cx,text,function(t){return compiler.compile(t,options).render(cx,partials)});this.b(compiler.compile(t.toString(),options).render(cx,partials));return false},b:useArrayBuffer?function(s){this.buf.push(s)}:function(s){this.buf+=s},fl:useArrayBuffer?function(){var r=this.buf.join(\"\");this.buf=[];return r}:function(){var r=this.buf;this.buf=\"\";return r},ls:function(val,ctx,partials,inverted,start,end,tags){var cx=ctx[ctx.length-1],t=null;if(!inverted&&this.c&&val.length>0)return this.ho(val,cx,partials,this.text.substring(start,end),tags);t=val.call(cx);if(typeof t==\"function\")if(inverted)return true;else if(this.c)return this.ho(t,cx,partials,this.text.substring(start,end),tags);return t},lv:function(val,ctx,partials){var cx=ctx[ctx.length-1];var result=val.call(cx);if(typeof result==\"function\")result=result.call(cx);result=coerceToString(result);if(this.c&&~result.indexOf(\"{{\"))return this.c.compile(result,this.options).render(cx,partials);return result}};var rAmp=/&/g,rLt=/</g,rGt=/>/g,rApos=/\\\'/g,rQuot=/\\\"/g,hChars=/[&<>\\\"\\\']/;function coerceToString(val){return String(val===null||val===undefined?\"\":val)}function hoganEscape(str){str=coerceToString(str);return hChars.test(str)?str.replace(rAmp,\"&amp;\").replace(rLt,\"&lt;\").replace(rGt,\"&gt;\").replace(rApos,\"&#39;\").replace(rQuot,\"&quot;\"):str}var isArray=Array.isArray||function(a){return Object.prototype.toString.call(a)===\"[object Array]\"}})(typeof exports!==\"undefined\"?exports:Hogan);(function(Hogan){var rIsWhitespace=/\\S/,rQuot=/\\\"/g,rNewline=/\\n/g,rCr=/\\r/g,rSlash=/\\\\/g,tagTypes={\"#\":1,\"^\":2,\"/\":3,\"!\":4,\">\":5,\"<\":6,\"=\":7,\"_v\":8,\"{\":9,\"&\":10};Hogan.scan=function scan(text,delimiters){var len=text.length,IN_TEXT=0,IN_TAG_TYPE=1,IN_TAG=2,state=IN_TEXT,tagType=null,tag=null,buf=\"\",tokens=[],seenTag=false,i=0,lineStart=0,otag=\"{{\",ctag=\"}}\";function addBuf(){if(buf.length>0){tokens.push(new String(buf));buf=\"\"}}function lineIsWhitespace(){var isAllWhitespace=true;for(var j=lineStart;j<tokens.length;j++){isAllWhitespace=tokens[j].tag&&tagTypes[tokens[j].tag]<tagTypes[\"_v\"]||!tokens[j].tag&&tokens[j].match(rIsWhitespace)===null;if(!isAllWhitespace)return false}return isAllWhitespace}function filterLine(haveSeenTag,noNewLine){addBuf();if(haveSeenTag&&lineIsWhitespace())for(var j=lineStart,next;j<tokens.length;j++){if(!tokens[j].tag){if((next=tokens[j+1])&&next.tag==\">\")next.indent=tokens[j].toString();tokens.splice(j,1)}}else if(!noNewLine)tokens.push({tag:\"\\n\"});seenTag=false;lineStart=tokens.length}function changeDelimiters(text,index){var close=\"=\"+ctag,closeIndex=text.indexOf(close,index),delimiters=trim(text.substring(text.indexOf(\"=\",index)+1,closeIndex)).split(\" \");otag=delimiters[0];ctag=delimiters[1];return closeIndex+close.length-1}if(delimiters){delimiters=delimiters.split(\" \");otag=delimiters[0];ctag=delimiters[1]}for(i=0;i<len;i++)if(state==IN_TEXT)if(tagChange(otag,text,i)){--i;addBuf();state=IN_TAG_TYPE}else if(text.charAt(i)==\"\\n\")filterLine(seenTag);else buf+=text.charAt(i);else if(state==IN_TAG_TYPE){i+=otag.length-1;tag=tagTypes[text.charAt(i+1)];tagType=tag?text.charAt(i+1):\"_v\";if(tagType==\"=\"){i=changeDelimiters(text,i);state=IN_TEXT}else{if(tag)i++;state=IN_TAG}seenTag=i}else if(tagChange(ctag,text,i)){tokens.push({tag:tagType,n:trim(buf),otag:otag,ctag:ctag,i:tagType==\"/\"?seenTag-ctag.length:i+otag.length});buf=\"\";i+=ctag.length-1;state=IN_TEXT;if(tagType==\"{\")if(ctag==\"}}\")i++;else cleanTripleStache(tokens[tokens.length-1])}else buf+=text.charAt(i);filterLine(seenTag,true);return tokens};function cleanTripleStache(token){if(token.n.substr(token.n.length-1)===\"}\")token.n=token.n.substring(0,token.n.length-1)}function trim(s){if(s.trim)return s.trim();return s.replace(/^\\s*|\\s*$/g,\"\")}function tagChange(tag,text,index){if(text.charAt(index)!=tag.charAt(0))return false;for(var i=1,l=tag.length;i<l;i++)if(text.charAt(index+i)!=tag.charAt(i))return false;return true}function buildTree(tokens,kind,stack,customTags){var instructions=[],opener=null,token=null;while(tokens.length>0){token=tokens.shift();if(token.tag==\"#\"||token.tag==\"^\"||isOpener(token,customTags)){stack.push(token);token.nodes=buildTree(tokens,token.tag,stack,customTags);instructions.push(token)}else if(token.tag==\"/\"){if(stack.length===0)throw new Error(\"Closing tag without opener: /\"+token.n);opener=stack.pop();if(token.n!=opener.n&&!isCloser(token.n,opener.n,customTags))throw new Error(\"Nesting error: \"+opener.n+\" vs. \"+token.n);opener.end=token.i;return instructions}else instructions.push(token)}if(stack.length>0)throw new Error(\"missing closing tag: \"+stack.pop().n);return instructions}function isOpener(token,tags){for(var i=0,l=tags.length;i<l;i++)if(tags[i].o==token.n){token.tag=\"#\";return true}}function isCloser(close,open,tags){for(var i=0,l=tags.length;i<l;i++)if(tags[i].c==close&&tags[i].o==open)return true}function writeCode(tree){return\'var _=this;_.b(i=i||\"\");\'+walk(tree)+\"return _.fl();\"}Hogan.generate=function(code,text,options){if(options.asString)return\"function(c,p,i){\"+code+\";}\";return new Hogan.Template(new Function(\"c\",\"p\",\"i\",code),text,Hogan,options)};function esc(s){return s.replace(rSlash,\"\\\\\\\\\").replace(rQuot,\'\\\\\"\').replace(rNewline,\"\\\\n\").replace(rCr,\"\\\\r\")}function chooseMethod(s){return~s.indexOf(\".\")?\"d\":\"f\"}function walk(tree){var code=\"\";for(var i=0,l=tree.length;i<l;i++){var tag=tree[i].tag;if(tag==\"#\")code+=section(tree[i].nodes,tree[i].n,chooseMethod(tree[i].n),tree[i].i,tree[i].end,tree[i].otag+\" \"+tree[i].ctag);else if(tag==\"^\")code+=invertedSection(tree[i].nodes,tree[i].n,chooseMethod(tree[i].n));else if(tag==\"<\"||tag==\">\")code+=partial(tree[i]);else if(tag==\"{\"||tag==\"&\")code+=tripleStache(tree[i].n,chooseMethod(tree[i].n));else if(tag==\"\\n\")code+=text(\'\"\\\\n\"\'+(tree.length-1==i?\"\":\" + i\"));else if(tag==\"_v\")code+=variable(tree[i].n,chooseMethod(tree[i].n));else if(tag===undefined)code+=text(\'\"\'+esc(tree[i])+\'\"\')}return code}function section(nodes,id,method,start,end,tags){return\"if(_.s(_.\"+method+\'(\"\'+esc(id)+\'\",c,p,1),\'+\"c,p,0,\"+start+\",\"+end+\',\"\'+tags+\'\")){\'+\"_.rs(c,p,\"+\"function(c,p,_){\"+walk(nodes)+\"});c.pop();}\"}function invertedSection(nodes,id,method){return\"if(!_.s(_.\"+method+\'(\"\'+esc(id)+\'\",c,p,1),c,p,1,0,0,\"\")){\'+walk(nodes)+\"};\"}function partial(tok){return\'_.b(_.rp(\"\'+esc(tok.n)+\'\",c,p,\"\'+(tok.indent||\"\")+\'\"));\'}function tripleStache(id,method){return\"_.b(_.t(_.\"+method+\'(\"\'+esc(id)+\'\",c,p,0)));\'}function variable(id,method){return\"_.b(_.v(_.\"+method+\'(\"\'+esc(id)+\'\",c,p,0)));\'}function text(id){return\"_.b(\"+id+\");\"}Hogan.parse=function(tokens,text,options){options=options||{};return buildTree(tokens,\"\",[],options.sectionTags||[])},Hogan.cache={};Hogan.compile=function(text,options){options=options||{};var key=text+\"||\"+!!options.asString;var t=this.cache[key];if(t)return t;t=this.generate(writeCode(this.parse(this.scan(text,options.delimiters),text,options)),text,options);return this.cache[key]=t}})(typeof exports!==\"undefined\"?exports:Hogan);window.Hogan=Hogan;}"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 549
    const-string v2, "if(!window.flurryadapter){var flurryBridgeCtor=function(w){var flurryadapter={};flurryadapter.flurryCallQueue=[];flurryadapter.flurryCallInProgress=false;flurryadapter.callComplete=function(cmd){if(this.flurryCallQueue.length==0){this.flurryCallInProgress=false;return}var adapterCall=this.flurryCallQueue.splice(0,1)[0];this.executeNativeCall(adapterCall);return\"OK\"};flurryadapter.executeCall=function(command){var adapterCall=\"flurry://flurrycall?event=\"+command;var value;for(var i=1;i<arguments.length;i+=2){value=arguments[i+1];if(value==null)continue;adapterCall+=\"&\"+arguments[i]+\"=\"+escape(value)}if(this.flurryCallInProgress)this.flurryCallQueue.push(adapterCall);else this.executeNativeCall(adapterCall)};flurryadapter.executeNativeCall=function(adapterCall){if(adapterCall.length==0)return;this.flurryCallInProgress=true;w.location=adapterCall};return flurryadapter};window.flurryadapter=flurryBridgeCtor(window);}"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 550
    const-string v2, "if(!window.flurryAdapterAvailable){window.flurryAdapterAvailable=true;if(typeof window.FlurryAdapterReady === \'function\'){window.FlurryAdapterReady();} }"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 551
    invoke-static {v0}, Lcom/flurry/sdk/fh;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 552
    const-string v2, "var content=\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 553
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 554
    const-string v0, "\';var compiled=window.Hogan.compile(document.body.innerHTML);var rendered=compiled.render(JSON.parse(content));document.body.innerHTML=rendered;"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 555
    const-string v0, "})();"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 557
    iget-object v0, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    if-eqz v0, :cond_1

    .line 558
    iget-object v0, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 561
    :cond_1
    return-void
.end method

.method static synthetic k(Lcom/flurry/sdk/g;)V
    .locals 0

    .prologue
    .line 82
    invoke-direct {p0}, Lcom/flurry/sdk/g;->n()V

    return-void
.end method

.method static synthetic l(Lcom/flurry/sdk/g;)V
    .locals 0

    .prologue
    .line 82
    invoke-direct {p0}, Lcom/flurry/sdk/g;->k()V

    return-void
.end method

.method private declared-synchronized l()Z
    .locals 1

    .prologue
    .line 570
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/flurry/sdk/g;->x:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method static synthetic m(Lcom/flurry/sdk/g;)Landroid/app/ProgressDialog;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/flurry/sdk/g;->e:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method private declared-synchronized m()V
    .locals 1

    .prologue
    .line 575
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/sdk/g;->l()Z

    move-result v0

    if-nez v0, :cond_0

    .line 577
    invoke-direct {p0}, Lcom/flurry/sdk/g;->o()V

    .line 578
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/flurry/sdk/g;->setMraidJsEnvInitialized(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 580
    :cond_0
    monitor-exit p0

    return-void

    .line 575
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method static synthetic n(Lcom/flurry/sdk/g;)Ljava/util/List;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/flurry/sdk/g;->E:Ljava/util/List;

    return-object v0
.end method

.method private declared-synchronized n()V
    .locals 1

    .prologue
    .line 584
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    invoke-direct {p0, v0}, Lcom/flurry/sdk/g;->setMraidJsEnvInitialized(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 585
    monitor-exit p0

    return-void

    .line 584
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private o()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 589
    const/4 v0, 0x3

    iget-object v1, p0, Lcom/flurry/sdk/g;->c:Ljava/lang/String;

    const-string v2, "initializeMraid"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 591
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->d()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "interstitial"

    .line 594
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "{useCustomClose:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",isModal:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",width:undefined,height:undefined,placementType:\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\"}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 596
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 597
    const-string v2, "javascript:(function() {"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 598
    const-string v2, "var mraidCtor=function(flurryBridge,initState){var mraid={};var STATES=mraid.STATES={LOADING:\"loading\",UNKNOWN:\"unknown\",DEFAULT:\"default\",EXPANDED:\"expanded\",HIDDEN:\"hidden\"};var EVENTS=mraid.EVENTS={ASSETREADY:\"assetReady\",ASSETREMOVED:\"assetRemoved\",ASSETRETIRED:\"assetRetired\",INFO:\"info\",ERROR:\"error\",ORIENTATIONCHANGE:\"orientationChange\",READY:\"ready\",STATECHANGE:\"stateChange\",VIEWABLECHANGE:\"viewableChange\"};var listeners={};var currentState=STATES.LOADING;var expandProperties={width:initState.width,height:initState.height,isModal:initState.isModal,useCustomClose:false};var collapseProperties={};var placementType=initState.placementType;var disable=false;var closeId=\"flurry-mraid-default-close\";var imgUrl=\"http://flurry.cachefly.net/adSpaceStyles/images/bttn-close-bw.png\";var safeClose=function(){try{if(window.mraid)window.mraid.close();else if(window.flurryadapter)flurryadapter.executeCall(\"adWillClose\");else console.log(\"unable to close\")}catch(error){console.log(\"unable to close: \"+error)}};var makeDefaultClose=function(){var img=document.createElement(\"img\");img.src=imgUrl;img.id=closeId;img.style.position=\"absolute\";img.style.top=\"10px\";img.style.right=\"10px\";img.style.width=\"50px\";img.style.height=\"50px\";img.style.zIndex=1E4;return img};var updateDefaultClose=function(){if(!expandProperties.useCustomClose&&(placementType===\"interstitial\"||currentState===STATES.EXPANDED))addDefaultClose();else removeDefaultClose()};var addDefaultClose=function(){var closeButton=document.getElementById(closeId);if(!closeButton){closeButton=makeDefaultClose();document.body.appendChild(closeButton)}};var removeDefaultClose=function(){var closeButton=document.getElementById(closeId);if(closeButton)document.body.removeChild(closeButton)};var setupDefaultCloseHandler=function(){document.body.addEventListener(\"click\",function(e){e=e||window.event;var target=e.target||e.srcElement;if(target.id===closeId)safeClose()})};var contains=function(value,obj){for(var i in obj)if(obj[i]===value)return true;return false};var stringify=function(obj){if(typeof obj==\"object\")if(obj.push){var out=[];for(var p in obj)if(obj.hasOwnProperty(p))out.push(obj[p]);return\"[\"+out.join(\",\")+\"]\"}else{var out=[];for(var p in obj)if(obj.hasOwnProperty(p))out.push(\"\'\"+p+\"\':\"+obj[p]);return\"{\"+out.join(\",\")+\"}\"}else return new String(obj)};var broadcastEvent=function(){var args=new Array(arguments.length);for(var i=0;i<arguments.length;i++)args[i]=arguments[i];var event=args.shift();try{if(listeners[event])for(var j=0;j<listeners[event].length;j++)if(typeof listeners[event][j]===\"function\")listeners[event][j].apply(undefined,args);else if(typeof listeners[event][j]===\"string\"&&typeof window[listeners[event][j]]===\"function\")window[listeners[event][j]].apply(undefined,args)}catch(e){console.log(e)}};mraid.disable=function(){removeDefaultClose();disable=true};mraid.addEventListener=function(event,listener){if(disable)return;if(!event||!listener)broadcastEvent(EVENTS.ERROR,\"Both event and listener are required.\",\"addEventListener\");else if(!contains(event,EVENTS))broadcastEvent(EVENTS.ERROR,\"Unknown event: \"+event,\"addEventListener\");else if(!listeners[event])listeners[event]=[listener];else listeners[event].push(listener);flurryBridge.executeCall(\"eventListenerAdded\")};mraid.stateChange=function(newState){if(disable)return;if(currentState===newState)return;broadcastEvent(EVENTS.INFO,\"setting state to \"+stringify(newState));var oldState=currentState;currentState=newState;if(oldState===STATES.LOADING&&newState===STATES.DEFAULT){setupDefaultCloseHandler();updateDefaultClose();broadcastEvent(EVENTS.READY)}else if(oldState===STATES.HIDDEN||newState===STATES.HIDDEN)broadcastEvent(EVENTS.VIEWABLECHANGE);else if(oldState===STATES.DEFAULT&&newState===STATES.EXPANDED)updateDefaultClose();else if(newState===STATES.DEFAULT&&oldState===STATES.EXPANDED)updateDefaultClose();broadcastEvent(EVENTS.STATECHANGE,currentState)};mraid.close=function(){if(disable)return;var state=mraid.getState();if(state===STATES.DEFAULT){mraid.stateChange(STATES.HIDDEN);flurryBridge.executeCall(\"adWillClose\")}else if(state===STATES.EXPANDED){mraid.stateChange(STATES.DEFAULT);flurryBridge.executeCall(\"collapse\")}else console.log(\"close() called in state \"+state)};mraid.expand=function(url){if(disable)return;var state=mraid.getState();if(state!==STATES.DEFAULT){console.log(\"expand() called in state \"+state);return}if(placementType===\"interstitial\"){console.log(\"expand() called for placement type \"+placementType);return}if(url)flurryBridge.executeCall(\"expand\",\"width\",expandProperties.width,\"height\",expandProperties.height,\"url\",url);else flurryBridge.executeCall(\"expand\",\"width\",expandProperties.width,\"height\",expandProperties.height);mraid.stateChange(STATES.EXPANDED)};mraid.setExpandProperties=function(properties){if(disable)return;if(typeof properties.width===\"number\"&&!isNaN(properties.width))expandProperties.width=properties.width;if(typeof properties.height===\"number\"&&!isNaN(properties.height))expandProperties.height=properties.height;if(typeof properties.useCustomClose===\"boolean\"){expandProperties.useCustomClose=properties.useCustomClose;updateDefaultClose()}};mraid.getExpandProperties=function(properties){if(disable)return;var ret={};ret.width=expandProperties.width;ret.height=expandProperties.height;ret.isModal=expandProperties.isModal;ret.useCustomClose=expandProperties.useCustomClose;return ret};mraid.getPlacementType=function(){return placementType};mraid.getVersion=function(){if(disable)return\"\";return\"1.0\"};mraid.getState=function(){if(disable)return\"\";return currentState};mraid.isViewable=function(){if(disable)return false;if(mraid.getState()===\"hidden\")return false;else return true};mraid.open=function(url){if(disable)return;try{flurryBridge.executeCall(\"open\",\"url\",url)}catch(e){console.log(e)}};mraid.removeEventListener=function(event,listener){if(disable)return;if(!event)broadcastEvent(\"error\",\"Must specify an event.\",\"removeEventListener\");else if(listener&&listeners[event])for(var i=0;i<listeners[event].length;i++){if(listeners[event][i]===listener)listeners[event].splice(i,1)}else if(listeners[event])listeners[event]=[]};mraid.useCustomClose=function(use){if(disable)return;if(typeof use===\"boolean\"){expandProperties.useCustomClose=use;updateDefaultClose()}};return mraid};"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 599
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "window.mraid=mraidCtor(window.flurryadapter,"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ");"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 600
    const-string v0, "})();"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 602
    iget-object v0, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    .line 603
    iget-object v0, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 605
    :cond_0
    return-void

    .line 591
    :cond_1
    const-string v0, "inline"

    goto :goto_0
.end method

.method static synthetic o(Lcom/flurry/sdk/g;)V
    .locals 0

    .prologue
    .line 82
    invoke-direct {p0}, Lcom/flurry/sdk/g;->u()V

    return-void
.end method

.method static synthetic p(Lcom/flurry/sdk/g;)Landroid/view/View;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/flurry/sdk/g;->n:Landroid/view/View;

    return-object v0
.end method

.method private p()V
    .locals 3

    .prologue
    .line 609
    const/4 v0, 0x3

    iget-object v1, p0, Lcom/flurry/sdk/g;->c:Ljava/lang/String;

    const-string v2, "activateMraid"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 610
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 611
    const-string v1, "javascript:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 612
    const-string v1, "if(window.mraid){window.mraid.stateChange(window.mraid.STATES.DEFAULT);}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 613
    iget-object v1, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    if-eqz v1, :cond_0

    .line 614
    iget-object v1, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 616
    :cond_0
    return-void
.end method

.method static synthetic q(Lcom/flurry/sdk/g;)Landroid/webkit/WebChromeClient;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/flurry/sdk/g;->m:Landroid/webkit/WebChromeClient;

    return-object v0
.end method

.method private q()V
    .locals 3

    .prologue
    .line 619
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getContext()Landroid/content/Context;

    move-result-object v0

    instance-of v0, v0, Landroid/app/Activity;

    if-nez v0, :cond_1

    .line 621
    const/4 v0, 0x3

    iget-object v1, p0, Lcom/flurry/sdk/g;->c:Ljava/lang/String;

    const-string v2, "no activity present"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 633
    :cond_0
    :goto_0
    return-void

    .line 625
    :cond_1
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 629
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->d()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 630
    invoke-static {}, Lcom/flurry/sdk/bs;->a()I

    move-result v1

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/bs;->a(Landroid/app/Activity;IZ)Z

    goto :goto_0
.end method

.method static synthetic r(Lcom/flurry/sdk/g;)Landroid/widget/FrameLayout;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/flurry/sdk/g;->r:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method private r()V
    .locals 3

    .prologue
    .line 640
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getContext()Landroid/content/Context;

    move-result-object v0

    instance-of v0, v0, Landroid/app/Activity;

    if-nez v0, :cond_1

    .line 652
    :cond_0
    :goto_0
    return-void

    .line 643
    :cond_1
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 645
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->d()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 646
    invoke-static {}, Lcom/flurry/sdk/d;->a()Lcom/flurry/sdk/d;

    move-result-object v1

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/flurry/sdk/d;->a(Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)I

    move-result v1

    invoke-static {v0, v1}, Lcom/flurry/sdk/bs;->c(Landroid/app/Activity;I)I

    move-result v1

    .line 648
    const/4 v2, -0x1

    if-eq v2, v1, :cond_0

    .line 649
    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/bs;->a(Landroid/app/Activity;IZ)Z

    goto :goto_0
.end method

.method static synthetic s(Lcom/flurry/sdk/g;)Landroid/app/Dialog;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/flurry/sdk/g;->q:Landroid/app/Dialog;

    return-object v0
.end method

.method private s()V
    .locals 2

    .prologue
    .line 659
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getContext()Landroid/content/Context;

    move-result-object v0

    instance-of v0, v0, Landroid/app/Activity;

    if-nez v0, :cond_1

    .line 667
    :cond_0
    :goto_0
    return-void

    .line 662
    :cond_1
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 664
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->d()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 665
    iget v1, p0, Lcom/flurry/sdk/g;->j:I

    invoke-static {v0, v1}, Lcom/flurry/sdk/bs;->a(Landroid/app/Activity;I)V

    goto :goto_0
.end method

.method private declared-synchronized setFlurryJsEnvInitialized(Z)V
    .locals 1

    .prologue
    .line 485
    monitor-enter p0

    :try_start_0
    iput-boolean p1, p0, Lcom/flurry/sdk/g;->k:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 486
    monitor-exit p0

    return-void

    .line 485
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized setMraidJsEnvInitialized(Z)V
    .locals 1

    .prologue
    .line 565
    monitor-enter p0

    :try_start_0
    iput-boolean p1, p0, Lcom/flurry/sdk/g;->x:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 566
    monitor-exit p0

    return-void

    .line 565
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method static synthetic t(Lcom/flurry/sdk/g;)Landroid/app/Dialog;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/flurry/sdk/g;->t:Landroid/app/Dialog;

    return-object v0
.end method

.method private t()Z
    .locals 1

    .prologue
    .line 672
    iget-object v0, p0, Lcom/flurry/sdk/g;->q:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static synthetic u(Lcom/flurry/sdk/g;)I
    .locals 1

    .prologue
    .line 82
    iget v0, p0, Lcom/flurry/sdk/g;->o:I

    return v0
.end method

.method private u()V
    .locals 3

    .prologue
    const/4 v2, 0x3

    .line 768
    iget-object v0, p0, Lcom/flurry/sdk/g;->c:Ljava/lang/String;

    const-string v1, "closing ad"

    invoke-static {v2, v0, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 769
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->d()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 771
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getContext()Landroid/content/Context;

    move-result-object v0

    instance-of v0, v0, Landroid/app/Activity;

    if-nez v0, :cond_1

    .line 773
    iget-object v0, p0, Lcom/flurry/sdk/g;->c:Ljava/lang/String;

    const-string v1, "no activity present"

    invoke-static {v2, v0, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 786
    :cond_0
    :goto_0
    return-void

    .line 777
    :cond_1
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 779
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto :goto_0
.end method

.method static synthetic v(Lcom/flurry/sdk/g;)Landroid/webkit/WebChromeClient$CustomViewCallback;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/flurry/sdk/g;->p:Landroid/webkit/WebChromeClient$CustomViewCallback;

    return-object v0
.end method

.method private v()Z
    .locals 1

    .prologue
    .line 1431
    iget-object v0, p0, Lcom/flurry/sdk/g;->t:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static synthetic w(Lcom/flurry/sdk/g;)Lcom/flurry/sdk/f;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/flurry/sdk/g;->g:Lcom/flurry/sdk/f;

    return-object v0
.end method

.method private w()V
    .locals 2

    .prologue
    .line 1437
    iget-object v0, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    const-string v1, "javascript:(function() { document.getElementById(\'flurry_interstitial_close\').style.display = \'none\'; })()"

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 1438
    return-void
.end method


# virtual methods
.method public a()V
    .locals 7

    .prologue
    .line 1448
    const-string v1, "adWillClose"

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v2

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v3

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdLog()Lcom/flurry/sdk/e;

    move-result-object v4

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdFrameIndex()I

    move-result v5

    const/4 v6, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/flurry/sdk/g;->a(Ljava/lang/String;Ljava/util/Map;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/e;II)V

    .line 1449
    return-void
.end method

.method public a(Lcom/flurry/sdk/a;Lcom/flurry/sdk/ae;I)V
    .locals 9

    .prologue
    .line 1051
    iget-object v1, p1, Lcom/flurry/sdk/a;->a:Ljava/lang/String;

    .line 1052
    iget-object v3, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    .line 1053
    iget-object v2, p1, Lcom/flurry/sdk/a;->b:Ljava/util/Map;

    .line 1055
    const/16 v0, 0xa

    if-le p3, v0, :cond_1

    .line 1057
    const/4 v0, 0x5

    iget-object v4, p0, Lcom/flurry/sdk/g;->c:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Maximum depth for event/action loop exceeded when performing action:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v5, ","

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",triggered by:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v3, Lcom/flurry/sdk/p;->a:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v4, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 1304
    :cond_0
    :goto_0
    return-void

    .line 1061
    :cond_1
    iget-object v0, v3, Lcom/flurry/sdk/p;->a:Ljava/lang/String;

    const-string v4, "clicked"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1062
    iget-object v0, v3, Lcom/flurry/sdk/p;->b:Ljava/util/Map;

    const-string v4, "noop"

    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1063
    if-eqz v0, :cond_2

    const-string v4, "true"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1065
    const/4 v0, 0x4

    iget-object v1, p0, Lcom/flurry/sdk/g;->c:Ljava/lang/String;

    const-string v2, "\'clicked\' event is a noop"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1070
    :cond_2
    const/4 v0, 0x3

    iget-object v4, p0, Lcom/flurry/sdk/g;->c:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "performAction(action="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ",params="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p1, Lcom/flurry/sdk/a;->b:Ljava/util/Map;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ",triggering event="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, v3, Lcom/flurry/sdk/p;->a:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ")"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v4, v5}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 1072
    const-string v0, "nextFrame"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 1074
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdFrameIndex()I

    move-result v0

    add-int/lit8 v1, v0, 0x1

    .line 1075
    const-string v0, "offset"

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1076
    if-eqz v0, :cond_5

    .line 1078
    const-string v2, "next"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 1080
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdFrameIndex()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    .line 1098
    :goto_1
    invoke-direct {p0, p1, v0}, Lcom/flurry/sdk/g;->a(Lcom/flurry/sdk/a;I)V

    .line 1303
    :cond_3
    :goto_2
    invoke-direct {p0, p1}, Lcom/flurry/sdk/g;->a(Lcom/flurry/sdk/a;)V

    goto/16 :goto_0

    .line 1082
    :cond_4
    const-string v2, "current"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1090
    :try_start_0
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    goto :goto_1

    .line 1092
    :catch_0
    move-exception v0

    .line 1094
    const/4 v2, 0x6

    iget-object v3, p0, Lcom/flurry/sdk/g;->c:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "caught: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    :cond_5
    move v0, v1

    goto :goto_1

    .line 1100
    :cond_6
    const-string v0, "closeAd"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 1102
    invoke-direct {p0}, Lcom/flurry/sdk/g;->u()V

    goto :goto_2

    .line 1104
    :cond_7
    const-string v0, "notifyUser"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 1128
    new-instance v4, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {v4, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1131
    const-string v0, "message"

    invoke-interface {v2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    const-string v0, "confirmDisplay"

    invoke-interface {v2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    const-string v0, "cancelDisplay"

    invoke-interface {v2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 1133
    const-string v0, "message"

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1134
    const-string v1, "confirmDisplay"

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1135
    const-string v5, "cancelDisplay"

    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 1144
    :goto_3
    invoke-virtual {v4, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/4 v5, 0x0

    invoke-virtual {v0, v5}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v5, Lcom/flurry/sdk/g$3;

    invoke-direct {v5, p0, v3, p3}, Lcom/flurry/sdk/g$3;-><init>(Lcom/flurry/sdk/g;Lcom/flurry/sdk/p;I)V

    invoke-virtual {v0, v2, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v2, Lcom/flurry/sdk/g$2;

    invoke-direct {v2, p0, v3, p3}, Lcom/flurry/sdk/g$2;-><init>(Lcom/flurry/sdk/g;Lcom/flurry/sdk/p;I)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1174
    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/g;->y:Landroid/app/AlertDialog;

    .line 1176
    iget-object v0, p0, Lcom/flurry/sdk/g;->g:Lcom/flurry/sdk/f;

    if-eqz v0, :cond_8

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getCurrentBinding()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_8

    .line 1178
    iget-object v0, p0, Lcom/flurry/sdk/g;->g:Lcom/flurry/sdk/f;

    invoke-virtual {v0}, Lcom/flurry/sdk/f;->pause()V

    .line 1180
    :cond_8
    iget-object v0, p0, Lcom/flurry/sdk/g;->y:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    goto/16 :goto_2

    .line 1139
    :cond_9
    const-string v0, "Are you sure?"

    .line 1140
    const-string v1, "Cancel"

    .line 1141
    const-string v2, "OK"

    goto :goto_3

    .line 1182
    :cond_a
    const-string v0, "loadAdComponents"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 1184
    const/4 v1, 0x1

    const/4 v0, 0x3

    .line 1185
    const-string v3, "min"

    invoke-interface {v2, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const-string v3, "max"

    invoke-interface {v2, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 1189
    :try_start_1
    const-string v0, "min"

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 1190
    const-string v0, "max"

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    move-result v0

    .line 1201
    :cond_b
    :goto_4
    const/4 v2, 0x1

    if-ge v2, v1, :cond_c

    .line 1202
    add-int/lit8 v1, v1, -0x1

    .line 1205
    :cond_c
    const/4 v2, 0x1

    if-ge v2, v0, :cond_d

    .line 1206
    add-int/lit8 v0, v0, -0x1

    .line 1209
    :cond_d
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1210
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1211
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v3

    invoke-virtual {v3}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->b()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3, v1, v0}, Lcom/flurry/sdk/g;->a(Ljava/lang/String;II)Ljava/util/List;

    move-result-object v0

    invoke-interface {v2, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1212
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_10

    .line 1214
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->b()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v2, v0}, Lcom/flurry/sdk/g;->a(Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1215
    iget-object v1, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    if-eqz v1, :cond_e

    .line 1216
    iget-object v1, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "javascript:(function() {var multiadwraps=document.getElementsByClassName(\'multiAdWrap\');if(multiadwraps.length>0){var template=document.getElementsByClassName(\'multiAdWrap\')[0];var compiled=Hogan.compile(template.innerHTML);template.innerHTML=\'\';template.innerHTML=compiled.render(JSON.parse("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "));}})();"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 1219
    iget-object v0, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    const-string v1, "javascript:flurryadapter.callComplete();"

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 1221
    :cond_e
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_5
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_f

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    .line 1223
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 1224
    const-string v1, "guid"

    invoke-virtual {v3}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->d()Ljava/util/List;

    move-result-object v0

    const/4 v4, 0x0

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->g()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1225
    const-string v1, "rendered"

    invoke-virtual {v3}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->d()Ljava/util/List;

    move-result-object v0

    const/4 v4, 0x0

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->g()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/flurry/sdk/g;->b(Ljava/lang/String;)Lcom/flurry/sdk/e;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/flurry/sdk/g;->a(Ljava/lang/String;Ljava/util/Map;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/e;II)V

    goto :goto_5

    .line 1192
    :catch_1
    move-exception v0

    .line 1194
    const/4 v1, 0x1

    .line 1195
    const/4 v0, 0x3

    goto/16 :goto_4

    .line 1230
    :cond_f
    iget-object v0, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/g;->a(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 1232
    iget-object v0, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/g;->addView(Landroid/view/View;)V

    goto/16 :goto_2

    .line 1237
    :cond_10
    const-string v1, "renderFailed"

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v2

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v3

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdLog()Lcom/flurry/sdk/e;

    move-result-object v4

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdFrameIndex()I

    move-result v5

    const/4 v6, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/flurry/sdk/g;->a(Ljava/lang/String;Ljava/util/Map;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/e;II)V

    goto/16 :goto_2

    .line 1240
    :cond_11
    const-string v0, "doExpand"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 1242
    invoke-static {}, Lcom/flurry/sdk/fg;->d()I

    move-result v1

    .line 1243
    invoke-static {}, Lcom/flurry/sdk/fg;->e()I

    move-result v0

    .line 1244
    iget-object v2, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    iget-object v2, v2, Lcom/flurry/sdk/p;->b:Ljava/util/Map;

    const-string v3, "width"

    invoke-interface {v2, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_17

    iget-object v2, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    iget-object v2, v2, Lcom/flurry/sdk/p;->b:Ljava/util/Map;

    const-string v3, "height"

    invoke-interface {v2, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_17

    .line 1250
    :try_start_2
    iget-object v0, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    iget-object v0, v0, Lcom/flurry/sdk/p;->b:Ljava/util/Map;

    const-string v1, "width"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Lcom/flurry/sdk/fg;->b(I)I

    move-result v1

    .line 1251
    iget-object v0, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    iget-object v0, v0, Lcom/flurry/sdk/p;->b:Ljava/util/Map;

    const-string v2, "height"

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Lcom/flurry/sdk/fg;->b(I)I
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_2

    move-result v0

    move v7, v0

    move v8, v1

    .line 1261
    :goto_6
    const/4 v0, 0x3

    iget-object v1, p0, Lcom/flurry/sdk/g;->c:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "expand to width = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " height = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 1262
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getHolder()Lcom/flurry/sdk/k;

    move-result-object v0

    .line 1263
    if-eqz v0, :cond_12

    .line 1265
    const-string v1, "clicked"

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v2

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v3

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdLog()Lcom/flurry/sdk/e;

    move-result-object v4

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdFrameIndex()I

    move-result v5

    const/4 v6, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/flurry/sdk/g;->a(Ljava/lang/String;Ljava/util/Map;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/e;II)V

    .line 1266
    invoke-direct {p0, v8, v7}, Lcom/flurry/sdk/g;->a(II)V

    .line 1268
    :cond_12
    iget-object v0, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    iget-object v0, v0, Lcom/flurry/sdk/p;->b:Ljava/util/Map;

    const-string v1, "url"

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1270
    iget-object v0, p1, Lcom/flurry/sdk/a;->c:Lcom/flurry/sdk/p;

    iget-object v0, v0, Lcom/flurry/sdk/p;->b:Ljava/util/Map;

    const-string v1, "url"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/flurry/sdk/g;->a:Ljava/lang/String;

    .line 1271
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->initLayout()V

    goto/16 :goto_2

    .line 1253
    :catch_2
    move-exception v0

    .line 1255
    const/4 v1, 0x6

    iget-object v2, p0, Lcom/flurry/sdk/g;->c:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v2, v0}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 1256
    invoke-static {}, Lcom/flurry/sdk/fg;->d()I

    move-result v1

    .line 1257
    invoke-static {}, Lcom/flurry/sdk/fg;->e()I

    move-result v0

    move v7, v0

    move v8, v1

    goto :goto_6

    .line 1274
    :cond_13
    const-string v0, "doCollapse"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 1277
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getCurrentAdFrame()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->e()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdSpaceLayout;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdSpaceLayout;->b()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1278
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getCurrentAdFrame()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;

    move-result-object v1

    invoke-virtual {v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->e()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdSpaceLayout;

    move-result-object v1

    invoke-virtual {v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdSpaceLayout;->c()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 1280
    invoke-static {v0}, Lcom/flurry/sdk/fg;->b(I)I

    move-result v0

    .line 1281
    invoke-static {v1}, Lcom/flurry/sdk/fg;->b(I)I

    move-result v1

    .line 1282
    iget-object v2, p0, Lcom/flurry/sdk/g;->a:Ljava/lang/String;

    if-eqz v2, :cond_14

    .line 1284
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/flurry/sdk/g;->a:Ljava/lang/String;

    .line 1285
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->initLayout()V

    .line 1287
    :cond_14
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getHolder()Lcom/flurry/sdk/k;

    move-result-object v2

    .line 1288
    if-eqz v2, :cond_3

    .line 1290
    invoke-direct {p0, v0, v1}, Lcom/flurry/sdk/g;->b(II)V

    goto/16 :goto_2

    .line 1295
    :cond_15
    const-string v0, "directOpen"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 1297
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 1298
    const-string v0, "noop"

    const-string v1, "true"

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1299
    const-string v1, "clicked"

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v3

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdLog()Lcom/flurry/sdk/e;

    move-result-object v4

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdFrameIndex()I

    move-result v5

    const/4 v6, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/flurry/sdk/g;->a(Ljava/lang/String;Ljava/util/Map;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/e;II)V

    .line 1301
    :cond_16
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getPlatformModule()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a()Lcom/flurry/sdk/q;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/flurry/sdk/q;->a(Lcom/flurry/sdk/a;Lcom/flurry/sdk/ae;I)V

    goto/16 :goto_2

    :cond_17
    move v7, v0

    move v8, v1

    goto/16 :goto_6
.end method

.method public a(Ljava/lang/String;Ljava/util/Map;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/e;II)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;",
            "Lcom/flurry/sdk/e;",
            "II)V"
        }
    .end annotation

    .prologue
    .line 1559
    const/4 v0, 0x3

    iget-object v1, p0, Lcom/flurry/sdk/g;->c:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "fireEvent(event="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ",params="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 1560
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getPlatformModule()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v7

    new-instance v0, Lcom/flurry/sdk/p;

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getContext()Landroid/content/Context;

    move-result-object v3

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    move-object v5, p4

    move v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/flurry/sdk/p;-><init>(Ljava/lang/String;Ljava/util/Map;Landroid/content/Context;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/e;I)V

    invoke-virtual {v7, v0, p0, p6}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Lcom/flurry/sdk/p;Lcom/flurry/sdk/ad;I)V

    .line 1561
    return-void
.end method

.method a(Landroid/view/View;)Z
    .locals 1

    .prologue
    .line 1678
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 1679
    if-eqz v0, :cond_0

    if-ne v0, p0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public b()V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 1486
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/flurry/sdk/g;->h:Z

    .line 1487
    iget-object v0, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    .line 1488
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_0

    .line 1489
    iget-object v0, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->onResume()V

    .line 1493
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/g;->g:Lcom/flurry/sdk/f;

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getCurrentBinding()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    .line 1494
    iget-object v0, p0, Lcom/flurry/sdk/g;->f:Lcom/flurry/sdk/aa;

    if-eqz v0, :cond_1

    .line 1495
    iget-object v0, p0, Lcom/flurry/sdk/g;->f:Lcom/flurry/sdk/aa;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/aa;->show(I)V

    .line 1498
    :cond_1
    return-void
.end method

.method public c()V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 1502
    iget-object v0, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    .line 1503
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_0

    .line 1504
    iget-object v0, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->onPause()V

    .line 1508
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/g;->g:Lcom/flurry/sdk/f;

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getCurrentBinding()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    .line 1509
    iget-object v0, p0, Lcom/flurry/sdk/g;->g:Lcom/flurry/sdk/f;

    invoke-virtual {v0}, Lcom/flurry/sdk/f;->pause()V

    .line 1511
    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/flurry/sdk/g;->h:Z

    .line 1512
    return-void
.end method

.method d()Z
    .locals 2

    .prologue
    .line 1584
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getCurrentFormat()Ljava/lang/String;

    move-result-object v0

    const-string v1, "takeover"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method e()Z
    .locals 4

    .prologue
    .line 1667
    invoke-static {}, Lcom/flurry/sdk/fe;->a()Lcom/flurry/sdk/fe;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/sdk/fe;->c()Z

    move-result v0

    .line 1668
    if-nez v0, :cond_0

    .line 1670
    const/4 v1, 0x5

    iget-object v2, p0, Lcom/flurry/sdk/g;->c:Ljava/lang/String;

    const-string v3, "There is no network connectivity (ad will not rotate)"

    invoke-static {v1, v2, v3}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 1673
    :cond_0
    invoke-direct {p0}, Lcom/flurry/sdk/g;->v()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-direct {p0}, Lcom/flurry/sdk/g;->t()Z

    move-result v1

    if-nez v1, :cond_1

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method getCurrentAdFrame()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;
    .locals 2

    .prologue
    .line 1588
    iget-object v0, p0, Lcom/flurry/sdk/g;->z:Ljava/util/List;

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdFrameIndex()I

    move-result v1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;

    return-object v0
.end method

.method getCurrentBinding()I
    .locals 1

    .prologue
    .line 1565
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getCurrentAdFrame()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->b()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method getCurrentContent()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1570
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getCurrentAdFrame()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->d()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getCurrentDisplay()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1575
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getCurrentAdFrame()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->c()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getCurrentFormat()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1580
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getCurrentAdFrame()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->e()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdSpaceLayout;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdSpaceLayout;->e()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getHolder()Lcom/flurry/sdk/k;
    .locals 2

    .prologue
    .line 1697
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 1698
    instance-of v1, v0, Lcom/flurry/sdk/k;

    if-eqz v1, :cond_0

    .line 1699
    check-cast v0, Lcom/flurry/sdk/k;

    .line 1702
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public initLayout()V
    .locals 10

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x3

    const/4 v9, -0x1

    const/4 v8, 0x1

    const/4 v6, 0x0

    .line 796
    iget-object v0, p0, Lcom/flurry/sdk/g;->c:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "initLayout: ad creative layout: {width = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getCurrentAdFrame()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;

    move-result-object v2

    invoke-virtual {v2}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->e()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdSpaceLayout;

    move-result-object v2

    invoke-virtual {v2}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdSpaceLayout;->b()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", height = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getCurrentAdFrame()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;

    move-result-object v2

    invoke-virtual {v2}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->e()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdSpaceLayout;

    move-result-object v2

    invoke-virtual {v2}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdSpaceLayout;->c()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "}"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v0, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 800
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getContext()Landroid/content/Context;

    move-result-object v7

    .line 802
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->removeAllViews()V

    .line 803
    invoke-virtual {p0, v8}, Lcom/flurry/sdk/g;->setFocusable(Z)V

    .line 804
    invoke-virtual {p0, v8}, Lcom/flurry/sdk/g;->setFocusableInTouchMode(Z)V

    .line 806
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getCurrentBinding()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 955
    const-string v1, "renderFailed"

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v2

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v3

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdLog()Lcom/flurry/sdk/e;

    move-result-object v4

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdFrameIndex()I

    move-result v5

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/flurry/sdk/g;->a(Ljava/lang/String;Ljava/util/Map;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/e;II)V

    .line 957
    :goto_0
    return-void

    .line 809
    :pswitch_0
    iget-object v0, p0, Lcom/flurry/sdk/g;->g:Lcom/flurry/sdk/f;

    if-nez v0, :cond_0

    .line 811
    new-instance v0, Lcom/flurry/sdk/f;

    invoke-direct {v0, v7}, Lcom/flurry/sdk/f;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/flurry/sdk/g;->g:Lcom/flurry/sdk/f;

    .line 812
    iget-object v0, p0, Lcom/flurry/sdk/g;->g:Lcom/flurry/sdk/f;

    invoke-virtual {v0, p0}, Lcom/flurry/sdk/f;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 813
    iget-object v0, p0, Lcom/flurry/sdk/g;->g:Lcom/flurry/sdk/f;

    invoke-virtual {v0, p0}, Lcom/flurry/sdk/f;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 814
    iget-object v0, p0, Lcom/flurry/sdk/g;->g:Lcom/flurry/sdk/f;

    invoke-virtual {v0, p0}, Lcom/flurry/sdk/f;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 815
    new-instance v0, Lcom/flurry/sdk/aa;

    iget-object v1, p0, Lcom/flurry/sdk/g;->g:Lcom/flurry/sdk/f;

    invoke-direct {v0, v7, v1, p0}, Lcom/flurry/sdk/aa;-><init>(Landroid/content/Context;Lcom/flurry/sdk/f;Lcom/flurry/sdk/g;)V

    iput-object v0, p0, Lcom/flurry/sdk/g;->f:Lcom/flurry/sdk/aa;

    .line 816
    iget-object v0, p0, Lcom/flurry/sdk/g;->g:Lcom/flurry/sdk/f;

    iget-object v1, p0, Lcom/flurry/sdk/g;->f:Lcom/flurry/sdk/aa;

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/f;->setMediaController(Landroid/widget/MediaController;)V

    .line 821
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/g;->c:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Load URI: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getCurrentDisplay()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v0, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 822
    iget-object v0, p0, Lcom/flurry/sdk/g;->g:Lcom/flurry/sdk/f;

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getCurrentDisplay()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/f;->setVideoURI(Landroid/net/Uri;)V

    .line 854
    iget-object v0, p0, Lcom/flurry/sdk/g;->g:Lcom/flurry/sdk/f;

    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v1, v9, v9}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/f;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 857
    iget-object v0, p0, Lcom/flurry/sdk/g;->g:Lcom/flurry/sdk/f;

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/g;->addView(Landroid/view/View;)V

    .line 859
    iget-object v0, p0, Lcom/flurry/sdk/g;->g:Lcom/flurry/sdk/f;

    invoke-virtual {v0}, Lcom/flurry/sdk/f;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setGravity(I)V

    .line 860
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, v7}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/flurry/sdk/g;->e:Landroid/app/ProgressDialog;

    .line 861
    iget-object v0, p0, Lcom/flurry/sdk/g;->e:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v6}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 862
    iget-object v0, p0, Lcom/flurry/sdk/g;->e:Landroid/app/ProgressDialog;

    const-string v1, "Loading..."

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 863
    iget-object v0, p0, Lcom/flurry/sdk/g;->e:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v8}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 864
    iget-object v0, p0, Lcom/flurry/sdk/g;->e:Landroid/app/ProgressDialog;

    invoke-virtual {v0, p0}, Landroid/app/ProgressDialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 865
    iget-object v0, p0, Lcom/flurry/sdk/g;->e:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 874
    invoke-direct {p0}, Lcom/flurry/sdk/g;->s()V

    goto/16 :goto_0

    .line 881
    :pswitch_1
    iget-object v0, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    if-nez v0, :cond_1

    .line 883
    new-instance v0, Landroid/webkit/WebView;

    invoke-direct {v0, v7}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    .line 884
    iget-object v0, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0, v8}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 885
    iget-object v0, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    invoke-virtual {v0, v6}, Landroid/webkit/WebView;->setVerticalScrollBarEnabled(Z)V

    .line 886
    iget-object v0, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    invoke-virtual {v0, v6}, Landroid/webkit/WebView;->setHorizontalScrollBarEnabled(Z)V

    .line 887
    iget-object v0, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    invoke-virtual {v0, v6}, Landroid/webkit/WebView;->setBackgroundColor(I)V

    .line 888
    iget-object v0, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    invoke-virtual {v0, v6}, Landroid/webkit/WebView;->clearCache(Z)V

    .line 890
    new-instance v0, Lcom/flurry/sdk/g$a;

    invoke-direct {v0, p0, v4}, Lcom/flurry/sdk/g$a;-><init>(Lcom/flurry/sdk/g;Lcom/flurry/sdk/g$1;)V

    iput-object v0, p0, Lcom/flurry/sdk/g;->m:Landroid/webkit/WebChromeClient;

    .line 891
    iget-object v0, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/flurry/sdk/g;->m:Landroid/webkit/WebChromeClient;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 892
    new-instance v0, Lcom/flurry/sdk/g$b;

    invoke-direct {v0, p0, v4}, Lcom/flurry/sdk/g$b;-><init>(Lcom/flurry/sdk/g;Lcom/flurry/sdk/g$1;)V

    iput-object v0, p0, Lcom/flurry/sdk/g;->l:Landroid/webkit/WebViewClient;

    .line 893
    iget-object v0, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/flurry/sdk/g;->l:Landroid/webkit/WebViewClient;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 896
    :cond_1
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getCurrentBinding()I

    move-result v0

    if-ne v0, v8, :cond_7

    .line 898
    iget-object v0, p0, Lcom/flurry/sdk/g;->a:Ljava/lang/String;

    if-eqz v0, :cond_4

    .line 900
    iget-object v0, p0, Lcom/flurry/sdk/g;->a:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/flurry/sdk/g;->a(Ljava/lang/String;)V

    .line 928
    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v1, v9, v9}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 935
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->d()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 937
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, v7}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/flurry/sdk/g;->e:Landroid/app/ProgressDialog;

    .line 938
    iget-object v0, p0, Lcom/flurry/sdk/g;->e:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v6}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 939
    iget-object v0, p0, Lcom/flurry/sdk/g;->e:Landroid/app/ProgressDialog;

    const-string v1, "Loading..."

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 940
    iget-object v0, p0, Lcom/flurry/sdk/g;->e:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v8}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 941
    iget-object v0, p0, Lcom/flurry/sdk/g;->e:Landroid/app/ProgressDialog;

    invoke-virtual {v0, p0}, Landroid/app/ProgressDialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 942
    iget-object v0, p0, Lcom/flurry/sdk/g;->e:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 950
    :cond_3
    invoke-direct {p0}, Lcom/flurry/sdk/g;->r()V

    goto/16 :goto_0

    .line 902
    :cond_4
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdFrameIndex()I

    move-result v0

    if-nez v0, :cond_6

    .line 905
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getPlatformModule()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->b()Lcom/flurry/sdk/u;

    move-result-object v0

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v1

    invoke-virtual {v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->b()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/u;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 906
    if-nez v2, :cond_5

    .line 908
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getCurrentDisplay()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/flurry/sdk/g;->a(Ljava/lang/String;)V

    goto :goto_1

    .line 912
    :cond_5
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getCurrentDisplay()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flurry/sdk/bv;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 913
    iget-object v0, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    const-string v3, "text/html"

    const-string v4, "utf-8"

    move-object v5, v1

    invoke-virtual/range {v0 .. v5}, Landroid/webkit/WebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 914
    const-string v1, "rendered"

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v2

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v3

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdLog()Lcom/flurry/sdk/e;

    move-result-object v4

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdFrameIndex()I

    move-result v5

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/flurry/sdk/g;->a(Ljava/lang/String;Ljava/util/Map;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/e;II)V

    goto/16 :goto_1

    .line 919
    :cond_6
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getCurrentDisplay()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/flurry/sdk/g;->a(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 922
    :cond_7
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getCurrentBinding()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_2

    .line 924
    iget-object v0, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    const-string v1, "base://url/"

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getCurrentDisplay()Ljava/lang/String;

    move-result-object v2

    const-string v3, "text/html"

    const-string v4, "utf-8"

    const-string v5, "base://url/"

    invoke-virtual/range {v0 .. v5}, Landroid/webkit/WebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 925
    const-string v1, "rendered"

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v2

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v3

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdLog()Lcom/flurry/sdk/e;

    move-result-object v4

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdFrameIndex()I

    move-result v5

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/flurry/sdk/g;->a(Ljava/lang/String;Ljava/util/Map;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/e;II)V

    goto/16 :goto_1

    .line 806
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 7

    .prologue
    .line 1443
    const-string v1, "videoCompleted"

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v2

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v3

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdLog()Lcom/flurry/sdk/e;

    move-result-object v4

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdFrameIndex()I

    move-result v5

    const/4 v6, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/flurry/sdk/g;->a(Ljava/lang/String;Ljava/util/Map;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/e;II)V

    .line 1444
    return-void
.end method

.method public onError(Landroid/media/MediaPlayer;II)Z
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 1474
    iget-object v0, p0, Lcom/flurry/sdk/g;->e:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flurry/sdk/g;->e:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1476
    iget-object v0, p0, Lcom/flurry/sdk/g;->e:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 1478
    :cond_0
    const-string v1, "renderFailed"

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v2

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v3

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdLog()Lcom/flurry/sdk/e;

    move-result-object v4

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdFrameIndex()I

    move-result v5

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/flurry/sdk/g;->a(Ljava/lang/String;Ljava/util/Map;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/e;II)V

    .line 1480
    iget-object v0, p0, Lcom/flurry/sdk/g;->g:Lcom/flurry/sdk/f;

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/g;->removeView(Landroid/view/View;)V

    .line 1481
    return v6
.end method

.method public onKey(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 4

    .prologue
    .line 1685
    const/4 v0, 0x3

    const-string v1, "listeners"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onkey,keycode="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ",event="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 1686
    iget-object v0, p0, Lcom/flurry/sdk/g;->e:Landroid/app/ProgressDialog;

    if-ne p1, v0, :cond_0

    const/4 v0, 0x4

    if-ne p2, v0, :cond_0

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_0

    .line 1688
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->a()V

    .line 1689
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 1690
    const/4 v0, 0x1

    .line 1692
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 1454
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getCurrentBinding()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_3

    .line 1456
    iget-object v0, p0, Lcom/flurry/sdk/g;->e:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1458
    iget-object v0, p0, Lcom/flurry/sdk/g;->e:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 1460
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/g;->y:Landroid/app/AlertDialog;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/flurry/sdk/g;->y:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-nez v0, :cond_2

    .line 1462
    :cond_1
    iget-object v0, p0, Lcom/flurry/sdk/g;->g:Lcom/flurry/sdk/f;

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/flurry/sdk/g;->h:Z

    if-eqz v0, :cond_2

    .line 1463
    iget-object v0, p0, Lcom/flurry/sdk/g;->g:Lcom/flurry/sdk/f;

    invoke-virtual {v0}, Lcom/flurry/sdk/f;->start()V

    .line 1466
    :cond_2
    const-string v1, "rendered"

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v2

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v3

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdLog()Lcom/flurry/sdk/e;

    move-result-object v4

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdFrameIndex()I

    move-result v5

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/flurry/sdk/g;->a(Ljava/lang/String;Ljava/util/Map;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/e;II)V

    .line 1467
    const-string v1, "videoStart"

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v2

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v3

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdLog()Lcom/flurry/sdk/e;

    move-result-object v4

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdFrameIndex()I

    move-result v5

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/flurry/sdk/g;->a(Ljava/lang/String;Ljava/util/Map;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/e;II)V

    .line 1469
    :cond_3
    return-void
.end method

.method public stop()V
    .locals 7
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    const/4 v2, 0x3

    const/4 v6, 0x0

    .line 1518
    iget-object v0, p0, Lcom/flurry/sdk/g;->c:Ljava/lang/String;

    const-string v1, "stop"

    invoke-static {v2, v0, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 1519
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getCurrentBinding()I

    move-result v0

    if-ne v0, v2, :cond_1

    .line 1521
    iget-object v0, p0, Lcom/flurry/sdk/g;->e:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flurry/sdk/g;->e:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1523
    iget-object v0, p0, Lcom/flurry/sdk/g;->e:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 1525
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/g;->g:Lcom/flurry/sdk/f;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/flurry/sdk/g;->g:Lcom/flurry/sdk/f;

    invoke-virtual {v0}, Lcom/flurry/sdk/f;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1527
    iget-object v0, p0, Lcom/flurry/sdk/g;->g:Lcom/flurry/sdk/f;

    invoke-virtual {v0}, Lcom/flurry/sdk/f;->stopPlayback()V

    .line 1531
    :cond_1
    iget-object v0, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    if-eqz v0, :cond_5

    .line 1533
    iget-object v0, p0, Lcom/flurry/sdk/g;->n:Landroid/view/View;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/flurry/sdk/g;->m:Landroid/webkit/WebChromeClient;

    if-eqz v0, :cond_2

    .line 1535
    iget-object v0, p0, Lcom/flurry/sdk/g;->m:Landroid/webkit/WebChromeClient;

    invoke-virtual {v0}, Landroid/webkit/WebChromeClient;->onHideCustomView()V

    .line 1538
    :cond_2
    iget-object v0, p0, Lcom/flurry/sdk/g;->t:Landroid/app/Dialog;

    if-eqz v0, :cond_3

    .line 1539
    invoke-direct {p0, v6, v6}, Lcom/flurry/sdk/g;->b(II)V

    .line 1542
    :cond_3
    iget-object v0, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/g;->removeView(Landroid/view/View;)V

    .line 1543
    iget-object v0, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->stopLoading()V

    .line 1544
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_4

    .line 1545
    iget-object v0, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->onPause()V

    .line 1547
    :cond_4
    iget-object v0, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->destroy()V

    .line 1548
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/flurry/sdk/g;->i:Landroid/webkit/WebView;

    .line 1551
    :cond_5
    invoke-virtual {p0}, Lcom/flurry/sdk/g;->d()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 1553
    const-string v1, "adClosed"

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v2

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v3

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdLog()Lcom/flurry/sdk/e;

    move-result-object v4

    invoke-virtual {p0}, Lcom/flurry/sdk/g;->getAdFrameIndex()I

    move-result v5

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/flurry/sdk/g;->a(Ljava/lang/String;Ljava/util/Map;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/e;II)V

    .line 1555
    :cond_6
    return-void
.end method
