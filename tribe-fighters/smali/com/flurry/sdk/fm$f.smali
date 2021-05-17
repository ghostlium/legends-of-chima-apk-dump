.class public Lcom/flurry/sdk/fm$f;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/fm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "f"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/fm$f$a;
    }
.end annotation


# instance fields
.field private final a:Ljava/lang/String;

.field private transient b:I

.field private final c:Lcom/flurry/sdk/fm;

.field private final d:Ljava/lang/String;

.field private final e:Lcom/flurry/sdk/hr;

.field private final f:Lcom/flurry/sdk/fm$f$a;

.field private g:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final h:Lcom/flurry/sdk/fm$r;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/flurry/sdk/fm;Ljava/lang/String;Lcom/flurry/sdk/hr;Lcom/flurry/sdk/fm$f$a;)V
    .locals 2

    .prologue
    .line 410
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 397
    const/4 v0, -0x1

    iput v0, p0, Lcom/flurry/sdk/fm$f;->b:I

    .line 403
    new-instance v0, Lcom/flurry/sdk/fm$r;

    invoke-static {}, Lcom/flurry/sdk/fm;->n()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flurry/sdk/fm$r;-><init>(Ljava/util/Set;)V

    iput-object v0, p0, Lcom/flurry/sdk/fm$f;->h:Lcom/flurry/sdk/fm$r;

    .line 411
    invoke-static {p1}, Lcom/flurry/sdk/fm;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/fm$f;->a:Ljava/lang/String;

    .line 412
    iput-object p2, p0, Lcom/flurry/sdk/fm$f;->c:Lcom/flurry/sdk/fm;

    .line 413
    iput-object p3, p0, Lcom/flurry/sdk/fm$f;->d:Ljava/lang/String;

    .line 414
    iput-object p4, p0, Lcom/flurry/sdk/fm$f;->e:Lcom/flurry/sdk/hr;

    .line 415
    iput-object p5, p0, Lcom/flurry/sdk/fm$f;->f:Lcom/flurry/sdk/fm$f$a;

    .line 416
    return-void
.end method

.method static synthetic a(Lcom/flurry/sdk/fm$f;)I
    .locals 1

    .prologue
    .line 387
    iget v0, p0, Lcom/flurry/sdk/fm$f;->b:I

    return v0
.end method

.method static synthetic a(Lcom/flurry/sdk/fm$f;I)I
    .locals 0

    .prologue
    .line 387
    iput p1, p0, Lcom/flurry/sdk/fm$f;->b:I

    return p1
.end method

.method static synthetic a(Lcom/flurry/sdk/fm$f;Ljava/util/Set;)Ljava/util/Set;
    .locals 0

    .prologue
    .line 387
    iput-object p1, p0, Lcom/flurry/sdk/fm$f;->g:Ljava/util/Set;

    return-object p1
.end method

.method private a(Lcom/flurry/sdk/hr;)Z
    .locals 2

    .prologue
    .line 459
    iget-object v0, p0, Lcom/flurry/sdk/fm$f;->e:Lcom/flurry/sdk/hr;

    if-nez v0, :cond_1

    .line 460
    if-nez p1, :cond_0

    const/4 v0, 0x1

    .line 463
    :goto_0
    return v0

    .line 460
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 461
    :cond_1
    iget-object v0, p0, Lcom/flurry/sdk/fm$f;->e:Lcom/flurry/sdk/hr;

    invoke-virtual {v0}, Lcom/flurry/sdk/hr;->n()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 462
    invoke-virtual {p1}, Lcom/flurry/sdk/hr;->n()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    goto :goto_0

    .line 463
    :cond_2
    iget-object v0, p0, Lcom/flurry/sdk/fm$f;->e:Lcom/flurry/sdk/hr;

    invoke-virtual {v0, p1}, Lcom/flurry/sdk/hr;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method static synthetic b(Lcom/flurry/sdk/fm$f;)Ljava/util/Set;
    .locals 1

    .prologue
    .line 387
    iget-object v0, p0, Lcom/flurry/sdk/fm$f;->g:Ljava/util/Set;

    return-object v0
.end method

.method static synthetic c(Lcom/flurry/sdk/fm$f;)Lcom/flurry/sdk/fm$r;
    .locals 1

    .prologue
    .line 387
    iget-object v0, p0, Lcom/flurry/sdk/fm$f;->h:Lcom/flurry/sdk/fm$r;

    return-object v0
.end method

.method static synthetic d(Lcom/flurry/sdk/fm$f;)Lcom/flurry/sdk/fm;
    .locals 1

    .prologue
    .line 387
    iget-object v0, p0, Lcom/flurry/sdk/fm$f;->c:Lcom/flurry/sdk/fm;

    return-object v0
