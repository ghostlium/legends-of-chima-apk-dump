.class public abstract Lcom/flurry/sdk/jl;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/jl$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 135
    return-void
.end method


# virtual methods
.method public a()Lcom/flurry/sdk/jl;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/flurry/sdk/jl",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 39
    return-object p0
.end method

.method public abstract a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/flurry/sdk/hp;",
            "Lcom/flurry/sdk/jw;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation
.end method

.method public a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;Lcom/flurry/sdk/jz;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/flurry/sdk/hp;",
            "Lcom/flurry/sdk/jw;",
            "Lcom/flurry/sdk/jz;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 100
    invoke-virtual {p0, p1, p2, p3}, Lcom/flurry/sdk/jl;->a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V

    .line 101
    return-void
.end method

.method public b()Z
    .locals 1

    .prologue
    .line 51
    const/4 v0, 0x0

    return v0
.end method

.method public c()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 120
    const/4 v0, 0x0

    return-object v0
.end method
