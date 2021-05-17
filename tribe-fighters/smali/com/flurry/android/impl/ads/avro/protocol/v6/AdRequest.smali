.class public Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;
.super Lcom/flurry/sdk/gv;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/sdk/gu;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$1;,
        Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;
    }
.end annotation


# static fields
.field public static final SCHEMA$:Lcom/flurry/sdk/fm;


# instance fields
.field public a:Ljava/lang/CharSequence;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public b:Ljava/lang/CharSequence;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public c:Ljava/lang/CharSequence;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public d:J
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public f:Lcom/flurry/android/impl/ads/avro/protocol/v6/Location;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public g:Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public i:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public j:Ljava/lang/CharSequence;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public k:Ljava/lang/CharSequence;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public l:Ljava/lang/CharSequence;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public m:Ljava/lang/CharSequence;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public n:Lcom/flurry/android/impl/ads/avro/protocol/v6/TestAds;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public o:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/CharSequence;",
            "Ljava/lang/CharSequence;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public p:Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public q:Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public r:I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public s:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public t:Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public u:Ljava/lang/CharSequence;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public v:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/CharSequence;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 9
    new-instance v0, Lcom/flurry/sdk/fm$q;

    invoke-direct {v0}, Lcom/flurry/sdk/fm$q;-><init>()V

    const-string v1, "{\"type\":\"record\",\"name\":\"AdRequest\",\"namespace\":\"com.flurry.android.impl.ads.avro.protocol.v6\",\"fields\":[{\"name\":\"apiKey\",\"type\":\"string\"},{\"name\":\"agentVersion\",\"type\":\"string\",\"default\":\"null\"},{\"name\":\"adSpaceName\",\"type\":\"string\"},{\"name\":\"sessionId\",\"type\":\"long\"},{\"name\":\"adReportedIds\",\"type\":{\"type\":\"array\",\"items\":{\"type\":\"record\",\"name\":\"AdReportedId\",\"fields\":[{\"name\":\"type\",\"type\":\"int\"},{\"name\":\"id\",\"type\":\"bytes\"}]}}},{\"name\":\"location\",\"type\":{\"type\":\"record\",\"name\":\"Location\",\"fields\":[{\"name\":\"lat\",\"type\":\"float\",\"default\":0.0},{\"name\":\"lon\",\"type\":\"float\",\"default\":0.0}]},\"default\":\"null\"},{\"name\":\"testDevice\",\"type\":\"boolean\",\"default\":false},{\"name\":\"bindings\",\"type\":{\"type\":\"array\",\"items\":\"int\"}},{\"name\":\"adViewContainer\",\"type\":{\"type\":\"record\",\"name\":\"AdViewContainer\",\"fields\":[{\"name\":\"viewWidth\",\"type\":\"int\",\"default\":0},{\"name\":\"viewHeight\",\"type\":\"int\",\"default\":0},{\"name\":\"screenWidth\",\"type\":\"int\",\"default\":0},{\"name\":\"screenHeight\",\"type\":\"int\",\"default\":0},{\"name\":\"density\",\"type\":\"float\",\"default\":1.0}]},\"default\":\"null\"},{\"name\":\"locale\",\"type\":\"string\",\"default\":\"null\"},{\"name\":\"timezone\",\"type\":\"string\",\"default\":\"null\"},{\"name\":\"osVersion\",\"type\":\"string\",\"default\":\"null\"},{\"name\":\"devicePlatform\",\"type\":\"string\",\"default\":\"null\"},{\"name\":\"testAds\",\"type\":{\"type\":\"record\",\"name\":\"TestAds\",\"fields\":[{\"name\":\"adspacePlacement\",\"type\":\"int\",\"default\":0}]},\"default\":\"null\"},{\"name\":\"keywords\",\"type\":{\"type\":\"map\",\"values\":\"string\"},\"default\":[]},{\"name\":\"refresh\",\"type\":\"boolean\",\"default\":false},{\"name\":\"canDoSKAppStore\",\"type\":\"boolean\",\"default\":false},{\"name\":\"networkStatus\",\"type\":\"int\",\"default\":1},{\"name\":\"frequencyCapInfos\",\"type\":{\"type\":\"array\",\"items\":{\"type\":\"record\",\"name\":\"FrequencyCapInfo\",\"fields\":[{\"name\":\"idHash\",\"type\":\"string\",\"default\":\"null\"},{\"name\":\"serveTime\",\"type\":\"long\"},{\"name\":\"expirationTime\",\"type\":\"long\"},{\"name\":\"views\",\"type\":\"int\"},{\"name\":\"newCap\",\"type\":\"int\"},{\"name\":\"previousCap\",\"type\":\"int\"},{\"name\":\"previousCapType\",\"type\":\"int\"}]}}},{\"name\":\"adTrackingEnabled\",\"type\":\"boolean\",\"default\":false},{\"name\":\"preferredLanguage\",\"type\":\"string\",\"default\":\"null\"},{\"name\":\"bcat\",\"type\":{\"type\":\"array\",\"items\":\"string\"},\"default\":[]}]}"

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/fm$q;->a(Ljava/lang/String;)Lcom/flurry/sdk/fm;

    move-result-object v0

    sput-object v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->SCHEMA$:Lcom/flurry/sdk/fm;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Lcom/flurry/sdk/gv;-><init>()V

    .line 439
    return-void
