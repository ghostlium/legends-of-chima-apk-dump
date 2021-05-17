.class public Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer;
.super Lcom/flurry/sdk/gv;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/sdk/gu;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$1;,
        Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;
    }
.end annotation


# static fields
.field public static final SCHEMA$:Lcom/flurry/sdk/fm;


# instance fields
.field public a:I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public b:I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public c:I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public d:I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public e:F
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

    const-string v1, "{\"type\":\"record\",\"name\":\"AdViewContainer\",\"namespace\":\"com.flurry.android.impl.ads.avro.protocol.v6\",\"fields\":[{\"name\":\"viewWidth\",\"type\":\"int\",\"default\":0},{\"name\":\"viewHeight\",\"type\":\"int\",\"default\":0},{\"name\":\"screenWidth\",\"type\":\"int\",\"default\":0},{\"name\":\"screenHeight\",\"type\":\"int\",\"default\":0},{\"name\":\"density\",\"type\":\"float\",\"default\":1.0}]}"

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/fm$q;->a(Ljava/lang/String;)Lcom/flurry/sdk/fm;

    move-result-object v0

    sput-object v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer;->SCHEMA$:Lcom/flurry/sdk/fm;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Lcom/flurry/sdk/gv;-><init>()V

    .line 133
    return-void
.end method

.method public static b()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;
    .locals 2

    .prologue
    .line 117
    new-instance v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;-><init>(Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$1;)V

    return-object v0
.end method


# virtual methods
.method public a()Lcom/flurry/sdk/fm;
    .locals 1

    .prologue
    .line 15
    sget-object v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer;->SCHEMA$:Lcom/flurry/sdk/fm;

    return-object v0
.end method

.method public a(I)Ljava/lang/Object;
    .locals 2

    .prologue
    .line 18
    packed-switch p1, :pswitch_data_0

    .line 24
    new-instance v0, Lcom/flurry/sdk/fk;

    const-string v1, "Bad index"

    invoke-direct {v0, v1}, Lcom/flurry/sdk/fk;-><init>(Ljava/lang/String;)V

    throw v0

    .line 19
    :pswitch_0
    iget v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 23
    :goto_0
    return-object v0

    .line 20
    :pswitch_1
    iget v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer;->b:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    .line 21
    :pswitch_2
    iget v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer;->c:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    .line 22
    :pswitch_3
    iget v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer;->d:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    .line 23
    :pswitch_4
    iget v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer;->e:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    goto :goto_0

    .line 18
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public a(ILjava/lang/Object;)V
    .locals 2

    .prologue
    .line 30
    packed-switch p1, :pswitch_data_0

    .line 36
    new-instance v0, Lcom/flurry/sdk/fk;

    const-string v1, "Bad index"

    invoke-direct {v0, v1}, Lcom/flurry/sdk/fk;-><init>(Ljava/lang/String;)V

    throw v0

    .line 31
    :pswitch_0
    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer;->a:I

    .line 38
    :goto_0
    return-void

    .line 32
    :pswitch_1
    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer;->b:I

    goto :goto_0

    .line 33
    :pswitch_2
    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer;->c:I

    goto :goto_0

    .line 34
    :pswitch_3
    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer;->d:I

    goto :goto_0

    .line 35
    :pswitch_4
    check-cast p2, Ljava/lang/Float;

    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iput v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer;->e:F

    goto :goto_0

    .line 30
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method
