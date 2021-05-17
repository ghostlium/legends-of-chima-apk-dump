.class public abstract Lcom/flurry/sdk/pq;
.super Lcom/flurry/sdk/jl;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/flurry/sdk/jl",
        "<TT;>;"
    }
.end annotation


# instance fields
.field protected final k:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Lcom/flurry/sdk/rx;)V
    .locals 1

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/flurry/sdk/jl;-><init>()V

    .line 38
    invoke-virtual {p1}, Lcom/flurry/sdk/rx;->p()Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/pq;->k:Ljava/lang/Class;

    .line 39
    return-void
.end method

.method protected constructor <init>(Ljava/lang/Class;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/flurry/sdk/jl;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/flurry/sdk/pq;->k:Ljava/lang/Class;

    .line 31
    return-void
.end method

.method protected constructor <init>(Ljava/lang/Class;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;Z)V"
        }
    .end annotation

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/flurry/sdk/jl;-><init>()V

    .line 47
    iput-object p1, p0, Lcom/flurry/sdk/pq;->k:Ljava/lang/Class;

    .line 48
    return-void
.end method


# virtual methods
.method public a(Lcom/flurry/sdk/jw;Ljava/lang/Throwable;Ljava/lang/Object;I)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 147
    move-object v0, p2

    :goto_0
    instance-of v1, v0, Ljava/lang/reflect/InvocationTargetException;

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 148
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    goto :goto_0

    .line 151
    :cond_0
    instance-of v1, v0, Ljava/lang/Error;

    if-eqz v1, :cond_1

    .line 152
    check-cast v0, Ljava/lang/Error;

    throw v0

    .line 155
    :cond_1
    if-eqz p1, :cond_2

    sget-object v1, Lcom/flurry/sdk/ju$a;->n:Lcom/flurry/sdk/ju$a;

    invoke-virtual {p1, v1}, Lcom/flurry/sdk/jw;->a(Lcom/flurry/sdk/ju$a;)Z

    move-result v1

    if-eqz v1, :cond_4

    :cond_2
    const/4 v1, 0x1

    .line 156
    :goto_1
    instance-of v2, v0, Ljava/io/IOException;

    if-eqz v2, :cond_5

    .line 157
    if-eqz v1, :cond_3

    instance-of v1, v0, Lcom/flurry/sdk/ji;

    if-nez v1, :cond_6

    .line 158
    :cond_3
    check-cast v0, Ljava/io/IOException;

    throw v0

    .line 155
    :cond_4
    const/4 v1, 0x0

    goto :goto_1

    .line 160
    :cond_5
    if-nez v1, :cond_6

    .line 161
    instance-of v1, v0, Ljava/lang/RuntimeException;

    if-eqz v1, :cond_6

    .line 162
    check-cast v0, Ljava/lang/RuntimeException;

    throw v0

    .line 166
    :cond_6
    invoke-static {v0, p3, p4}, Lcom/flurry/sdk/ji;->a(Ljava/lang/Throwable;Ljava/lang/Object;I)Lcom/flurry/sdk/ji;

    move-result-object v0

    throw v0
.end method

.method public a(Lcom/flurry/sdk/jw;Ljava/lang/Throwable;Ljava/lang/Object;Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 121
    move-object v0, p2

    :goto_0
    instance-of v1, v0, Ljava/lang/reflect/InvocationTargetException;

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 122
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    goto :goto_0

    .line 125
    :cond_0
    instance-of v1, v0, Ljava/lang/Error;

    if-eqz v1, :cond_1

    .line 126
    check-cast v0, Ljava/lang/Error;

    throw v0

    .line 129
    :cond_1
    if-eqz p1, :cond_2

    sget-object v1, Lcom/flurry/sdk/ju$a;->n:Lcom/flurry/sdk/ju$a;

    invoke-virtual {p1, v1}, Lcom/flurry/sdk/jw;->a(Lcom/flurry/sdk/ju$a;)Z

    move-result v1

    if-eqz v1, :cond_4

    :cond_2
    const/4 v1, 0x1

    .line 130
    :goto_1
    instance-of v2, v0, Ljava/io/IOException;

    if-eqz v2, :cond_5

    .line 131
    if-eqz v1, :cond_3

    instance-of v1, v0, Lcom/flurry/sdk/ji;

    if-nez v1, :cond_6

    .line 132
    :cond_3
    check-cast v0, Ljava/io/IOException;

    throw v0

    .line 129
    :cond_4
    const/4 v1, 0x0

    goto :goto_1

    .line 134
    :cond_5
    if-nez v1, :cond_6

    .line 135
    instance-of v1, v0, Ljava/lang/RuntimeException;

    if-eqz v1, :cond_6

    .line 136
    check-cast v0, Ljava/lang/RuntimeException;

    throw v0

    .line 140
    :cond_6
    invoke-static {v0, p3, p4}, Lcom/flurry/sdk/ji;->a(Ljava/lang/Throwable;Ljava/lang/Object;Ljava/lang/String;)Lcom/flurry/sdk/ji;

    move-result-object v0

    throw v0
.end method

.method public abstract a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
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
.end method

.method protected a(Lcom/flurry/sdk/jl;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/jl",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 98
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lcom/flurry/sdk/kb;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final c()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 51
    iget-object v0, p0, Lcom/flurry/sdk/pq;->k:Ljava/lang/Class;

    return-object v0
.end method
