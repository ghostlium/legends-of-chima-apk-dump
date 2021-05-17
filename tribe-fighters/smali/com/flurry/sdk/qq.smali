.class public final Lcom/flurry/sdk/qq;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/qq$a;,
        Lcom/flurry/sdk/qq$d;,
        Lcom/flurry/sdk/qq$e;,
        Lcom/flurry/sdk/qq$g;,
        Lcom/flurry/sdk/qq$f;,
        Lcom/flurry/sdk/qq$h;,
        Lcom/flurry/sdk/qq$c;,
        Lcom/flurry/sdk/qq$b;
    }
.end annotation


# instance fields
.field a:Lcom/flurry/sdk/qq$b;

.field b:Lcom/flurry/sdk/qq$c;

.field c:Lcom/flurry/sdk/qq$h;

.field d:Lcom/flurry/sdk/qq$f;

.field e:Lcom/flurry/sdk/qq$g;

.field f:Lcom/flurry/sdk/qq$e;

.field g:Lcom/flurry/sdk/qq$d;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object v0, p0, Lcom/flurry/sdk/qq;->a:Lcom/flurry/sdk/qq$b;

    .line 19
    iput-object v0, p0, Lcom/flurry/sdk/qq;->b:Lcom/flurry/sdk/qq$c;

    .line 20
    iput-object v0, p0, Lcom/flurry/sdk/qq;->c:Lcom/flurry/sdk/qq$h;

    .line 21
    iput-object v0, p0, Lcom/flurry/sdk/qq;->d:Lcom/flurry/sdk/qq$f;

    .line 22
    iput-object v0, p0, Lcom/flurry/sdk/qq;->e:Lcom/flurry/sdk/qq$g;

    .line 24
    iput-object v0, p0, Lcom/flurry/sdk/qq;->f:Lcom/flurry/sdk/qq$e;

    .line 25
    iput-object v0, p0, Lcom/flurry/sdk/qq;->g:Lcom/flurry/sdk/qq$d;

    .line 27
    return-void
.end method

.method public static a([Ljava/lang/Object;)Ljava/util/HashSet;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)",
            "Ljava/util/HashSet",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 147
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 148
    if-eqz p0, :cond_0

    .line 149
    array-length v2, p0

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v2, :cond_0

    aget-object v3, p0, v0

    .line 150
    invoke-virtual {v1, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 149
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 153
    :cond_0
    return-object v1
.end method

.method public static b([Ljava/lang/Object;)Ljava/lang/Iterable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)",
            "Ljava/lang/Iterable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 244
    new-instance v0, Lcom/flurry/sdk/qq$a;

    invoke-direct {v0, p0}, Lcom/flurry/sdk/qq$a;-><init>([Ljava/lang/Object;)V

    return-object v0
.end method


# virtual methods
.method public a()Lcom/flurry/sdk/qq$b;
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/flurry/sdk/qq;->a:Lcom/flurry/sdk/qq$b;

    if-nez v0, :cond_0

    .line 32
    new-instance v0, Lcom/flurry/sdk/qq$b;

    invoke-direct {v0}, Lcom/flurry/sdk/qq$b;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/qq;->a:Lcom/flurry/sdk/qq$b;

    .line 34
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/qq;->a:Lcom/flurry/sdk/qq$b;

    return-object v0
.end method

.method public b()Lcom/flurry/sdk/qq$c;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/flurry/sdk/qq;->b:Lcom/flurry/sdk/qq$c;

    if-nez v0, :cond_0

    .line 40
    new-instance v0, Lcom/flurry/sdk/qq$c;

    invoke-direct {v0}, Lcom/flurry/sdk/qq$c;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/qq;->b:Lcom/flurry/sdk/qq$c;

    .line 42
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/qq;->b:Lcom/flurry/sdk/qq$c;

    return-object v0
.end method

.method public c()Lcom/flurry/sdk/qq$h;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/flurry/sdk/qq;->c:Lcom/flurry/sdk/qq$h;

    if-nez v0, :cond_0

    .line 47
    new-instance v0, Lcom/flurry/sdk/qq$h;

    invoke-direct {v0}, Lcom/flurry/sdk/qq$h;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/qq;->c:Lcom/flurry/sdk/qq$h;

    .line 49
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/qq;->c:Lcom/flurry/sdk/qq$h;

    return-object v0
.end method

.method public d()Lcom/flurry/sdk/qq$f;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/flurry/sdk/qq;->d:Lcom/flurry/sdk/qq$f;

    if-nez v0, :cond_0

    .line 54
    new-instance v0, Lcom/flurry/sdk/qq$f;

    invoke-direct {v0}, Lcom/flurry/sdk/qq$f;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/qq;->d:Lcom/flurry/sdk/qq$f;

    .line 56
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/qq;->d:Lcom/flurry/sdk/qq$f;

    return-object v0
.end method

.method public e()Lcom/flurry/sdk/qq$g;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/flurry/sdk/qq;->e:Lcom/flurry/sdk/qq$g;

    if-nez v0, :cond_0

    .line 61
    new-instance v0, Lcom/flurry/sdk/qq$g;

    invoke-direct {v0}, Lcom/flurry/sdk/qq$g;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/qq;->e:Lcom/flurry/sdk/qq$g;

    .line 63
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/qq;->e:Lcom/flurry/sdk/qq$g;

    return-object v0
.end method

.method public f()Lcom/flurry/sdk/qq$e;
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lcom/flurry/sdk/qq;->f:Lcom/flurry/sdk/qq$e;

    if-nez v0, :cond_0

    .line 69
    new-instance v0, Lcom/flurry/sdk/qq$e;

    invoke-direct {v0}, Lcom/flurry/sdk/qq$e;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/qq;->f:Lcom/flurry/sdk/qq$e;

    .line 71
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/qq;->f:Lcom/flurry/sdk/qq$e;

    return-object v0
.end method

.method public g()Lcom/flurry/sdk/qq$d;
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lcom/flurry/sdk/qq;->g:Lcom/flurry/sdk/qq$d;

    if-nez v0, :cond_0

    .line 76
    new-instance v0, Lcom/flurry/sdk/qq$d;

    invoke-direct {v0}, Lcom/flurry/sdk/qq$d;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/qq;->g:Lcom/flurry/sdk/qq$d;

    .line 78
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/qq;->g:Lcom/flurry/sdk/qq$d;

    return-object v0
.end method
