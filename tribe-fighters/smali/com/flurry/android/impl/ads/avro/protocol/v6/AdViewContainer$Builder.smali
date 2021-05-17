.class public Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;
.super Lcom/flurry/sdk/gw;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/gw",
        "<",
        "Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer;",
        ">;"
    }
.end annotation


# instance fields
.field private a:I

.field private b:I

.field private c:I

.field private d:I

.field private e:F


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 144
    sget-object v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer;->SCHEMA$:Lcom/flurry/sdk/fm;

    invoke-direct {p0, v0}, Lcom/flurry/sdk/gw;-><init>(Lcom/flurry/sdk/fm;)V

    .line 145
    return-void
.end method

.method synthetic constructor <init>(Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$1;)V
    .locals 0

    .prologue
    .line 133
    invoke-direct {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public a(F)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;
    .locals 3

    .prologue
    const/4 v2, 0x4

    .line 280
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 281
    iput p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->e:F

    .line 282
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x1

    aput-boolean v1, v0, v2

    .line 283
    return-object p0
.end method

.method public a(I)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 184
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 185
    iput p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->a:I

    .line 186
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x1

    aput-boolean v1, v0, v2

    .line 187
    return-object p0
.end method

.method public a()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer;
    .locals 3

    .prologue
    .line 300
    :try_start_0
    new-instance v1, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer;

    invoke-direct {v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer;-><init>()V

    .line 301
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->c()[Z

    move-result-object v0

    const/4 v2, 0x0

    aget-boolean v0, v0, v2

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->a:I

    :goto_0
    iput v0, v1, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer;->a:I

    .line 302
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->c()[Z

    move-result-object v0

    const/4 v2, 0x1

    aget-boolean v0, v0, v2

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->b:I

    :goto_1
    iput v0, v1, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer;->b:I

    .line 303
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->c()[Z

    move-result-object v0

    const/4 v2, 0x2

    aget-boolean v0, v0, v2

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->c:I

    :goto_2
    iput v0, v1, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer;->c:I

    .line 304
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->c()[Z

    move-result-object v0

    const/4 v2, 0x3

    aget-boolean v0, v0, v2

    if-eqz v0, :cond_3

    iget v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->d:I

    :goto_3
    iput v0, v1, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer;->d:I

    .line 305
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->c()[Z

    move-result-object v0

    const/4 v2, 0x4

    aget-boolean v0, v0, v2

    if-eqz v0, :cond_4

    iget v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->e:F

    :goto_4
    iput v0, v1, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer;->e:F

    .line 306
    return-object v1

    .line 301
    :cond_0
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/4 v2, 0x0

    aget-object v0, v0, v2

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_0

    .line 302
    :cond_1
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/4 v2, 0x1

    aget-object v0, v0, v2

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_1

    .line 303
    :cond_2
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/4 v2, 0x2

    aget-object v0, v0, v2

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_2

    .line 304
    :cond_3
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/4 v2, 0x3

    aget-object v0, v0, v2

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_3

    .line 305
    :cond_4
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/4 v2, 0x4

    aget-object v0, v0, v2

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    goto :goto_4

    .line 307
    :catch_0
    move-exception v0

    .line 308
    new-instance v1, Lcom/flurry/sdk/fk;

    invoke-direct {v1, v0}, Lcom/flurry/sdk/fk;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public b(I)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 208
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 209
    iput p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->b:I

    .line 210
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->c()[Z

    move-result-object v0

    aput-boolean v2, v0, v2

    .line 211
    return-object p0
.end method

.method public c(I)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;
    .locals 3

    .prologue
    const/4 v2, 0x2

    .line 232
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 233
    iput p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->c:I

    .line 234
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x1

    aput-boolean v1, v0, v2

    .line 235
    return-object p0
.end method

.method public d(I)Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;
    .locals 3

    .prologue
    const/4 v2, 0x3

    .line 256
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 257
    iput p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->d:I

    .line 258
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdViewContainer$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x1

    aput-boolean v1, v0, v2

    .line 259
    return-object p0
.end method
