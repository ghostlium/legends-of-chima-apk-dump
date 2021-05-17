.class public final Lcom/flurry/sdk/rv;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/rv$a;
    }
.end annotation


# static fields
.field static final a:Lcom/flurry/sdk/rv;


# instance fields
.field protected b:Lcom/flurry/sdk/rv;

.field protected final c:Z

.field protected final d:Z

.field protected e:[Ljava/lang/String;

.field protected f:[Lcom/flurry/sdk/rv$a;

.field protected g:I

.field protected h:I

.field protected i:I

.field protected j:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 72
    new-instance v0, Lcom/flurry/sdk/rv;

    invoke-direct {v0}, Lcom/flurry/sdk/rv;-><init>()V

    sput-object v0, Lcom/flurry/sdk/rv;->a:Lcom/flurry/sdk/rv;

    .line 73
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x1

    .line 179
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 181
    iput-boolean v0, p0, Lcom/flurry/sdk/rv;->d:Z

    .line 182
    iput-boolean v0, p0, Lcom/flurry/sdk/rv;->c:Z

    .line 184
    iput-boolean v0, p0, Lcom/flurry/sdk/rv;->j:Z

    .line 185
    const/16 v0, 0x40

    invoke-direct {p0, v0}, Lcom/flurry/sdk/rv;->a(I)V

    .line 186
    return-void
.end method

.method private constructor <init>(Lcom/flurry/sdk/rv;ZZ[Ljava/lang/String;[Lcom/flurry/sdk/rv$a;I)V
    .locals 2

    .prologue
    .line 205
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 206
    iput-object p1, p0, Lcom/flurry/sdk/rv;->b:Lcom/flurry/sdk/rv;

    .line 207
    iput-boolean p2, p0, Lcom/flurry/sdk/rv;->d:Z

    .line 208
    iput-boolean p3, p0, Lcom/flurry/sdk/rv;->c:Z

    .line 210
    iput-object p4, p0, Lcom/flurry/sdk/rv;->e:[Ljava/lang/String;

    .line 211
    iput-object p5, p0, Lcom/flurry/sdk/rv;->f:[Lcom/flurry/sdk/rv$a;

    .line 212
    iput p6, p0, Lcom/flurry/sdk/rv;->g:I

    .line 214
    array-length v0, p4

    .line 215
    shr-int/lit8 v1, v0, 0x2

    sub-int v1, v0, v1

    iput v1, p0, Lcom/flurry/sdk/rv;->h:I

    .line 216
    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/flurry/sdk/rv;->i:I

    .line 219
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/flurry/sdk/rv;->j:Z

    .line 220
    return-void
.end method

.method public static a(Ljava/lang/String;)I
    .locals 4

    .prologue
    .line 403
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 404
    const/4 v0, 0x1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    :goto_0
    if-ge v0, v2, :cond_0

    .line 405
    mul-int/lit8 v1, v1, 0x1f

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    add-int/2addr v1, v3

    .line 404
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 408
    :cond_0
    return v1
.end method

.method public static a([CII)I
    .locals 3

    .prologue
    .line 395
    const/4 v0, 0x0

    aget-char v1, p0, v0

    .line 396
    const/4 v0, 0x1

    :goto_0
    if-ge v0, p2, :cond_0

    .line 397
    mul-int/lit8 v1, v1, 0x1f

    aget-char v2, p0, v0

    add-int/2addr v1, v2

    .line 396
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 399
    :cond_0
    return v1
.end method

.method public static a()Lcom/flurry/sdk/rv;
    .locals 1

    .prologue
    .line 169
    sget-object v0, Lcom/flurry/sdk/rv;->a:Lcom/flurry/sdk/rv;

    invoke-direct {v0}, Lcom/flurry/sdk/rv;->e()Lcom/flurry/sdk/rv;

    move-result-object v0

    return-object v0
.end method

.method private a(I)V
    .locals 1

    .prologue
    .line 190
    new-array v0, p1, [Ljava/lang/String;

    iput-object v0, p0, Lcom/flurry/sdk/rv;->e:[Ljava/lang/String;

    .line 191
    shr-int/lit8 v0, p1, 0x1

    new-array v0, v0, [Lcom/flurry/sdk/rv$a;

    iput-object v0, p0, Lcom/flurry/sdk/rv;->f:[Lcom/flurry/sdk/rv$a;

    .line 193
    add-int/lit8 v0, p1, -0x1

    iput v0, p0, Lcom/flurry/sdk/rv;->i:I

    .line 194
    const/4 v0, 0x0

    iput v0, p0, Lcom/flurry/sdk/rv;->g:I

    .line 196
    shr-int/lit8 v0, p1, 0x2

    sub-int v0, p1, v0

    iput v0, p0, Lcom/flurry/sdk/rv;->h:I

    .line 197
    return-void
.end method

.method private declared-synchronized a(Lcom/flurry/sdk/rv;)V
    .locals 2

    .prologue
    .line 259
    monitor-enter p0

    :try_start_0
    invoke-virtual {p1}, Lcom/flurry/sdk/rv;->c()I

    move-result v0

    const/16 v1, 0x2ee0

    if-le v0, v1, :cond_1

    .line 265
    const/16 v0, 0x40

    invoke-direct {p0, v0}, Lcom/flurry/sdk/rv;->a(I)V

    .line 285
    :goto_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/flurry/sdk/rv;->j:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 286
    :cond_0
    monitor-exit p0

    return-void

    .line 271
    :cond_1
    :try_start_1
    invoke-virtual {p1}, Lcom/flurry/sdk/rv;->c()I

    move-result v0

    invoke-virtual {p0}, Lcom/flurry/sdk/rv;->c()I

    move-result v1

    if-le v0, v1, :cond_0

    .line 275
    iget-object v0, p1, Lcom/flurry/sdk/rv;->e:[Ljava/lang/String;

    iput-object v0, p0, Lcom/flurry/sdk/rv;->e:[Ljava/lang/String;

    .line 276
    iget-object v0, p1, Lcom/flurry/sdk/rv;->f:[Lcom/flurry/sdk/rv$a;

    iput-object v0, p0, Lcom/flurry/sdk/rv;->f:[Lcom/flurry/sdk/rv$a;

    .line 277
    iget v0, p1, Lcom/flurry/sdk/rv;->g:I

    iput v0, p0, Lcom/flurry/sdk/rv;->g:I

    .line 278
    iget v0, p1, Lcom/flurry/sdk/rv;->h:I

    iput v0, p0, Lcom/flurry/sdk/rv;->h:I

    .line 279
    iget v0, p1, Lcom/flurry/sdk/rv;->i:I

    iput v0, p0, Lcom/flurry/sdk/rv;->i:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 259
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private e()Lcom/flurry/sdk/rv;
    .locals 7

    .prologue
    const/4 v2, 0x1

    .line 241
    new-instance v0, Lcom/flurry/sdk/rv;

    const/4 v1, 0x0

    iget-object v4, p0, Lcom/flurry/sdk/rv;->e:[Ljava/lang/String;

    iget-object v5, p0, Lcom/flurry/sdk/rv;->f:[Lcom/flurry/sdk/rv$a;

    iget v6, p0, Lcom/flurry/sdk/rv;->g:I

    move v3, v2

    invoke-direct/range {v0 .. v6}, Lcom/flurry/sdk/rv;-><init>(Lcom/flurry/sdk/rv;ZZ[Ljava/lang/String;[Lcom/flurry/sdk/rv$a;I)V

    return-object v0
.end method

.method private f()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 422
    iget-object v0, p0, Lcom/flurry/sdk/rv;->e:[Ljava/lang/String;

    .line 423
    array-length v1, v0

    .line 424
    new-array v2, v1, [Ljava/lang/String;

    iput-object v2, p0, Lcom/flurry/sdk/rv;->e:[Ljava/lang/String;

    .line 425
    iget-object v2, p0, Lcom/flurry/sdk/rv;->e:[Ljava/lang/String;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 426
    iget-object v0, p0, Lcom/flurry/sdk/rv;->f:[Lcom/flurry/sdk/rv$a;

    .line 427
    array-length v1, v0

    .line 428
    new-array v2, v1, [Lcom/flurry/sdk/rv$a;

    iput-object v2, p0, Lcom/flurry/sdk/rv;->f:[Lcom/flurry/sdk/rv$a;

    .line 429
    iget-object v2, p0, Lcom/flurry/sdk/rv;->f:[Lcom/flurry/sdk/rv$a;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 430
    return-void
.end method

.method private g()V
    .locals 11

    .prologue
    const/4 v4, 0x0

    const/4 v1, 0x0

    .line 441
    iget-object v0, p0, Lcom/flurry/sdk/rv;->e:[Ljava/lang/String;

    array-length v3, v0

    .line 442
    add-int v0, v3, v3

    .line 448
    const/high16 v2, 0x10000

    if-le v0, v2, :cond_1

    .line 453
    iput v1, p0, Lcom/flurry/sdk/rv;->g:I

    .line 454
    iget-object v0, p0, Lcom/flurry/sdk/rv;->e:[Ljava/lang/String;

    invoke-static {v0, v4}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 455
    iget-object v0, p0, Lcom/flurry/sdk/rv;->f:[Lcom/flurry/sdk/rv$a;

    invoke-static {v0, v4}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 456
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/flurry/sdk/rv;->j:Z

    .line 507
    :cond_0
    return-void

    .line 460
    :cond_1
    iget-object v4, p0, Lcom/flurry/sdk/rv;->e:[Ljava/lang/String;

    .line 461
    iget-object v5, p0, Lcom/flurry/sdk/rv;->f:[Lcom/flurry/sdk/rv$a;

    .line 462
    new-array v2, v0, [Ljava/lang/String;

    iput-object v2, p0, Lcom/flurry/sdk/rv;->e:[Ljava/lang/String;

    .line 463
    shr-int/lit8 v2, v0, 0x1

    new-array v2, v2, [Lcom/flurry/sdk/rv$a;

    iput-object v2, p0, Lcom/flurry/sdk/rv;->f:[Lcom/flurry/sdk/rv$a;

    .line 465
    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/flurry/sdk/rv;->i:I

    .line 466
    iget v0, p0, Lcom/flurry/sdk/rv;->h:I

    iget v2, p0, Lcom/flurry/sdk/rv;->h:I

    add-int/2addr v0, v2

    iput v0, p0, Lcom/flurry/sdk/rv;->h:I

    move v2, v1

    move v0, v1

    .line 473
    :goto_0
    if-ge v2, v3, :cond_4

    .line 474
    aget-object v6, v4, v2

    .line 475
    if-eqz v6, :cond_2

    .line 476
    add-int/lit8 v0, v0, 0x1

    .line 477
    invoke-static {v6}, Lcom/flurry/sdk/rv;->a(Ljava/lang/String;)I

    move-result v7

    iget v8, p0, Lcom/flurry/sdk/rv;->i:I

    and-int/2addr v7, v8

    .line 478
    iget-object v8, p0, Lcom/flurry/sdk/rv;->e:[Ljava/lang/String;

    aget-object v8, v8, v7

    if-nez v8, :cond_3

    .line 479
    iget-object v8, p0, Lcom/flurry/sdk/rv;->e:[Ljava/lang/String;

    aput-object v6, v8, v7

    .line 473
    :cond_2
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 481
    :cond_3
    shr-int/lit8 v7, v7, 0x1

    .line 482
    iget-object v8, p0, Lcom/flurry/sdk/rv;->f:[Lcom/flurry/sdk/rv$a;

    new-instance v9, Lcom/flurry/sdk/rv$a;

    iget-object v10, p0, Lcom/flurry/sdk/rv;->f:[Lcom/flurry/sdk/rv$a;

    aget-object v10, v10, v7

    invoke-direct {v9, v6, v10}, Lcom/flurry/sdk/rv$a;-><init>(Ljava/lang/String;Lcom/flurry/sdk/rv$a;)V

    aput-object v9, v8, v7

    goto :goto_1

    .line 487
    :cond_4
    shr-int/lit8 v3, v3, 0x1

    move v2, v1

    move v1, v0

    .line 488
    :goto_2
    if-ge v2, v3, :cond_7

    .line 489
    aget-object v0, v5, v2

    .line 490
    :goto_3
    if-eqz v0, :cond_6

    .line 491
    add-int/lit8 v1, v1, 0x1

    .line 492
    invoke-virtual {v0}, Lcom/flurry/sdk/rv$a;->a()Ljava/lang/String;

    move-result-object v4

    .line 493
    invoke-static {v4}, Lcom/flurry/sdk/rv;->a(Ljava/lang/String;)I

    move-result v6

    iget v7, p0, Lcom/flurry/sdk/rv;->i:I

    and-int/2addr v6, v7

    .line 494
    iget-object v7, p0, Lcom/flurry/sdk/rv;->e:[Ljava/lang/String;

    aget-object v7, v7, v6

    if-nez v7, :cond_5

    .line 495
    iget-object v7, p0, Lcom/flurry/sdk/rv;->e:[Ljava/lang/String;

    aput-object v4, v7, v6

    .line 500
    :goto_4
    invoke-virtual {v0}, Lcom/flurry/sdk/rv$a;->b()Lcom/flurry/sdk/rv$a;

    move-result-object v0

    goto :goto_3

    .line 497
    :cond_5
    shr-int/lit8 v6, v6, 0x1

    .line 498
    iget-object v7, p0, Lcom/flurry/sdk/rv;->f:[Lcom/flurry/sdk/rv$a;

    new-instance v8, Lcom/flurry/sdk/rv$a;

    iget-object v9, p0, Lcom/flurry/sdk/rv;->f:[Lcom/flurry/sdk/rv$a;

    aget-object v9, v9, v6

    invoke-direct {v8, v4, v9}, Lcom/flurry/sdk/rv$a;-><init>(Ljava/lang/String;Lcom/flurry/sdk/rv$a;)V

    aput-object v8, v7, v6

    goto :goto_4

    .line 488
    :cond_6
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_2

    .line 504
    :cond_7
    iget v0, p0, Lcom/flurry/sdk/rv;->g:I

    if-eq v1, v0, :cond_0

    .line 505
    new-instance v0, Ljava/lang/Error;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Internal error on SymbolTable.rehash(): had "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/flurry/sdk/rv;->g:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " entries; now have "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public declared-synchronized a(ZZ)Lcom/flurry/sdk/rv;
    .locals 7

    .prologue
    .line 236
    monitor-enter p0

    :try_start_0
    new-instance v0, Lcom/flurry/sdk/rv;

    iget-object v4, p0, Lcom/flurry/sdk/rv;->e:[Ljava/lang/String;

    iget-object v5, p0, Lcom/flurry/sdk/rv;->f:[Lcom/flurry/sdk/rv$a;

    iget v6, p0, Lcom/flurry/sdk/rv;->g:I

    move-object v1, p0

    move v2, p1

    move v3, p2

    invoke-direct/range {v0 .. v6}, Lcom/flurry/sdk/rv;-><init>(Lcom/flurry/sdk/rv;ZZ[Ljava/lang/String;[Lcom/flurry/sdk/rv$a;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public a([CIII)Ljava/lang/String;
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 322
    if-ge p3, v5, :cond_0

    .line 323
    const-string v1, ""

    .line 382
    :goto_0
    return-object v1

    .line 325
    :cond_0
    iget-boolean v0, p0, Lcom/flurry/sdk/rv;->d:Z

    if-nez v0, :cond_1

    .line 326
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    goto :goto_0

    .line 329
    :cond_1
    iget v0, p0, Lcom/flurry/sdk/rv;->i:I

    and-int v1, p4, v0

    .line 331
    iget-object v0, p0, Lcom/flurry/sdk/rv;->e:[Ljava/lang/String;

    aget-object v2, v0, v1

    .line 334
    if-eqz v2, :cond_5

    .line 336
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v0

    if-ne v0, p3, :cond_4

    .line 337
    const/4 v0, 0x0

    .line 339
    :cond_2
    invoke-virtual {v2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    add-int v4, p2, v0

    aget-char v4, p1, v4

    if-eq v3, v4, :cond_3

    .line 344
    :goto_1
    if-ne v0, p3, :cond_4

    move-object v1, v2

    .line 345
    goto :goto_0

    .line 342
    :cond_3
    add-int/lit8 v0, v0, 0x1

    if-lt v0, p3, :cond_2

    goto :goto_1

    .line 349
    :cond_4
    iget-object v0, p0, Lcom/flurry/sdk/rv;->f:[Lcom/flurry/sdk/rv$a;

    shr-int/lit8 v2, v1, 0x1

    aget-object v0, v0, v2

    .line 350
    if-eqz v0, :cond_5

    .line 351
    invoke-virtual {v0, p1, p2, p3}, Lcom/flurry/sdk/rv$a;->a([CII)Ljava/lang/String;

    move-result-object v0

    .line 352
    if-eqz v0, :cond_5

    move-object v1, v0

    .line 353
    goto :goto_0

    .line 358
    :cond_5
    iget-boolean v0, p0, Lcom/flurry/sdk/rv;->j:Z

    if-nez v0, :cond_7

    .line 359
    invoke-direct {p0}, Lcom/flurry/sdk/rv;->f()V

    .line 360
    iput-boolean v5, p0, Lcom/flurry/sdk/rv;->j:Z

    move v0, v1

    .line 368
    :goto_2
    iget v1, p0, Lcom/flurry/sdk/rv;->g:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/flurry/sdk/rv;->g:I

    .line 370
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    .line 371
    iget-boolean v2, p0, Lcom/flurry/sdk/rv;->c:Z

    if-eqz v2, :cond_6

    .line 372
    sget-object v2, Lcom/flurry/sdk/sc;->a:Lcom/flurry/sdk/sc;

    invoke-virtual {v2, v1}, Lcom/flurry/sdk/sc;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 375
    :cond_6
    iget-object v2, p0, Lcom/flurry/sdk/rv;->e:[Ljava/lang/String;

    aget-object v2, v2, v0

    if-nez v2, :cond_8

    .line 376
    iget-object v2, p0, Lcom/flurry/sdk/rv;->e:[Ljava/lang/String;

    aput-object v1, v2, v0

    goto :goto_0

    .line 361
    :cond_7
    iget v0, p0, Lcom/flurry/sdk/rv;->g:I

    iget v2, p0, Lcom/flurry/sdk/rv;->h:I

    if-lt v0, v2, :cond_9

    .line 362
    invoke-direct {p0}, Lcom/flurry/sdk/rv;->g()V

    .line 366
    invoke-static {p1, p2, p3}, Lcom/flurry/sdk/rv;->a([CII)I

    move-result v0

    iget v1, p0, Lcom/flurry/sdk/rv;->i:I

    and-int/2addr v0, v1

    goto :goto_2

    .line 378
    :cond_8
    shr-int/lit8 v0, v0, 0x1

    .line 379
    iget-object v2, p0, Lcom/flurry/sdk/rv;->f:[Lcom/flurry/sdk/rv$a;

    new-instance v3, Lcom/flurry/sdk/rv$a;

    iget-object v4, p0, Lcom/flurry/sdk/rv;->f:[Lcom/flurry/sdk/rv$a;

    aget-object v4, v4, v0

    invoke-direct {v3, v1, v4}, Lcom/flurry/sdk/rv$a;-><init>(Ljava/lang/String;Lcom/flurry/sdk/rv$a;)V

    aput-object v3, v2, v0

    goto/16 :goto_0

    :cond_9
    move v0, v1

    goto :goto_2
.end method

.method public b()V
    .locals 1

    .prologue
    .line 291
    invoke-virtual {p0}, Lcom/flurry/sdk/rv;->d()Z

    move-result v0

    if-nez v0, :cond_1

    .line 302
    :cond_0
    :goto_0
    return-void

    .line 294
    :cond_1
    iget-object v0, p0, Lcom/flurry/sdk/rv;->b:Lcom/flurry/sdk/rv;

    if-eqz v0, :cond_0

    .line 295
    iget-object v0, p0, Lcom/flurry/sdk/rv;->b:Lcom/flurry/sdk/rv;

    invoke-direct {v0, p0}, Lcom/flurry/sdk/rv;->a(Lcom/flurry/sdk/rv;)V

    .line 300
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/flurry/sdk/rv;->j:Z

    goto :goto_0
.end method

.method public c()I
    .locals 1

    .prologue
    .line 310
    iget v0, p0, Lcom/flurry/sdk/rv;->g:I

    return v0
.end method

.method public d()Z
    .locals 1

    .prologue
    .line 312
    iget-boolean v0, p0, Lcom/flurry/sdk/rv;->j:Z

    return v0
.end method
