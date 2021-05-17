.class public Lcom/flurry/sdk/nz;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected final a:Ljava/lang/reflect/Method;

.field protected final b:Lcom/flurry/sdk/pi;


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/mr;Lcom/flurry/sdk/pi;)V
    .locals 1

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    invoke-virtual {p1}, Lcom/flurry/sdk/mr;->e()Ljava/lang/reflect/Method;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/nz;->a:Ljava/lang/reflect/Method;

    .line 27
    iput-object p2, p0, Lcom/flurry/sdk/nz;->b:Lcom/flurry/sdk/pi;

    .line 28
    return-void
.end method


# virtual methods
.method public a(Lcom/flurry/sdk/jw;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flurry/sdk/ji;
        }
    .end annotation

    .prologue
    .line 46
    iget-object v0, p0, Lcom/flurry/sdk/nz;->b:Lcom/flurry/sdk/pi;

    invoke-virtual {v0, p1}, Lcom/flurry/sdk/pi;->a(Lcom/flurry/sdk/jw;)V

    .line 47
    return-void
.end method

.method public a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 33
    iget-object v0, p0, Lcom/flurry/sdk/nz;->a:Ljava/lang/reflect/Method;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 34
    if-nez v0, :cond_0

    .line 42
    :goto_0
    return-void

    .line 37
    :cond_0
    instance-of v1, v0, Ljava/util/Map;

    if-nez v1, :cond_1

    .line 38
    new-instance v1, Lcom/flurry/sdk/ji;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Value returned by \'any-getter\' ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/flurry/sdk/nz;->a:Ljava/lang/reflect/Method;

    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "()) not java.util.Map but "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/flurry/sdk/ji;-><init>(Ljava/lang/String;)V

    throw v1

    .line 41
    :cond_1
    iget-object v1, p0, Lcom/flurry/sdk/nz;->b:Lcom/flurry/sdk/pi;

    check-cast v0, Ljava/util/Map;

    invoke-virtual {v1, v0, p2, p3}, Lcom/flurry/sdk/pi;->b(Ljava/util/Map;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V

    goto :goto_0
.end method
