.class final Lcom/flurry/sdk/le$c;
.super Lcom/flurry/sdk/le;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/le;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "c"
.end annotation


# instance fields
.field final c:Lcom/flurry/sdk/kt;


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/le;Ljava/lang/Object;Lcom/flurry/sdk/kt;)V
    .locals 0

    .prologue
    .line 52
    invoke-direct {p0, p1, p2}, Lcom/flurry/sdk/le;-><init>(Lcom/flurry/sdk/le;Ljava/lang/Object;)V

    .line 53
    iput-object p3, p0, Lcom/flurry/sdk/le$c;->c:Lcom/flurry/sdk/kt;

    .line 54
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 60
    iget-object v0, p0, Lcom/flurry/sdk/le$c;->c:Lcom/flurry/sdk/kt;

    iget-object v1, p0, Lcom/flurry/sdk/le$c;->b:Ljava/lang/Object;

    invoke-virtual {v0, p1, v1}, Lcom/flurry/sdk/kt;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 61
    return-void
.end method
