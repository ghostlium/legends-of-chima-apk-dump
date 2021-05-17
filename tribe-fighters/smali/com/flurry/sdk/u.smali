.class public Lcom/flurry/sdk/u;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/u$c;,
        Lcom/flurry/sdk/u$b;,
        Lcom/flurry/sdk/u$a;
    }
.end annotation


# static fields
.field private static final a:Ljava/lang/String;


# instance fields
.field private final b:Lcom/flurry/android/impl/ads/FlurryAdModule;

.field private final c:Lcom/flurry/sdk/l;

.field private d:Lcom/flurry/sdk/ak;

.field private final e:Lcom/flurry/sdk/x;

.field private final f:Lcom/flurry/sdk/es;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/flurry/sdk/es",
            "<",
            "Lcom/flurry/sdk/fj;",
            ">;"
        }
    .end annotation
.end field

.field private final g:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/flurry/sdk/u$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 57
    const-class v0, Lcom/flurry/sdk/u;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flurry/sdk/u;->a:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/flurry/android/impl/ads/FlurryAdModule;)V
    .locals 2

    .prologue
    .line 167
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 168
    iput-object p1, p0, Lcom/flurry/sdk/u;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    .line 170
    new-instance v0, Lcom/flurry/sdk/l;

    invoke-direct {v0}, Lcom/flurry/sdk/l;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/u;->c:Lcom/flurry/sdk/l;

    .line 171
    new-instance v0, Lcom/flurry/sdk/ak;

    invoke-direct {v0}, Lcom/flurry/sdk/ak;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/u;->d:Lcom/flurry/sdk/ak;

    .line 172
    new-instance v0, Lcom/flurry/sdk/x;

    invoke-direct {v0}, Lcom/flurry/sdk/x;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/u;->e:Lcom/flurry/sdk/x;

    .line 173
    new-instance v0, Lcom/flurry/sdk/es;

    const-string v1, "FlurryAds"

    invoke-direct {v0, v1}, Lcom/flurry/sdk/es;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/flurry/sdk/u;->f:Lcom/flurry/sdk/es;

    .line 174
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/u;->g:Ljava/util/Map;

    .line 175
    return-void
.end method

.method static synthetic a(Lcom/flurry/sdk/u;)Lcom/flurry/android/impl/ads/FlurryAdModule;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lcom/flurry/sdk/u;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    return-object v0
.end method

