.class public Lcom/flurry/sdk/ku;
.super Lcom/flurry/sdk/ja;
.source "SourceFile"


# instance fields
.field protected c:Lcom/flurry/sdk/ht;

.field protected final d:Lcom/flurry/sdk/jd;

.field protected final e:Lcom/flurry/sdk/jg;

.field protected f:Lcom/flurry/sdk/qq;

.field protected g:Lcom/flurry/sdk/qy;

.field protected h:Ljava/text/DateFormat;


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/iz;Lcom/flurry/sdk/ht;Lcom/flurry/sdk/jd;Lcom/flurry/sdk/jg;)V
    .locals 0

    .prologue
    .line 68
    invoke-direct {p0, p1}, Lcom/flurry/sdk/ja;-><init>(Lcom/flurry/sdk/iz;)V

    .line 69
    iput-object p2, p0, Lcom/flurry/sdk/ku;->c:Lcom/flurry/sdk/ht;

    .line 70
    iput-object p3, p0, Lcom/flurry/sdk/ku;->d:Lcom/flurry/sdk/jd;

    .line 71
    iput-object p4, p0, Lcom/flurry/sdk/ku;->e:Lcom/flurry/sdk/jg;

    .line 72
    return-void
.end method


# virtual methods
.method public a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/hw;Ljava/lang/String;)Lcom/flurry/sdk/ji;
    .locals 2

    .prologue
    .line 261
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unexpected token ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->e()Lcom/flurry/sdk/hw;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "), expected "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flurry/sdk/ji;->a(Lcom/flurry/sdk/ht;Ljava/lang/String;)Lcom/flurry/sdk/ji;

    move-result-object v0

    return-object v0
.end method

.method public a(Lcom/flurry/sdk/rx;Ljava/lang/String;)Lcom/flurry/sdk/ji;
    .locals 3

    .prologue
    .line 273
    iget-object v0, p0, Lcom/flurry/sdk/ku;->c:Lcom/flurry/sdk/ht;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Could not resolve type id \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\' into a subtype of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flurry/sdk/ji;->a(Lcom/flurry/sdk/ht;Ljava/lang/String;)Lcom/flurry/sdk/ji;

    move-result-object v0

    return-object v0
.end method

