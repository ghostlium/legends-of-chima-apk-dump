.class public abstract Lcom/flurry/sdk/op;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/op$c;,
        Lcom/flurry/sdk/op$a;,
        Lcom/flurry/sdk/op$e;,
        Lcom/flurry/sdk/op$b;,
        Lcom/flurry/sdk/op$f;,
        Lcom/flurry/sdk/op$d;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 186
    return-void
.end method

.method public static a()Lcom/flurry/sdk/op;
    .locals 1

    .prologue
    .line 54
    sget-object v0, Lcom/flurry/sdk/op$b;->a:Lcom/flurry/sdk/op$b;

    return-object v0
.end method


# virtual methods
.method public abstract a(Ljava/lang/Class;)Lcom/flurry/sdk/jl;
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
.end method

.method public final a(Lcom/flurry/sdk/rx;Lcom/flurry/sdk/jw;Lcom/flurry/sdk/it;)Lcom/flurry/sdk/op$d;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flurry/sdk/ji;
        }
    .end annotation

    .prologue
    .line 47
    invoke-virtual {p2, p1, p3}, Lcom/flurry/sdk/jw;->a(Lcom/flurry/sdk/rx;Lcom/flurry/sdk/it;)Lcom/flurry/sdk/jl;

    move-result-object v0

    .line 48
    new-instance v1, Lcom/flurry/sdk/op$d;

    invoke-virtual {p1}, Lcom/flurry/sdk/rx;->p()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0, v2, v0}, Lcom/flurry/sdk/op;->a(Ljava/lang/Class;Lcom/flurry/sdk/jl;)Lcom/flurry/sdk/op;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lcom/flurry/sdk/op$d;-><init>(Lcom/flurry/sdk/jl;Lcom/flurry/sdk/op;)V

    return-object v1
.end method

.method public final a(Ljava/lang/Class;Lcom/flurry/sdk/jw;Lcom/flurry/sdk/it;)Lcom/flurry/sdk/op$d;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/flurry/sdk/jw;",
            "Lcom/flurry/sdk/it;",
            ")",
            "Lcom/flurry/sdk/op$d;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flurry/sdk/ji;
        }
    .end annotation

    .prologue
    .line 39
    invoke-virtual {p2, p1, p3}, Lcom/flurry/sdk/jw;->a(Ljava/lang/Class;Lcom/flurry/sdk/it;)Lcom/flurry/sdk/jl;

    move-result-object v0

    .line 40
    new-instance v1, Lcom/flurry/sdk/op$d;

    invoke-virtual {p0, p1, v0}, Lcom/flurry/sdk/op;->a(Ljava/lang/Class;Lcom/flurry/sdk/jl;)Lcom/flurry/sdk/op;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lcom/flurry/sdk/op$d;-><init>(Lcom/flurry/sdk/jl;Lcom/flurry/sdk/op;)V

    return-object v1
.end method

.method public abstract a(Ljava/lang/Class;Lcom/flurry/sdk/jl;)Lcom/flurry/sdk/op;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/flurry/sdk/op;"
        }
    .end annotation
.end method
