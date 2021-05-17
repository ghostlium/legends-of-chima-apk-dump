.class Lcom/flurry/sdk/fm$e;
.super Lcom/flurry/sdk/fm$n;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/fm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "e"
.end annotation


# instance fields
.field private final i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final j:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/fm$m;Ljava/lang/String;Lcom/flurry/sdk/fm$j;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/fm$m;",
            "Ljava/lang/String;",
            "Lcom/flurry/sdk/fm$j",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 714
    sget-object v0, Lcom/flurry/sdk/fm$v;->b:Lcom/flurry/sdk/fm$v;

    invoke-direct {p0, v0, p1, p2}, Lcom/flurry/sdk/fm$n;-><init>(Lcom/flurry/sdk/fm$v;Lcom/flurry/sdk/fm$m;Ljava/lang/String;)V

    .line 715
    invoke-virtual {p3}, Lcom/flurry/sdk/fm$j;->a()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/fm$e;->i:Ljava/util/List;

    .line 716
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/fm$e;->j:Ljava/util/Map;

    .line 717
    const/4 v0, 0x0

    .line 718
    invoke-virtual {p3}, Lcom/flurry/sdk/fm$j;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move v1, v0

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 719
    iget-object v4, p0, Lcom/flurry/sdk/fm$e;->j:Ljava/util/Map;

    invoke-static {v0}, Lcom/flurry/sdk/fm;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    add-int/lit8 v2, v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v4, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 720
    new-instance v1, Lcom/flurry/sdk/fn;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Duplicate enum symbol: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/flurry/sdk/fn;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_0
    move v1, v2

    goto :goto_0

    .line 721
    :cond_1
    return-void
.end method


# virtual methods
.method a(Lcom/flurry/sdk/fm$o;Lcom/flurry/sdk/hp;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 737
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/fm$e;->c(Lcom/flurry/sdk/fm$o;Lcom/flurry/sdk/hp;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 750
    :goto_0
    return-void

    .line 738
    :cond_0
    invoke-virtual {p2}, Lcom/flurry/sdk/hp;->d()V

    .line 739
    const-string v0, "type"

    const-string v1, "enum"

    invoke-virtual {p2, v0, v1}, Lcom/flurry/sdk/hp;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 740
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/fm$e;->d(Lcom/flurry/sdk/fm$o;Lcom/flurry/sdk/hp;)V

    .line 741
    invoke-virtual {p0}, Lcom/flurry/sdk/fm$e;->e()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 742
    const-string v0, "doc"

    invoke-virtual {p0}, Lcom/flurry/sdk/fm$e;->e()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v0, v1}, Lcom/flurry/sdk/hp;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 743
    :cond_1
    const-string v0, "symbols"

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/hp;->f(Ljava/lang/String;)V

    .line 744
    iget-object v0, p0, Lcom/flurry/sdk/fm$e;->i:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 745
    invoke-virtual {p2, v0}, Lcom/flurry/sdk/hp;->b(Ljava/lang/String;)V

    goto :goto_1

    .line 746
    :cond_2
    invoke-virtual {p2}, Lcom/flurry/sdk/hp;->c()V

    .line 747
    iget-object v0, p0, Lcom/flurry/sdk/fm$e;->c:Lcom/flurry/sdk/fm$r;

    invoke-virtual {v0, p2}, Lcom/flurry/sdk/fm$r;->a(Lcom/flurry/sdk/hp;)V

    .line 748
    invoke-virtual {p0, p2}, Lcom/flurry/sdk/fm$e;->a(Lcom/flurry/sdk/hp;)V

    .line 749
    invoke-virtual {p2}, Lcom/flurry/sdk/hp;->e()V

    goto :goto_0
.end method

.method public c(Ljava/lang/String;)I
    .locals 1

    .prologue
    .line 725
    iget-object v0, p0, Lcom/flurry/sdk/fm$e;->j:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public c()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 722
    iget-object v0, p0, Lcom/flurry/sdk/fm$e;->i:Ljava/util/List;

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 727
    if-ne p1, p0, :cond_1

    .line 730
    :cond_0
    :goto_0
    return v0

    .line 728
    :cond_1
    instance-of v2, p1, Lcom/flurry/sdk/fm$e;

    if-nez v2, :cond_2

    move v0, v1

    goto :goto_0

    .line 729
    :cond_2
    check-cast p1, Lcom/flurry/sdk/fm$e;

    .line 730
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/fm$e;->c(Lcom/flurry/sdk/fm;)Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-virtual {p0, p1}, Lcom/flurry/sdk/fm$e;->a(Lcom/flurry/sdk/fm$n;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/flurry/sdk/fm$e;->i:Ljava/util/List;

    iget-object v3, p1, Lcom/flurry/sdk/fm$e;->i:Ljava/util/List;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/flurry/sdk/fm$e;->c:Lcom/flurry/sdk/fm$r;

    iget-object v3, p1, Lcom/flurry/sdk/fm$e;->c:Lcom/flurry/sdk/fm$r;

    invoke-virtual {v2, v3}, Lcom/flurry/sdk/fm$r;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    :cond_3
    move v0, v1

    goto :goto_0
.end method

.method m()I
    .locals 2

    .prologue
    .line 735
    invoke-super {p0}, Lcom/flurry/sdk/fm$n;->m()I

    move-result v0

    iget-object v1, p0, Lcom/flurry/sdk/fm$e;->i:Ljava/util/List;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method