.method public a(Ljava/lang/Class;Lcom/flurry/sdk/hw;)Lcom/flurry/sdk/ji;
    .locals 4
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

    .prologue
    .line 218
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/ku;->c(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    .line 219
    iget-object v1, p0, Lcom/flurry/sdk/ku;->c:Lcom/flurry/sdk/ht;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Can not deserialize instance of "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " out of "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " token"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/flurry/sdk/ji;->a(Lcom/flurry/sdk/ht;Ljava/lang/String;)Lcom/flurry/sdk/ji;

    move-result-object v0

    return-object v0
.end method

.method public a(Ljava/lang/Class;Ljava/lang/String;)Lcom/flurry/sdk/ji;
    .locals 3
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

    .prologue
    .line 233
    iget-object v0, p0, Lcom/flurry/sdk/ku;->c:Lcom/flurry/sdk/ht;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Can not construct instance of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", problem: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flurry/sdk/ji;->a(Lcom/flurry/sdk/ht;Ljava/lang/String;)Lcom/flurry/sdk/ji;

    move-result-object v0

    return-object v0
.end method

.method public a(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Lcom/flurry/sdk/ji;
    .locals 3
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

    .prologue
    .line 255
    iget-object v0, p0, Lcom/flurry/sdk/ku;->c:Lcom/flurry/sdk/ht;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Can not construct Map key of type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " from String \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0, p2}, Lcom/flurry/sdk/ku;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flurry/sdk/ji;->a(Lcom/flurry/sdk/ht;Ljava/lang/String;)Lcom/flurry/sdk/ji;

    move-result-object v0

    return-object v0
.end method

.method public a(Ljava/lang/Class;Ljava/lang/Throwable;)Lcom/flurry/sdk/ji;
    .locals 3
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

    .prologue
    .line 225
    iget-object v0, p0, Lcom/flurry/sdk/ku;->c:Lcom/flurry/sdk/ht;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Can not construct instance of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", problem: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p2}, Lcom/flurry/sdk/ji;->a(Lcom/flurry/sdk/ht;Ljava/lang/String;Ljava/lang/Throwable;)Lcom/flurry/sdk/ji;

    move-result-object v0

    return-object v0
.end method

.method public a(Ljava/lang/Object;Ljava/lang/String;)Lcom/flurry/sdk/ji;
    .locals 1

    .prologue
    .line 267
    iget-object v0, p0, Lcom/flurry/sdk/ku;->c:Lcom/flurry/sdk/ht;

    invoke-static {v0, p1, p2}, Lcom/flurry/sdk/mk;->a(Lcom/flurry/sdk/ht;Ljava/lang/Object;Ljava/lang/String;)Lcom/flurry/sdk/mk;

    move-result-object v0

    return-object v0
.end method

.method public a(Ljava/lang/Object;Lcom/flurry/sdk/it;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .prologue
    .line 100
    iget-object v0, p0, Lcom/flurry/sdk/ku;->e:Lcom/flurry/sdk/jg;

    if-nez v0, :cond_0

    .line 101
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No \'injectableValues\' configured, can not inject value with id ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 103
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/ku;->e:Lcom/flurry/sdk/jg;

    invoke-virtual {v0, p1, p0, p2, p3}, Lcom/flurry/sdk/jg;->a(Ljava/lang/Object;Lcom/flurry/sdk/ja;Lcom/flurry/sdk/it;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public a(Ljava/util/Date;)Ljava/util/Calendar;
    .locals 1

    .prologue
    .line 168
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 169
    invoke-virtual {v0, p1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 170
    return-object v0
.end method

.method public a(Ljava/lang/String;)Ljava/util/Date;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 156
    :try_start_0
    invoke-virtual {p0}, Lcom/flurry/sdk/ku;->i()Ljava/text/DateFormat;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    return-object v0

    .line 157
    :catch_0
    move-exception v0

    .line 158
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v0}, Ljava/text/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public final a(Lcom/flurry/sdk/qy;)V
    .locals 2

    .prologue
    .line 130
    iget-object v0, p0, Lcom/flurry/sdk/ku;->g:Lcom/flurry/sdk/qy;

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/flurry/sdk/qy;->b()I

    move-result v0

    iget-object v1, p0, Lcom/flurry/sdk/ku;->g:Lcom/flurry/sdk/qy;

    invoke-virtual {v1}, Lcom/flurry/sdk/qy;->b()I

    move-result v1

    if-lt v0, v1, :cond_1

    .line 132
    :cond_0
    iput-object p1, p0, Lcom/flurry/sdk/ku;->g:Lcom/flurry/sdk/qy;

    .line 134
    :cond_1
    return-void
.end method

.method public a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/jh;Ljava/lang/Object;Ljava/lang/String;)Z
    .locals 3
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

    .prologue
    .line 188
    iget-object v0, p0, Lcom/flurry/sdk/ku;->a:Lcom/flurry/sdk/iz;

    invoke-virtual {v0}, Lcom/flurry/sdk/iz;->f()Lcom/flurry/sdk/qx;

    move-result-object v0

    .line 189
    if-eqz v0, :cond_2

    .line 193
    iget-object v2, p0, Lcom/flurry/sdk/ku;->c:Lcom/flurry/sdk/ht;

    .line 194
    iput-object p1, p0, Lcom/flurry/sdk/ku;->c:Lcom/flurry/sdk/ht;

    move-object v1, v0

    .line 196
    :goto_0
    if-eqz v1, :cond_1

    .line 198
    :try_start_0
    invoke-virtual {v1}, Lcom/flurry/sdk/qx;->b()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/jb;

    invoke-virtual {v0, p0, p2, p3, p4}, Lcom/flurry/sdk/jb;->a(Lcom/flurry/sdk/ja;Lcom/flurry/sdk/jh;Ljava/lang/Object;Ljava/lang/String;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_0

    .line 199
    const/4 v0, 0x1

    .line 204
    iput-object v2, p0, Lcom/flurry/sdk/ku;->c:Lcom/flurry/sdk/ht;

    .line 207
    :goto_1
    return v0

    .line 201
    :cond_0
    :try_start_1
    invoke-virtual {v1}, Lcom/flurry/sdk/qx;->a()Lcom/flurry/sdk/qx;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    move-object v1, v0

    goto :goto_0

    .line 204
    :cond_1
    iput-object v2, p0, Lcom/flurry/sdk/ku;->c:Lcom/flurry/sdk/ht;

    .line 207
    :cond_2
    const/4 v0, 0x0

    goto :goto_1

    .line 204
    :catchall_0
    move-exception v0

    iput-object v2, p0, Lcom/flurry/sdk/ku;->c:Lcom/flurry/sdk/ht;

    throw v0
.end method

.method public b()Lcom/flurry/sdk/jd;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/flurry/sdk/ku;->d:Lcom/flurry/sdk/jd;

    return-object v0
.end method

.method public b(Ljava/lang/Class;)Lcom/flurry/sdk/ji;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/flurry/sdk/ji;"
        }
    .end annotation

    .prologue
    .line 212
    iget-object v0, p0, Lcom/flurry/sdk/ku;->c:Lcom/flurry/sdk/ht;

    invoke-virtual {v0}, Lcom/flurry/sdk/ht;->e()Lcom/flurry/sdk/hw;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/flurry/sdk/ku;->a(Ljava/lang/Class;Lcom/flurry/sdk/hw;)Lcom/flurry/sdk/ji;

    move-result-object v0

    return-object v0
.end method

.method public b(Ljava/lang/Class;Ljava/lang/String;)Lcom/flurry/sdk/ji;
    .locals 3
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

    .prologue
    .line 243
    iget-object v0, p0, Lcom/flurry/sdk/ku;->c:Lcom/flurry/sdk/ht;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Can not construct instance of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " from String value \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/flurry/sdk/ku;->j()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\': "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flurry/sdk/ji;->a(Lcom/flurry/sdk/ht;Ljava/lang/String;)Lcom/flurry/sdk/ji;

    move-result-object v0

    return-object v0
.end method

.method public c(Ljava/lang/Class;Ljava/lang/String;)Lcom/flurry/sdk/ji;
    .locals 3
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

    .prologue
    .line 249
    iget-object v0, p0, Lcom/flurry/sdk/ku;->c:Lcom/flurry/sdk/ht;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Can not construct instance of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " from number value ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/flurry/sdk/ku;->j()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flurry/sdk/ji;->a(Lcom/flurry/sdk/ht;Ljava/lang/String;)Lcom/flurry/sdk/ji;

    move-result-object v0

    return-object v0
.end method

.method protected c(Ljava/lang/Class;)Ljava/lang/String;
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
    .line 304
    invoke-virtual {p1}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 305
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/flurry/sdk/ku;->c(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "[]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 307
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method protected c(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .prologue
    const/16 v2, 0x1f4

    .line 321
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v2, :cond_0

    .line 322
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]...["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit16 v1, v1, -0x1f4

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 324
    :cond_0
    return-object p1
.end method

.method public d()Lcom/flurry/sdk/ht;
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, Lcom/flurry/sdk/ku;->c:Lcom/flurry/sdk/ht;

    return-object v0
.end method

.method public final g()Lcom/flurry/sdk/qy;
    .locals 2

    .prologue
    .line 115
    iget-object v0, p0, Lcom/flurry/sdk/ku;->g:Lcom/flurry/sdk/qy;

    .line 116
    if-nez v0, :cond_0

    .line 117
    new-instance v0, Lcom/flurry/sdk/qy;

    invoke-direct {v0}, Lcom/flurry/sdk/qy;-><init>()V

    .line 121
    :goto_0
    return-object v0

    .line 119
    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/flurry/sdk/ku;->g:Lcom/flurry/sdk/qy;

    goto :goto_0
.end method

.method public final h()Lcom/flurry/sdk/qq;
    .locals 1

    .prologue
    .line 139
    iget-object v0, p0, Lcom/flurry/sdk/ku;->f:Lcom/flurry/sdk/qq;

    if-nez v0, :cond_0

    .line 140
    new-instance v0, Lcom/flurry/sdk/qq;

    invoke-direct {v0}, Lcom/flurry/sdk/qq;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/ku;->f:Lcom/flurry/sdk/qq;

    .line 142
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/ku;->f:Lcom/flurry/sdk/qq;

    return-object v0
.end method

.method protected i()Ljava/text/DateFormat;
    .locals 1

    .prologue
    .line 284
    iget-object v0, p0, Lcom/flurry/sdk/ku;->h:Ljava/text/DateFormat;

    if-nez v0, :cond_0

    .line 286
    iget-object v0, p0, Lcom/flurry/sdk/ku;->a:Lcom/flurry/sdk/iz;

    invoke-virtual {v0}, Lcom/flurry/sdk/iz;->n()Ljava/text/DateFormat;

    move-result-object v0

    invoke-virtual {v0}, Ljava/text/DateFormat;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/text/DateFormat;

    iput-object v0, p0, Lcom/flurry/sdk/ku;->h:Ljava/text/DateFormat;

    .line 288
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/ku;->h:Ljava/text/DateFormat;

    return-object v0
.end method

.method protected j()Ljava/lang/String;
    .locals 1

    .prologue
    .line 313
    :try_start_0
    iget-object v0, p0, Lcom/flurry/sdk/ku;->c:Lcom/flurry/sdk/ht;

    invoke-virtual {v0}, Lcom/flurry/sdk/ht;->k()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/ku;->c(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 315
    :goto_0
    return-object v0

    .line 314
    :catch_0
    move-exception v0

    .line 315
    const-string v0, "[N/A]"

    goto :goto_0
.end method
