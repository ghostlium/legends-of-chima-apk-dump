.class public Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;
.super Lcom/flurry/sdk/gw;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/gw",
        "<",
        "Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest;",
        ">;"
    }
.end annotation


# instance fields
.field private a:Ljava/lang/CharSequence;

.field private b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId;",
            ">;"
        }
    .end annotation
.end field

.field private c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkAdLog;",
            ">;"
        }
    .end annotation
.end field

.field private d:J

.field private e:Ljava/lang/CharSequence;

.field private f:Z


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 163
    sget-object v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest;->SCHEMA$:Lcom/flurry/sdk/fm;

    invoke-direct {p0, v0}, Lcom/flurry/sdk/gw;-><init>(Lcom/flurry/sdk/fm;)V

    .line 164
    return-void
.end method

.method synthetic constructor <init>(Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$1;)V
    .locals 0

    .prologue
    .line 151
    invoke-direct {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public a(J)Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;
    .locals 3

    .prologue
    const/4 v2, 0x3

    .line 282
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 283
    iput-wide p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->d:J

    .line 284
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x1

    aput-boolean v1, v0, v2

    .line 285
    return-object p0
.end method

.method public a(Ljava/lang/CharSequence;)Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 207
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-virtual {p0, v0, p1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 208
    iput-object p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->a:Ljava/lang/CharSequence;

    .line 209
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x1

    aput-boolean v1, v0, v2

    .line 210
    return-object p0
.end method

.method public a(Ljava/util/List;)Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/android/impl/ads/avro/protocol/v6/AdReportedId;",
            ">;)",
            "Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;"
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 232
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v1

    invoke-virtual {p0, v0, p1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 233
    iput-object p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->b:Ljava/util/List;

    .line 234
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->c()[Z

    move-result-object v0

    aput-boolean v1, v0, v1

    .line 235
    return-object p0
.end method

.method public a(Z)Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;
    .locals 3

    .prologue
    const/4 v2, 0x5

    .line 331
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 332
    iput-boolean p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->f:Z

    .line 333
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x1

    aput-boolean v1, v0, v2

    .line 334
    return-object p0
.end method

.method public a()Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest;
    .locals 3

    .prologue
    .line 351
    :try_start_0
    new-instance v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest;

    invoke-direct {v2}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest;-><init>()V

    .line 352
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x0

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->a:Ljava/lang/CharSequence;

    :goto_0
    iput-object v0, v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest;->a:Ljava/lang/CharSequence;

    .line 353
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x1

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->b:Ljava/util/List;

    :goto_1
    iput-object v0, v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest;->b:Ljava/util/List;

    .line 354
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x2

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->c:Ljava/util/List;

    :goto_2
    iput-object v0, v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest;->c:Ljava/util/List;

    .line 355
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x3

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_3

    iget-wide v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->d:J

    :goto_3
    iput-wide v0, v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest;->d:J

    .line 356
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x4

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->e:Ljava/lang/CharSequence;

    :goto_4
    iput-object v0, v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest;->e:Ljava/lang/CharSequence;

    .line 357
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x5

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_5

    iget-boolean v0, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->f:Z

    :goto_5
    iput-boolean v0, v2, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest;->f:Z

    .line 358
    return-object v2

    .line 352
    :cond_0
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    goto :goto_0

    .line 353
    :cond_1
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/4 v1, 0x1

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    goto :goto_1

    .line 354
    :cond_2
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/4 v1, 0x2

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    goto :goto_2

    .line 355
    :cond_3
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/4 v1, 0x3

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    goto :goto_3

    .line 356
    :cond_4
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/4 v1, 0x4

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    goto :goto_4

    .line 357
    :cond_5
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    const/4 v1, 0x5

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->a(Lcom/flurry/sdk/fm$f;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    goto :goto_5

    .line 359
    :catch_0
    move-exception v0

    .line 360
    new-instance v1, Lcom/flurry/sdk/fk;

    invoke-direct {v1, v0}, Lcom/flurry/sdk/fk;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public b(Ljava/lang/CharSequence;)Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;
    .locals 3

    .prologue
    const/4 v2, 0x4

    .line 306
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-virtual {p0, v0, p1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 307
    iput-object p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->e:Ljava/lang/CharSequence;

    .line 308
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x1

    aput-boolean v1, v0, v2

    .line 309
    return-object p0
.end method

.method public b(Ljava/util/List;)Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkAdLog;",
            ">;)",
            "Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;"
        }
    .end annotation

    .prologue
    const/4 v2, 0x2

    .line 257
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->b()[Lcom/flurry/sdk/fm$f;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-virtual {p0, v0, p1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->a(Lcom/flurry/sdk/fm$f;Ljava/lang/Object;)V

    .line 258
    iput-object p1, p0, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->c:Ljava/util/List;

    .line 259
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/SdkLogRequest$Builder;->c()[Z

    move-result-object v0

    const/4 v1, 0x1

    aput-boolean v1, v0, v2

    .line 260
    return-object p0
.end method
