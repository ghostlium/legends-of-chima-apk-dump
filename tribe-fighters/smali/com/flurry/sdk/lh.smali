.class public Lcom/flurry/sdk/lh;
.super Lcom/flurry/sdk/it$a;
.source "SourceFile"


# instance fields
.field protected final e:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/qp;Lcom/flurry/sdk/mq;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/flurry/sdk/it$a;-><init>(Ljava/lang/String;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/qp;Lcom/flurry/sdk/mq;)V

    .line 32
    iput-object p5, p0, Lcom/flurry/sdk/lh;->e:Ljava/lang/Object;

    .line 33
    return-void
.end method


# virtual methods
.method public a(Lcom/flurry/sdk/ja;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/flurry/sdk/lh;->e:Ljava/lang/Object;

    invoke-virtual {p1, v0, p0, p2}, Lcom/flurry/sdk/ja;->a(Ljava/lang/Object;Lcom/flurry/sdk/it;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public b(Lcom/flurry/sdk/ja;Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 43
    iget-object v0, p0, Lcom/flurry/sdk/lh;->c:Lcom/flurry/sdk/mq;

    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/lh;->a(Lcom/flurry/sdk/ja;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Lcom/flurry/sdk/mq;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 44
    return-void
.end method
