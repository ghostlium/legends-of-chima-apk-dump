.class public Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;
.super Lcom/flurry/sdk/gw;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/gw",
        "<",
        "Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;",
        ">;"
    }
.end annotation


# instance fields
.field private a:Ljava/lang/CharSequence;

.field private b:Ljava/lang/CharSequence;

.field private c:Ljava/lang/CharSequence;

.field private d:J

.field private e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId;",
            ">;"
        }
    .end annotation
.end field

.field private f:Lcom/flurry/android/impl/ads/avro/protocol/v6/Location;

.field private g:Z

.field private h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private i:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer;

.field private j:Ljava/lang/CharSequence;

.field private k:Ljava/lang/CharSequence;

.field private l:Ljava/lang/CharSequence;

.field private m:Ljava/lang/CharSequence;

.field private n:Lcom/flurry/android/impl/ads/avro/protocol/v6/TestAds;

.field private o:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/CharSequence;",
            "Ljava/lang/CharSequence;",
            ">;"
        }
    .end annotation
.end field

.field private p:Z

.field private q:Z

.field private r:I

.field private s:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo;",
            ">;"
        }
    .end annotation
.end field

.field private t:Z

.field private u:Ljava/lang/CharSequence;

.field private v:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/CharSequence;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 467
    sget-object v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->SCHEMA$:Lcom/flurry/sdk/fm;

    invoke-direct {p0, v0}, Lcom/flurry/sdk/gw;-><init>(Lcom/flurry/sdk/fm;)V

    .line 468
    return-void
.end method

