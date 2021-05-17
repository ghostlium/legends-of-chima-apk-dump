.class public Lcom/flurry/sdk/fz;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/fz$b;,
        Lcom/flurry/sdk/fz$a;
    }
.end annotation


# static fields
.field private static final a:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Lcom/flurry/sdk/fz$a;",
            ">;"
        }
    .end annotation
.end field

.field private static final b:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Lcom/flurry/sdk/fz$b;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 49
    new-instance v0, Lcom/flurry/sdk/fz$1;

    invoke-direct {v0}, Lcom/flurry/sdk/fz$1;-><init>()V

    sput-object v0, Lcom/flurry/sdk/fz;->a:Ljava/lang/ThreadLocal;

    .line 208
    new-instance v0, Lcom/flurry/sdk/fz$2;

    invoke-direct {v0}, Lcom/flurry/sdk/fz$2;-><init>()V

    sput-object v0, Lcom/flurry/sdk/fz;->b:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public static a(D[BI)I
    .locals 6

    .prologue
    const-wide/16 v4, -0x1

    .line 412
    invoke-static {p0, p1}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    move-result-wide v0

    .line 413
    and-long v2, v0, v4

    long-to-int v2, v2

    .line 414
    const/16 v3, 0x20

    ushr-long/2addr v0, v3

    and-long/2addr v0, v4

    long-to-int v0, v0

    .line 417
    and-int/lit16 v1, v2, 0xff

    int-to-byte v1, v1

    aput-byte v1, p2, p3

    .line 418
    add-int/lit8 v1, p3, 0x4

    and-int/lit16 v3, v0, 0xff

    int-to-byte v3, v3

    aput-byte v3, p2, v1

    .line 419
    add-int/lit8 v1, p3, 0x5

    ushr-int/lit8 v3, v0, 0x8

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    aput-byte v3, p2, v1

    .line 420
    add-int/lit8 v1, p3, 0x1

    ushr-int/lit8 v3, v2, 0x8

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    aput-byte v3, p2, v1

    .line 421
    add-int/lit8 v1, p3, 0x2

    ushr-int/lit8 v3, v2, 0x10

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    aput-byte v3, p2, v1

    .line 422
    add-int/lit8 v1, p3, 0x6

    ushr-int/lit8 v3, v0, 0x10

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    aput-byte v3, p2, v1

    .line 423
    add-int/lit8 v1, p3, 0x7

    ushr-int/lit8 v0, v0, 0x18

    and-int/lit16 v0, v0, 0xff

    int-to-byte v0, v0

    aput-byte v0, p2, v1

    .line 424
    add-int/lit8 v0, p3, 0x3

    ushr-int/lit8 v1, v2, 0x18

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    .line 425
    const/16 v0, 0x8

    return v0
.end method

.method public static a(F[BI)I
    .locals 3

    .prologue
    .line 396
    const/4 v0, 0x1

    .line 397
    invoke-static {p0}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v1

    .line 399
    and-int/lit16 v2, v1, 0xff

    int-to-byte v2, v2

    aput-byte v2, p1, p2

    .line 400
    add-int/2addr v0, p2

    ushr-int/lit8 v2, v1, 0x8

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, p1, v0

    .line 401
    add-int/lit8 v0, p2, 0x2

    ushr-int/lit8 v2, v1, 0x10

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, p1, v0

    .line 402
    add-int/lit8 v0, p2, 0x3

    ushr-int/lit8 v1, v1, 0x18

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, p1, v0

    .line 403
    const/4 v0, 0x4

    return v0
.end method

.method public static a(I[BI)I
    .locals 5

    .prologue
    const/16 v4, 0x7f

    .line 319
    shl-int/lit8 v0, p0, 0x1

    shr-int/lit8 v1, p0, 0x1f

    xor-int/2addr v0, v1

    .line 321
    and-int/lit8 v1, v0, -0x80

    if-eqz v1, :cond_2

    .line 322
    add-int/lit8 v1, p2, 0x1

    or-int/lit16 v2, v0, 0x80

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, p1, p2

    .line 323
    ushr-int/lit8 v2, v0, 0x7

    .line 324
    if-le v2, v4, :cond_0

    .line 325
    add-int/lit8 v0, v1, 0x1

    or-int/lit16 v3, v2, 0x80

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    aput-byte v3, p1, v1

    .line 326
    ushr-int/lit8 v2, v2, 0x7

    .line 327
    if-le v2, v4, :cond_1

    .line 328
    add-int/lit8 v1, v0, 0x1

    or-int/lit16 v3, v2, 0x80

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    aput-byte v3, p1, v0

    .line 329
    ushr-int/lit8 v2, v2, 0x7

    .line 330
    if-le v2, v4, :cond_0

    .line 331
    add-int/lit8 v0, v1, 0x1

    or-int/lit16 v3, v2, 0x80

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    aput-byte v3, p1, v1

    .line 332
    ushr-int/lit8 v1, v2, 0x7

    .line 337
    :goto_0
    add-int/lit8 v2, v0, 0x1

    int-to-byte v1, v1

    aput-byte v1, p1, v0

    .line 338
    sub-int v0, v2, p2

    return v0

    :cond_0
    move v0, v1

    move v1, v2

    goto :goto_0

    :cond_1
    move v1, v2

    goto :goto_0

    :cond_2
    move v1, v0

    move v0, p2

    goto :goto_0
.end method

.method public static a(J[BI)I
    .locals 10

    .prologue
    .line 348
    const/4 v0, 0x1

    shl-long v0, p0, v0

    const/16 v2, 0x3f

    shr-long v2, p0, v2

    xor-long v1, v0, v2

    .line 350
    const-wide/16 v3, -0x80

    and-long/2addr v3, v1

    const-wide/16 v5, 0x0

    cmp-long v0, v3, v5

    if-eqz v0, :cond_2

    .line 351
    add-int/lit8 v0, p3, 0x1

    const-wide/16 v3, 0x80

    or-long/2addr v3, v1

    const-wide/16 v5, 0xff

    and-long/2addr v3, v5

    long-to-int v3, v3

    int-to-byte v3, v3

    aput-byte v3, p2, p3

    .line 352
    const/4 v3, 0x7

    ushr-long v2, v1, v3

    .line 353
    const-wide/16 v4, 0x7f

    cmp-long v1, v2, v4

    if-lez v1, :cond_1

    .line 354
    add-int/lit8 v1, v0, 0x1

    const-wide/16 v4, 0x80

    or-long/2addr v4, v2

    const-wide/16 v6, 0xff

    and-long/2addr v4, v6

    long-to-int v4, v4

    int-to-byte v4, v4

    aput-byte v4, p2, v0

    .line 355
    const/4 v0, 0x7

    ushr-long/2addr v2, v0

    .line 356
    const-wide/16 v4, 0x7f

    cmp-long v0, v2, v4

    if-lez v0, :cond_0

    .line 357
    add-int/lit8 v0, v1, 0x1

    const-wide/16 v4, 0x80

    or-long/2addr v4, v2

    const-wide/16 v6, 0xff

    and-long/2addr v4, v6

    long-to-int v4, v4

    int-to-byte v4, v4

    aput-byte v4, p2, v1

    .line 358
    const/4 v1, 0x7

    ushr-long/2addr v2, v1

    .line 359
    const-wide/16 v4, 0x7f

    cmp-long v1, v2, v4

    if-lez v1, :cond_1

    .line 360
    add-int/lit8 v1, v0, 0x1

    const-wide/16 v4, 0x80

    or-long/2addr v4, v2

    const-wide/16 v6, 0xff

    and-long/2addr v4, v6

    long-to-int v4, v4

    int-to-byte v4, v4

    aput-byte v4, p2, v0

    .line 361
    const/4 v0, 0x7

    ushr-long/2addr v2, v0

    .line 362
    const-wide/16 v4, 0x7f

    cmp-long v0, v2, v4

    if-lez v0, :cond_0

    .line 363
    add-int/lit8 v0, v1, 0x1

    const-wide/16 v4, 0x80

    or-long/2addr v4, v2

    const-wide/16 v6, 0xff

    and-long/2addr v4, v6

    long-to-int v4, v4

    int-to-byte v4, v4

    aput-byte v4, p2, v1

    .line 364
    const/4 v1, 0x7

    ushr-long/2addr v2, v1

    .line 365
    const-wide/16 v4, 0x7f

    cmp-long v1, v2, v4

    if-lez v1, :cond_1

    .line 366
    add-int/lit8 v1, v0, 0x1

    const-wide/16 v4, 0x80

    or-long/2addr v4, v2

    const-wide/16 v6, 0xff

    and-long/2addr v4, v6

    long-to-int v4, v4

    int-to-byte v4, v4

    aput-byte v4, p2, v0

    .line 367
    const/4 v0, 0x7

    ushr-long/2addr v2, v0

    .line 368
    const-wide/16 v4, 0x7f

    cmp-long v0, v2, v4

    if-lez v0, :cond_0

    .line 369
    add-int/lit8 v0, v1, 0x1

    const-wide/16 v4, 0x80

    or-long/2addr v4, v2

    const-wide/16 v6, 0xff

    and-long/2addr v4, v6

    long-to-int v4, v4

    int-to-byte v4, v4

    aput-byte v4, p2, v1

    .line 370
    const/4 v1, 0x7

    ushr-long/2addr v2, v1

    .line 371
    const-wide/16 v4, 0x7f

    cmp-long v1, v2, v4

    if-lez v1, :cond_1

    .line 372
    add-int/lit8 v1, v0, 0x1

    const-wide/16 v4, 0x80

    or-long/2addr v4, v2

    const-wide/16 v6, 0xff

    and-long/2addr v4, v6

    long-to-int v4, v4

    int-to-byte v4, v4

    aput-byte v4, p2, v0

    .line 373
    const/4 v0, 0x7

    ushr-long/2addr v2, v0

    .line 374
    const-wide/16 v4, 0x7f

    cmp-long v0, v2, v4

    if-lez v0, :cond_0

    .line 375
    add-int/lit8 v0, v1, 0x1

    const-wide/16 v4, 0x80

    or-long/2addr v4, v2

    const-wide/16 v6, 0xff

    and-long/2addr v4, v6

    long-to-int v4, v4

    int-to-byte v4, v4

    aput-byte v4, p2, v1

    .line 376
    const/4 v1, 0x7

    ushr-long v1, v2, v1

    .line 386
    :goto_0
    add-int/lit8 v3, v0, 0x1

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    .line 387
    sub-int v0, v3, p3

    return v0

    :cond_0
    move v0, v1

    move-wide v8, v2

    move-wide v1, v8

    goto :goto_0

    :cond_1
    move-wide v1, v2

    goto :goto_0

    :cond_2
    move v0, p3

    goto :goto_0
.end method

.method public static a(Z[BI)I
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 308
    if-eqz p0, :cond_0

    move v0, v1

    :goto_0
    aput-byte v0, p1, p2

    .line 309
    return v1

    .line 308
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static a([BII[BII)I
    .locals 4

    .prologue
    .line 184
    add-int v0, p1, p2

    .line 185
    add-int v1, p4, p5

    .line 186
    :goto_0
    if-ge p1, v0, :cond_1

    if-ge p4, v1, :cond_1

    .line 187
    aget-byte v2, p0, p1

    and-int/lit16 v2, v2, 0xff

    .line 188
    aget-byte v3, p3, p4

    and-int/lit16 v3, v3, 0xff

    .line 189
    if-eq v2, v3, :cond_0

    .line 190
    sub-int v0, v2, v3

    .line 193
    :goto_1
    return v0

    .line 186
    :cond_0
    add-int/lit8 p1, p1, 0x1

    add-int/lit8 p4, p4, 0x1

    goto :goto_0

    .line 193
    :cond_1
    sub-int v0, p2, p5

    goto :goto_1
.end method
