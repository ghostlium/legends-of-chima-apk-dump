.class public Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;
.super Lcom/flurry/sdk/gv;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/sdk/gu;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame$1;,
        Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame$Builder;
    }
.end annotation


# static fields
.field public static final SCHEMA$:Lcom/flurry/sdk/fm;


# instance fields
.field public a:I
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

.field public d:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdSpaceLayout;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/flurry/android/impl/ads/avro/protocol/v6/Callback;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public f:Ljava/lang/CharSequence;
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

    const-string v1, "{\"type\":\"record\",\"name\":\"AdFrame\",\"namespace\":\"com.flurry.android.impl.ads.avro.protocol.v6\",\"fields\":[{\"name\":\"binding\",\"type\":\"int\"},{\"name\":\"display\",\"type\":\"string\"},{\"name\":\"content\",\"type\":\"string\"},{\"name\":\"adSpaceLayout\",\"type\":{\"type\":\"record\",\"name\":\"AdSpaceLayout\",\"fields\":[{\"name\":\"adWidth\",\"type\":\"int\"},{\"name\":\"adHeight\",\"type\":\"int\"},{\"name\":\"fix\",\"type\":\"string\"},{\"name\":\"format\",\"type\":\"string\"},{\"name\":\"alignment\",\"type\":\"string\"}]}},{\"name\":\"callbacks\",\"type\":{\"type\":\"array\",\"items\":{\"type\":\"record\",\"name\":\"Callback\",\"fields\":[{\"name\":\"event\",\"type\":\"string\"},{\"name\":\"actions\",\"type\":{\"type\":\"array\",\"items\":\"string\"}}]}}},{\"name\":\"adGuid\",\"type\":\"string\"}]}"

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/fm$q;->a(Ljava/lang/String;)Lcom/flurry/sdk/fm;

    move-result-object v0

    sput-object v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->SCHEMA$:Lcom/flurry/sdk/fm;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Lcom/flurry/sdk/gv;-><init>()V

    .line 151
    return-void
.end method


# virtual methods
.method public a()Lcom/flurry/sdk/fm;
    .locals 1

    .prologue
    .line 16
    sget-object v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->SCHEMA$:Lcom/flurry/sdk/fm;

    return-object v0
.end method

.method public a(I)Ljava/lang/Object;
    .locals 2

    .prologue
    .line 19
    packed-switch p1, :pswitch_data_0

    .line 26
    new-instance v0, Lcom/flurry/sdk/fk;

    const-string v1, "Bad index"

    invoke-direct {v0, v1}, Lcom/flurry/sdk/fk;-><init>(Ljava/lang/String;)V

    throw v0

    .line 20
    :pswitch_0
    iget v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 25
    :goto_0
    return-object v0

    .line 21
    :pswitch_1
    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->b:Ljava/lang/CharSequence;

    goto :goto_0

    .line 22
    :pswitch_2
    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->c:Ljava/lang/CharSequence;

    goto :goto_0

    .line 23
    :pswitch_3
    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->d:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdSpaceLayout;

    goto :goto_0

    .line 24
    :pswitch_4
    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->e:Ljava/util/List;

    goto :goto_0

    .line 25
    :pswitch_5
    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->f:Ljava/lang/CharSequence;

    goto :goto_0

    .line 19
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method public a(ILjava/lang/Object;)V
    .locals 2

    .prologue
    .line 32
    packed-switch p1, :pswitch_data_0

    .line 39
    new-instance v0, Lcom/flurry/sdk/fk;

    const-string v1, "Bad index"

    invoke-direct {v0, v1}, Lcom/flurry/sdk/fk;-><init>(Ljava/lang/String;)V

    throw v0

    .line 33
    :pswitch_0
    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->a:I

    .line 41
    :goto_0
    return-void

    .line 34
    :pswitch_1
    check-cast p2, Ljava/lang/CharSequence;

    iput-object p2, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->b:Ljava/lang/CharSequence;

    goto :goto_0

    .line 35
    :pswitch_2
    check-cast p2, Ljava/lang/CharSequence;

    iput-object p2, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->c:Ljava/lang/CharSequence;

    goto :goto_0

    .line 36
    :pswitch_3
    check-cast p2, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdSpaceLayout;

    iput-object p2, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->d:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdSpaceLayout;

    goto :goto_0

    .line 37
    :pswitch_4
    check-cast p2, Ljava/util/List;

    iput-object p2, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->e:Ljava/util/List;

    goto :goto_0

    .line 38
    :pswitch_5
    check-cast p2, Ljava/lang/CharSequence;

    iput-object p2, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->f:Ljava/lang/CharSequence;

    goto :goto_0

    .line 32
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method public b()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 47
    iget v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public c()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->b:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public d()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->c:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public e()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdSpaceLayout;
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->d:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdSpaceLayout;

    return-object v0
.end method

.method public f()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/android/impl/ads/avro/protocol/v6/Callback;",
            ">;"
        }
    .end annotation

    .prologue
    .line 107
    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->e:Ljava/util/List;

    return-object v0
.end method

.method public g()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 122
    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->f:Ljava/lang/CharSequence;

    return-object v0
.end method
