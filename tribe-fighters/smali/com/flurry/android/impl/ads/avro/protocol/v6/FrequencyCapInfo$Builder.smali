.class public Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;
.super Lcom/flurry/sdk/gw;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/gw",
        "<",
        "Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo;",
        ">;"
    }
.end annotation


# instance fields
.field private a:Ljava/lang/CharSequence;

.field private b:J

.field private c:J

.field private d:I

.field private e:I

.field private f:I

.field private g:I


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 182
    sget-object v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo;->SCHEMA$:Lcom/flurry/sdk/fm;

    invoke-direct {p0, v0}, Lcom/flurry/sdk/gw;-><init>(Lcom/flurry/sdk/fm;)V

    .line 183
    return-void
.end method

.method synthetic constructor <init>(Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$1;)V
    .locals 0

    .prologue
    .line 169
    invoke-direct {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public a(I)Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;
    .locals 3

    .prologue
    const/4 v2, 0x3

    .line 303
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 304
    iput p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->d:I

    .line 305
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x1

    aput-boolean v1, v0, v2

    .line 306
    return-object p0
.end method

.method public a(J)Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 255
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 256
    iput-wide p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->b:J

    .line 257
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->c()[Z

    move-result-object v0

    aput-boolean v2, v0, v2

    .line 258
    return-object p0
.end method

.method public a(Ljava/lang/CharSequence;)Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 230
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-virtual {p0, v0, p1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 231
    iput-object p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->a:Ljava/lang/CharSequence;

    .line 232
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x1

    aput-boolean v1, v0, v2

    .line 233
    return-object p0
.end method

.method public a()Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo;
    .locals 3

    .prologue
    .line 395
    :try_start_0
    new-instance v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo;

    invoke-direct {v2}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo;-><init>()V

    .line 396
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x0

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->a:Ljava/lang/CharSequence;

    :goto_0
    iput-object v0, v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo;->a:Ljava/lang/CharSequence;

    .line 397
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x1

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_1

    iget-wide v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->b:J

    :goto_1
    iput-wide v0, v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo;->b:J

    .line 398
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x2

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_2

    iget-wide v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->c:J

    :goto_2
    iput-wide v0, v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo;->c:J

    .line 399
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x3

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_3

    iget v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->d:I

    :goto_3
    iput v0, v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo;->d:I

    .line 400
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x4

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_4

    iget v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->e:I

    :goto_4
    iput v0, v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo;->e:I

    .line 401
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x5

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_5

    iget v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->f:I

    :goto_5
    iput v0, v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo;->f:I

    .line 402
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x6

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_6

    iget v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->g:I

    :goto_6
    iput v0, v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo;->g:I

    .line 403
    return-object v2

    .line 396
    :cond_0
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    goto :goto_0

    .line 397
    :cond_1
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/4 v1, 0x1

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    goto :goto_1

    .line 398
    :cond_2
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/4 v1, 0x2

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    goto :goto_2

    .line 399
    :cond_3
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/4 v1, 0x3

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_3

    .line 400
    :cond_4
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/4 v1, 0x4

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_4

    .line 401
    :cond_5
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/4 v1, 0x5

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_5

    .line 402
    :cond_6
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/4 v1, 0x6

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    goto :goto_6

    .line 404
    :catch_0
    move-exception v0

    .line 405
    new-instance v1, Lcom/flurry/sdk/fk;

    invoke-direct {v1, v0}, Lcom/flurry/sdk/fk;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public b(I)Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;
    .locals 3

    .prologue
    const/4 v2, 0x4

    .line 327
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 328
    iput p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->e:I

    .line 329
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x1

    aput-boolean v1, v0, v2

    .line 330
    return-object p0
.end method

.method public b(J)Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;
    .locals 3

    .prologue
    const/4 v2, 0x2

    .line 279
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 280
    iput-wide p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->c:J

    .line 281
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x1

    aput-boolean v1, v0, v2

    .line 282
    return-object p0
.end method

.method public c(I)Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;
    .locals 3

    .prologue
    const/4 v2, 0x5

    .line 351
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 352
    iput p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->f:I

    .line 353
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x1

    aput-boolean v1, v0, v2

    .line 354
    return-object p0
.end method

.method public d(I)Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;
    .locals 3

    .prologue
    const/4 v2, 0x6

    .line 375
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 376
    iput p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->g:I

    .line 377
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/FrequencyCapInfo$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x1

    aput-boolean v1, v0, v2

    .line 378
    return-object p0
.end method