.end method

.method public static b()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;
    .locals 2

    .prologue
    .line 423
    new-instance v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$Builder;-><init>(Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest$1;)V

    return-object v0
.end method


# virtual methods
.method public a()Lcom/flurry/sdk/fm;
    .locals 1

    .prologue
    .line 32
    sget-object v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->SCHEMA$:Lcom/flurry/sdk/fm;

    return-object v0
.end method

.method public a(I)Ljava/lang/Object;
    .locals 2

    .prologue
    .line 35
    packed-switch p1, :pswitch_data_0

    .line 58
    new-instance v0, Lcom/flurry/sdk/fk;

    const-string v1, "Bad index"

    invoke-direct {v0, v1}, Lcom/flurry/sdk/fk;-><init>(Ljava/lang/String;)V

    throw v0

    .line 36
    :pswitch_0
    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->a:Ljava/lang/CharSequence;

    .line 57
    :goto_0
    return-object v0

    .line 37
    :pswitch_1
    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->b:Ljava/lang/CharSequence;

    goto :goto_0

    .line 38
    :pswitch_2
    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->c:Ljava/lang/CharSequence;

    goto :goto_0

    .line 39
    :pswitch_3
    iget-wide v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->d:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    goto :goto_0

    .line 40
    :pswitch_4
    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->e:Ljava/util/List;

    goto :goto_0

    .line 41
    :pswitch_5
    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->f:Lcom/flurry/android/impl/ads/avro/protocol/v6/Location;

    goto :goto_0

    .line 42
    :pswitch_6
    iget-boolean v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->g:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0

    .line 43
    :pswitch_7
    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->h:Ljava/util/List;

    goto :goto_0

    .line 44
    :pswitch_8
    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->i:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer;

    goto :goto_0

    .line 45
    :pswitch_9
    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->j:Ljava/lang/CharSequence;

    goto :goto_0

    .line 46
    :pswitch_a
    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->k:Ljava/lang/CharSequence;

    goto :goto_0

    .line 47
    :pswitch_b
    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->l:Ljava/lang/CharSequence;

    goto :goto_0

    .line 48
    :pswitch_c
    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->m:Ljava/lang/CharSequence;

    goto :goto_0

    .line 49
    :pswitch_d
    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->n:Lcom/flurry/android/impl/ads/avro/protocol/v6/TestAds;

    goto :goto_0

    .line 50
    :pswitch_e
    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->o:Ljava/util/Map;

    goto :goto_0

    .line 51
    :pswitch_f
    iget-boolean v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->p:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0

    .line 52
    :pswitch_10
    iget-boolean v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->q:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0

    .line 53
    :pswitch_11
    iget v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->r:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    .line 54
    :pswitch_12
    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->s:Ljava/util/List;

    goto :goto_0

    .line 55
    :pswitch_13
    iget-boolean v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->t:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0

    .line 56
    :pswitch_14
    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->u:Ljava/lang/CharSequence;

    goto :goto_0

    .line 57
    :pswitch_15
    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->v:Ljava/util/List;

    goto :goto_0

    .line 35
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_12
        :pswitch_13
        :pswitch_14
        :pswitch_15
    .end packed-switch
.end method

