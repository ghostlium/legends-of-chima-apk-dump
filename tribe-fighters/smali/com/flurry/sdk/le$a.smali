.class final Lcom/flurry/sdk/le$a;
.super Lcom/flurry/sdk/le;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/le;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "a"
.end annotation


# instance fields
.field final c:Lcom/flurry/sdk/ks;

.field final d:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/le;Ljava/lang/Object;Lcom/flurry/sdk/ks;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 80
    invoke-direct {p0, p1, p2}, Lcom/flurry/sdk/le;-><init>(Lcom/flurry/sdk/le;Ljava/lang/Object;)V

    .line 81
    iput-object p3, p0, Lcom/flurry/sdk/le$a;->c:Lcom/flurry/sdk/ks;

    .line 82
    iput-object p4, p0, Lcom/flurry/sdk/le$a;->d:Ljava/lang/String;

    .line 83
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 89
    iget-object v0, p0, Lcom/flurry/sdk/le$a;->c:Lcom/flurry/sdk/ks;

    iget-object v1, p0, Lcom/flurry/sdk/le$a;->d:Ljava/lang/String;

    iget-object v2, p0, Lcom/flurry/sdk/le$a;->b:Ljava/lang/Object;

    invoke-virtual {v0, p1, v1, v2}, Lcom/flurry/sdk/ks;->a(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 90
    return-void
.end method
