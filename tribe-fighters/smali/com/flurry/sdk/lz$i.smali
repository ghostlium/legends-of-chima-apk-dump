.class public final Lcom/flurry/sdk/lz$i;
.super Lcom/flurry/sdk/lz$k;
.source "SourceFile"


# annotations
.annotation runtime Lcom/flurry/sdk/kb;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/lz;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "i"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/lz$k",
        "<",
        "Ljava/lang/Long;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/Class;Ljava/lang/Long;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<",
            "Ljava/lang/Long;",
            ">;",
            "Ljava/lang/Long;",
            ")V"
        }
    .end annotation

    .prologue
    .line 838
    invoke-direct {p0, p1, p2}, Lcom/flurry/sdk/lz$k;-><init>(Ljava/lang/Class;Ljava/lang/Object;)V

    .line 839
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
    .line 832
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/lz$i;->b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method public b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Long;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 845
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/lz$i;->v(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method