.end method

.method static synthetic e(Lcom/flurry/sdk/fm$f;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 387
    iget-object v0, p0, Lcom/flurry/sdk/fm$f;->a:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic f(Lcom/flurry/sdk/fm$f;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 387
    iget-object v0, p0, Lcom/flurry/sdk/fm$f;->d:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic g(Lcom/flurry/sdk/fm$f;)Lcom/flurry/sdk/hr;
    .locals 1

    .prologue
    .line 387
    iget-object v0, p0, Lcom/flurry/sdk/fm$f;->e:Lcom/flurry/sdk/hr;

    return-object v0
.end method

.method static synthetic h(Lcom/flurry/sdk/fm$f;)Lcom/flurry/sdk/fm$f$a;
    .locals 1

    .prologue
    .line 387
    iget-object v0, p0, Lcom/flurry/sdk/fm$f;->f:Lcom/flurry/sdk/fm$f$a;

    return-object v0
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 1

    .prologue
    .line 417
    iget-object v0, p0, Lcom/flurry/sdk/fm$f;->a:Ljava/lang/String;

    return-object v0
.end method

.method public declared-synchronized a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 430
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/flurry/sdk/fm$f;->h:Lcom/flurry/sdk/fm$r;

    invoke-virtual {v0, p1, p2}, Lcom/flurry/sdk/fm$r;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 431
    monitor-exit p0

    return-void

    .line 430
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public b()I
    .locals 1

    .prologue
    .line 419
    iget v0, p0, Lcom/flurry/sdk/fm$f;->b:I

    return v0
.end method

.method public c()Lcom/flurry/sdk/fm;
    .locals 1

    .prologue
    .line 421
    iget-object v0, p0, Lcom/flurry/sdk/fm$f;->c:Lcom/flurry/sdk/fm;

    return-object v0
.end method

.method public d()Ljava/lang/String;
    .locals 1

    .prologue
    .line 423
    iget-object v0, p0, Lcom/flurry/sdk/fm$f;->d:Ljava/lang/String;

    return-object v0
.end method

.method public e()Lcom/flurry/sdk/hr;
    .locals 1

    .prologue
    .line 424
    iget-object v0, p0, Lcom/flurry/sdk/fm$f;->e:Lcom/flurry/sdk/hr;

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 448
    if-ne p1, p0, :cond_1

    .line 451
    :cond_0
    :goto_0
    return v0

    .line 449
    :cond_1
    instance-of v2, p1, Lcom/flurry/sdk/fm$f;

    if-nez v2, :cond_2

    move v0, v1

    goto :goto_0

    .line 450
    :cond_2
    check-cast p1, Lcom/flurry/sdk/fm$f;

    .line 451
    iget-object v2, p0, Lcom/flurry/sdk/fm$f;->a:Ljava/lang/String;

    iget-object v3, p1, Lcom/flurry/sdk/fm$f;->a:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/flurry/sdk/fm$f;->c:Lcom/flurry/sdk/fm;

    iget-object v3, p1, Lcom/flurry/sdk/fm$f;->c:Lcom/flurry/sdk/fm;

    invoke-virtual {v2, v3}, Lcom/flurry/sdk/fm;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p1, Lcom/flurry/sdk/fm$f;->e:Lcom/flurry/sdk/hr;

    invoke-direct {p0, v2}, Lcom/flurry/sdk/fm$f;->a(Lcom/flurry/sdk/hr;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/flurry/sdk/fm$f;->h:Lcom/flurry/sdk/fm$r;

    iget-object v3, p1, Lcom/flurry/sdk/fm$f;->h:Lcom/flurry/sdk/fm$r;

    invoke-virtual {v2, v3}, Lcom/flurry/sdk/fm$r;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    :cond_3
    move v0, v1

    goto :goto_0
.end method

.method public f()Lcom/flurry/sdk/fm$f$a;
    .locals 1

    .prologue
    .line 425
    iget-object v0, p0, Lcom/flurry/sdk/fm$f;->f:Lcom/flurry/sdk/fm$f$a;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 456
    iget-object v0, p0, Lcom/flurry/sdk/fm$f;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    iget-object v1, p0, Lcom/flurry/sdk/fm$f;->c:Lcom/flurry/sdk/fm;

    invoke-virtual {v1}, Lcom/flurry/sdk/fm;->m()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 468
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flurry/sdk/fm$f;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " type:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/sdk/fm$f;->c:Lcom/flurry/sdk/fm;

    invoke-static {v1}, Lcom/flurry/sdk/fm;->d(Lcom/flurry/sdk/fm;)Lcom/flurry/sdk/fm$v;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " pos:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/flurry/sdk/fm$f;->b:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
