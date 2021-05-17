.class final Lcom/flurry/sdk/nd$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/nd;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public final a:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public final b:Lcom/flurry/sdk/nd$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/flurry/sdk/nd$a",
            "<TT;>;"
        }
    .end annotation
.end field

.field public final c:Ljava/lang/String;

.field public final d:Z

.field public final e:Z


# direct methods
.method public constructor <init>(Ljava/lang/Object;Lcom/flurry/sdk/nd$a;Ljava/lang/String;ZZ)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/flurry/sdk/nd$a",
            "<TT;>;",
            "Ljava/lang/String;",
            "ZZ)V"
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 556
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 557
    iput-object p1, p0, Lcom/flurry/sdk/nd$a;->a:Ljava/lang/Object;

    .line 558
    iput-object p2, p0, Lcom/flurry/sdk/nd$a;->b:Lcom/flurry/sdk/nd$a;

    .line 560
    if-nez p3, :cond_0

    .line 561
    iput-object v0, p0, Lcom/flurry/sdk/nd$a;->c:Ljava/lang/String;

    .line 565
    :goto_0
    iput-boolean p4, p0, Lcom/flurry/sdk/nd$a;->d:Z

    .line 566
    iput-boolean p5, p0, Lcom/flurry/sdk/nd$a;->e:Z

    .line 567
    return-void

    .line 563
    :cond_0
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    move-object p3, v0

    :cond_1
    iput-object p3, p0, Lcom/flurry/sdk/nd$a;->c:Ljava/lang/String;

    goto :goto_0
.end method

.method static synthetic a(Lcom/flurry/sdk/nd$a;Lcom/flurry/sdk/nd$a;)Lcom/flurry/sdk/nd$a;
    .locals 1

    .prologue
    .line 545
    invoke-direct {p0, p1}, Lcom/flurry/sdk/nd$a;->b(Lcom/flurry/sdk/nd$a;)Lcom/flurry/sdk/nd$a;

    move-result-object v0

    return-object v0
.end method

.method private b(Lcom/flurry/sdk/nd$a;)Lcom/flurry/sdk/nd$a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/nd$a",
            "<TT;>;)",
            "Lcom/flurry/sdk/nd$a",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 610
    iget-object v0, p0, Lcom/flurry/sdk/nd$a;->b:Lcom/flurry/sdk/nd$a;

    if-nez v0, :cond_0

    .line 611
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/nd$a;->a(Lcom/flurry/sdk/nd$a;)Lcom/flurry/sdk/nd$a;

    move-result-object v0

    .line 613
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/nd$a;->b:Lcom/flurry/sdk/nd$a;

    invoke-direct {v0, p1}, Lcom/flurry/sdk/nd$a;->b(Lcom/flurry/sdk/nd$a;)Lcom/flurry/sdk/nd$a;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/nd$a;->a(Lcom/flurry/sdk/nd$a;)Lcom/flurry/sdk/nd$a;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method public a()Lcom/flurry/sdk/nd$a;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/flurry/sdk/nd$a",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 586
    iget-boolean v0, p0, Lcom/flurry/sdk/nd$a;->e:Z

    if-eqz v0, :cond_1

    .line 587
    iget-object v0, p0, Lcom/flurry/sdk/nd$a;->b:Lcom/flurry/sdk/nd$a;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 595
    :goto_0
    return-object v0

    .line 587
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/nd$a;->b:Lcom/flurry/sdk/nd$a;

    invoke-virtual {v0}, Lcom/flurry/sdk/nd$a;->a()Lcom/flurry/sdk/nd$a;

    move-result-object v0

    goto :goto_0

    .line 589
    :cond_1
    iget-object v0, p0, Lcom/flurry/sdk/nd$a;->b:Lcom/flurry/sdk/nd$a;

    if-eqz v0, :cond_2

    .line 590
    iget-object v0, p0, Lcom/flurry/sdk/nd$a;->b:Lcom/flurry/sdk/nd$a;

    invoke-virtual {v0}, Lcom/flurry/sdk/nd$a;->a()Lcom/flurry/sdk/nd$a;

    move-result-object v0

    .line 591
    iget-object v1, p0, Lcom/flurry/sdk/nd$a;->b:Lcom/flurry/sdk/nd$a;

    if-eq v0, v1, :cond_2

    .line 592
    invoke-virtual {p0, v0}, Lcom/flurry/sdk/nd$a;->a(Lcom/flurry/sdk/nd$a;)Lcom/flurry/sdk/nd$a;

    move-result-object v0

    goto :goto_0

    :cond_2
    move-object v0, p0

    .line 595
    goto :goto_0
.end method

.method public a(Lcom/flurry/sdk/nd$a;)Lcom/flurry/sdk/nd$a;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/nd$a",
            "<TT;>;)",
            "Lcom/flurry/sdk/nd$a",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 578
    iget-object v0, p0, Lcom/flurry/sdk/nd$a;->b:Lcom/flurry/sdk/nd$a;

    if-ne p1, v0, :cond_0

    .line 581
    :goto_0
    return-object p0

    :cond_0
    new-instance v0, Lcom/flurry/sdk/nd$a;

    iget-object v1, p0, Lcom/flurry/sdk/nd$a;->a:Ljava/lang/Object;

    iget-object v3, p0, Lcom/flurry/sdk/nd$a;->c:Ljava/lang/String;

    iget-boolean v4, p0, Lcom/flurry/sdk/nd$a;->d:Z

    iget-boolean v5, p0, Lcom/flurry/sdk/nd$a;->e:Z

    move-object v2, p1

    invoke-direct/range {v0 .. v5}, Lcom/flurry/sdk/nd$a;-><init>(Ljava/lang/Object;Lcom/flurry/sdk/nd$a;Ljava/lang/String;ZZ)V

    move-object p0, v0

    goto :goto_0
