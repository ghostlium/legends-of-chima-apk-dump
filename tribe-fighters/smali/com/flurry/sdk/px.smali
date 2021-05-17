.class public Lcom/flurry/sdk/px;
.super Lcom/flurry/sdk/pr;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/sdk/jt;


# annotations
.annotation runtime Lcom/flurry/sdk/kb;
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/pr",
        "<",
        "Ljava/util/Collection",
        "<",
        "Ljava/lang/String;",
        ">;>;",
        "Lcom/flurry/sdk/jt;"
    }
.end annotation


# instance fields
.field protected a:Lcom/flurry/sdk/jl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/it;)V
    .locals 1

    .prologue
    .line 35
    const-class v0, Ljava/util/Collection;

    invoke-direct {p0, v0, p1}, Lcom/flurry/sdk/pr;-><init>(Ljava/lang/Class;Lcom/flurry/sdk/it;)V

    .line 36
    return-void
.end method

.method private final b(Ljava/util/Collection;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/flurry/sdk/hp;",
            "Lcom/flurry/sdk/jw;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 82
    iget-object v0, p0, Lcom/flurry/sdk/px;->a:Lcom/flurry/sdk/jl;

    if-eqz v0, :cond_1

    .line 83
    invoke-direct {p0, p1, p2, p3}, Lcom/flurry/sdk/px;->c(Ljava/util/Collection;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V

    .line 99
    :cond_0
    return-void

    .line 86
    :cond_1
    const/4 v0, 0x0

    .line 87
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v1, v0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 89
    if-nez v0, :cond_2

    .line 90
    :try_start_0
    invoke-virtual {p3, p2}, Lcom/flurry/sdk/jw;->a(Lcom/flurry/sdk/hp;)V

    .line 94
    :goto_1
    add-int/lit8 v0, v1, 0x1

    :goto_2
    move v1, v0

    .line 97
    goto :goto_0

    .line 92
    :cond_2
    invoke-virtual {p2, v0}, Lcom/flurry/sdk/hp;->b(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 95
    :catch_0
    move-exception v0

    .line 96
    invoke-virtual {p0, p3, v0, p1, v1}, Lcom/flurry/sdk/px;->a(Lcom/flurry/sdk/jw;Ljava/lang/Throwable;Ljava/lang/Object;I)V

    move v0, v1

    goto :goto_2
.end method

.method private c(Ljava/util/Collection;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/flurry/sdk/hp;",
            "Lcom/flurry/sdk/jw;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 104
    iget-object v1, p0, Lcom/flurry/sdk/px;->a:Lcom/flurry/sdk/jl;

    .line 105
    const/4 v2, 0x0

    .line 106
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 108
    if-nez v0, :cond_0

    .line 109
    :try_start_0
    invoke-virtual {p3, p2}, Lcom/flurry/sdk/jw;->a(Lcom/flurry/sdk/hp;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 113
    :catch_0
    move-exception v0

    .line 114
    invoke-virtual {p0, p3, v0, p1, v2}, Lcom/flurry/sdk/px;->a(Lcom/flurry/sdk/jw;Ljava/lang/Throwable;Ljava/lang/Object;I)V

    goto :goto_0

    .line 111
    :cond_0
    :try_start_1
    invoke-virtual {v1, v0, p2, p3}, Lcom/flurry/sdk/jl;->a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 117
    :cond_1
    return-void
.end method


# virtual methods
.method public a(Lcom/flurry/sdk/jw;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flurry/sdk/ji;
        }
    .end annotation

    .prologue
    .line 46
    const-class v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/flurry/sdk/px;->b:Lcom/flurry/sdk/it;

    invoke-virtual {p1, v0, v1}, Lcom/flurry/sdk/jw;->a(Ljava/lang/Class;Lcom/flurry/sdk/it;)Lcom/flurry/sdk/jl;

    move-result-object v0

    .line 47
    invoke-virtual {p0, v0}, Lcom/flurry/sdk/px;->a(Lcom/flurry/sdk/jl;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 48
    iput-object v0, p0, Lcom/flurry/sdk/px;->a:Lcom/flurry/sdk/jl;

    .line 50
    :cond_0
    return-void
.end method

.method public bridge synthetic a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 26
    check-cast p1, Ljava/util/Collection;

    invoke-virtual {p0, p1, p2, p3}, Lcom/flurry/sdk/px;->a(Ljava/util/Collection;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V

    return-void
.end method

.method public bridge synthetic a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;Lcom/flurry/sdk/jz;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 26
    check-cast p1, Ljava/util/Collection;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/flurry/sdk/px;->a(Ljava/util/Collection;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;Lcom/flurry/sdk/jz;)V

    return-void
.end method

.method public a(Ljava/util/Collection;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/flurry/sdk/hp;",
            "Lcom/flurry/sdk/jw;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 56
    invoke-virtual {p2}, Lcom/flurry/sdk/hp;->b()V

    .line 57
    iget-object v0, p0, Lcom/flurry/sdk/px;->a:Lcom/flurry/sdk/jl;

    if-nez v0, :cond_0

    .line 58
    invoke-direct {p0, p1, p2, p3}, Lcom/flurry/sdk/px;->b(Ljava/util/Collection;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V

    .line 62
    :goto_0
    invoke-virtual {p2}, Lcom/flurry/sdk/hp;->c()V

    .line 63
    return-void

    .line 60
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lcom/flurry/sdk/px;->c(Ljava/util/Collection;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V

    goto :goto_0
.end method

.method public a(Ljava/util/Collection;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;Lcom/flurry/sdk/jz;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/flurry/sdk/hp;",
            "Lcom/flurry/sdk/jw;",
            "Lcom/flurry/sdk/jz;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 70
    invoke-virtual {p4, p1, p2}, Lcom/flurry/sdk/jz;->c(Ljava/lang/Object;Lcom/flurry/sdk/hp;)V

    .line 71
    iget-object v0, p0, Lcom/flurry/sdk/px;->a:Lcom/flurry/sdk/jl;

    if-nez v0, :cond_0

    .line 72
    invoke-direct {p0, p1, p2, p3}, Lcom/flurry/sdk/px;->b(Ljava/util/Collection;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V

    .line 76
    :goto_0
    invoke-virtual {p4, p1, p2}, Lcom/flurry/sdk/jz;->f(Ljava/lang/Object;Lcom/flurry/sdk/hp;)V

    .line 77
    return-void

    .line 74
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lcom/flurry/sdk/px;->c(Ljava/util/Collection;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V

    goto :goto_0
.end method