.method private a(Ljava/lang/String;Lcom/flurry/android/FlurryAdSize;ZIIII)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;
    .locals 5

    .prologue
    .line 662
    iget-object v0, p0, Lcom/flurry/sdk/u;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->B()Ljava/util/List;

    move-result-object v0

    .line 663
    iget-object v1, p0, Lcom/flurry/sdk/u;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v1}, Lcom/flurry/android/impl/ads/FlurryAdModule;->C()Ljava/util/List;

    move-result-object v1

    .line 666
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 667
    iget-object v3, p0, Lcom/flurry/sdk/u;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v3}, Lcom/flurry/android/impl/ads/FlurryAdModule;->K()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 668
    const-string v3, "FLURRY_VIEWER"

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 669
    iget-object v3, p0, Lcom/flurry/sdk/u;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v3}, Lcom/flurry/android/impl/ads/FlurryAdModule;->L()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 673
    :cond_0
    invoke-static {}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->b()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;

    move-result-object v3

    iget-object v4, p0, Lcom/flurry/sdk/u;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v4}, Lcom/flurry/android/impl/ads/FlurryAdModule;->f()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Ljava/lang/CharSequence;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;

    move-result-object v3

    const-string v4, ""

    invoke-virtual {v3, v4}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c(Ljava/lang/CharSequence;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;

    move-result-object v3

    iget-object v4, p0, Lcom/flurry/sdk/u;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v4}, Lcom/flurry/android/impl/ads/FlurryAdModule;->N()Ljava/util/List;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b(Ljava/util/List;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Ljava/util/List;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;

    move-result-object v0

    iget-object v3, p0, Lcom/flurry/sdk/u;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v3}, Lcom/flurry/android/impl/ads/FlurryAdModule;->i()Lcom/flurry/android/impl/ads/avro/protocol/v6/Location;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/android/impl/ads/avro/protocol/v6/Location;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;

    move-result-object v0

    iget-object v3, p0, Lcom/flurry/sdk/u;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v3}, Lcom/flurry/android/impl/ads/FlurryAdModule;->O()Z

    move-result v3

    invoke-virtual {v0, v3}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Z)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;

    move-result-object v0

    invoke-static {}, Lcom/flurry/android/FlurryAgent;->getAgentVersion()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b(Ljava/lang/CharSequence;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;

    move-result-object v0

    iget-object v3, p0, Lcom/flurry/sdk/u;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v3}, Lcom/flurry/android/impl/ads/FlurryAdModule;->d()J

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(J)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;

    move-result-object v0

    invoke-static {}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer;->b()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;

    move-result-object v3

    invoke-virtual {v3, p7}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->d(I)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;

    move-result-object v3

    invoke-virtual {v3, p6}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->c(I)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;

    move-result-object v3

    invoke-virtual {v3, p5}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->b(I)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;

    move-result-object v3

    invoke-virtual {v3, p4}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->a(I)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;

    move-result-object v3

    invoke-static {}, Lcom/flurry/sdk/fg;->c()F

    move-result v4

    invoke-virtual {v3, v4}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->a(F)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->a()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;

    move-result-object v0

    iget-object v3, p0, Lcom/flurry/sdk/u;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v3}, Lcom/flurry/android/impl/ads/FlurryAdModule;->g()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->d(Ljava/lang/CharSequence;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;

    move-result-object v0

    iget-object v3, p0, Lcom/flurry/sdk/u;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v3}, Lcom/flurry/android/impl/ads/FlurryAdModule;->h()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->e(Ljava/lang/CharSequence;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;

    move-result-object v0

    iget-object v3, p0, Lcom/flurry/sdk/u;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v3}, Lcom/flurry/android/impl/ads/FlurryAdModule;->P()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->f(Ljava/lang/CharSequence;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;

    move-result-object v0

    iget-object v3, p0, Lcom/flurry/sdk/u;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v3}, Lcom/flurry/android/impl/ads/FlurryAdModule;->Q()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->g(Ljava/lang/CharSequence;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;

    move-result-object v0

    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b(Z)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;

    move-result-object v0

    iget-object v3, p0, Lcom/flurry/sdk/u;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v3}, Lcom/flurry/android/impl/ads/FlurryAdModule;->J()Lcom/flurry/sdk/fe$a;

    move-result-object v3

    invoke-virtual {v3}, Lcom/flurry/sdk/fe$a;->a()I

    move-result v3

    invoke-virtual {v0, v3}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(I)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c(Ljava/util/List;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;

    move-result-object v0

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->h(Ljava/lang/CharSequence;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->d(Ljava/util/List;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;

    move-result-object v0

    .line 695
    if-eqz p3, :cond_3

    .line 696
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->a(Ljava/lang/Boolean;)V

    .line 701
    :goto_0
    if-eqz p2, :cond_1

    .line 702
    invoke-static {}, Lcom/flurry/android/impl/ads/avro/protocol/v6/TestAds;->b()Lcom/flurry/android/impl/ads/avro/protocol/v6/TestAds$Builder;

    move-result-object v1

    invoke-virtual {p2}, Lcom/flurry/android/FlurryAdSize;->getValue()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/flurry/android/impl/ads/avro/protocol/v6/TestAds$Builder;->a(I)Lcom/flurry/android/impl/ads/avro/protocol/v6/TestAds$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/TestAds$Builder;->a()Lcom/flurry/android/impl/ads/avro/protocol/v6/TestAds;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->a(Lcom/flurry/android/impl/ads/avro/protocol/v6/TestAds;)V

    .line 705
    :cond_1
    iget-object v1, p0, Lcom/flurry/sdk/u;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v1}, Lcom/flurry/android/impl/ads/FlurryAdModule;->p()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 706
    iget-object v1, p0, Lcom/flurry/sdk/u;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v1}, Lcom/flurry/android/impl/ads/FlurryAdModule;->q()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->a(Ljava/util/Map;)V

    .line 709
    :cond_2
    const/4 v1, 0x3

    sget-object v2, Lcom/flurry/sdk/u;->a:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Got ad request: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 711
    return-object v0

    .line 698
    :cond_3
    invoke-virtual {v0, p1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->a(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method static synthetic a(Lcom/flurry/sdk/u;Ljava/lang/String;)Lcom/flurry/sdk/u$a;
    .locals 1

    .prologue
    .line 56
    invoke-direct {p0, p1}, Lcom/flurry/sdk/u;->g(Ljava/lang/String;)Lcom/flurry/sdk/u$a;

    move-result-object v0

    return-object v0
.end method

.method static synthetic a(Lcom/flurry/sdk/u;Ljava/lang/String;Landroid/view/ViewGroup;Lcom/flurry/android/FlurryAdSize;ZI)Ljava/util/List;
    .locals 1

    .prologue
    .line 56
    invoke-direct/range {p0 .. p5}, Lcom/flurry/sdk/u;->a(Ljava/lang/String;Landroid/view/ViewGroup;Lcom/flurry/android/FlurryAdSize;ZI)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method private a(Ljava/lang/String;Landroid/view/ViewGroup;Lcom/flurry/android/FlurryAdSize;ZI)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/view/ViewGroup;",
            "Lcom/flurry/android/FlurryAdSize;",
            "ZI)",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;",
            ">;"
        }
    .end annotation

    .prologue
    .line 603
    iget-object v0, p0, Lcom/flurry/sdk/u;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->M()Lcom/flurry/sdk/z;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/sdk/z;->d()V

    .line 609
    invoke-static {}, Lcom/flurry/sdk/fe;->a()Lcom/flurry/sdk/fe;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/sdk/fe;->c()Z

    move-result v0

    if-nez v0, :cond_0

    .line 610
    const/4 v0, 0x5

    sget-object v1, Lcom/flurry/sdk/u;->a:Ljava/lang/String;

    const-string v2, "There is no network connectivity (cannot request ads)"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 611
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    .line 657
    :goto_0
    return-object v0

    .line 614
    :cond_0
    invoke-static {p5}, Lcom/flurry/sdk/fg;->c(I)Landroid/util/Pair;

    move-result-object v1

    .line 615
    iget-object v0, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 616
    iget-object v0, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 618
    invoke-static {}, Lcom/flurry/sdk/fg;->i()Landroid/util/Pair;

    move-result-object v1

    .line 620
    iget-object v0, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 621
    iget-object v0, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 623
    sget-object v0, Lcom/flurry/android/FlurryAdSize;->BANNER_BOTTOM:Lcom/flurry/android/FlurryAdSize;

    invoke-virtual {p3, v0}, Lcom/flurry/android/FlurryAdSize;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lcom/flurry/android/FlurryAdSize;->BANNER_TOP:Lcom/flurry/android/FlurryAdSize;

    invoke-virtual {p3, v0}, Lcom/flurry/android/FlurryAdSize;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 624
    :cond_1
    if-eqz p2, :cond_2

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getHeight()I

    move-result v0

    if-lez v0, :cond_2

    .line 626
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getHeight()I

    move-result v0

    invoke-static {v0}, Lcom/flurry/sdk/fg;->a(I)I

    move-result v5

    .line 628
    :cond_2
    if-eqz p2, :cond_3

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getWidth()I

    move-result v0

    if-lez v0, :cond_3

    .line 630
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getWidth()I

    move-result v0

    invoke-static {v0}, Lcom/flurry/sdk/fg;->a(I)I

    move-result v4

    :cond_3
    move-object v0, p0

    move-object v1, p1

    move-object v2, p3

    move v3, p4

    .line 634
    invoke-direct/range {v0 .. v7}, Lcom/flurry/sdk/u;->a(Ljava/lang/String;Lcom/flurry/android/FlurryAdSize;ZIIII)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;

    move-result-object v0

    .line 636
    iget-object v1, p0, Lcom/flurry/sdk/u;->e:Lcom/flurry/sdk/x;

    iget-object v2, p0, Lcom/flurry/sdk/u;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v2}, Lcom/flurry/android/impl/ads/FlurryAdModule;->t()Ljava/lang/String;

    move-result-object v2

    const-class v3, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;

    const-class v4, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdResponse;

    invoke-virtual {v1, v0, v2, v3, v4}, Lcom/flurry/sdk/x;->a(Lcom/flurry/sdk/gv;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;)Lcom/flurry/sdk/gv;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdResponse;

    .line 639
    if-nez v0, :cond_4

    .line 640
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    goto :goto_0

    .line 643
    :cond_4
    const/4 v1, 0x3

    sget-object v2, Lcom/flurry/sdk/u;->a:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Got ad response: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 645
    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdResponse;->c()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_6

    .line 646
    sget-object v1, Lcom/flurry/sdk/u;->a:Ljava/lang/String;

    const-string v2, "Ad server responded with the following error(s):"

    invoke-static {v1, v2}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 647
    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdResponse;->c()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    .line 648
    sget-object v2, Lcom/flurry/sdk/u;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 650
    :cond_5
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    goto/16 :goto_0

    .line 652
    :cond_6
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_8

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdResponse;->b()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_7

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdResponse;->b()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_8

    .line 654
    :cond_7
    sget-object v0, Lcom/flurry/sdk/u;->a:Ljava/lang/String;

    const-string v1, "Ad server responded but sent no ad units."

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 655
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    goto/16 :goto_0

    .line 657
    :cond_8
    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdResponse;->b()Ljava/util/List;

    move-result-object v0

    goto/16 :goto_0
.end method

.method static synthetic a(Lcom/flurry/sdk/u;Ljava/lang/String;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V
    .locals 0

    .prologue
    .line 56
    invoke-direct {p0, p1, p2}, Lcom/flurry/sdk/u;->a(Ljava/lang/String;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V

    return-void
.end method

.method static synthetic a(Lcom/flurry/sdk/u;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/e;II)V
    .locals 0

    .prologue
    .line 56
    invoke-direct/range {p0 .. p7}, Lcom/flurry/sdk/u;->a(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/e;II)V

    return-void
.end method

.method static synthetic a(Lcom/flurry/sdk/u;Ljava/util/List;I)V
    .locals 0

    .prologue
    .line 56
    invoke-direct {p0, p1, p2}, Lcom/flurry/sdk/u;->a(Ljava/util/List;I)V

    return-void
.end method

.method private a(Ljava/lang/String;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V
    .locals 2

    .prologue
    .line 427
    invoke-static {}, Lcom/flurry/sdk/eg;->a()Lcom/flurry/sdk/eg;

    move-result-object v0

    new-instance v1, Lcom/flurry/sdk/u$1;

    invoke-direct {v1, p0, p2, p1}, Lcom/flurry/sdk/u$1;-><init>(Lcom/flurry/sdk/u;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/eg;->a(Ljava/lang/Runnable;)V

    .line 437
    return-void
.end method

.method private a(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/e;II)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
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
    const/4 v6, 0x0

    .line 716
    const/4 v0, 0x3

    sget-object v1, Lcom/flurry/sdk/u;->a:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "fireEvent(event="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ",params="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 718
    invoke-direct {p0, p1}, Lcom/flurry/sdk/u;->g(Ljava/lang/String;)Lcom/flurry/sdk/u$a;

    move-result-object v1

    .line 719
    iget-object v7, p0, Lcom/flurry/sdk/u;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    new-instance v0, Lcom/flurry/sdk/p;

    invoke-virtual {v1}, Lcom/flurry/sdk/u$a;->c()Landroid/content/Context;

    move-result-object v3

    move-object v1, p2

    move-object v2, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v6}, Lcom/flurry/sdk/p;-><init>(Ljava/lang/String;Ljava/util/Map;Landroid/content/Context;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/e;I)V

    iget-object v1, p0, Lcom/flurry/sdk/u;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v1}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a()Lcom/flurry/sdk/q;

    move-result-object v1

    invoke-virtual {v7, v0, v1, v6}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Lcom/flurry/sdk/p;Lcom/flurry/sdk/ad;I)V

    .line 722
    return-void
.end method

.method private a(Ljava/util/List;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 545
    iget-object v0, p0, Lcom/flurry/sdk/u;->d:Lcom/flurry/sdk/ak;

    invoke-virtual {v0, p1, p2}, Lcom/flurry/sdk/ak;->a(Ljava/util/List;I)V

    .line 546
    return-void
.end method

.method static synthetic b(Lcom/flurry/sdk/u;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 56
    invoke-direct {p0, p1}, Lcom/flurry/sdk/u;->h(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic c()Ljava/lang/String;
    .locals 1

    .prologue
    .line 56
    sget-object v0, Lcom/flurry/sdk/u;->a:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic c(Lcom/flurry/sdk/u;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 56
    invoke-direct {p0, p1}, Lcom/flurry/sdk/u;->l(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic d(Lcom/flurry/sdk/u;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 56
    invoke-direct {p0, p1}, Lcom/flurry/sdk/u;->n(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic e(Lcom/flurry/sdk/u;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 56
    invoke-direct {p0, p1}, Lcom/flurry/sdk/u;->m(Ljava/lang/String;)V

    return-void
.end method

.method private declared-synchronized g(Ljava/lang/String;)Lcom/flurry/sdk/u$a;
    .locals 2

    .prologue
    .line 72
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/flurry/sdk/u;->g:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/u$a;

    .line 73
    if-nez v0, :cond_0

    .line 74
    new-instance v0, Lcom/flurry/sdk/u$a;

    invoke-direct {v0}, Lcom/flurry/sdk/u$a;-><init>()V

    .line 75
    iget-object v1, p0, Lcom/flurry/sdk/u;->g:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 77
    :cond_0
    monitor-exit p0

    return-object v0

    .line 72
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private h(Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 348
    invoke-direct {p0, p1}, Lcom/flurry/sdk/u;->g(Ljava/lang/String;)Lcom/flurry/sdk/u$a;

    move-result-object v1

    .line 351
    const/4 v0, 0x0

    .line 352
    monitor-enter v1

    .line 353
    :try_start_0
    sget-object v2, Lcom/flurry/sdk/u$a$a;->b:Lcom/flurry/sdk/u$a$a;

    invoke-virtual {v1}, Lcom/flurry/sdk/u$a;->b()Lcom/flurry/sdk/u$a$a;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/flurry/sdk/u$a$a;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 354
    sget-object v0, Lcom/flurry/sdk/u$a$a;->c:Lcom/flurry/sdk/u$a$a;

    invoke-virtual {v1, v0}, Lcom/flurry/sdk/u$a;->a(Lcom/flurry/sdk/u$a$a;)V

    .line 355
    invoke-virtual {v1}, Lcom/flurry/sdk/u$a;->c()Landroid/content/Context;

    move-result-object v0

    .line 357
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 359
    if-nez v0, :cond_1

    .line 360
    invoke-direct {p0, p1}, Lcom/flurry/sdk/u;->m(Ljava/lang/String;)V

    .line 386
    :goto_0
    return-void

    .line 357
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 364
    :cond_1
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->e()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 365
    invoke-direct {p0, p1}, Lcom/flurry/sdk/u;->m(Ljava/lang/String;)V

    goto :goto_0

    .line 370
    :cond_2
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/u;->e(Ljava/lang/String;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v2

    .line 371
    if-nez v2, :cond_3

    .line 372
    iget-object v0, p0, Lcom/flurry/sdk/u;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->F()Lcom/flurry/sdk/e;

    .line 373
    invoke-direct {p0, p1}, Lcom/flurry/sdk/u;->m(Ljava/lang/String;)V

    goto :goto_0

    .line 378
    :cond_3
    iget-object v3, p0, Lcom/flurry/sdk/u;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v3}, Lcom/flurry/android/impl/ads/FlurryAdModule;->R()V

    .line 380
    monitor-enter v1

    .line 381
    :try_start_2
    iget-object v3, p0, Lcom/flurry/sdk/u;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v3, v0, v2}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Landroid/content/Context;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)Lcom/flurry/sdk/ag;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/flurry/sdk/u$a;->a(Lcom/flurry/sdk/ag;)V

    .line 382
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 385
    invoke-direct {p0, p1}, Lcom/flurry/sdk/u;->i(Ljava/lang/String;)V

    goto :goto_0

    .line 382
    :catchall_1
    move-exception v0

    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v0
.end method

.method private i(Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 389
    invoke-direct {p0, p1}, Lcom/flurry/sdk/u;->g(Ljava/lang/String;)Lcom/flurry/sdk/u$a;

    move-result-object v1

    .line 392
    const/4 v0, 0x0

    .line 393
    monitor-enter v1

    .line 394
    :try_start_0
    sget-object v2, Lcom/flurry/sdk/u$a$a;->c:Lcom/flurry/sdk/u$a$a;

    invoke-virtual {v1}, Lcom/flurry/sdk/u$a;->b()Lcom/flurry/sdk/u$a$a;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/flurry/sdk/u$a$a;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 395
    sget-object v0, Lcom/flurry/sdk/u$a$a;->d:Lcom/flurry/sdk/u$a$a;

    invoke-virtual {v1, v0}, Lcom/flurry/sdk/u$a;->a(Lcom/flurry/sdk/u$a$a;)V

    .line 396
    invoke-virtual {v1}, Lcom/flurry/sdk/u$a;->f()Lcom/flurry/sdk/ag;

    move-result-object v0

    .line 398
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 400
    if-nez v0, :cond_1

    .line 401
    invoke-direct {p0, p1}, Lcom/flurry/sdk/u;->m(Ljava/lang/String;)V

    .line 424
    :goto_0
    return-void

    .line 398
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 405
    :cond_1
    invoke-virtual {v0}, Lcom/flurry/sdk/ag;->b()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v1

    .line 406
    invoke-virtual {v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->d()Ljava/util/List;

    move-result-object v0

    .line 407
    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 408
    :cond_2
    invoke-direct {p0, p1}, Lcom/flurry/sdk/u;->m(Ljava/lang/String;)V

    goto :goto_0

    .line 412
    :cond_3
    const/4 v2, 0x0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;

    .line 413
    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->b()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 414
    const/4 v3, 0x1

    if-ne v2, v3, :cond_4

    .line 416
    new-instance v2, Lcom/flurry/sdk/u$c;

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->c()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, p0, p1, v1, v0}, Lcom/flurry/sdk/u$c;-><init>(Lcom/flurry/sdk/u;Ljava/lang/String;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Ljava/lang/String;)V

    .line 418
    iget-object v0, p0, Lcom/flurry/sdk/u;->f:Lcom/flurry/sdk/es;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ":prerender"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Lcom/flurry/sdk/es;->a(Ljava/lang/Object;Lcom/flurry/sdk/fj;)V

    goto :goto_0

    .line 421
    :cond_4
    invoke-direct {p0, p1}, Lcom/flurry/sdk/u;->l(Ljava/lang/String;)V

    .line 422
    invoke-direct {p0, p1}, Lcom/flurry/sdk/u;->n(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private j(Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 440
    iget-object v0, p0, Lcom/flurry/sdk/u;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->S()Lcom/flurry/android/FlurryAdListener;

    move-result-object v0

    .line 441
    if-eqz v0, :cond_0

    .line 442
    invoke-static {}, Lcom/flurry/sdk/eg;->a()Lcom/flurry/sdk/eg;

    move-result-object v1

    new-instance v2, Lcom/flurry/sdk/u$2;

    invoke-direct {v2, p0, v0, p1}, Lcom/flurry/sdk/u$2;-><init>(Lcom/flurry/sdk/u;Lcom/flurry/android/FlurryAdListener;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/flurry/sdk/eg;->a(Ljava/lang/Runnable;)V

    .line 449
    :cond_0
    return-void
.end method

.method private k(Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 452
    iget-object v0, p0, Lcom/flurry/sdk/u;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->S()Lcom/flurry/android/FlurryAdListener;

    move-result-object v0

    .line 453
    if-eqz v0, :cond_0

    .line 454
    invoke-static {}, Lcom/flurry/sdk/eg;->a()Lcom/flurry/sdk/eg;

    move-result-object v1

    new-instance v2, Lcom/flurry/sdk/u$3;

    invoke-direct {v2, p0, v0, p1}, Lcom/flurry/sdk/u$3;-><init>(Lcom/flurry/sdk/u;Lcom/flurry/android/FlurryAdListener;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/flurry/sdk/eg;->a(Ljava/lang/Runnable;)V

    .line 461
    :cond_0
    return-void
.end method

.method private l(Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 464
    invoke-direct {p0, p1}, Lcom/flurry/sdk/u;->g(Ljava/lang/String;)Lcom/flurry/sdk/u$a;

    move-result-object v1

    .line 465
    monitor-enter v1

    .line 466
    :try_start_0
    sget-object v0, Lcom/flurry/sdk/u$a$a;->e:Lcom/flurry/sdk/u$a$a;

    invoke-virtual {v1, v0}, Lcom/flurry/sdk/u$a;->a(Lcom/flurry/sdk/u$a$a;)V

    .line 467
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 469
    iget-object v0, p0, Lcom/flurry/sdk/u;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->S()Lcom/flurry/android/FlurryAdListener;

    move-result-object v0

    .line 470
    if-eqz v0, :cond_0

    .line 471
    invoke-static {}, Lcom/flurry/sdk/eg;->a()Lcom/flurry/sdk/eg;

    move-result-object v1

    new-instance v2, Lcom/flurry/sdk/u$4;

    invoke-direct {v2, p0, v0, p1}, Lcom/flurry/sdk/u$4;-><init>(Lcom/flurry/sdk/u;Lcom/flurry/android/FlurryAdListener;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/flurry/sdk/eg;->a(Ljava/lang/Runnable;)V

    .line 478
    :cond_0
    return-void

    .line 467
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private m(Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 481
    invoke-direct {p0, p1}, Lcom/flurry/sdk/u;->g(Ljava/lang/String;)Lcom/flurry/sdk/u$a;

    move-result-object v1

    .line 482
    monitor-enter v1

    .line 483
    :try_start_0
    invoke-virtual {v1}, Lcom/flurry/sdk/u$a;->a()V

    .line 484
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 486
    iget-object v0, p0, Lcom/flurry/sdk/u;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->S()Lcom/flurry/android/FlurryAdListener;

    move-result-object v0

    .line 487
    if-eqz v0, :cond_0

    .line 488
    invoke-static {}, Lcom/flurry/sdk/eg;->a()Lcom/flurry/sdk/eg;

    move-result-object v1

    new-instance v2, Lcom/flurry/sdk/u$5;

    invoke-direct {v2, p0, v0, p1}, Lcom/flurry/sdk/u$5;-><init>(Lcom/flurry/sdk/u;Lcom/flurry/android/FlurryAdListener;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/flurry/sdk/eg;->a(Ljava/lang/Runnable;)V

    .line 495
    :cond_0
    return-void

    .line 484
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private n(Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 499
    invoke-direct {p0, p1}, Lcom/flurry/sdk/u;->g(Ljava/lang/String;)Lcom/flurry/sdk/u$a;

    move-result-object v0

    .line 500
    invoke-virtual {v0}, Lcom/flurry/sdk/u$a;->e()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 501
    invoke-static {}, Lcom/flurry/sdk/eg;->a()Lcom/flurry/sdk/eg;

    move-result-object v1

    new-instance v2, Lcom/flurry/sdk/u$6;

    invoke-direct {v2, p0, v0, p1}, Lcom/flurry/sdk/u$6;-><init>(Lcom/flurry/sdk/u;Lcom/flurry/sdk/u$a;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/flurry/sdk/eg;->a(Ljava/lang/Runnable;)V

    .line 508
    :cond_0
    return-void
.end method

.method private o(Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 549
    iget-object v0, p0, Lcom/flurry/sdk/u;->d:Lcom/flurry/sdk/ak;

    invoke-virtual {v0, p1}, Lcom/flurry/sdk/ak;->e(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public a(Lcom/flurry/android/impl/ads/FlurryAdModule;Landroid/content/Context;Landroid/view/ViewGroup;Ljava/lang/String;)Lcom/flurry/sdk/k;
    .locals 1

    .prologue
    .line 537
    iget-object v0, p0, Lcom/flurry/sdk/u;->c:Lcom/flurry/sdk/l;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/flurry/sdk/l;->a(Lcom/flurry/android/impl/ads/FlurryAdModule;Landroid/content/Context;Landroid/view/ViewGroup;Ljava/lang/String;)Lcom/flurry/sdk/k;

    move-result-object v0

    return-object v0
.end method

.method public a(Ljava/lang/String;II)Ljava/util/List;
    .locals 1
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
    .line 580
    iget-object v0, p0, Lcom/flurry/sdk/u;->d:Lcom/flurry/sdk/ak;

    invoke-virtual {v0, p1, p2, p3}, Lcom/flurry/sdk/ak;->a(Ljava/lang/String;II)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public a()V
    .locals 1

    .prologue
    .line 553
    iget-object v0, p0, Lcom/flurry/sdk/u;->d:Lcom/flurry/sdk/ak;

    invoke-virtual {v0}, Lcom/flurry/sdk/ak;->a()V

    .line 554
    return-void
.end method

.method public a(Landroid/content/Context;Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 304
    const/4 v0, 0x3

    sget-object v1, Lcom/flurry/sdk/u;->a:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "removeAd(context = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", adSpaceName = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 307
    invoke-direct {p0, p2}, Lcom/flurry/sdk/u;->g(Ljava/lang/String;)Lcom/flurry/sdk/u$a;

    move-result-object v1

    .line 308
    monitor-enter v1

    .line 309
    :try_start_0
    invoke-virtual {v1}, Lcom/flurry/sdk/u$a;->a()V

    .line 310
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 312
    iget-object v0, p0, Lcom/flurry/sdk/u;->c:Lcom/flurry/sdk/l;

    invoke-virtual {v0, p2}, Lcom/flurry/sdk/l;->a(Ljava/lang/String;)Lcom/flurry/sdk/k;

    move-result-object v0

    .line 313
    if-nez v0, :cond_0

    .line 325
    :goto_0
    return-void

    .line 310
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 317
    :cond_0
    invoke-virtual {v0}, Lcom/flurry/sdk/k;->b()V

    .line 319
    invoke-virtual {v0}, Lcom/flurry/sdk/k;->getViewGroup()Landroid/view/ViewGroup;

    move-result-object v1

    .line 320
    if-eqz v1, :cond_1

    .line 321
    invoke-virtual {v0}, Lcom/flurry/sdk/k;->removeAllViews()V

    .line 322
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 324
    :cond_1
    iget-object v1, p0, Lcom/flurry/sdk/u;->c:Lcom/flurry/sdk/l;

    invoke-virtual {v1, v0}, Lcom/flurry/sdk/l;->a(Lcom/flurry/sdk/k;)V

    goto :goto_0
.end method

.method public a(Landroid/content/Context;Ljava/lang/String;Landroid/view/ViewGroup;Lcom/flurry/android/FlurryAdSize;Z)V
    .locals 3

    .prologue
    .line 199
    invoke-virtual {p0, p2}, Lcom/flurry/sdk/u;->a(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 200
    invoke-direct {p0, p2}, Lcom/flurry/sdk/u;->l(Ljava/lang/String;)V

    .line 235
    :cond_0
    :goto_0
    return-void

    .line 204
    :cond_1
    invoke-direct {p0, p2}, Lcom/flurry/sdk/u;->g(Ljava/lang/String;)Lcom/flurry/sdk/u$a;

    move-result-object v1

    .line 208
    monitor-enter v1

    .line 209
    :try_start_0
    sget-object v0, Lcom/flurry/sdk/u$a$a;->a:Lcom/flurry/sdk/u$a$a;

    invoke-virtual {v1}, Lcom/flurry/sdk/u$a;->b()Lcom/flurry/sdk/u$a$a;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/flurry/sdk/u$a$a;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 210
    if-eqz v0, :cond_2

    .line 211
    sget-object v2, Lcom/flurry/sdk/u$a$a;->b:Lcom/flurry/sdk/u$a$a;

    invoke-virtual {v1, v2}, Lcom/flurry/sdk/u$a;->a(Lcom/flurry/sdk/u$a$a;)V

    .line 212
    invoke-virtual {v1, p1}, Lcom/flurry/sdk/u$a;->a(Landroid/content/Context;)V

    .line 213
    invoke-virtual {v1, p3}, Lcom/flurry/sdk/u$a;->a(Landroid/view/ViewGroup;)V

    .line 214
    invoke-virtual {v1, p5}, Lcom/flurry/sdk/u$a;->a(Z)V

    .line 216
    :cond_2
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 218
    if-eqz v0, :cond_0

    .line 223
    invoke-static {}, Lcom/flurry/sdk/fe;->a()Lcom/flurry/sdk/fe;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/sdk/fe;->c()Z

    move-result v0

    if-nez v0, :cond_3

    .line 224
    const/4 v0, 0x5

    sget-object v1, Lcom/flurry/sdk/u;->a:Ljava/lang/String;

    const-string v2, "There is no network connectivity (ad will not fetch)"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 225
    invoke-direct {p0, p2}, Lcom/flurry/sdk/u;->m(Ljava/lang/String;)V

    goto :goto_0

    .line 216
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 230
    :cond_3
    invoke-direct {p0, p2}, Lcom/flurry/sdk/u;->o(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 231
    invoke-direct {p0, p2}, Lcom/flurry/sdk/u;->h(Ljava/lang/String;)V

    goto :goto_0

    .line 233
    :cond_4
    const/4 v0, 0x0

    invoke-virtual {p0, p2, p3, p4, v0}, Lcom/flurry/sdk/u;->a(Ljava/lang/String;Landroid/view/ViewGroup;Lcom/flurry/android/FlurryAdSize;Z)V

    goto :goto_0
.end method

.method a(Ljava/lang/String;I)V
    .locals 1

    .prologue
    .line 566
    iget-object v0, p0, Lcom/flurry/sdk/u;->d:Lcom/flurry/sdk/ak;

    invoke-virtual {v0, p1, p2}, Lcom/flurry/sdk/ak;->a(Ljava/lang/String;I)V

    .line 567
    return-void
.end method

.method public a(Ljava/lang/String;Landroid/view/ViewGroup;Lcom/flurry/android/FlurryAdSize;Z)V
    .locals 6

    .prologue
    .line 180
    iget-object v0, p0, Lcom/flurry/sdk/u;->f:Lcom/flurry/sdk/es;

    invoke-virtual {v0, p1}, Lcom/flurry/sdk/es;->a(Ljava/lang/Object;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 181
    new-instance v0, Lcom/flurry/sdk/u$b;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/flurry/sdk/u$b;-><init>(Lcom/flurry/sdk/u;Ljava/lang/String;Landroid/view/ViewGroup;Lcom/flurry/android/FlurryAdSize;Z)V

    .line 182
    iget-object v1, p0, Lcom/flurry/sdk/u;->f:Lcom/flurry/sdk/es;

    invoke-virtual {v1, p1, v0}, Lcom/flurry/sdk/es;->a(Ljava/lang/Object;Lcom/flurry/sdk/fj;)V

    .line 184
    :cond_0
    return-void
.end method

.method a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 570
    iget-object v0, p0, Lcom/flurry/sdk/u;->d:Lcom/flurry/sdk/ak;

    invoke-virtual {v0, p1, p2}, Lcom/flurry/sdk/ak;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 571
    return-void
.end method

.method public a(Landroid/content/Context;)Z
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 511
    .line 513
    iget-object v0, p0, Lcom/flurry/sdk/u;->c:Lcom/flurry/sdk/l;

    invoke-virtual {v0, p1}, Lcom/flurry/sdk/l;->a(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    .line 514
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move v1, v2

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/k;

    .line 516
    invoke-virtual {v0}, Lcom/flurry/sdk/k;->b()V

    .line 517
    invoke-virtual {v0}, Lcom/flurry/sdk/k;->removeAllViews()V

    .line 519
    invoke-virtual {v0}, Lcom/flurry/sdk/k;->getViewGroup()Landroid/view/ViewGroup;

    move-result-object v4

    .line 520
    if-eqz v4, :cond_0

    .line 521
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 524
    :cond_0
    iget-object v4, p0, Lcom/flurry/sdk/u;->c:Lcom/flurry/sdk/l;

    invoke-virtual {v4, v0}, Lcom/flurry/sdk/l;->a(Lcom/flurry/sdk/k;)V

    .line 525
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    .line 526
    goto :goto_0

    .line 528
    :cond_1
    if-lez v1, :cond_2

    .line 529
    const/4 v2, 0x1

    .line 532
    :cond_2
    return v2
.end method

.method public a(Landroid/content/Context;Ljava/lang/String;Landroid/view/ViewGroup;)Z
    .locals 8

    .prologue
    const/4 v1, 0x0

    .line 238
    invoke-direct {p0, p2}, Lcom/flurry/sdk/u;->g(Ljava/lang/String;)Lcom/flurry/sdk/u$a;

    move-result-object v3

    .line 241
    const/4 v0, 0x0

    .line 242
    monitor-enter v3

    .line 243
    :try_start_0
    sget-object v2, Lcom/flurry/sdk/u$a$a;->e:Lcom/flurry/sdk/u$a$a;

    invoke-virtual {v3}, Lcom/flurry/sdk/u$a;->b()Lcom/flurry/sdk/u$a$a;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/flurry/sdk/u$a$a;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 244
    invoke-virtual {v3}, Lcom/flurry/sdk/u$a;->f()Lcom/flurry/sdk/ag;

    move-result-object v0

    move-object v2, v0

    .line 246
    :goto_0
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 248
    if-nez v2, :cond_0

    .line 249
    invoke-direct {p0, p2}, Lcom/flurry/sdk/u;->j(Ljava/lang/String;)V

    move v0, v1

    .line 300
    :goto_1
    return v0

    .line 246
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 254
    :cond_0
    invoke-static {}, Lcom/flurry/sdk/fe;->a()Lcom/flurry/sdk/fe;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/sdk/fe;->c()Z

    move-result v0

    if-nez v0, :cond_1

    .line 255
    const/4 v0, 0x5

    sget-object v2, Lcom/flurry/sdk/u;->a:Ljava/lang/String;

    const-string v3, "There is no network connectivity (ad will not display)"

    invoke-static {v0, v2, v3}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 256
    invoke-direct {p0, p2}, Lcom/flurry/sdk/u;->j(Ljava/lang/String;)V

    move v0, v1

    .line 257
    goto :goto_1

    .line 261
    :cond_1
    if-eqz p1, :cond_2

    if-nez p3, :cond_3

    .line 262
    :cond_2
    invoke-direct {p0, p2}, Lcom/flurry/sdk/u;->j(Ljava/lang/String;)V

    move v0, v1

    .line 263
    goto :goto_1

    .line 266
    :cond_3
    invoke-virtual {v2}, Lcom/flurry/sdk/ag;->b()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v4

    .line 267
    instance-of v0, v2, Lcom/flurry/sdk/i;

    if-eqz v0, :cond_4

    sget-object v0, Lcom/flurry/android/FlurryAdType;->WEB_BANNER:Lcom/flurry/android/FlurryAdType;

    .line 272
    :goto_2
    iget-object v5, p0, Lcom/flurry/sdk/u;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v5}, Lcom/flurry/android/impl/ads/FlurryAdModule;->S()Lcom/flurry/android/FlurryAdListener;

    move-result-object v5

    .line 273
    if-eqz v5, :cond_5

    .line 276
    :try_start_2
    invoke-interface {v5, p2, v0}, Lcom/flurry/android/FlurryAdListener;->shouldDisplayAd(Ljava/lang/String;Lcom/flurry/android/FlurryAdType;)Z
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    move-result v0

    .line 281
    :goto_3
    if-nez v0, :cond_5

    move v0, v1

    .line 282
    goto :goto_1

    .line 267
    :cond_4
    sget-object v0, Lcom/flurry/android/FlurryAdType;->WEB_TAKEOVER:Lcom/flurry/android/FlurryAdType;

    goto :goto_2

    .line 277
    :catch_0
    move-exception v0

    .line 278
    const/4 v5, 0x6

    sget-object v6, Lcom/flurry/sdk/u;->a:Ljava/lang/String;

    const-string v7, "AdListener.shouldDisplayAd"

    invoke-static {v5, v6, v7, v0}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    move v0, v1

    goto :goto_3

    .line 286
    :cond_5
    monitor-enter v3

    .line 287
    :try_start_3
    sget-object v0, Lcom/flurry/sdk/u$a$a;->e:Lcom/flurry/sdk/u$a$a;

    invoke-virtual {v3}, Lcom/flurry/sdk/u$a;->b()Lcom/flurry/sdk/u$a$a;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/flurry/sdk/u$a$a;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 288
    invoke-direct {p0, p2}, Lcom/flurry/sdk/u;->j(Ljava/lang/String;)V

    .line 289
    monitor-exit v3

    move v0, v1

    goto :goto_1

    .line 292
    :cond_6
    invoke-virtual {v3}, Lcom/flurry/sdk/u$a;->a()V

    .line 293
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 295
    iget-object v0, p0, Lcom/flurry/sdk/u;->b:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v0, p1, v4, v2}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Landroid/content/Context;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/ag;)V

    .line 296
    invoke-virtual {v2, p1, p3}, Lcom/flurry/sdk/ag;->a(Landroid/content/Context;Landroid/view/ViewGroup;)V

    .line 298
    invoke-direct {p0, p2}, Lcom/flurry/sdk/u;->k(Ljava/lang/String;)V

    .line 300
    const/4 v0, 0x1

    goto :goto_1

    .line 293
    :catchall_1
    move-exception v0

    :try_start_4
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v0

    :cond_7
    move-object v2, v0

    goto :goto_0
.end method

.method public a(Landroid/content/Context;Ljava/lang/String;Landroid/view/ViewGroup;Lcom/flurry/android/FlurryAdSize;)Z
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 188
    invoke-virtual {p0, p2}, Lcom/flurry/sdk/u;->a(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 189
    invoke-virtual {p0, p1, p2, p3}, Lcom/flurry/sdk/u;->a(Landroid/content/Context;Ljava/lang/String;Landroid/view/ViewGroup;)Z

    move-result v5

    .line 193
    :goto_0
    return v5

    :cond_0
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 192
    invoke-virtual/range {v0 .. v5}, Lcom/flurry/sdk/u;->a(Landroid/content/Context;Ljava/lang/String;Landroid/view/ViewGroup;Lcom/flurry/android/FlurryAdSize;Z)V

    goto :goto_0
.end method

.method public a(Landroid/content/Context;Ljava/lang/String;Lcom/flurry/android/FlurryAdSize;)Z
    .locals 1

    .prologue
    .line 339
    invoke-virtual {p0, p2}, Lcom/flurry/sdk/u;->a(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public a(Ljava/lang/String;)Z
    .locals 3

    .prologue
    .line 328
    .line 330
    invoke-direct {p0, p1}, Lcom/flurry/sdk/u;->g(Ljava/lang/String;)Lcom/flurry/sdk/u$a;

    move-result-object v1

    .line 331
    monitor-enter v1

    .line 332
    :try_start_0
    sget-object v0, Lcom/flurry/sdk/u$a$a;->e:Lcom/flurry/sdk/u$a$a;

    invoke-virtual {v1}, Lcom/flurry/sdk/u$a;->b()Lcom/flurry/sdk/u$a$a;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/flurry/sdk/u$a$a;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 333
    monitor-exit v1

    .line 335
    return v0

    .line 333
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public b()Lcom/flurry/sdk/ak;
    .locals 1

    .prologue
    .line 584
    iget-object v0, p0, Lcom/flurry/sdk/u;->d:Lcom/flurry/sdk/ak;

    return-object v0
.end method

.method public b(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 343
    invoke-direct {p0, p1}, Lcom/flurry/sdk/u;->g(Ljava/lang/String;)Lcom/flurry/sdk/u$a;

    move-result-object v0

    .line 344
    invoke-virtual {v0}, Lcom/flurry/sdk/u$a;->g()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public c(Ljava/lang/String;)Lcom/flurry/sdk/k;
    .locals 1

    .prologue
    .line 541
    iget-object v0, p0, Lcom/flurry/sdk/u;->c:Lcom/flurry/sdk/l;

    invoke-virtual {v0, p1}, Lcom/flurry/sdk/l;->a(Ljava/lang/String;)Lcom/flurry/sdk/k;

    move-result-object v0

    return-object v0
.end method

.method public d(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 557
    iget-object v0, p0, Lcom/flurry/sdk/u;->d:Lcom/flurry/sdk/ak;

    invoke-virtual {v0, p1}, Lcom/flurry/sdk/ak;->a(Ljava/lang/String;)V

    .line 558
    return-void
.end method

.method e(Ljava/lang/String;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;
    .locals 1

    .prologue
    .line 575
    iget-object v0, p0, Lcom/flurry/sdk/u;->d:Lcom/flurry/sdk/ak;

    invoke-virtual {v0, p1}, Lcom/flurry/sdk/ak;->d(Ljava/lang/String;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v0

    .line 576
    return-object v0
.end method

.method public f(Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 590
    iget-object v0, p0, Lcom/flurry/sdk/u;->d:Lcom/flurry/sdk/ak;

    invoke-virtual {v0, p1}, Lcom/flurry/sdk/ak;->b(Ljava/lang/String;)V

    .line 591
    const/4 v0, 0x3

    sget-object v1, Lcom/flurry/sdk/u;->a:Ljava/lang/String;

    const-string v2, "fetchAdTaskExecute :setting cache request limit count"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 592
    return-void
.end method