.end method

.method public a(Ljava/lang/Object;)Lcom/flurry/sdk/nd$a;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lcom/flurry/sdk/nd$a",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 571
    iget-object v0, p0, Lcom/flurry/sdk/nd$a;->a:Ljava/lang/Object;

    if-ne p1, v0, :cond_0

    .line 574
    :goto_0
    return-object p0

    :cond_0
    new-instance v0, Lcom/flurry/sdk/nd$a;

    iget-object v2, p0, Lcom/flurry/sdk/nd$a;->b:Lcom/flurry/sdk/nd$a;

    iget-object v3, p0, Lcom/flurry/sdk/nd$a;->c:Ljava/lang/String;

    iget-boolean v4, p0, Lcom/flurry/sdk/nd$a;->d:Z

    iget-boolean v5, p0, Lcom/flurry/sdk/nd$a;->e:Z

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/flurry/sdk/nd$a;-><init>(Ljava/lang/Object;Lcom/flurry/sdk/nd$a;Ljava/lang/String;ZZ)V

    move-object p0, v0

    goto :goto_0
.end method

.method public b()Lcom/flurry/sdk/nd$a;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/flurry/sdk/nd$a",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 600
    iget-object v0, p0, Lcom/flurry/sdk/nd$a;->b:Lcom/flurry/sdk/nd$a;

    if-nez v0, :cond_1

    const/4 v0, 0x0

    .line 601
    :goto_0
    iget-boolean v1, p0, Lcom/flurry/sdk/nd$a;->d:Z

    if-eqz v1, :cond_0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/nd$a;->a(Lcom/flurry/sdk/nd$a;)Lcom/flurry/sdk/nd$a;

    move-result-object v0

    :cond_0
    return-object v0

    .line 600
    :cond_1
    iget-object v0, p0, Lcom/flurry/sdk/nd$a;->b:Lcom/flurry/sdk/nd$a;

    invoke-virtual {v0}, Lcom/flurry/sdk/nd$a;->b()Lcom/flurry/sdk/nd$a;

    move-result-object v0

    goto :goto_0
.end method

.method public c()Lcom/flurry/sdk/nd$a;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/flurry/sdk/nd$a",
            "<TT;>;"
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 618
    iget-object v0, p0, Lcom/flurry/sdk/nd$a;->b:Lcom/flurry/sdk/nd$a;

    if-nez v0, :cond_1

    move-object v0, p0

    .line 636
    :cond_0
    :goto_0
    return-object v0

    .line 621
    :cond_1
    iget-object v0, p0, Lcom/flurry/sdk/nd$a;->b:Lcom/flurry/sdk/nd$a;

    invoke-virtual {v0}, Lcom/flurry/sdk/nd$a;->c()Lcom/flurry/sdk/nd$a;

    move-result-object v0

    .line 622
    iget-object v1, p0, Lcom/flurry/sdk/nd$a;->c:Ljava/lang/String;

    if-eqz v1, :cond_3

    .line 623
    iget-object v1, v0, Lcom/flurry/sdk/nd$a;->c:Ljava/lang/String;

    if-nez v1, :cond_2

    .line 624
    invoke-virtual {p0, v3}, Lcom/flurry/sdk/nd$a;->a(Lcom/flurry/sdk/nd$a;)Lcom/flurry/sdk/nd$a;

    move-result-object v0

    goto :goto_0

    .line 627
    :cond_2
    invoke-virtual {p0, v0}, Lcom/flurry/sdk/nd$a;->a(Lcom/flurry/sdk/nd$a;)Lcom/flurry/sdk/nd$a;

    move-result-object v0

    goto :goto_0

    .line 629
    :cond_3
    iget-object v1, v0, Lcom/flurry/sdk/nd$a;->c:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 633
    iget-boolean v1, p0, Lcom/flurry/sdk/nd$a;->d:Z

    iget-boolean v2, v0, Lcom/flurry/sdk/nd$a;->d:Z

    if-ne v1, v2, :cond_4

    .line 634
    invoke-virtual {p0, v0}, Lcom/flurry/sdk/nd$a;->a(Lcom/flurry/sdk/nd$a;)Lcom/flurry/sdk/nd$a;

    move-result-object v0

    goto :goto_0

    .line 636
    :cond_4
    iget-boolean v1, p0, Lcom/flurry/sdk/nd$a;->d:Z

    if-eqz v1, :cond_0

    invoke-virtual {p0, v3}, Lcom/flurry/sdk/nd$a;->a(Lcom/flurry/sdk/nd$a;)Lcom/flurry/sdk/nd$a;

    move-result-object v0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 641
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flurry/sdk/nd$a;->a:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "[visible="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/flurry/sdk/nd$a;->d:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 642
    iget-object v1, p0, Lcom/flurry/sdk/nd$a;->b:Lcom/flurry/sdk/nd$a;

    if-eqz v1, :cond_0

    .line 643
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/sdk/nd$a;->b:Lcom/flurry/sdk/nd$a;

    invoke-virtual {v1}, Lcom/flurry/sdk/nd$a;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 645
    :cond_0
    return-object v0
.end method
