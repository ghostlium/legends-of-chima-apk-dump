.class public final Lcom/flurry/sdk/ld;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected final a:Lcom/flurry/sdk/kx;

.field protected final b:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/flurry/sdk/kt;",
            ">;"
        }
    .end annotation
.end field

.field protected c:[Ljava/lang/Object;

.field protected final d:[Lcom/flurry/sdk/kt;


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/kx;)V
    .locals 8

    .prologue
    const/4 v1, 0x0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p1, p0, Lcom/flurry/sdk/ld;->a:Lcom/flurry/sdk/kx;

    .line 50
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/ld;->b:Ljava/util/HashMap;

    .line 53
    invoke-virtual {p1}, Lcom/flurry/sdk/kx;->k()[Lcom/flurry/sdk/kt;

    move-result-object v3

    .line 55
    const/4 v0, 0x0

    array-length v4, v3

    move v2, v0

    move-object v0, v1

    :goto_0
    if-ge v2, v4, :cond_4

    .line 56
    aget-object v5, v3, v2

    .line 57
    iget-object v6, p0, Lcom/flurry/sdk/ld;->b:Ljava/util/HashMap;

    invoke-virtual {v5}, Lcom/flurry/sdk/kt;->c()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    invoke-virtual {v5}, Lcom/flurry/sdk/kt;->a()Lcom/flurry/sdk/rx;

    move-result-object v6

    invoke-virtual {v6}, Lcom/flurry/sdk/rx;->t()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 59
    if-nez v1, :cond_0

    .line 60
    new-array v1, v4, [Ljava/lang/Object;

    .line 62
    :cond_0
    invoke-virtual {v5}, Lcom/flurry/sdk/kt;->a()Lcom/flurry/sdk/rx;

    move-result-object v6

    invoke-virtual {v6}, Lcom/flurry/sdk/rx;->p()Ljava/lang/Class;

    move-result-object v6

    invoke-static {v6}, Lcom/flurry/sdk/qs;->f(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, v1, v2

    .line 64
    :cond_1
    invoke-virtual {v5}, Lcom/flurry/sdk/kt;->k()Ljava/lang/Object;

    move-result-object v6

    .line 65
    if-eqz v6, :cond_3

    .line 66
    if-nez v0, :cond_2

    .line 67
    new-array v0, v4, [Lcom/flurry/sdk/kt;

    .line 69
    :cond_2
    aput-object v5, v0, v2

    .line 55
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 72
    :cond_4
    iput-object v1, p0, Lcom/flurry/sdk/ld;->c:[Ljava/lang/Object;

    .line 73
    iput-object v0, p0, Lcom/flurry/sdk/ld;->d:[Lcom/flurry/sdk/kt;

    .line 74
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)Lcom/flurry/sdk/kt;
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lcom/flurry/sdk/ld;->b:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/kt;

    return-object v0
.end method

.method public a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Lcom/flurry/sdk/lf;
    .locals 2

    .prologue
    .line 101
    new-instance v0, Lcom/flurry/sdk/lf;

    iget-object v1, p0, Lcom/flurry/sdk/ld;->b:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    move-result v1

    invoke-direct {v0, p1, p2, v1}, Lcom/flurry/sdk/lf;-><init>(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;I)V

    .line 102
    iget-object v1, p0, Lcom/flurry/sdk/ld;->d:[Lcom/flurry/sdk/kt;

    if-eqz v1, :cond_0

    .line 103
    iget-object v1, p0, Lcom/flurry/sdk/ld;->d:[Lcom/flurry/sdk/kt;

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/lf;->a([Lcom/flurry/sdk/kt;)V

    .line 105
    :cond_0
    return-object v0
.end method

.method public a(Lcom/flurry/sdk/lf;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 110
    iget-object v0, p0, Lcom/flurry/sdk/ld;->a:Lcom/flurry/sdk/kx;

    iget-object v1, p0, Lcom/flurry/sdk/ld;->c:[Ljava/lang/Object;

    invoke-virtual {p1, v1}, Lcom/flurry/sdk/lf;->a([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/kx;->a([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 112
    invoke-virtual {p1}, Lcom/flurry/sdk/lf;->a()Lcom/flurry/sdk/le;

    move-result-object v0

    :goto_0
    if-eqz v0, :cond_0

    .line 113
    invoke-virtual {v0, v1}, Lcom/flurry/sdk/le;->a(Ljava/lang/Object;)V

    .line 112
    iget-object v0, v0, Lcom/flurry/sdk/le;->a:Lcom/flurry/sdk/le;

    goto :goto_0

    .line 115
    :cond_0
    return-object v1
.end method

.method public a()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lcom/flurry/sdk/kt;",
            ">;"
        }
    .end annotation

    .prologue
    .line 77
    iget-object v0, p0, Lcom/flurry/sdk/ld;->b:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public a(Lcom/flurry/sdk/kt;Lcom/flurry/sdk/jh;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/kt;",
            "Lcom/flurry/sdk/jh",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 85
    invoke-virtual {p1, p2}, Lcom/flurry/sdk/kt;->a(Lcom/flurry/sdk/jh;)Lcom/flurry/sdk/kt;

    move-result-object v0

    .line 86
    iget-object v1, p0, Lcom/flurry/sdk/ld;->b:Ljava/util/HashMap;

    invoke-virtual {v0}, Lcom/flurry/sdk/kt;->c()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    invoke-virtual {p2}, Lcom/flurry/sdk/jh;->b()Ljava/lang/Object;

    move-result-object v1

    .line 88
    if-eqz v1, :cond_1

    .line 89
    iget-object v2, p0, Lcom/flurry/sdk/ld;->c:[Ljava/lang/Object;

    if-nez v2, :cond_0

    .line 90
    iget-object v2, p0, Lcom/flurry/sdk/ld;->b:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/Object;

    iput-object v2, p0, Lcom/flurry/sdk/ld;->c:[Ljava/lang/Object;

    .line 92
    :cond_0
    iget-object v2, p0, Lcom/flurry/sdk/ld;->c:[Ljava/lang/Object;

    invoke-virtual {v0}, Lcom/flurry/sdk/kt;->j()I

    move-result v0

    aput-object v1, v2, v0

    .line 94
    :cond_1
    return-void
.end method
