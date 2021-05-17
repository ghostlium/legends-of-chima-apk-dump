.class public Lcom/flurry/sdk/lb;
.super Lcom/flurry/sdk/kt;
.source "SourceFile"


# instance fields
.field protected final i:Lcom/flurry/sdk/mt;

.field protected final j:Ljava/lang/Object;


# direct methods
.method protected constructor <init>(Lcom/flurry/sdk/lb;Lcom/flurry/sdk/jh;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/lb;",
            "Lcom/flurry/sdk/jh",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 72
    invoke-direct {p0, p1, p2}, Lcom/flurry/sdk/kt;-><init>(Lcom/flurry/sdk/kt;Lcom/flurry/sdk/jh;)V

    .line 73
    iget-object v0, p1, Lcom/flurry/sdk/lb;->i:Lcom/flurry/sdk/mt;

    iput-object v0, p0, Lcom/flurry/sdk/lb;->i:Lcom/flurry/sdk/mt;

    .line 74
    iget-object v0, p1, Lcom/flurry/sdk/lb;->j:Ljava/lang/Object;

    iput-object v0, p0, Lcom/flurry/sdk/lb;->j:Ljava/lang/Object;

    .line 75
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/jy;Lcom/flurry/sdk/qp;Lcom/flurry/sdk/mt;ILjava/lang/Object;)V
    .locals 0

    .prologue
    .line 65
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/flurry/sdk/kt;-><init>(Ljava/lang/String;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/jy;Lcom/flurry/sdk/qp;)V

    .line 66
    iput-object p5, p0, Lcom/flurry/sdk/lb;->i:Lcom/flurry/sdk/mt;

    .line 67
    iput p6, p0, Lcom/flurry/sdk/lb;->h:I

    .line 68
    iput-object p7, p0, Lcom/flurry/sdk/lb;->j:Ljava/lang/Object;

    .line 69
    return-void
.end method


# virtual methods
.method public synthetic a(Lcom/flurry/sdk/jh;)Lcom/flurry/sdk/kt;
    .locals 1

    .prologue
    .line 32
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/lb;->b(Lcom/flurry/sdk/jh;)Lcom/flurry/sdk/lb;

    move-result-object v0

    return-object v0
.end method

.method public a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 135
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/lb;->a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, p3, v0}, Lcom/flurry/sdk/lb;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 136
    return-void
.end method

.method public a(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 146
    return-void
.end method

.method public b(Lcom/flurry/sdk/jh;)Lcom/flurry/sdk/lb;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/jh",
            "<",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/flurry/sdk/lb;"
        }
    .end annotation

    .prologue
    .line 79
    new-instance v0, Lcom/flurry/sdk/lb;

    invoke-direct {v0, p0, p1}, Lcom/flurry/sdk/lb;-><init>(Lcom/flurry/sdk/lb;Lcom/flurry/sdk/jh;)V

    return-object v0
.end method

.method public b()Lcom/flurry/sdk/mq;
    .locals 1

    .prologue
    .line 122
    iget-object v0, p0, Lcom/flurry/sdk/lb;->i:Lcom/flurry/sdk/mt;

    return-object v0
.end method

.method public k()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 150
    iget-object v0, p0, Lcom/flurry/sdk/lb;->j:Ljava/lang/Object;

    return-object v0
.end method
