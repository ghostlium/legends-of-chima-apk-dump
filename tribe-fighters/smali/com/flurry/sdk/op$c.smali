.class final Lcom/flurry/sdk/op$c;
.super Lcom/flurry/sdk/op;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/op;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "c"
.end annotation


# instance fields
.field private final a:[Lcom/flurry/sdk/op$f;


# direct methods
.method public constructor <init>([Lcom/flurry/sdk/op$f;)V
    .locals 0

    .prologue
    .line 200
    invoke-direct {p0}, Lcom/flurry/sdk/op;-><init>()V

    .line 201
    iput-object p1, p0, Lcom/flurry/sdk/op$c;->a:[Lcom/flurry/sdk/op$f;

    .line 202
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Class;)Lcom/flurry/sdk/jl;
    .locals 4
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
    .line 207
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/flurry/sdk/op$c;->a:[Lcom/flurry/sdk/op$f;

    array-length v1, v1

    :goto_0
    if-ge v0, v1, :cond_1

    .line 208
    iget-object v2, p0, Lcom/flurry/sdk/op$c;->a:[Lcom/flurry/sdk/op$f;

    aget-object v2, v2, v0

    .line 209
    iget-object v3, v2, Lcom/flurry/sdk/op$f;->a:Ljava/lang/Class;

    if-ne v3, p1, :cond_0

    .line 210
    iget-object v0, v2, Lcom/flurry/sdk/op$f;->b:Lcom/flurry/sdk/jl;

    .line 213
    :goto_1
    return-object v0

    .line 207
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 213
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public a(Ljava/lang/Class;Lcom/flurry/sdk/jl;)Lcom/flurry/sdk/op;
    .locals 4
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

    .prologue
    const/4 v3, 0x0

    .line 219
    iget-object v0, p0, Lcom/flurry/sdk/op$c;->a:[Lcom/flurry/sdk/op$f;

    array-length v0, v0

    .line 221
    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    .line 228
    :goto_0
    return-object p0

    .line 225
    :cond_0
    add-int/lit8 v1, v0, 0x1

    new-array v1, v1, [Lcom/flurry/sdk/op$f;

    .line 226
    iget-object v2, p0, Lcom/flurry/sdk/op$c;->a:[Lcom/flurry/sdk/op$f;

    invoke-static {v2, v3, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 227
    new-instance v2, Lcom/flurry/sdk/op$f;

    invoke-direct {v2, p1, p2}, Lcom/flurry/sdk/op$f;-><init>(Ljava/lang/Class;Lcom/flurry/sdk/jl;)V

    aput-object v2, v1, v0

    .line 228
    new-instance p0, Lcom/flurry/sdk/op$c;

    invoke-direct {p0, v1}, Lcom/flurry/sdk/op$c;-><init>([Lcom/flurry/sdk/op$f;)V

    goto :goto_0
.end method
