.class public Lcom/flurry/sdk/mi;
.super Lcom/flurry/sdk/mc;
.source "SourceFile"


# annotations
.annotation runtime Lcom/flurry/sdk/kb;
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/mc",
        "<",
        "Lcom/flurry/sdk/sg;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 25
    const-class v0, Lcom/flurry/sdk/sg;

    invoke-direct {p0, v0}, Lcom/flurry/sdk/mc;-><init>(Ljava/lang/Class;)V

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
    .line 21
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/mi;->b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Lcom/flurry/sdk/sg;

    move-result-object v0

    return-object v0
.end method

.method public b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Lcom/flurry/sdk/sg;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 31
    new-instance v0, Lcom/flurry/sdk/sg;

    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->a()Lcom/flurry/sdk/hx;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flurry/sdk/sg;-><init>(Lcom/flurry/sdk/hx;)V

    .line 33
    invoke-virtual {v0, p1}, Lcom/flurry/sdk/sg;->c(Lcom/flurry/sdk/ht;)V

    .line 34
    return-object v0
.end method
