.class public Lcom/flurry/sdk/lr;
.super Lcom/flurry/sdk/lz;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/lz",
        "<",
        "Ljava/util/EnumMap",
        "<**>;>;"
    }
.end annotation


# instance fields
.field protected final a:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field protected final b:Lcom/flurry/sdk/jh;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/flurry/sdk/jh",
            "<",
            "Ljava/lang/Enum",
            "<*>;>;"
        }
    .end annotation
.end field

.field protected final c:Lcom/flurry/sdk/jh;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/flurry/sdk/jh",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Class;Lcom/flurry/sdk/jh;Lcom/flurry/sdk/jh;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/flurry/sdk/jh",
            "<*>;",
            "Lcom/flurry/sdk/jh",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 44
    const-class v0, Ljava/util/EnumMap;

    invoke-direct {p0, v0}, Lcom/flurry/sdk/lz;-><init>(Ljava/lang/Class;)V

    .line 45
    iput-object p1, p0, Lcom/flurry/sdk/lr;->a:Ljava/lang/Class;

    .line 46
    iput-object p2, p0, Lcom/flurry/sdk/lr;->b:Lcom/flurry/sdk/jh;

    .line 47
    iput-object p3, p0, Lcom/flurry/sdk/lr;->c:Lcom/flurry/sdk/jh;

    .line 48
    return-void
.end method

.method private d()Ljava/util/EnumMap;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/EnumMap",
            "<**>;"
        }
    .end annotation

    .prologue
    .line 88
    new-instance v0, Ljava/util/EnumMap;

    iget-object v1, p0, Lcom/flurry/sdk/lr;->a:Ljava/lang/Class;

    invoke-direct {v0, v1}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    return-object v0
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
    .line 25
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/lr;->b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/util/EnumMap;

    move-result-object v0

    return-object v0
.end method

.method public a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;Lcom/flurry/sdk/jy;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 83
    invoke-virtual {p3, p1, p2}, Lcom/flurry/sdk/jy;->a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/util/EnumMap;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/ht;",
            "Lcom/flurry/sdk/ja;",
            ")",
            "Ljava/util/EnumMap",
            "<**>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 55
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->e()Lcom/flurry/sdk/hw;

    move-result-object v0

    sget-object v1, Lcom/flurry/sdk/hw;->b:Lcom/flurry/sdk/hw;

    if-eq v0, v1, :cond_0

    .line 56
    const-class v0, Ljava/util/EnumMap;

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/ja;->b(Ljava/lang/Class;)Lcom/flurry/sdk/ji;

    move-result-object v0

    throw v0

    .line 58
    :cond_0
    invoke-direct {p0}, Lcom/flurry/sdk/lr;->d()Ljava/util/EnumMap;

    move-result-object v2

    .line 60
    :goto_0
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->b()Lcom/flurry/sdk/hw;

    move-result-object v0

    sget-object v1, Lcom/flurry/sdk/hw;->c:Lcom/flurry/sdk/hw;

    if-eq v0, v1, :cond_3

    .line 61
    iget-object v0, p0, Lcom/flurry/sdk/lr;->b:Lcom/flurry/sdk/jh;

    invoke-virtual {v0, p1, p2}, Lcom/flurry/sdk/jh;->a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Enum;

    .line 62
    if-nez v0, :cond_1

    .line 63
    iget-object v0, p0, Lcom/flurry/sdk/lr;->a:Ljava/lang/Class;

    const-string v1, "value not one of declared Enum instance names"

    invoke-virtual {p2, v0, v1}, Lcom/flurry/sdk/ja;->b(Ljava/lang/Class;Ljava/lang/String;)Lcom/flurry/sdk/ji;

    move-result-object v0

    throw v0

    .line 66
    :cond_1
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->b()Lcom/flurry/sdk/hw;

    move-result-object v1

    .line 70
    sget-object v3, Lcom/flurry/sdk/hw;->m:Lcom/flurry/sdk/hw;

    if-ne v1, v3, :cond_2

    const/4 v1, 0x0

    .line 72
    :goto_1
    invoke-virtual {v2, v0, v1}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 70
    :cond_2
    iget-object v1, p0, Lcom/flurry/sdk/lr;->c:Lcom/flurry/sdk/jh;

    invoke-virtual {v1, p1, p2}, Lcom/flurry/sdk/jh;->a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 74
    :cond_3
    return-object v2
.end method
