.class public abstract Lcom/flurry/sdk/nv;
.super Lcom/flurry/sdk/jy;
.source "SourceFile"


# instance fields
.field protected final b:Lcom/flurry/sdk/nh;

.field protected final c:Lcom/flurry/sdk/rx;

.field protected final d:Lcom/flurry/sdk/it;

.field protected final e:Lcom/flurry/sdk/rx;

.field protected final f:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/flurry/sdk/jh",
            "<",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field protected g:Lcom/flurry/sdk/jh;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/flurry/sdk/jh",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Lcom/flurry/sdk/rx;Lcom/flurry/sdk/nh;Lcom/flurry/sdk/it;Ljava/lang/Class;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/rx;",
            "Lcom/flurry/sdk/nh;",
            "Lcom/flurry/sdk/it;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 56
    invoke-direct {p0}, Lcom/flurry/sdk/jy;-><init>()V

    .line 57
    iput-object p1, p0, Lcom/flurry/sdk/nv;->c:Lcom/flurry/sdk/rx;

    .line 58
    iput-object p2, p0, Lcom/flurry/sdk/nv;->b:Lcom/flurry/sdk/nh;

    .line 59
    iput-object p3, p0, Lcom/flurry/sdk/nv;->d:Lcom/flurry/sdk/it;

    .line 60
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/nv;->f:Ljava/util/HashMap;

    .line 61
    if-nez p4, :cond_0

    .line 62
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/flurry/sdk/nv;->e:Lcom/flurry/sdk/rx;

    .line 70
    :goto_0
    return-void

    .line 68
    :cond_0
    invoke-virtual {p1, p4}, Lcom/flurry/sdk/rx;->g(Ljava/lang/Class;)Lcom/flurry/sdk/rx;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/nv;->e:Lcom/flurry/sdk/rx;

    goto :goto_0
.end method


# virtual methods
.method protected final a(Lcom/flurry/sdk/ja;)Lcom/flurry/sdk/jh;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/ja;",
            ")",
            "Lcom/flurry/sdk/jh",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 143
    iget-object v0, p0, Lcom/flurry/sdk/nv;->e:Lcom/flurry/sdk/rx;

    if-nez v0, :cond_0

    .line 144
    const/4 v0, 0x0

    .line 151
    :goto_0
    return-object v0

    .line 146
    :cond_0
    iget-object v1, p0, Lcom/flurry/sdk/nv;->e:Lcom/flurry/sdk/rx;

    monitor-enter v1

    .line 147
    :try_start_0
    iget-object v0, p0, Lcom/flurry/sdk/nv;->g:Lcom/flurry/sdk/jh;

    if-nez v0, :cond_1

    .line 148
    invoke-virtual {p1}, Lcom/flurry/sdk/ja;->b()Lcom/flurry/sdk/jd;

    move-result-object v0

    invoke-virtual {p1}, Lcom/flurry/sdk/ja;->a()Lcom/flurry/sdk/iz;

    move-result-object v2

    iget-object v3, p0, Lcom/flurry/sdk/nv;->e:Lcom/flurry/sdk/rx;

    iget-object v4, p0, Lcom/flurry/sdk/nv;->d:Lcom/flurry/sdk/it;

    invoke-virtual {v0, v2, v3, v4}, Lcom/flurry/sdk/jd;->a(Lcom/flurry/sdk/iz;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/it;)Lcom/flurry/sdk/jh;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/nv;->g:Lcom/flurry/sdk/jh;

    .line 151
    :cond_1
    iget-object v0, p0, Lcom/flurry/sdk/nv;->g:Lcom/flurry/sdk/jh;

    monitor-exit v1

    goto :goto_0

    .line 152
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected final a(Lcom/flurry/sdk/ja;Ljava/lang/String;)Lcom/flurry/sdk/jh;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/ja;",
            "Ljava/lang/String;",
            ")",
            "Lcom/flurry/sdk/jh",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 110
    iget-object v1, p0, Lcom/flurry/sdk/nv;->f:Ljava/util/HashMap;

    monitor-enter v1

    .line 111
    :try_start_0
    iget-object v0, p0, Lcom/flurry/sdk/nv;->f:Ljava/util/HashMap;

    invoke-virtual {v0, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/jh;

    .line 112
    if-nez v0, :cond_1

    .line 113
    iget-object v0, p0, Lcom/flurry/sdk/nv;->b:Lcom/flurry/sdk/nh;

    invoke-interface {v0, p2}, Lcom/flurry/sdk/nh;->a(Ljava/lang/String;)Lcom/flurry/sdk/rx;

    move-result-object v0

    .line 114
    if-nez v0, :cond_2

    .line 116
    iget-object v0, p0, Lcom/flurry/sdk/nv;->e:Lcom/flurry/sdk/rx;

    if-nez v0, :cond_0

    .line 117
    iget-object v0, p0, Lcom/flurry/sdk/nv;->c:Lcom/flurry/sdk/rx;

    invoke-virtual {p1, v0, p2}, Lcom/flurry/sdk/ja;->a(Lcom/flurry/sdk/rx;Ljava/lang/String;)Lcom/flurry/sdk/ji;

    move-result-object v0

    throw v0

    .line 136
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 119
    :cond_0
    :try_start_1
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/nv;->a(Lcom/flurry/sdk/ja;)Lcom/flurry/sdk/jh;

    move-result-object v0

    .line 134
    :goto_0
    iget-object v2, p0, Lcom/flurry/sdk/nv;->f:Ljava/util/HashMap;

    invoke-virtual {v2, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    :cond_1
    monitor-exit v1

    .line 137
    return-object v0

    .line 129
    :cond_2
    iget-object v2, p0, Lcom/flurry/sdk/nv;->c:Lcom/flurry/sdk/rx;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/flurry/sdk/nv;->c:Lcom/flurry/sdk/rx;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_3

    .line 130
    iget-object v2, p0, Lcom/flurry/sdk/nv;->c:Lcom/flurry/sdk/rx;

    invoke-virtual {v0}, Lcom/flurry/sdk/rx;->p()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v2, v0}, Lcom/flurry/sdk/rx;->f(Ljava/lang/Class;)Lcom/flurry/sdk/rx;

    move-result-object v0

    .line 132
    :cond_3
    invoke-virtual {p1}, Lcom/flurry/sdk/ja;->b()Lcom/flurry/sdk/jd;

    move-result-object v2

    invoke-virtual {p1}, Lcom/flurry/sdk/ja;->a()Lcom/flurry/sdk/iz;

    move-result-object v3

    iget-object v4, p0, Lcom/flurry/sdk/nv;->d:Lcom/flurry/sdk/it;

    invoke-virtual {v2, v3, v0, v4}, Lcom/flurry/sdk/jd;->a(Lcom/flurry/sdk/iz;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/it;)Lcom/flurry/sdk/jh;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    goto :goto_0
.end method

.method public b()Ljava/lang/String;
    .locals 1

    .prologue
    .line 78
    const/4 v0, 0x0

    return-object v0
.end method

.method public c()Ljava/lang/String;
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lcom/flurry/sdk/nv;->c:Lcom/flurry/sdk/rx;

    invoke-virtual {v0}, Lcom/flurry/sdk/rx;->p()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 91
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 92
    const/16 v1, 0x5b

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    const-string v1, "; base-type:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/flurry/sdk/nv;->c:Lcom/flurry/sdk/rx;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 94
    const-string v1, "; id-resolver: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/flurry/sdk/nv;->b:Lcom/flurry/sdk/nh;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 95
    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 96
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
