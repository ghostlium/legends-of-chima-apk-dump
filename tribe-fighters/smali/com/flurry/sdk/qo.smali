.class public Lcom/flurry/sdk/qo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/qo$a;
    }
.end annotation


# instance fields
.field final a:Lcom/flurry/sdk/qm;


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/qm;)V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/flurry/sdk/qo;->a:Lcom/flurry/sdk/qm;

    .line 20
    return-void
.end method


# virtual methods
.method protected a(Lcom/flurry/sdk/qo$a;)Lcom/flurry/sdk/rx;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 38
    invoke-virtual {p1}, Lcom/flurry/sdk/qo$a;->hasMoreTokens()Z

    move-result v0

    if-nez v0, :cond_0

    .line 39
    const-string v0, "Unexpected end-of-string"

    invoke-virtual {p0, p1, v0}, Lcom/flurry/sdk/qo;->a(Lcom/flurry/sdk/qo$a;Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object v0

    throw v0

    .line 41
    :cond_0
    invoke-virtual {p1}, Lcom/flurry/sdk/qo$a;->nextToken()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lcom/flurry/sdk/qo;->a(Ljava/lang/String;Lcom/flurry/sdk/qo$a;)Ljava/lang/Class;

    move-result-object v0

    .line 43
    invoke-virtual {p1}, Lcom/flurry/sdk/qo$a;->hasMoreTokens()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 44
    invoke-virtual {p1}, Lcom/flurry/sdk/qo$a;->nextToken()Ljava/lang/String;

    move-result-object v1

    .line 45
    const-string v2, "<"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 46
    iget-object v1, p0, Lcom/flurry/sdk/qo;->a:Lcom/flurry/sdk/qm;

    invoke-virtual {p0, p1}, Lcom/flurry/sdk/qo;->b(Lcom/flurry/sdk/qo$a;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lcom/flurry/sdk/qm;->a(Ljava/lang/Class;Ljava/util/List;)Lcom/flurry/sdk/rx;

    move-result-object v0

    .line 51
    :goto_0
    return-object v0

    .line 49
    :cond_1
    invoke-virtual {p1, v1}, Lcom/flurry/sdk/qo$a;->a(Ljava/lang/String;)V

    .line 51
    :cond_2
    iget-object v1, p0, Lcom/flurry/sdk/qo;->a:Lcom/flurry/sdk/qm;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lcom/flurry/sdk/qm;->a(Ljava/lang/Class;Lcom/flurry/sdk/ql;)Lcom/flurry/sdk/rx;

    move-result-object v0

    goto :goto_0
.end method

.method public a(Ljava/lang/String;)Lcom/flurry/sdk/rx;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 25
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 26
    new-instance v1, Lcom/flurry/sdk/qo$a;

    invoke-direct {v1, v0}, Lcom/flurry/sdk/qo$a;-><init>(Ljava/lang/String;)V

    .line 27
    invoke-virtual {p0, v1}, Lcom/flurry/sdk/qo;->a(Lcom/flurry/sdk/qo$a;)Lcom/flurry/sdk/rx;

    move-result-object v0

    .line 29
    invoke-virtual {v1}, Lcom/flurry/sdk/qo$a;->hasMoreTokens()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 30
    const-string v0, "Unexpected tokens after complete type"

    invoke-virtual {p0, v1, v0}, Lcom/flurry/sdk/qo;->a(Lcom/flurry/sdk/qo$a;Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object v0

    throw v0

    .line 32
    :cond_0
    return-object v0
.end method

.method protected a(Ljava/lang/String;Lcom/flurry/sdk/qo$a;)Ljava/lang/Class;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/flurry/sdk/qo$a;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 77
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 78
    const/4 v1, 0x1

    invoke-static {p1, v1, v0}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    return-object v0

    .line 79
    :catch_0
    move-exception v0

    .line 80
    instance-of v1, v0, Ljava/lang/RuntimeException;

    if-eqz v1, :cond_0

    .line 81
    check-cast v0, Ljava/lang/RuntimeException;

    throw v0

    .line 83
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Can not locate class \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\', problem: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p2, v0}, Lcom/flurry/sdk/qo;->a(Lcom/flurry/sdk/qo$a;Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object v0

    throw v0
.end method

.method protected a(Lcom/flurry/sdk/qo$a;Ljava/lang/String;)Ljava/lang/IllegalArgumentException;
    .locals 3

    .prologue
    .line 89
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to parse type \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/flurry/sdk/qo$a;->a()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\' (remaining: \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/flurry/sdk/qo$a;->b()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method protected b(Lcom/flurry/sdk/qo$a;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/qo$a;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/sdk/rx;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 57
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 58
    :cond_0
    invoke-virtual {p1}, Lcom/flurry/sdk/qo$a;->hasMoreTokens()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 59
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/qo;->a(Lcom/flurry/sdk/qo$a;)Lcom/flurry/sdk/rx;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 60
    invoke-virtual {p1}, Lcom/flurry/sdk/qo$a;->hasMoreTokens()Z

    move-result v1

    if-nez v1, :cond_2

    .line 67
    :cond_1
    const-string v0, "Unexpected end-of-string"

    invoke-virtual {p0, p1, v0}, Lcom/flurry/sdk/qo;->a(Lcom/flurry/sdk/qo$a;Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object v0

    throw v0

    .line 61
    :cond_2
    invoke-virtual {p1}, Lcom/flurry/sdk/qo$a;->nextToken()Ljava/lang/String;

    move-result-object v1

    .line 62
    const-string v2, ">"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    return-object v0

    .line 63
    :cond_3
    const-string v2, ","

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 64
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unexpected token \'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\', expected \',\' or \'>\')"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/flurry/sdk/qo;->a(Lcom/flurry/sdk/qo$a;Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object v0

    throw v0
.end method
