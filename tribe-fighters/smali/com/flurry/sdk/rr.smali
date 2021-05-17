.class public final Lcom/flurry/sdk/rr;
.super Lcom/flurry/sdk/rt;
.source "SourceFile"


# instance fields
.field protected final c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Lcom/flurry/sdk/rt;-><init>()V

    iput-object p1, p0, Lcom/flurry/sdk/rr;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public a(D)D
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/flurry/sdk/rr;->c:Ljava/lang/Object;

    instance-of v0, v0, Ljava/lang/Number;

    if-eqz v0, :cond_0

    .line 83
    iget-object v0, p0, Lcom/flurry/sdk/rr;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide p1

    .line 85
    :cond_0
    return-wide p1
.end method

.method public final a(Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 98
    iget-object v0, p0, Lcom/flurry/sdk/rr;->c:Ljava/lang/Object;

    if-nez v0, :cond_0

    .line 99
    invoke-virtual {p1}, Lcom/flurry/sdk/hp;->f()V

    .line 103
    :goto_0
    return-void

    .line 101
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/rr;->c:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/hp;->a(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 125
    if-ne p1, p0, :cond_1

    .line 134
    :cond_0
    :goto_0
    return v0

    .line 126
    :cond_1
    if-nez p1, :cond_2

    move v0, v1

    goto :goto_0

    .line 127
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_3

    move v0, v1

    .line 128
    goto :goto_0

    .line 130
    :cond_3
    check-cast p1, Lcom/flurry/sdk/rr;

    .line 131
    iget-object v2, p0, Lcom/flurry/sdk/rr;->c:Ljava/lang/Object;

    if-nez v2, :cond_4

    .line 132
    iget-object v2, p1, Lcom/flurry/sdk/rr;->c:Ljava/lang/Object;

    if-eqz v2, :cond_0

    move v0, v1

    goto :goto_0

    .line 134
    :cond_4
    iget-object v0, p0, Lcom/flurry/sdk/rr;->c:Ljava/lang/Object;

    iget-object v1, p1, Lcom/flurry/sdk/rr;->c:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 138
    iget-object v0, p0, Lcom/flurry/sdk/rr;->c:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public m()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/flurry/sdk/rr;->c:Ljava/lang/Object;

    if-nez v0, :cond_0

    const-string v0, "null"

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/rr;->c:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 143
    iget-object v0, p0, Lcom/flurry/sdk/rr;->c:Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
