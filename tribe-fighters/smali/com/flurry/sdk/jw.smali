.class public abstract Lcom/flurry/sdk/jw;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field protected static final a:Lcom/flurry/sdk/rx;


# instance fields
.field protected final b:Lcom/flurry/sdk/ju;

.field protected final c:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 25
    invoke-static {}, Lcom/flurry/sdk/qm;->a()Lcom/flurry/sdk/qm;

    move-result-object v0

    const-class v1, Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/qm;->a(Ljava/lang/Class;)Lcom/flurry/sdk/rx;

    move-result-object v0

    sput-object v0, Lcom/flurry/sdk/jw;->a:Lcom/flurry/sdk/rx;

    return-void
.end method

.method protected constructor <init>(Lcom/flurry/sdk/ju;)V
    .locals 1

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lcom/flurry/sdk/jw;->b:Lcom/flurry/sdk/ju;

    .line 40
    if-nez p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    iput-object v0, p0, Lcom/flurry/sdk/jw;->c:Ljava/lang/Class;

    .line 41
    return-void

    .line 40
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/jw;->b:Lcom/flurry/sdk/ju;

    invoke-virtual {v0}, Lcom/flurry/sdk/ju;->f()Ljava/lang/Class;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method public abstract a(Lcom/flurry/sdk/rx;Lcom/flurry/sdk/it;)Lcom/flurry/sdk/jl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/rx;",
            "Lcom/flurry/sdk/it;",
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
.end method

.method public abstract a(Lcom/flurry/sdk/rx;ZLcom/flurry/sdk/it;)Lcom/flurry/sdk/jl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/rx;",
            "Z",
            "Lcom/flurry/sdk/it;",
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
.end method

.method public abstract a(Ljava/lang/Class;Lcom/flurry/sdk/it;)Lcom/flurry/sdk/jl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/flurry/sdk/it;",
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
.end method

.method public abstract a(Ljava/lang/Class;ZLcom/flurry/sdk/it;)Lcom/flurry/sdk/jl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;Z",
            "Lcom/flurry/sdk/it;",
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
.end method

.method public a(Lcom/flurry/sdk/rx;Ljava/lang/Class;)Lcom/flurry/sdk/rx;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/rx;",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/flurry/sdk/rx;"
        }
    .end annotation

    .prologue
    .line 190
    iget-object v0, p0, Lcom/flurry/sdk/jw;->b:Lcom/flurry/sdk/ju;

    invoke-virtual {v0, p1, p2}, Lcom/flurry/sdk/ju;->a(Lcom/flurry/sdk/rx;Ljava/lang/Class;)Lcom/flurry/sdk/rx;

    move-result-object v0

    return-object v0
.end method

.method public a(Ljava/lang/reflect/Type;)Lcom/flurry/sdk/rx;
    .locals 1

    .prologue
    .line 183
    iget-object v0, p0, Lcom/flurry/sdk/jw;->b:Lcom/flurry/sdk/ju;

    invoke-virtual {v0}, Lcom/flurry/sdk/ju;->m()Lcom/flurry/sdk/qm;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/flurry/sdk/qm;->a(Ljava/lang/reflect/Type;)Lcom/flurry/sdk/rx;

    move-result-object v0

    return-object v0
.end method

.method public final a()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 164
    iget-object v0, p0, Lcom/flurry/sdk/jw;->c:Ljava/lang/Class;

    return-object v0
.end method

.method public abstract a(JLcom/flurry/sdk/hp;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation
.end method

.method public final a(Lcom/flurry/sdk/hp;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 517
    invoke-virtual {p0}, Lcom/flurry/sdk/jw;->d()Lcom/flurry/sdk/jl;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1, p0}, Lcom/flurry/sdk/jl;->a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V

    .line 518
    return-void
.end method

.method public abstract a(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/hp;Ljava/lang/Object;Lcom/flurry/sdk/jv;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation
.end method

.method public final a(Ljava/lang/Object;Lcom/flurry/sdk/hp;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 442
    if-nez p1, :cond_0

    .line 443
    invoke-virtual {p0}, Lcom/flurry/sdk/jw;->d()Lcom/flurry/sdk/jl;

    move-result-object v0

    invoke-virtual {v0, v2, p2, p0}, Lcom/flurry/sdk/jl;->a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V

    .line 448
    :goto_0
    return-void

    .line 445
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 446
    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1, v2}, Lcom/flurry/sdk/jw;->a(Ljava/lang/Class;ZLcom/flurry/sdk/it;)Lcom/flurry/sdk/jl;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p0}, Lcom/flurry/sdk/jl;->a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V

    goto :goto_0
.end method

.method public abstract a(Ljava/util/Date;Lcom/flurry/sdk/hp;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation
.end method

.method public final a(Lcom/flurry/sdk/ju$a;)Z
    .locals 1

    .prologue
    .line 153
    iget-object v0, p0, Lcom/flurry/sdk/jw;->b:Lcom/flurry/sdk/ju;

    invoke-virtual {v0, p1}, Lcom/flurry/sdk/ju;->a(Lcom/flurry/sdk/ju$a;)Z

    move-result v0

    return v0
.end method

.method public abstract b(Lcom/flurry/sdk/rx;Lcom/flurry/sdk/it;)Lcom/flurry/sdk/jl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/rx;",
            "Lcom/flurry/sdk/it;",
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
.end method

.method public final b()Lcom/flurry/sdk/oh;
    .locals 1

    .prologue
    .line 176
    iget-object v0, p0, Lcom/flurry/sdk/jw;->b:Lcom/flurry/sdk/ju;

    invoke-virtual {v0}, Lcom/flurry/sdk/ju;->h()Lcom/flurry/sdk/oh;

    move-result-object v0

    return-object v0
.end method

.method public abstract b(JLcom/flurry/sdk/hp;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation
.end method

.method public abstract b(Ljava/util/Date;Lcom/flurry/sdk/hp;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation
.end method

.method public abstract c()Lcom/flurry/sdk/jl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end method

.method public abstract d()Lcom/flurry/sdk/jl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end method
