.class public Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;
.super Lcom/flurry/sdk/gw;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/gw",
        "<",
        "Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId;",
        ">;"
    }
.end annotation


# instance fields
.field private a:I

.field private b:Ljava/nio/ByteBuffer;


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 87
    sget-object v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId;->SCHEMA$:Lcom/flurry/sdk/fm;

    invoke-direct {p0, v0}, Lcom/flurry/sdk/gw;-><init>(Lcom/flurry/sdk/fm;)V

    .line 88
    return-void
.end method

.method synthetic constructor <init>(Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$1;)V
    .locals 0

    .prologue
    .line 79
    invoke-direct {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public a(I)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 115
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 116
    iput p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;->a:I

    .line 117
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x1

    aput-boolean v1, v0, v2

    .line 118
    return-object p0
.end method

.method public a(Ljava/nio/ByteBuffer;)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 139
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v1

    invoke-virtual {p0, v0, p1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 140
    iput-object p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;->b:Ljava/nio/ByteBuffer;

    .line 141
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;->c()[Z

    move-result-object v0

    aput-boolean v1, v0, v1

    .line 142
    return-object p0
.end method

.method public a()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId;
    .locals 3

    .prologue
    .line 160
    :try_start_0
    new-instance v1, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId;

    invoke-direct {v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId;-><init>()V

    .line 161
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;->c()[Z

    move-result-object v0

    const/4 v2, 0x0

    aget-boolean v0, v0, v2

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;->a:I

    :goto_0
    iput v0, v1, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId;->a:I

    .line 162
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;->c()[Z

    move-result-object v0

    const/4 v2, 0x1

    aget-boolean v0, v0, v2

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;->b:Ljava/nio/ByteBuffer;

    :goto_1
    iput-object v0, v1, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId;->b:Ljava/nio/ByteBuffer;

    .line 163
    return-object v1

    .line 161
    :cond_0
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/4 v2, 0x0

    aget-object v0, v0, v2

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_0

    .line 162
    :cond_1
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/4 v2, 0x1

    aget-object v0, v0, v2

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 164
    :catch_0
    move-exception v0

    .line 165
    new-instance v1, Lcom/flurry/sdk/fk;

    invoke-direct {v1, v0}, Lcom/flurry/sdk/fk;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
