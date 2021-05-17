.class public abstract Lcom/flurry/sdk/ov;
.super Lcom/flurry/sdk/oz;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/sdk/jt;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/flurry/sdk/oz",
        "<TT;>;",
        "Lcom/flurry/sdk/jt;"
    }
.end annotation


# instance fields
.field protected final a:Z

.field protected final b:Lcom/flurry/sdk/rx;

.field protected final c:Lcom/flurry/sdk/jz;

.field protected d:Lcom/flurry/sdk/jl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field protected final e:Lcom/flurry/sdk/it;

.field protected f:Lcom/flurry/sdk/op;


# direct methods
.method protected constructor <init>(Ljava/lang/Class;Lcom/flurry/sdk/rx;ZLcom/flurry/sdk/jz;Lcom/flurry/sdk/it;Lcom/flurry/sdk/jl;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/flurry/sdk/rx;",
            "Z",
            "Lcom/flurry/sdk/jz;",
            "Lcom/flurry/sdk/it;",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 71
    invoke-direct {p0, p1, v0}, Lcom/flurry/sdk/oz;-><init>(Ljava/lang/Class;Z)V

    .line 72
    iput-object p2, p0, Lcom/flurry/sdk/ov;->b:Lcom/flurry/sdk/rx;

    .line 74
    if-nez p3, :cond_0

    if-eqz p2, :cond_1

    invoke-virtual {p2}, Lcom/flurry/sdk/rx;->u()Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :cond_1
    iput-boolean v0, p0, Lcom/flurry/sdk/ov;->a:Z

    .line 75
    iput-object p4, p0, Lcom/flurry/sdk/ov;->c:Lcom/flurry/sdk/jz;

    .line 76
    iput-object p5, p0, Lcom/flurry/sdk/ov;->e:Lcom/flurry/sdk/it;

    .line 77
    iput-object p6, p0, Lcom/flurry/sdk/ov;->d:Lcom/flurry/sdk/jl;

    .line 78
    invoke-static {}, Lcom/flurry/sdk/op;->a()Lcom/flurry/sdk/op;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/ov;->f:Lcom/flurry/sdk/op;

    .line 79
    return-void
.end method


# virtual methods
.method protected final a(Lcom/flurry/sdk/op;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/jw;)Lcom/flurry/sdk/jl;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/op;",
            "Lcom/flurry/sdk/rx;",
            "Lcom/flurry/sdk/jw;",
            ")",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flurry/sdk/ji;
        }
    .end annotation

    .prologue
    .line 179
    iget-object v0, p0, Lcom/flurry/sdk/ov;->e:Lcom/flurry/sdk/it;

    invoke-virtual {p1, p2, p3, v0}, Lcom/flurry/sdk/op;->a(Lcom/flurry/sdk/rx;Lcom/flurry/sdk/jw;Lcom/flurry/sdk/it;)Lcom/flurry/sdk/op$d;

    move-result-object v0

    .line 180
    iget-object v1, v0, Lcom/flurry/sdk/op$d;->b:Lcom/flurry/sdk/op;

    if-eq p1, v1, :cond_0

    .line 181
    iget-object v1, v0, Lcom/flurry/sdk/op$d;->b:Lcom/flurry/sdk/op;

    iput-object v1, p0, Lcom/flurry/sdk/ov;->f:Lcom/flurry/sdk/op;

    .line 183
    :cond_0
    iget-object v0, v0, Lcom/flurry/sdk/op$d;->a:Lcom/flurry/sdk/jl;

    return-object v0
.end method

.method protected final a(Lcom/flurry/sdk/op;Ljava/lang/Class;Lcom/flurry/sdk/jw;)Lcom/flurry/sdk/jl;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/op;",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/flurry/sdk/jw;",
            ")",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flurry/sdk/ji;
        }
    .end annotation

    .prologue
    .line 165
    iget-object v0, p0, Lcom/flurry/sdk/ov;->e:Lcom/flurry/sdk/it;

    invoke-virtual {p1, p2, p3, v0}, Lcom/flurry/sdk/op;->a(Ljava/lang/Class;Lcom/flurry/sdk/jw;Lcom/flurry/sdk/it;)Lcom/flurry/sdk/op$d;

    move-result-object v0

    .line 167
    iget-object v1, v0, Lcom/flurry/sdk/op$d;->b:Lcom/flurry/sdk/op;

    if-eq p1, v1, :cond_0

    .line 168
    iget-object v1, v0, Lcom/flurry/sdk/op$d;->b:Lcom/flurry/sdk/op;

    iput-object v1, p0, Lcom/flurry/sdk/ov;->f:Lcom/flurry/sdk/op;

    .line 170
    :cond_0
    iget-object v0, v0, Lcom/flurry/sdk/op$d;->a:Lcom/flurry/sdk/jl;

    return-object v0
.end method

.method public a(Lcom/flurry/sdk/jw;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flurry/sdk/ji;
        }
    .end annotation

    .prologue
    .line 154
    iget-boolean v0, p0, Lcom/flurry/sdk/ov;->a:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flurry/sdk/ov;->b:Lcom/flurry/sdk/rx;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flurry/sdk/ov;->d:Lcom/flurry/sdk/jl;

    if-nez v0, :cond_0

    .line 155
    iget-object v0, p0, Lcom/flurry/sdk/ov;->b:Lcom/flurry/sdk/rx;

    iget-object v1, p0, Lcom/flurry/sdk/ov;->e:Lcom/flurry/sdk/it;

    invoke-virtual {p1, v0, v1}, Lcom/flurry/sdk/jw;->a(Lcom/flurry/sdk/rx;Lcom/flurry/sdk/it;)Lcom/flurry/sdk/jl;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/ov;->d:Lcom/flurry/sdk/jl;

    .line 157
    :cond_0
    return-void
.end method

.method public final a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .locals 0
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
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 85
    invoke-virtual {p2}, Lcom/flurry/sdk/hp;->b()V

    .line 86
    invoke-virtual {p0, p1, p2, p3}, Lcom/flurry/sdk/ov;->b(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V

    .line 87
    invoke-virtual {p2}, Lcom/flurry/sdk/hp;->c()V

    .line 88
    return-void
.end method

.method public final a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;Lcom/flurry/sdk/jz;)V
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
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 95
    invoke-virtual {p4, p1, p2}, Lcom/flurry/sdk/jz;->c(Ljava/lang/Object;Lcom/flurry/sdk/hp;)V

    .line 96
    invoke-virtual {p0, p1, p2, p3}, Lcom/flurry/sdk/ov;->b(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V

    .line 97
    invoke-virtual {p4, p1, p2}, Lcom/flurry/sdk/jz;->f(Ljava/lang/Object;Lcom/flurry/sdk/hp;)V

    .line 98
    return-void
.end method

.method protected abstract b(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
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
            Lcom/flurry/sdk/ho;
        }
    .end annotation
.end method
