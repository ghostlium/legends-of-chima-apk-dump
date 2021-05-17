.class final Lcom/flurry/sdk/ly$j;
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
    name = "j"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/ly$a",
        "<[",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 111
    const-class v0, [Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/flurry/sdk/ly$a;-><init>(Ljava/lang/Class;)V

    return-void
.end method

.method private final c(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)[Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 144
    sget-object v1, Lcom/flurry/sdk/iz$a;->o:Lcom/flurry/sdk/iz$a;

    invoke-virtual {p2, v1}, Lcom/flurry/sdk/ja;->a(Lcom/flurry/sdk/iz$a;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 146
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->e()Lcom/flurry/sdk/hw;

    move-result-object v1

    sget-object v2, Lcom/flurry/sdk/hw;->h:Lcom/flurry/sdk/hw;

    if-ne v1, v2, :cond_0

    sget-object v1, Lcom/flurry/sdk/iz$a;->q:Lcom/flurry/sdk/iz$a;

    invoke-virtual {p2, v1}, Lcom/flurry/sdk/ja;->a(Lcom/flurry/sdk/iz$a;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 148
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->k()Ljava/lang/String;

    move-result-object v1

    .line 149
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    .line 155
    :goto_0
    return-object v0

    .line 153
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/ly$j;->q:Ljava/lang/Class;

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/ja;->b(Ljava/lang/Class;)Lcom/flurry/sdk/ji;

    move-result-object v0

    throw v0

    .line 155
    :cond_1
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->e()Lcom/flurry/sdk/hw;

    move-result-object v3

    sget-object v4, Lcom/flurry/sdk/hw;->m:Lcom/flurry/sdk/hw;

    if-ne v3, v4, :cond_2

    :goto_1
    aput-object v0, v1, v2

    move-object v0, v1

    goto :goto_0

    :cond_2
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->k()Ljava/lang/String;

    move-result-object v0

    goto :goto_1
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
    .line 107
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/ly$j;->b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)[Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 118
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->j()Z

    move-result v0

    if-nez v0, :cond_0

    .line 119
    invoke-direct {p0, p1, p2}, Lcom/flurry/sdk/ly$j;->c(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)[Ljava/lang/String;

    move-result-object v0

    .line 137
    :goto_0
    return-object v0

    .line 121
    :cond_0
    invoke-virtual {p2}, Lcom/flurry/sdk/ja;->g()Lcom/flurry/sdk/qy;

    move-result-object v5

    .line 122
    invoke-virtual {v5}, Lcom/flurry/sdk/qy;->a()[Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    move v0, v1

    .line 126
    :goto_1
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->b()Lcom/flurry/sdk/hw;

    move-result-object v3

    sget-object v4, Lcom/flurry/sdk/hw;->e:Lcom/flurry/sdk/hw;

    if-eq v3, v4, :cond_2

    .line 128
    sget-object v4, Lcom/flurry/sdk/hw;->m:Lcom/flurry/sdk/hw;

    if-ne v3, v4, :cond_1

    const/4 v3, 0x0

    .line 129
    :goto_2
    array-length v4, v2

    if-lt v0, v4, :cond_3

    .line 130
    invoke-virtual {v5, v2}, Lcom/flurry/sdk/qy;->a([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    move v4, v1

    .line 133
    :goto_3
    add-int/lit8 v0, v4, 0x1

    aput-object v3, v2, v4

    goto :goto_1

    .line 128
    :cond_1
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->k()Ljava/lang/String;

    move-result-object v3

    goto :goto_2

    .line 135
    :cond_2
    const-class v1, Ljava/lang/String;

    invoke-virtual {v5, v2, v0, v1}, Lcom/flurry/sdk/qy;->a([Ljava/lang/Object;ILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    .line 136
    invoke-virtual {p2, v5}, Lcom/flurry/sdk/ja;->a(Lcom/flurry/sdk/qy;)V

    goto :goto_0

    :cond_3
    move v4, v0

    goto :goto_3
.end method
