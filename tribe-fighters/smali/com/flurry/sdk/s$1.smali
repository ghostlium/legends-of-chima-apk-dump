.class Lcom/flurry/sdk/s$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/sdk/ch;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flurry/sdk/s;->a([BLjava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/flurry/sdk/s;


# direct methods
.method constructor <init>(Lcom/flurry/sdk/s;)V
    .locals 0

    .prologue
    .line 118
    iput-object p1, p0, Lcom/flurry/sdk/s$1;->a:Lcom/flurry/sdk/s;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 123
    const/4 v0, 0x5

    invoke-static {}, Lcom/flurry/sdk/s;->a()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "--onReport "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " sent. HTTP response: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 126
    invoke-static {}, Lcom/flurry/sdk/ex;->c()I

    move-result v0

    const/4 v1, 0x3

    if-gt v0, v1, :cond_0

    invoke-static {}, Lcom/flurry/sdk/ex;->d()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 127
    invoke-static {}, Lcom/flurry/sdk/eg;->a()Lcom/flurry/sdk/eg;

    move-result-object v0

    new-instance v1, Lcom/flurry/sdk/s$1$1;

    invoke-direct {v1, p0}, Lcom/flurry/sdk/s$1$1;-><init>(Lcom/flurry/sdk/s$1;)V

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/eg;->a(Ljava/lang/Runnable;)V

    .line 136
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/s$1;->a:Lcom/flurry/sdk/s;

    invoke-static {v0, p3, p4, p1}, Lcom/flurry/sdk/s;->a(Lcom/flurry/sdk/s;Ljava/lang/String;Ljava/lang/String;I)V

    .line 137
    iget-object v0, p0, Lcom/flurry/sdk/s$1;->a:Lcom/flurry/sdk/s;

    invoke-static {v0}, Lcom/flurry/sdk/s;->a(Lcom/flurry/sdk/s;)V

    .line 138
    return-void
.end method

.method public a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 142
    const/4 v0, 0x5

    invoke-static {}, Lcom/flurry/sdk/s;->b()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "--onServerError "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 144
    iget-object v0, p0, Lcom/flurry/sdk/s$1;->a:Lcom/flurry/sdk/s;

    invoke-static {v0, p1, p2}, Lcom/flurry/sdk/s;->a(Lcom/flurry/sdk/s;Ljava/lang/String;Ljava/lang/String;)V

    .line 145
    return-void
.end method