.method public a(ILjava/lang/Object;)V
    .locals 2

    .prologue
    .line 64
    packed-switch p1, :pswitch_data_0

    .line 87
    new-instance v0, Lcom/flurry/sdk/fk;

    const-string v1, "Bad index"

    invoke-direct {v0, v1}, Lcom/flurry/sdk/fk;-><init>(Ljava/lang/String;)V

    throw v0

    .line 65
    :pswitch_0
    check-cast p2, Ljava/lang/CharSequence;

    iput-object p2, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->a:Ljava/lang/CharSequence;

    .line 89
    :goto_0
    return-void

    .line 66
    :pswitch_1
    check-cast p2, Ljava/lang/CharSequence;

    iput-object p2, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->b:Ljava/lang/CharSequence;

    goto :goto_0

    .line 67
    :pswitch_2
    check-cast p2, Ljava/lang/CharSequence;

    iput-object p2, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->c:Ljava/lang/CharSequence;

    goto :goto_0

    .line 68
    :pswitch_3
    check-cast p2, Ljava/lang/Long;

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->d:J

    goto :goto_0

    .line 69
    :pswitch_4
    check-cast p2, Ljava/util/List;

    iput-object p2, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->e:Ljava/util/List;

    goto :goto_0

    .line 70
    :pswitch_5
    check-cast p2, Lcom/flurry/android/impl/ads/avro/protocol/v6/Location;

    iput-object p2, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->f:Lcom/flurry/android/impl/ads/avro/protocol/v6/Location;

    goto :goto_0

    .line 71
    :pswitch_6
    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->g:Z

    goto :goto_0

    .line 72
    :pswitch_7
    check-cast p2, Ljava/util/List;

    iput-object p2, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->h:Ljava/util/List;

    goto :goto_0

    .line 73
    :pswitch_8
    check-cast p2, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer;

    iput-object p2, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->i:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer;

    goto :goto_0

    .line 74
    :pswitch_9
    check-cast p2, Ljava/lang/CharSequence;

    iput-object p2, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->j:Ljava/lang/CharSequence;

    goto :goto_0

    .line 75
    :pswitch_a
    check-cast p2, Ljava/lang/CharSequence;

    iput-object p2, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->k:Ljava/lang/CharSequence;

    goto :goto_0

    .line 76
    :pswitch_b
    check-cast p2, Ljava/lang/CharSequence;

    iput-object p2, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->l:Ljava/lang/CharSequence;

    goto :goto_0

    .line 77
    :pswitch_c
    check-cast p2, Ljava/lang/CharSequence;

    iput-object p2, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->m:Ljava/lang/CharSequence;

    goto :goto_0

    .line 78
    :pswitch_d
    check-cast p2, Lcom/flurry/android/impl/ads/avro/protocol/v6/TestAds;

    iput-object p2, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->n:Lcom/flurry/android/impl/ads/avro/protocol/v6/TestAds;

    goto :goto_0

    .line 79
    :pswitch_e
    check-cast p2, Ljava/util/Map;

    iput-object p2, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->o:Ljava/util/Map;

    goto :goto_0

    .line 80
    :pswitch_f
    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->p:Z

    goto :goto_0

    .line 81
    :pswitch_10
    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->q:Z

    goto :goto_0

    .line 82
    :pswitch_11
    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->r:I

    goto :goto_0

    .line 83
    :pswitch_12
    check-cast p2, Ljava/util/List;

    iput-object p2, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->s:Ljava/util/List;

    goto :goto_0

    .line 84
    :pswitch_13
    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->t:Z

    goto :goto_0

    .line 85
    :pswitch_14
    check-cast p2, Ljava/lang/CharSequence;

    iput-object p2, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->u:Ljava/lang/CharSequence;

    goto :goto_0

    .line 86
    :pswitch_15
    check-cast p2, Ljava/util/List;

    iput-object p2, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->v:Ljava/util/List;

    goto/16 :goto_0

    .line 64
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_12
        :pswitch_13
        :pswitch_14
        :pswitch_15
    .end packed-switch
.end method

.method public a(Lcom/flurry/android/impl/ads/avro/protocol/v6/TestAds;)V
    .locals 0

    .prologue
    .line 298
    iput-object p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->n:Lcom/flurry/android/impl/ads/avro/protocol/v6/TestAds;

    .line 299
    return-void
.end method

.method public a(Ljava/lang/Boolean;)V
    .locals 1

    .prologue
    .line 328
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->p:Z

    .line 329
    return-void
.end method

.method public a(Ljava/lang/CharSequence;)V
    .locals 0

    .prologue
    .line 133
    iput-object p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->c:Ljava/lang/CharSequence;

    .line 134
    return-void
.end method

.method public a(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/CharSequence;",
            "Ljava/lang/CharSequence;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 313
    iput-object p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdRequest;->o:Ljava/util/Map;

    .line 314
    return-void
.end method
