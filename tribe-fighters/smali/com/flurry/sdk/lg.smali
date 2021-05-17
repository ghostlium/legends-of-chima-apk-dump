.class public Lcom/flurry/sdk/lg;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected final a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/flurry/sdk/kt;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/lg;->a:Ljava/util/ArrayList;

    .line 23
    return-void
.end method


# virtual methods
.method public a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;Ljava/lang/Object;Lcom/flurry/sdk/sg;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 33
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/flurry/sdk/lg;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    move v1, v0

    :goto_0
    if-ge v1, v2, :cond_0

    .line 34
    iget-object v0, p0, Lcom/flurry/sdk/lg;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/kt;

    .line 35
    invoke-virtual {p4}, Lcom/flurry/sdk/sg;->h()Lcom/flurry/sdk/ht;

    move-result-object v3

    .line 36
    invoke-virtual {v3}, Lcom/flurry/sdk/ht;->b()Lcom/flurry/sdk/hw;

    .line 37
    invoke-virtual {v0, v3, p2, p3}, Lcom/flurry/sdk/kt;->a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;Ljava/lang/Object;)V

    .line 33
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    .line 39
    :cond_0
    return-object p3
.end method

.method public a(Lcom/flurry/sdk/kt;)V
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/flurry/sdk/lg;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 27
    return-void
.end method
