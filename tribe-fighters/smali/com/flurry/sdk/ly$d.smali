.class final Lcom/flurry/sdk/ly$d;
.super Lcom/flurry/sdk/ly$a;
.source "SourceFile"


# annotations
.annotation runtime Lcom/flurry/sdk/kb;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/ly;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/ly$a",
        "<[C>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 163
    const-class v0, [C

    invoke-direct {p0, v0}, Lcom/flurry/sdk/ly$a;-><init>(Ljava/lang/Class;)V

    return-void
.end method


# virtual methods
.method public synthetic a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 159
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/ly$d;->b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)[C

    move-result-object v0

    return-object v0
.end method

.method public b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)[C
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 173
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->e()Lcom/flurry/sdk/hw;

    move-result-object v0

    .line 174
    sget-object v1, Lcom/flurry/sdk/hw;->h:Lcom/flurry/sdk/hw;

    if-ne v0, v1, :cond_0

    .line 176
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->l()[C

    move-result-object v1

    .line 177
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->n()I

    move-result v2

    .line 178
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->m()I

    move-result v3

    .line 180
    new-array v0, v3, [C

    .line 181
    invoke-static {v1, v2, v0, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 211
    :goto_0
    return-object v0

    .line 184
    :cond_0
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->j()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 186
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x40

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 187
    :goto_1
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->b()Lcom/flurry/sdk/hw;

    move-result-object v1

    sget-object v2, Lcom/flurry/sdk/hw;->e:Lcom/flurry/sdk/hw;

    if-eq v1, v2, :cond_3

    .line 188
    sget-object v2, Lcom/flurry/sdk/hw;->h:Lcom/flurry/sdk/hw;

    if-eq v1, v2, :cond_1

    .line 189
    sget-object v0, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/ja;->b(Ljava/lang/Class;)Lcom/flurry/sdk/ji;

    move-result-object v0

    throw v0

    .line 191
    :cond_1
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->k()Ljava/lang/String;

    move-result-object v1

    .line 192
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x1

    if-eq v2, v3, :cond_2

    .line 193
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Can not convert a JSON String of length "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " into a char element of char array"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flurry/sdk/ji;->a(Lcom/flurry/sdk/ht;Ljava/lang/String;)Lcom/flurry/sdk/ji;

    move-result-object v0

    throw v0

    .line 195
    :cond_2
    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 197
    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    goto :goto_0

    .line 200
    :cond_4
    sget-object v1, Lcom/flurry/sdk/hw;->g:Lcom/flurry/sdk/hw;

    if-ne v0, v1, :cond_8

    .line 201
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->z()Ljava/lang/Object;

    move-result-object v0

    .line 202
    if-nez v0, :cond_5

    const/4 v0, 0x0

    goto :goto_0

    .line 203
    :cond_5
    instance-of v1, v0, [C

    if-eqz v1, :cond_6

    .line 204
    check-cast v0, [C

    check-cast v0, [C

    goto :goto_0

    .line 206
    :cond_6
    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_7

    .line 207
    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    goto :goto_0

    .line 210
    :cond_7
    instance-of v1, v0, [B

    if-eqz v1, :cond_8

    .line 211
    invoke-static {}, Lcom/flurry/sdk/hm;->a()Lcom/flurry/sdk/hl;

    move-result-object v1

    check-cast v0, [B

    check-cast v0, [B

    invoke-virtual {v1, v0, v4}, Lcom/flurry/sdk/hl;->a([BZ)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    goto/16 :goto_0

    .line 215
    :cond_8
    iget-object v0, p0, Lcom/flurry/sdk/ly$d;->q:Ljava/lang/Class;

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/ja;->b(Ljava/lang/Class;)Lcom/flurry/sdk/ji;

    move-result-object v0

    throw v0
.end method
