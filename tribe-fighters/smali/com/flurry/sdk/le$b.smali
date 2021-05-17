.class final Lcom/flurry/sdk/le$b;
.super Lcom/flurry/sdk/le;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/le;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "b"
.end annotation


# instance fields
.field final c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/le;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 104
    invoke-direct {p0, p1, p2}, Lcom/flurry/sdk/le;-><init>(Lcom/flurry/sdk/le;Ljava/lang/Object;)V

    .line 105
    iput-object p3, p0, Lcom/flurry/sdk/le$b;->c:Ljava/lang/Object;

    .line 106
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
    .line 113
    check-cast p1, Ljava/util/Map;

    iget-object v0, p0, Lcom/flurry/sdk/le$b;->c:Ljava/lang/Object;

    iget-object v1, p0, Lcom/flurry/sdk/le$b;->b:Ljava/lang/Object;

    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    return-void
.end method
