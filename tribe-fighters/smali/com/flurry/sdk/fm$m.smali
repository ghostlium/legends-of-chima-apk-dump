.class Lcom/flurry/sdk/fm$m;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/fm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "m"
.end annotation


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:Ljava/lang/String;

.field private final c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 476
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 477
    if-nez p1, :cond_0

    .line 478
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/flurry/sdk/fm$m;->c:Ljava/lang/String;

    iput-object v0, p0, Lcom/flurry/sdk/fm$m;->b:Ljava/lang/String;

    iput-object v0, p0, Lcom/flurry/sdk/fm$m;->a:Ljava/lang/String;

    .line 490
    :goto_0
    return-void

    .line 481
    :cond_0
    const/16 v0, 0x2e

    invoke-virtual {p1, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 482
    if-gez v0, :cond_1

    .line 483
    iput-object p2, p0, Lcom/flurry/sdk/fm$m;->b:Ljava/lang/String;

    .line 484
    invoke-static {p1}, Lcom/flurry/sdk/fm;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/fm$m;->a:Ljava/lang/String;

    .line 489
    :goto_1
    iget-object v0, p0, Lcom/flurry/sdk/fm$m;->b:Ljava/lang/String;

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/flurry/sdk/fm$m;->a:Ljava/lang/String;

    :goto_2
    iput-object v0, p0, Lcom/flurry/sdk/fm$m;->c:Ljava/lang/String;

    goto :goto_0

    .line 486
    :cond_1
    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/flurry/sdk/fm$m;->b:Ljava/lang/String;

    .line 487
    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flurry/sdk/fm;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/fm$m;->a:Ljava/lang/String;

    goto :goto_1

    .line 489
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flurry/sdk/fm$m;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/sdk/fm$m;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_2
.end method

.method static synthetic a(Lcom/flurry/sdk/fm$m;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 472
    iget-object v0, p0, Lcom/flurry/sdk/fm$m;->c:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic b(Lcom/flurry/sdk/fm$m;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 472
    iget-object v0, p0, Lcom/flurry/sdk/fm$m;->a:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic c(Lcom/flurry/sdk/fm$m;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 472
    iget-object v0, p0, Lcom/flurry/sdk/fm$m;->b:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public a(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 511
    iget-object v0, p0, Lcom/flurry/sdk/fm$m;->b:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flurry/sdk/fm$m;->b:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/fm$m;->a:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/flurry/sdk/fm$m;->c:Ljava/lang/String;

    goto :goto_0
.end method

.method public a(Lcom/flurry/sdk/fm$o;Lcom/flurry/sdk/hp;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 502
    iget-object v0, p0, Lcom/flurry/sdk/fm$m;->a:Ljava/lang/String;

    if-eqz v0, :cond_0

    const-string v0, "name"

    iget-object v1, p0, Lcom/flurry/sdk/fm$m;->a:Ljava/lang/String;

    invoke-virtual {p2, v0, v1}, Lcom/flurry/sdk/hp;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 503
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/fm$m;->b:Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 504
    iget-object v0, p0, Lcom/flurry/sdk/fm$m;->b:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/flurry/sdk/fm$o;->a()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 505
    const-string v0, "namespace"

    iget-object v1, p0, Lcom/flurry/sdk/fm$m;->b:Ljava/lang/String;

    invoke-virtual {p2, v0, v1}, Lcom/flurry/sdk/hp;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 506
    :cond_1
    invoke-virtual {p1}, Lcom/flurry/sdk/fm$o;->a()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_2

    .line 507
    iget-object v0, p0, Lcom/flurry/sdk/fm$m;->b:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/fm$o;->a(Ljava/lang/String;)V

    .line 509
    :cond_2
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 492
    if-ne p1, p0, :cond_1

    .line 495
    :cond_0
    :goto_0
    return v0

    .line 493
    :cond_1
    instance-of v2, p1, Lcom/flurry/sdk/fm$m;

    if-nez v2, :cond_2

    move v0, v1

    goto :goto_0

    .line 494
    :cond_2
    check-cast p1, Lcom/flurry/sdk/fm$m;

    .line 495
    iget-object v2, p0, Lcom/flurry/sdk/fm$m;->c:Ljava/lang/String;

    if-nez v2, :cond_3

    iget-object v2, p1, Lcom/flurry/sdk/fm$m;->c:Ljava/lang/String;

    if-eqz v2, :cond_0

    move v0, v1

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/flurry/sdk/fm$m;->c:Ljava/lang/String;

    iget-object v1, p1, Lcom/flurry/sdk/fm$m;->c:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 498
    iget-object v0, p0, Lcom/flurry/sdk/fm$m;->c:Ljava/lang/String;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/fm$m;->c:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 500
    iget-object v0, p0, Lcom/flurry/sdk/fm$m;->c:Ljava/lang/String;

    return-object v0
.end method
