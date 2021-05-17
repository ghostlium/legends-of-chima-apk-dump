.class public final Lcom/flurry/sdk/oq;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected final a:Lcom/flurry/sdk/oo;

.field protected final b:Lcom/flurry/sdk/or$a;


# direct methods
.method private constructor <init>(Lcom/flurry/sdk/oo;)V
    .locals 3

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    new-instance v0, Lcom/flurry/sdk/or$a;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/flurry/sdk/or$a;-><init>(Ljava/lang/Class;Z)V

    iput-object v0, p0, Lcom/flurry/sdk/oq;->b:Lcom/flurry/sdk/or$a;

    .line 32
    iput-object p1, p0, Lcom/flurry/sdk/oq;->a:Lcom/flurry/sdk/oo;

    .line 33
    return-void
.end method

.method public static a(Ljava/util/HashMap;)Lcom/flurry/sdk/oq;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Lcom/flurry/sdk/or$a;",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;>;)",
            "Lcom/flurry/sdk/oq;"
        }
    .end annotation

    .prologue
    .line 47
    new-instance v0, Lcom/flurry/sdk/oq;

    new-instance v1, Lcom/flurry/sdk/oo;

    invoke-direct {v1, p0}, Lcom/flurry/sdk/oo;-><init>(Ljava/util/Map;)V

    invoke-direct {v0, v1}, Lcom/flurry/sdk/oq;-><init>(Lcom/flurry/sdk/oo;)V

    return-object v0
.end method


# virtual methods
.method public a(Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/jl;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/rx;",
            ")",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 52
    iget-object v0, p0, Lcom/flurry/sdk/oq;->b:Lcom/flurry/sdk/or$a;

    invoke-virtual {v0, p1}, Lcom/flurry/sdk/or$a;->a(Lcom/flurry/sdk/rx;)V

    .line 53
    iget-object v0, p0, Lcom/flurry/sdk/oq;->a:Lcom/flurry/sdk/oo;

    iget-object v1, p0, Lcom/flurry/sdk/oq;->b:Lcom/flurry/sdk/or$a;

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/oo;->a(Lcom/flurry/sdk/or$a;)Lcom/flurry/sdk/jl;

    move-result-object v0

    return-object v0
.end method

.method public a(Ljava/lang/Class;)Lcom/flurry/sdk/jl;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 58
    iget-object v0, p0, Lcom/flurry/sdk/oq;->b:Lcom/flurry/sdk/or$a;

    invoke-virtual {v0, p1}, Lcom/flurry/sdk/or$a;->a(Ljava/lang/Class;)V

    .line 59
    iget-object v0, p0, Lcom/flurry/sdk/oq;->a:Lcom/flurry/sdk/oo;

    iget-object v1, p0, Lcom/flurry/sdk/oq;->b:Lcom/flurry/sdk/or$a;

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/oo;->a(Lcom/flurry/sdk/or$a;)Lcom/flurry/sdk/jl;

    move-result-object v0

    return-object v0
.end method

.method public a()Lcom/flurry/sdk/oq;
    .locals 2

    .prologue
    .line 37
    new-instance v0, Lcom/flurry/sdk/oq;

    iget-object v1, p0, Lcom/flurry/sdk/oq;->a:Lcom/flurry/sdk/oo;

    invoke-direct {v0, v1}, Lcom/flurry/sdk/oq;-><init>(Lcom/flurry/sdk/oo;)V

    return-object v0
.end method

.method public b(Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/jl;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/rx;",
            ")",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 70
    iget-object v0, p0, Lcom/flurry/sdk/oq;->b:Lcom/flurry/sdk/or$a;

    invoke-virtual {v0, p1}, Lcom/flurry/sdk/or$a;->b(Lcom/flurry/sdk/rx;)V

    .line 71
    iget-object v0, p0, Lcom/flurry/sdk/oq;->a:Lcom/flurry/sdk/oo;

    iget-object v1, p0, Lcom/flurry/sdk/oq;->b:Lcom/flurry/sdk/or$a;

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/oo;->a(Lcom/flurry/sdk/or$a;)Lcom/flurry/sdk/jl;

    move-result-object v0

    return-object v0
.end method

.method public b(Ljava/lang/Class;)Lcom/flurry/sdk/jl;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 64
    iget-object v0, p0, Lcom/flurry/sdk/oq;->b:Lcom/flurry/sdk/or$a;

    invoke-virtual {v0, p1}, Lcom/flurry/sdk/or$a;->b(Ljava/lang/Class;)V

    .line 65
    iget-object v0, p0, Lcom/flurry/sdk/oq;->a:Lcom/flurry/sdk/oo;

    iget-object v1, p0, Lcom/flurry/sdk/oq;->b:Lcom/flurry/sdk/or$a;

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/oo;->a(Lcom/flurry/sdk/or$a;)Lcom/flurry/sdk/jl;

    move-result-object v0

    return-object v0
.end method
