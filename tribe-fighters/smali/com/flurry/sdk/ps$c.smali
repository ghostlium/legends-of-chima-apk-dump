.class public final Lcom/flurry/sdk/ps$c;
.super Lcom/flurry/sdk/pq;
.source "SourceFile"


# annotations
.annotation runtime Lcom/flurry/sdk/kb;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/ps;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/pq",
        "<[B>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 224
    const-class v0, [B

    invoke-direct {p0, v0}, Lcom/flurry/sdk/pq;-><init>(Ljava/lang/Class;)V

    .line 225
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 219
    check-cast p1, [B

    invoke-virtual {p0, p1, p2, p3}, Lcom/flurry/sdk/ps$c;->a([BLcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V

    return-void
.end method

.method public bridge synthetic a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;Lcom/flurry/sdk/jz;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 219
    check-cast p1, [B

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/flurry/sdk/ps$c;->a([BLcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;Lcom/flurry/sdk/jz;)V

    return-void
.end method

.method public a([BLcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 231
    invoke-virtual {p2, p1}, Lcom/flurry/sdk/hp;->a([B)V

    .line 232
    return-void
.end method

.method public a([BLcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;Lcom/flurry/sdk/jz;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 239
    invoke-virtual {p4, p1, p2}, Lcom/flurry/sdk/jz;->a(Ljava/lang/Object;Lcom/flurry/sdk/hp;)V

    .line 240
    invoke-virtual {p2, p1}, Lcom/flurry/sdk/hp;->a([B)V

    .line 241
    invoke-virtual {p4, p1, p2}, Lcom/flurry/sdk/jz;->d(Ljava/lang/Object;Lcom/flurry/sdk/hp;)V

    .line 242
    return-void
.end method
