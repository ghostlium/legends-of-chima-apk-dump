.class public Lcom/flurry/sdk/nq;
.super Lcom/flurry/sdk/ny;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/nh;Lcom/flurry/sdk/it;)V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0, p1, p2}, Lcom/flurry/sdk/ny;-><init>(Lcom/flurry/sdk/nh;Lcom/flurry/sdk/it;)V

    .line 28
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Object;Lcom/flurry/sdk/hp;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 80
    invoke-virtual {p2}, Lcom/flurry/sdk/hp;->d()V

    .line 81
    iget-object v0, p0, Lcom/flurry/sdk/nq;->b:Lcom/flurry/sdk/nh;

    invoke-interface {v0, p1}, Lcom/flurry/sdk/nh;->a(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/hp;->a(Ljava/lang/String;)V

    .line 82
    return-void
.end method

.method public a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Ljava/lang/Class;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lcom/flurry/sdk/hp;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 90
    invoke-virtual {p2}, Lcom/flurry/sdk/hp;->d()V

    .line 91
    iget-object v0, p0, Lcom/flurry/sdk/nq;->b:Lcom/flurry/sdk/nh;

    invoke-interface {v0, p1, p3}, Lcom/flurry/sdk/nh;->a(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/hp;->a(Ljava/lang/String;)V

    .line 92
    return-void
.end method

.method public b(Ljava/lang/Object;Lcom/flurry/sdk/hp;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 38
    invoke-virtual {p2}, Lcom/flurry/sdk/hp;->d()V

    .line 40
    iget-object v0, p0, Lcom/flurry/sdk/nq;->b:Lcom/flurry/sdk/nh;

    invoke-interface {v0, p1}, Lcom/flurry/sdk/nh;->a(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/hp;->g(Ljava/lang/String;)V

    .line 41
    return-void
.end method

.method public c(Ljava/lang/Object;Lcom/flurry/sdk/hp;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 59
    invoke-virtual {p2}, Lcom/flurry/sdk/hp;->d()V

    .line 61
    iget-object v0, p0, Lcom/flurry/sdk/nq;->b:Lcom/flurry/sdk/nh;

    invoke-interface {v0, p1}, Lcom/flurry/sdk/nh;->a(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/hp;->f(Ljava/lang/String;)V

    .line 62
    return-void
.end method

.method public d(Ljava/lang/Object;Lcom/flurry/sdk/hp;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 119
    invoke-virtual {p2}, Lcom/flurry/sdk/hp;->e()V

    .line 120
    return-void
.end method

.method public e(Ljava/lang/Object;Lcom/flurry/sdk/hp;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 99
    invoke-virtual {p2}, Lcom/flurry/sdk/hp;->e()V

    .line 101
    invoke-virtual {p2}, Lcom/flurry/sdk/hp;->e()V

    .line 102
    return-void
.end method

.method public f(Ljava/lang/Object;Lcom/flurry/sdk/hp;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 109
    invoke-virtual {p2}, Lcom/flurry/sdk/hp;->c()V

    .line 111
    invoke-virtual {p2}, Lcom/flurry/sdk/hp;->e()V

    .line 112
    return-void
.end method