.method synthetic constructor <init>(Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$1;)V
    .locals 0

    .prologue
    .line 439
    invoke-direct {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public a(I)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;
    .locals 3

    .prologue
    const/16 v2, 0x11

    .line 996
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 997
    iput p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->r:I

    .line 998
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x1

    aput-boolean v1, v0, v2

    .line 999
    return-object p0
.end method

.method public a(J)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;
    .locals 3

    .prologue
    const/4 v2, 0x3

    .line 650
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 651
    iput-wide p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->d:J

    .line 652
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x1

    aput-boolean v1, v0, v2

    .line 653
    return-object p0
.end method

.method public a(Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;
    .locals 3

    .prologue
    const/16 v2, 0x8

    .line 773
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-virtual {p0, v0, p1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 774
    iput-object p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->i:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer;

    .line 775
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x1

    aput-boolean v1, v0, v2

    .line 776
    return-object p0
.end method

.method public a(Lcom/flurry/android/impl/ads/avro/protocol/v6/Location;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;
    .locals 3

    .prologue
    const/4 v2, 0x5

    .line 699
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-virtual {p0, v0, p1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 700
    iput-object p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->f:Lcom/flurry/android/impl/ads/avro/protocol/v6/Location;

    .line 701
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x1

    aput-boolean v1, v0, v2

    .line 702
    return-object p0
.end method

.method public a(Ljava/lang/CharSequence;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 575
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-virtual {p0, v0, p1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 576
    iput-object p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a:Ljava/lang/CharSequence;

    .line 577
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x1

    aput-boolean v1, v0, v2

    .line 578
    return-object p0
.end method

.method public a(Ljava/util/List;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId;",
            ">;)",
            "Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;"
        }
    .end annotation

    .prologue
    const/4 v2, 0x4

    .line 674
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-virtual {p0, v0, p1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 675
    iput-object p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->e:Ljava/util/List;

    .line 676
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x1

    aput-boolean v1, v0, v2

    .line 677
    return-object p0
.end method

.method public a(Z)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;
    .locals 3

    .prologue
    const/4 v2, 0x6

    .line 724
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 725
    iput-boolean p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->g:Z

    .line 726
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x1

    aput-boolean v1, v0, v2

    .line 727
    return-object p0
.end method

.method public a()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;
    .locals 3

    .prologue
    .line 1115
    :try_start_0
    new-instance v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;

    invoke-direct {v2}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;-><init>()V

    .line 1116
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x0

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a:Ljava/lang/CharSequence;

    :goto_0
    iput-object v0, v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->a:Ljava/lang/CharSequence;

    .line 1117
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x1

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b:Ljava/lang/CharSequence;

    :goto_1
    iput-object v0, v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->b:Ljava/lang/CharSequence;

    .line 1118
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x2

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c:Ljava/lang/CharSequence;

    :goto_2
    iput-object v0, v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->c:Ljava/lang/CharSequence;

    .line 1119
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x3

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_3

    iget-wide v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->d:J

    :goto_3
    iput-wide v0, v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->d:J

    .line 1120
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x4

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->e:Ljava/util/List;

    :goto_4
    iput-object v0, v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->e:Ljava/util/List;

    .line 1121
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x5

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->f:Lcom/flurry/android/impl/ads/avro/protocol/v6/Location;

    :goto_5
    iput-object v0, v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->f:Lcom/flurry/android/impl/ads/avro/protocol/v6/Location;

    .line 1122
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x6

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_6

    iget-boolean v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->g:Z

    :goto_6
    iput-boolean v0, v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->g:Z

    .line 1123
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x7

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->h:Ljava/util/List;

    :goto_7
    iput-object v0, v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->h:Ljava/util/List;

    .line 1124
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/16 v1, 0x8

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->i:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer;

    :goto_8
    iput-object v0, v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->i:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer;

    .line 1125
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/16 v1, 0x9

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->j:Ljava/lang/CharSequence;

    :goto_9
    iput-object v0, v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->j:Ljava/lang/CharSequence;

    .line 1126
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/16 v1, 0xa

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->k:Ljava/lang/CharSequence;

    :goto_a
    iput-object v0, v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->k:Ljava/lang/CharSequence;

    .line 1127
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/16 v1, 0xb

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->l:Ljava/lang/CharSequence;

    :goto_b
    iput-object v0, v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->l:Ljava/lang/CharSequence;

    .line 1128
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/16 v1, 0xc

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->m:Ljava/lang/CharSequence;

    :goto_c
    iput-object v0, v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->m:Ljava/lang/CharSequence;

    .line 1129
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/16 v1, 0xd

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->n:Lcom/flurry/android/impl/ads/avro/protocol/v6/TestAds;

    :goto_d
    iput-object v0, v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->n:Lcom/flurry/android/impl/ads/avro/protocol/v6/TestAds;

    .line 1130
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/16 v1, 0xe

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->o:Ljava/util/Map;

    :goto_e
    iput-object v0, v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->o:Ljava/util/Map;

    .line 1131
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/16 v1, 0xf

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_f

    iget-boolean v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->p:Z

    :goto_f
    iput-boolean v0, v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->p:Z

    .line 1132
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/16 v1, 0x10

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_10

    iget-boolean v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->q:Z

    :goto_10
    iput-boolean v0, v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->q:Z

    .line 1133
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/16 v1, 0x11

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_11

    iget v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->r:I

    :goto_11
    iput v0, v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->r:I

    .line 1134
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/16 v1, 0x12

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->s:Ljava/util/List;

    :goto_12
    iput-object v0, v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->s:Ljava/util/List;

    .line 1135
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/16 v1, 0x13

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_13

    iget-boolean v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->t:Z

    :goto_13
    iput-boolean v0, v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->t:Z

    .line 1136
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/16 v1, 0x14

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->u:Ljava/lang/CharSequence;

    :goto_14
    iput-object v0, v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->u:Ljava/lang/CharSequence;

    .line 1137
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/16 v1, 0x15

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_15

    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->v:Ljava/util/List;

    :goto_15
    iput-object v0, v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->v:Ljava/util/List;

    .line 1138
    return-object v2

    .line 1116
    :cond_0
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    goto/16 :goto_0

    .line 1117
    :cond_1
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/4 v1, 0x1

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    goto/16 :goto_1

    .line 1118
    :cond_2
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/4 v1, 0x2

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    goto/16 :goto_2

    .line 1119
    :cond_3
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/4 v1, 0x3

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    goto/16 :goto_3

    .line 1120
    :cond_4
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/4 v1, 0x4

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    goto/16 :goto_4

    .line 1121
    :cond_5
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/4 v1, 0x5

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/Location;

    goto/16 :goto_5

    .line 1122
    :cond_6
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/4 v1, 0x6

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    goto/16 :goto_6

    .line 1123
    :cond_7
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/4 v1, 0x7

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    goto/16 :goto_7

    .line 1124
    :cond_8
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/16 v1, 0x8

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer;

    goto/16 :goto_8

    .line 1125
    :cond_9
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/16 v1, 0x9

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    goto/16 :goto_9

    .line 1126
    :cond_a
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/16 v1, 0xa

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    goto/16 :goto_a

    .line 1127
    :cond_b
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/16 v1, 0xb

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    goto/16 :goto_b

    .line 1128
    :cond_c
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/16 v1, 0xc

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    goto/16 :goto_c

    .line 1129
    :cond_d
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/16 v1, 0xd

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/TestAds;

    goto/16 :goto_d

    .line 1130
    :cond_e
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/16 v1, 0xe

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    goto/16 :goto_e

    .line 1131
    :cond_f
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/16 v1, 0xf

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    goto/16 :goto_f

    .line 1132
    :cond_10
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/16 v1, 0x10

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    goto/16 :goto_10

    .line 1133
    :cond_11
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/16 v1, 0x11

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto/16 :goto_11

    .line 1134
    :cond_12
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/16 v1, 0x12

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    goto/16 :goto_12

    .line 1135
    :cond_13
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/16 v1, 0x13

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    goto/16 :goto_13

    .line 1136
    :cond_14
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/16 v1, 0x14

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    goto/16 :goto_14

    .line 1137
    :cond_15
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/16 v1, 0x15

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_15

    .line 1139
    :catch_0
    move-exception v0

    .line 1140
    new-instance v1, Lcom/flurry/sdk/fk;

    invoke-direct {v1, v0}, Lcom/flurry/sdk/fk;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public b(Ljava/lang/CharSequence;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 600
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v1

    invoke-virtual {p0, v0, p1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 601
    iput-object p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b:Ljava/lang/CharSequence;

    .line 602
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    aput-boolean v1, v0, v1

    .line 603
    return-object p0
.end method

.method public b(Ljava/util/List;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;)",
            "Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;"
        }
    .end annotation

    .prologue
    const/4 v2, 0x7

    .line 748
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-virtual {p0, v0, p1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 749
    iput-object p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->h:Ljava/util/List;

    .line 750
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x1

    aput-boolean v1, v0, v2

    .line 751
    return-object p0
.end method

.method public b(Z)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;
    .locals 3

    .prologue
    const/16 v2, 0x10

    .line 972
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 973
    iput-boolean p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->q:Z

    .line 974
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x1

    aput-boolean v1, v0, v2

    .line 975
    return-object p0
.end method

.method public c(Ljava/lang/CharSequence;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;
    .locals 3

    .prologue
    const/4 v2, 0x2

    .line 625
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-virtual {p0, v0, p1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 626
    iput-object p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c:Ljava/lang/CharSequence;

    .line 627
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x1

    aput-boolean v1, v0, v2

    .line 628
    return-object p0
.end method

.method public c(Ljava/util/List;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo;",
            ">;)",
            "Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;"
        }
    .end annotation

    .prologue
    const/16 v2, 0x12

    .line 1020
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-virtual {p0, v0, p1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 1021
    iput-object p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->s:Ljava/util/List;

    .line 1022
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x1

    aput-boolean v1, v0, v2

    .line 1023
    return-object p0
.end method

.method public d(Ljava/lang/CharSequence;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;
    .locals 3

    .prologue
    const/16 v2, 0x9

    .line 798
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-virtual {p0, v0, p1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 799
    iput-object p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->j:Ljava/lang/CharSequence;

    .line 800
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x1

    aput-boolean v1, v0, v2

    .line 801
    return-object p0
.end method

.method public d(Ljava/util/List;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/CharSequence;",
            ">;)",
            "Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;"
        }
    .end annotation

    .prologue
    const/16 v2, 0x15

    .line 1094
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-virtual {p0, v0, p1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 1095
    iput-object p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->v:Ljava/util/List;

    .line 1096
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x1

    aput-boolean v1, v0, v2

    .line 1097
    return-object p0
.end method

.method public e(Ljava/lang/CharSequence;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;
    .locals 3

    .prologue
    const/16 v2, 0xa

    .line 823
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-virtual {p0, v0, p1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 824
    iput-object p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->k:Ljava/lang/CharSequence;

    .line 825
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x1

    aput-boolean v1, v0, v2

    .line 826
    return-object p0
.end method

.method public f(Ljava/lang/CharSequence;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;
    .locals 3

    .prologue
    const/16 v2, 0xb

    .line 848
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-virtual {p0, v0, p1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 849
    iput-object p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->l:Ljava/lang/CharSequence;

    .line 850
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x1

    aput-boolean v1, v0, v2

    .line 851
    return-object p0
.end method

.method public g(Ljava/lang/CharSequence;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;
    .locals 3

    .prologue
    const/16 v2, 0xc

    .line 873
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-virtual {p0, v0, p1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 874
    iput-object p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->m:Ljava/lang/CharSequence;

    .line 875
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x1

    aput-boolean v1, v0, v2

    .line 876
    return-object p0
.end method

.method public h(Ljava/lang/CharSequence;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;
    .locals 3

    .prologue
    const/16 v2, 0x14

    .line 1069
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-virtual {p0, v0, p1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 1070
    iput-object p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->u:Ljava/lang/CharSequence;

    .line 1071
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x1

    aput-boolean v1, v0, v2

    .line 1072
    return-object p0
.end method
