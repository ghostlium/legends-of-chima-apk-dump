.class public abstract Lcom/flurry/sdk/ja;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected final a:Lcom/flurry/sdk/iz;

.field protected final b:I


# direct methods
.method protected constructor <init>(Lcom/flurry/sdk/iz;)V
    .locals 1

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/flurry/sdk/ja;->a:Lcom/flurry/sdk/iz;

    .line 35
    iget v0, p1, Lcom/flurry/sdk/iz;->i:I

    iput v0, p0, Lcom/flurry/sdk/ja;->b:I

    .line 36
    return-void
.end method


# virtual methods
.method public a()Lcom/flurry/sdk/iz;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/flurry/sdk/ja;->a:Lcom/flurry/sdk/iz;

    return-object v0
.end method

.method public abstract a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/hw;Ljava/lang/String;)Lcom/flurry/sdk/ji;
.end method

.method public abstract a(Lcom/flurry/sdk/rx;Ljava/lang/String;)Lcom/flurry/sdk/ji;
.end method

.method public abstract a(Ljava/lang/Class;Lcom/flurry/sdk/hw;)Lcom/flurry/sdk/ji;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/flurry/sdk/hw;",
            ")",
            "Lcom/flurry/sdk/ji;"
        }
    .end annotation
.end method

.method public abstract a(Ljava/lang/Class;Ljava/lang/String;)Lcom/flurry/sdk/ji;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Lcom/flurry/sdk/ji;"
        }
    .end annotation
.end method

.method public abstract a(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Lcom/flurry/sdk/ji;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lcom/flurry/sdk/ji;"
        }
    .end annotation
.end method

.method public abstract a(Ljava/lang/Class;Ljava/lang/Throwable;)Lcom/flurry/sdk/ji;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Throwable;",
            ")",
            "Lcom/flurry/sdk/ji;"
        }
    .end annotation
.end method

.method public abstract a(Ljava/lang/Object;Ljava/lang/String;)Lcom/flurry/sdk/ji;
.end method

.method public a(Ljava/lang/Class;)Lcom/flurry/sdk/rx;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/flurry/sdk/rx;"
        }
    .end annotation

    .prologue
    .line 98
    iget-object v0, p0, Lcom/flurry/sdk/ja;->a:Lcom/flurry/sdk/iz;

    invoke-virtual {v0, p1}, Lcom/flurry/sdk/iz;->b(Ljava/lang/Class;)Lcom/flurry/sdk/rx;

    move-result-object v0

    return-object v0
.end method

.method public abstract a(Ljava/lang/Object;Lcom/flurry/sdk/it;Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method public abstract a(Ljava/util/Date;)Ljava/util/Calendar;
.end method

.method public abstract a(Ljava/lang/String;)Ljava/util/Date;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation
.end method

.method public abstract a(Lcom/flurry/sdk/qy;)V
.end method

.method public abstract a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/jh;Ljava/lang/Object;Ljava/lang/String;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/ht;",
            "Lcom/flurry/sdk/jh",
            "<*>;",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation
.end method

.method public a(Lcom/flurry/sdk/iz$a;)Z
    .locals 2

    .prologue
    .line 69
    iget v0, p0, Lcom/flurry/sdk/ja;->b:I

    invoke-virtual {p1}, Lcom/flurry/sdk/iz$a;->b()I

    move-result v1

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public b()Lcom/flurry/sdk/jd;
    .locals 1

    .prologue
    .line 58
    const/4 v0, 0x0

    return-object v0
.end method

.method public abstract b(Ljava/lang/Class;)Lcom/flurry/sdk/ji;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/flurry/sdk/ji;"
        }
    .end annotation
.end method

.method public abstract b(Ljava/lang/Class;Ljava/lang/String;)Lcom/flurry/sdk/ji;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Lcom/flurry/sdk/ji;"
        }
    .end annotation
.end method

.method public b(Ljava/lang/String;)Lcom/flurry/sdk/ji;
    .locals 1

    .prologue
    .line 203
    invoke-virtual {p0}, Lcom/flurry/sdk/ja;->d()Lcom/flurry/sdk/ht;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/flurry/sdk/ji;->a(Lcom/flurry/sdk/ht;Ljava/lang/String;)Lcom/flurry/sdk/ji;

    move-result-object v0

    return-object v0
.end method

.method public c()Lcom/flurry/sdk/hl;
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lcom/flurry/sdk/ja;->a:Lcom/flurry/sdk/iz;

    invoke-virtual {v0}, Lcom/flurry/sdk/iz;->g()Lcom/flurry/sdk/hl;

    move-result-object v0

    return-object v0
.end method

.method public abstract c(Ljava/lang/Class;Ljava/lang/String;)Lcom/flurry/sdk/ji;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Lcom/flurry/sdk/ji;"
        }
    .end annotation
.end method

.method public abstract d()Lcom/flurry/sdk/ht;
.end method

.method public final e()Lcom/flurry/sdk/rm;
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lcom/flurry/sdk/ja;->a:Lcom/flurry/sdk/iz;

    invoke-virtual {v0}, Lcom/flurry/sdk/iz;->h()Lcom/flurry/sdk/rm;

    move-result-object v0

    return-object v0
.end method

.method public f()Lcom/flurry/sdk/qm;
    .locals 1

    .prologue
    .line 105
    iget-object v0, p0, Lcom/flurry/sdk/ja;->a:Lcom/flurry/sdk/iz;

    invoke-virtual {v0}, Lcom/flurry/sdk/iz;->m()Lcom/flurry/sdk/qm;

    move-result-object v0

    return-object v0
.end method

.method public abstract g()Lcom/flurry/sdk/qy;
.end method

.method public abstract h()Lcom/flurry/sdk/qq;
.end method
