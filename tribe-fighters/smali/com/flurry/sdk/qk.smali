.class public abstract Lcom/flurry/sdk/qk;
.super Lcom/flurry/sdk/rx;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/sdk/jk;


# instance fields
.field volatile c:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/Class;ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;I",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .prologue
    .line 34
    invoke-direct {p0, p1, p2}, Lcom/flurry/sdk/rx;-><init>(Ljava/lang/Class;I)V

    .line 39
    iput-object p3, p0, Lcom/flurry/sdk/qk;->f:Ljava/lang/Object;

    .line 40
    iput-object p4, p0, Lcom/flurry/sdk/qk;->g:Ljava/lang/Object;

    .line 41
    return-void
.end method


# virtual methods
.method protected abstract a()Ljava/lang/String;
.end method

.method public a(Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 89
    invoke-virtual {p0}, Lcom/flurry/sdk/qk;->m()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/hp;->b(Ljava/lang/String;)V

    .line 90
    return-void
.end method

.method public a(Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;Lcom/flurry/sdk/jz;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 80
    invoke-virtual {p3, p0, p1}, Lcom/flurry/sdk/jz;->a(Ljava/lang/Object;Lcom/flurry/sdk/hp;)V

    .line 81
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/qk;->a(Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V

    .line 82
    invoke-virtual {p3, p0, p1}, Lcom/flurry/sdk/jz;->d(Ljava/lang/Object;Lcom/flurry/sdk/hp;)V

    .line 83
    return-void
.end method

.method public m()Ljava/lang/String;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/flurry/sdk/qk;->c:Ljava/lang/String;

    .line 47
    if-nez v0, :cond_0

    .line 48
    invoke-virtual {p0}, Lcom/flurry/sdk/qk;->a()Ljava/lang/String;

    move-result-object v0

    .line 50
    :cond_0
    return-object v0
.end method

.method public n()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()TT;"
        }
    .end annotation

    .prologue
    .line 63
    iget-object v0, p0, Lcom/flurry/sdk/qk;->f:Ljava/lang/Object;

    return-object v0
.end method

.method public o()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()TT;"
        }
    .end annotation

    .prologue
    .line 67
    iget-object v0, p0, Lcom/flurry/sdk/qk;->g:Ljava/lang/Object;

    return-object v0
.end method
