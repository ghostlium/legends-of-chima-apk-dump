.class public Lcom/flurry/android/impl/ads/avro/protocol/v6/Location$Builder;
.super Lcom/flurry/sdk/gw;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/android/impl/ads/avro/protocol/v6/Location;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/gw",
        "<",
        "Lcom/flurry/android/impl/ads/avro/protocol/v6/Location;",
        ">;"
    }
.end annotation


# instance fields
.field private a:F

.field private b:F


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 87
    sget-object v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/Location;->SCHEMA$:Lcom/flurry/sdk/fm;

    invoke-direct {p0, v0}, Lcom/flurry/sdk/gw;-><init>(Lcom/flurry/sdk/fm;)V

    .line 88
    return-void
.end method

.method synthetic constructor <init>(Lcom/flurry/android/impl/ads/avro/protocol/v6/Location$1;)V
    .locals 0

    .prologue
    .line 79
    invoke-direct {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/Location$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public a(F)Lcom/flurry/android/impl/ads/avro/protocol/v6/Location$Builder;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 115
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/Location$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/Location$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 116
    iput p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/Location$Builder;->a:F

    .line 117
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/Location$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x1

    aput-boolean v1, v0, v2

    .line 118
    return-object p0
.end method

.method public a()Lcom/flurry/android/impl/ads/avro/protocol/v6/Location;
    .locals 3

    .prologue
    .line 159
    :try_start_0
    new-instance v1, Lcom/flurry/android/impl/ads/avro/protocol/v6/Location;

    invoke-direct {v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/Location;-><init>()V

    .line 160
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/Location$Builder;->c()[Z

    move-result-object v0

    const/4 v2, 0x0

    aget-boolean v0, v0, v2

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/Location$Builder;->a:F

    :goto_0
    iput v0, v1, Lcom/flurry/android/impl/ads/avro/protocol/v6/Location;->a:F

    .line 161
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/Location$Builder;->c()[Z

    move-result-object v0

    const/4 v2, 0x1

    aget-boolean v0, v0, v2

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/Location$Builder;->b:F

    :goto_1
    iput v0, v1, Lcom/flurry/android/impl/ads/avro/protocol/v6/Location;->b:F

    .line 162
    return-object v1

    .line 160
    :cond_0
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/Location$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/4 v2, 0x0

    aget-object v0, v0, v2

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/Location$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    goto :goto_0

    .line 161
    :cond_1
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/Location$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/4 v2, 0x1

    aget-object v0, v0, v2

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/Location$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    goto :goto_1

    .line 163
    :catch_0
    move-exception v0

    .line 164
    new-instance v1, Lcom/flurry/sdk/fk;

    invoke-direct {v1, v0}, Lcom/flurry/sdk/fk;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public b(F)Lcom/flurry/android/impl/ads/avro/protocol/v6/Location$Builder;
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 139
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/Location$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/Location$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 140
    iput p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/Location$Builder;->b:F

    .line 141
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/Location$Builder;->c()[Z

    move-result-object v0

    aput-boolean v2, v0, v2

    .line 142
    return-object p0
.end method
