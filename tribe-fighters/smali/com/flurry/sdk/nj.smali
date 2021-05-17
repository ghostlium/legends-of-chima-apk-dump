.class public Lcom/flurry/sdk/nj;
.super Lcom/flurry/sdk/nv;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/rx;Lcom/flurry/sdk/nh;Lcom/flurry/sdk/it;Ljava/lang/Class;)V
    .locals 0
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
    .line 30
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/flurry/sdk/nv;-><init>(Lcom/flurry/sdk/rx;Lcom/flurry/sdk/nh;Lcom/flurry/sdk/it;Ljava/lang/Class;)V

    .line 31
    return-void
.end method

.method private final f(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 86
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->j()Z

    move-result v0

    .line 87
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/nj;->e(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p2, v1}, Lcom/flurry/sdk/nj;->a(Lcom/flurry/sdk/ja;Ljava/lang/String;)Lcom/flurry/sdk/jh;

    move-result-object v1

    .line 88
    invoke-virtual {v1, p1, p2}, Lcom/flurry/sdk/jh;->a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Object;

    move-result-object v1

    .line 90
    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->b()Lcom/flurry/sdk/hw;

    move-result-object v0

    sget-object v2, Lcom/flurry/sdk/hw;->e:Lcom/flurry/sdk/hw;

    if-eq v0, v2, :cond_0

    .line 91
    sget-object v0, Lcom/flurry/sdk/hw;->e:Lcom/flurry/sdk/hw;

    const-string v1, "expected closing END_ARRAY after type information and deserialized value"

    invoke-virtual {p2, p1, v0, v1}, Lcom/flurry/sdk/ja;->a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/hw;Ljava/lang/String;)Lcom/flurry/sdk/ji;

    move-result-object v0

    throw v0

    .line 94
    :cond_0
    return-object v1
.end method


# virtual methods
.method public a()Lcom/flurry/org/codehaus/jackson/annotate/JsonTypeInfo$As;
    .locals 1

    .prologue
    .line 35
    sget-object v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonTypeInfo$As;->WRAPPER_ARRAY:Lcom/flurry/org/codehaus/jackson/annotate/JsonTypeInfo$As;

    return-object v0
.end method

.method public a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 55
    invoke-direct {p0, p1, p2}, Lcom/flurry/sdk/nj;->f(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 45
    invoke-direct {p0, p1, p2}, Lcom/flurry/sdk/nj;->f(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public c(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 62
    invoke-direct {p0, p1, p2}, Lcom/flurry/sdk/nj;->f(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public d(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 69
    invoke-direct {p0, p1, p2}, Lcom/flurry/sdk/nj;->f(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected final e(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 100
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->j()Z

    move-result v0

    if-nez v0, :cond_1

    .line 104
    iget-object v0, p0, Lcom/flurry/sdk/nj;->b:Lcom/flurry/sdk/nh;

    instance-of v0, v0, Lcom/flurry/sdk/nw;

    if-eqz v0, :cond_0

    .line 105
    iget-object v0, p0, Lcom/flurry/sdk/nj;->e:Lcom/flurry/sdk/rx;

    if-eqz v0, :cond_0

    .line 106
    iget-object v0, p0, Lcom/flurry/sdk/nj;->b:Lcom/flurry/sdk/nh;

    check-cast v0, Lcom/flurry/sdk/nw;

    invoke-virtual {v0}, Lcom/flurry/sdk/nw;->a()Ljava/lang/String;

    move-result-object v0

    .line 124
    :goto_0
    return-object v0

    .line 109
    :cond_0
    sget-object v0, Lcom/flurry/sdk/hw;->d:Lcom/flurry/sdk/hw;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "need JSON Array to contain As.WRAPPER_ARRAY type information for class "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/flurry/sdk/nj;->c()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, p1, v0, v1}, Lcom/flurry/sdk/ja;->a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/hw;Ljava/lang/String;)Lcom/flurry/sdk/ji;

    move-result-object v0

    throw v0

    .line 113
    :cond_1
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->b()Lcom/flurry/sdk/hw;

    move-result-object v0

    sget-object v1, Lcom/flurry/sdk/hw;->h:Lcom/flurry/sdk/hw;

    if-eq v0, v1, :cond_3

    .line 114
    iget-object v0, p0, Lcom/flurry/sdk/nj;->b:Lcom/flurry/sdk/nh;

    instance-of v0, v0, Lcom/flurry/sdk/nw;

    if-eqz v0, :cond_2

    .line 115
    iget-object v0, p0, Lcom/flurry/sdk/nj;->e:Lcom/flurry/sdk/rx;

    if-eqz v0, :cond_2

    .line 116
    iget-object v0, p0, Lcom/flurry/sdk/nj;->b:Lcom/flurry/sdk/nh;

    check-cast v0, Lcom/flurry/sdk/nw;

    invoke-virtual {v0}, Lcom/flurry/sdk/nw;->a()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 119
    :cond_2
    sget-object v0, Lcom/flurry/sdk/hw;->h:Lcom/flurry/sdk/hw;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "need JSON String that contains type id (for subtype of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/flurry/sdk/nj;->c()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, p1, v0, v1}, Lcom/flurry/sdk/ja;->a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/hw;Ljava/lang/String;)Lcom/flurry/sdk/ji;

    move-result-object v0

    throw v0

    .line 122
    :cond_3
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->k()Ljava/lang/String;

    move-result-object v0

    .line 123
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->b()Lcom/flurry/sdk/hw;

    goto :goto_0
.end method
