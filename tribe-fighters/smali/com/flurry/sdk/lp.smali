.class public Lcom/flurry/sdk/lp;
.super Lcom/flurry/sdk/mc;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/mc",
        "<",
        "Ljava/util/Date;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 22
    const-class v0, Ljava/util/Date;

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
    .line 19
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/lp;->b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/util/Date;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 28
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/lp;->B(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method
