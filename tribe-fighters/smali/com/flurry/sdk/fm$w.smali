.class Lcom/flurry/sdk/fm$w;
.super Lcom/flurry/sdk/fm;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/fm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "w"
.end annotation


# instance fields
.field private final f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/flurry/sdk/fm;",
            ">;"
        }
    .end annotation
.end field

.field private final g:Ljava/util/Map;
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
.method public constructor <init>(Lcom/flurry/sdk/fm$j;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/fm$j",
            "<",
            "Lcom/flurry/sdk/fm;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 814
    sget-object v0, Lcom/flurry/sdk/fm$v;->e:Lcom/flurry/sdk/fm$v;

    invoke-direct {p0, v0}, Lcom/flurry/sdk/fm;-><init>(Lcom/flurry/sdk/fm$v;)V

    .line 811
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/fm$w;->g:Ljava/util/Map;

    .line 815
    invoke-virtual {p1}, Lcom/flurry/sdk/fm$j;->a()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/fm$w;->f:Ljava/util/List;

    .line 816
    const/4 v0, 0x0

    .line 817
    invoke-virtual {p1}, Lcom/flurry/sdk/fm$j;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v1, v0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/fm;

    .line 818
    invoke-virtual {v0}, Lcom/flurry/sdk/fm;->a()Lcom/flurry/sdk/fm$v;

    move-result-object v3

    sget-object v4, Lcom/flurry/sdk/fm$v;->e:Lcom/flurry/sdk/fm$v;

    if-ne v3, v4, :cond_0

    .line 819
    new-instance v0, Lcom/flurry/sdk/fk;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Nested union: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flurry/sdk/fk;-><init>(Ljava/lang/String;)V

    throw v0

    .line 820
    :cond_0
    invoke-virtual {v0}, Lcom/flurry/sdk/fm;->g()Ljava/lang/String;

    move-result-object v3

    .line 821
    if-nez v3, :cond_1

    .line 822
    new-instance v0, Lcom/flurry/sdk/fk;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Nameless in union:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flurry/sdk/fk;-><init>(Ljava/lang/String;)V

    throw v0

    .line 823
    :cond_1
    iget-object v4, p0, Lcom/flurry/sdk/fm$w;->g:Ljava/util/Map;

    add-int/lit8 v0, v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v4, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 824
    new-instance v0, Lcom/flurry/sdk/fk;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Duplicate in union:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flurry/sdk/fk;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    move v1, v0

    .line 825
    goto :goto_0

    .line 826
    :cond_3
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
    .line 850
    invoke-virtual {p2}, Lcom/flurry/sdk/hp;->b()V

    .line 851
    iget-object v0, p0, Lcom/flurry/sdk/fm$w;->f:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/fm;

    .line 852
    invoke-virtual {v0, p1, p2}, Lcom/flurry/sdk/fm;->a(Lcom/flurry/sdk/fm$o;Lcom/flurry/sdk/hp;)V

    goto :goto_0

    .line 853
    :cond_0
    invoke-virtual {p2}, Lcom/flurry/sdk/hp;->c()V

    .line 854
    return-void
.end method

.method public a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 846
    new-instance v0, Lcom/flurry/sdk/fk;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Can\'t set properties on a union: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flurry/sdk/fk;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public e(Ljava/lang/String;)Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 828
    iget-object v0, p0, Lcom/flurry/sdk/fm$w;->g:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 830
    if-ne p1, p0, :cond_1

    .line 833
    :cond_0
    :goto_0
    return v0

    .line 831
    :cond_1
    instance-of v2, p1, Lcom/flurry/sdk/fm$w;

    if-nez v2, :cond_2

    move v0, v1

    goto :goto_0

    .line 832
    :cond_2
    check-cast p1, Lcom/flurry/sdk/fm$w;

    .line 833
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/fm$w;->c(Lcom/flurry/sdk/fm;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/flurry/sdk/fm$w;->f:Ljava/util/List;

    iget-object v3, p1, Lcom/flurry/sdk/fm$w;->f:Ljava/util/List;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/flurry/sdk/fm$w;->c:Lcom/flurry/sdk/fm$r;

    iget-object v3, p1, Lcom/flurry/sdk/fm$w;->c:Lcom/flurry/sdk/fm$r;

    invoke-virtual {v2, v3}, Lcom/flurry/sdk/fm$r;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    :cond_3
    move v0, v1

    goto :goto_0
.end method

.method public k()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/sdk/fm;",
            ">;"
        }
    .end annotation

    .prologue
    .line 827
    iget-object v0, p0, Lcom/flurry/sdk/fm$w;->f:Ljava/util/List;

    return-object v0
.end method

.method m()I
    .locals 3

    .prologue
    .line 838
    invoke-super {p0}, Lcom/flurry/sdk/fm;->m()I

    move-result v0

    .line 839
    iget-object v1, p0, Lcom/flurry/sdk/fm$w;->f:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v1, v0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/fm;

    .line 840
    invoke-virtual {v0}, Lcom/flurry/sdk/fm;->m()I

    move-result v0

    add-int/2addr v0, v1

    move v1, v0

    goto :goto_0

    .line 841
    :cond_0
    return v1
.end method
