.class public Lcom/flurry/sdk/nx;
.super Lcom/flurry/sdk/nw;
.source "SourceFile"


# instance fields
.field protected final a:Lcom/flurry/sdk/jo;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/flurry/sdk/jo",
            "<*>;"
        }
    .end annotation
.end field

.field protected final b:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected final e:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/flurry/sdk/rx;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Lcom/flurry/sdk/jo;Lcom/flurry/sdk/rx;Ljava/util/HashMap;Ljava/util/HashMap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/jo",
            "<*>;",
            "Lcom/flurry/sdk/rx;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/flurry/sdk/rx;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 32
    invoke-virtual {p1}, Lcom/flurry/sdk/jo;->m()Lcom/flurry/sdk/qm;

    move-result-object v0

    invoke-direct {p0, p2, v0}, Lcom/flurry/sdk/nw;-><init>(Lcom/flurry/sdk/rx;Lcom/flurry/sdk/qm;)V

    .line 33
    iput-object p1, p0, Lcom/flurry/sdk/nx;->a:Lcom/flurry/sdk/jo;

    .line 34
    iput-object p3, p0, Lcom/flurry/sdk/nx;->b:Ljava/util/HashMap;

    .line 35
    iput-object p4, p0, Lcom/flurry/sdk/nx;->e:Ljava/util/HashMap;

    .line 36
    return-void
.end method

.method public static a(Lcom/flurry/sdk/jo;Lcom/flurry/sdk/rx;Ljava/util/Collection;ZZ)Lcom/flurry/sdk/nx;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/jo",
            "<*>;",
            "Lcom/flurry/sdk/rx;",
            "Ljava/util/Collection",
            "<",
            "Lcom/flurry/sdk/nf;",
            ">;ZZ)",
            "Lcom/flurry/sdk/nx;"
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 43
    if-ne p3, p4, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 47
    :cond_0
    if-eqz p3, :cond_7

    .line 48
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    move-object v3, v1

    .line 50
    :goto_0
    if-eqz p4, :cond_6

    .line 51
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    move-object v2, v0

    .line 53
    :goto_1
    if-eqz p2, :cond_5

    .line 54
    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1
    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/nf;

    .line 58
    invoke-virtual {v0}, Lcom/flurry/sdk/nf;->a()Ljava/lang/Class;

    move-result-object v5

    .line 59
    invoke-virtual {v0}, Lcom/flurry/sdk/nf;->c()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-virtual {v0}, Lcom/flurry/sdk/nf;->b()Ljava/lang/String;

    move-result-object v0

    move-object v1, v0

    .line 60
    :goto_3
    if-eqz p3, :cond_2

    .line 61
    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    :cond_2
    if-eqz p4, :cond_1

    .line 68
    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/rx;

    .line 69
    if-eqz v0, :cond_3

    .line 70
    invoke-virtual {v0}, Lcom/flurry/sdk/rx;->p()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 74
    :cond_3
    invoke-virtual {p0, v5}, Lcom/flurry/sdk/jo;->b(Ljava/lang/Class;)Lcom/flurry/sdk/rx;

    move-result-object v0

    invoke-virtual {v2, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 59
    :cond_4
    invoke-static {v5}, Lcom/flurry/sdk/nx;->a(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    move-object v1, v0

    goto :goto_3

    .line 78
    :cond_5
    new-instance v0, Lcom/flurry/sdk/nx;

    invoke-direct {v0, p0, p1, v3, v2}, Lcom/flurry/sdk/nx;-><init>(Lcom/flurry/sdk/jo;Lcom/flurry/sdk/rx;Ljava/util/HashMap;Ljava/util/HashMap;)V

    return-object v0

    :cond_6
    move-object v2, v0

    goto :goto_1

    :cond_7
    move-object v3, v0

    goto :goto_0
.end method

.method protected static a(Ljava/lang/Class;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 150
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 151
    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 152
    if-gez v1, :cond_0

    :goto_0
    return-object v0

    :cond_0
    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method public a(Ljava/lang/String;)Lcom/flurry/sdk/rx;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 119
    iget-object v0, p0, Lcom/flurry/sdk/nx;->e:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/rx;

    .line 125
    return-object v0
.end method

.method public a(Ljava/lang/Object;)Ljava/lang/String;
    .locals 5

    .prologue
    .line 87
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 88
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    .line 90
    iget-object v3, p0, Lcom/flurry/sdk/nx;->b:Ljava/util/HashMap;

    monitor-enter v3

    .line 91
    :try_start_0
    iget-object v0, p0, Lcom/flurry/sdk/nx;->b:Ljava/util/HashMap;

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 92
    if-nez v0, :cond_2

    .line 95
    iget-object v4, p0, Lcom/flurry/sdk/nx;->a:Lcom/flurry/sdk/jo;

    invoke-virtual {v4}, Lcom/flurry/sdk/jo;->b()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 96
    iget-object v0, p0, Lcom/flurry/sdk/nx;->a:Lcom/flurry/sdk/jo;

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/jo;->c(Ljava/lang/Class;)Lcom/flurry/sdk/is;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/mw;

    .line 97
    iget-object v4, p0, Lcom/flurry/sdk/nx;->a:Lcom/flurry/sdk/jo;

    invoke-virtual {v4}, Lcom/flurry/sdk/jo;->a()Lcom/flurry/sdk/ir;

    move-result-object v4

    invoke-virtual {v0}, Lcom/flurry/sdk/mw;->c()Lcom/flurry/sdk/mn;

    move-result-object v0

    invoke-virtual {v4, v0}, Lcom/flurry/sdk/ir;->g(Lcom/flurry/sdk/mn;)Ljava/lang/String;

    move-result-object v0

    .line 99
    :cond_0
    if-nez v0, :cond_1

    .line 101
    invoke-static {v1}, Lcom/flurry/sdk/nx;->a(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    .line 103
    :cond_1
    iget-object v1, p0, Lcom/flurry/sdk/nx;->b:Ljava/util/HashMap;

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    :cond_2
    monitor-exit v3

    .line 106
    return-object v0

    .line 105
    :catchall_0
    move-exception v0

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public a(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 112
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/nx;->a(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 131
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 132
    const/16 v1, 0x5b

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    const-string v1, "; id-to-type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/flurry/sdk/nx;->e:Ljava/util/HashMap;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 134
    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 135
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
