.class public Lcom/flurry/sdk/qg;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected final a:Ljava/lang/reflect/Type;

.field protected final b:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field protected final c:Ljava/lang/reflect/ParameterizedType;

.field protected d:Lcom/flurry/sdk/qg;

.field protected e:Lcom/flurry/sdk/qg;


# direct methods
.method public constructor <init>(Ljava/lang/reflect/Type;)V
    .locals 3

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/flurry/sdk/qg;->a:Ljava/lang/reflect/Type;

    .line 33
    instance-of v0, p1, Ljava/lang/Class;

    if-eqz v0, :cond_0

    .line 34
    check-cast p1, Ljava/lang/Class;

    iput-object p1, p0, Lcom/flurry/sdk/qg;->b:Ljava/lang/Class;

    .line 35
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/flurry/sdk/qg;->c:Ljava/lang/reflect/ParameterizedType;

    .line 42
    :goto_0
    return-void

    .line 36
    :cond_0
    instance-of v0, p1, Ljava/lang/reflect/ParameterizedType;

    if-eqz v0, :cond_1

    .line 37
    check-cast p1, Ljava/lang/reflect/ParameterizedType;

    iput-object p1, p0, Lcom/flurry/sdk/qg;->c:Ljava/lang/reflect/ParameterizedType;

    .line 38
    iget-object v0, p0, Lcom/flurry/sdk/qg;->c:Ljava/lang/reflect/ParameterizedType;

    invoke-interface {v0}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    iput-object v0, p0, Lcom/flurry/sdk/qg;->b:Ljava/lang/Class;

    goto :goto_0

    .line 40
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " can not be used to construct HierarchicType"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private constructor <init>(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/lang/reflect/ParameterizedType;Lcom/flurry/sdk/qg;Lcom/flurry/sdk/qg;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/reflect/ParameterizedType;",
            "Lcom/flurry/sdk/qg;",
            "Lcom/flurry/sdk/qg;",
            ")V"
        }
    .end annotation

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-object p1, p0, Lcom/flurry/sdk/qg;->a:Ljava/lang/reflect/Type;

    .line 48
    iput-object p2, p0, Lcom/flurry/sdk/qg;->b:Ljava/lang/Class;

    .line 49
    iput-object p3, p0, Lcom/flurry/sdk/qg;->c:Ljava/lang/reflect/ParameterizedType;

    .line 50
    iput-object p4, p0, Lcom/flurry/sdk/qg;->d:Lcom/flurry/sdk/qg;

    .line 51
    iput-object p5, p0, Lcom/flurry/sdk/qg;->e:Lcom/flurry/sdk/qg;

    .line 52
    return-void
.end method


# virtual methods
.method public a()Lcom/flurry/sdk/qg;
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 62
    iget-object v0, p0, Lcom/flurry/sdk/qg;->d:Lcom/flurry/sdk/qg;

    if-nez v0, :cond_1

    move-object v4, v5

    .line 63
    :goto_0
    new-instance v0, Lcom/flurry/sdk/qg;

    iget-object v1, p0, Lcom/flurry/sdk/qg;->a:Ljava/lang/reflect/Type;

    iget-object v2, p0, Lcom/flurry/sdk/qg;->b:Ljava/lang/Class;

    iget-object v3, p0, Lcom/flurry/sdk/qg;->c:Ljava/lang/reflect/ParameterizedType;

    invoke-direct/range {v0 .. v5}, Lcom/flurry/sdk/qg;-><init>(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/lang/reflect/ParameterizedType;Lcom/flurry/sdk/qg;Lcom/flurry/sdk/qg;)V

    .line 64
    if-eqz v4, :cond_0

    .line 65
    invoke-virtual {v4, v0}, Lcom/flurry/sdk/qg;->b(Lcom/flurry/sdk/qg;)V

    .line 67
    :cond_0
    return-object v0

    .line 62
    :cond_1
    iget-object v0, p0, Lcom/flurry/sdk/qg;->d:Lcom/flurry/sdk/qg;

    invoke-virtual {v0}, Lcom/flurry/sdk/qg;->a()Lcom/flurry/sdk/qg;

    move-result-object v4

    goto :goto_0
.end method

.method public a(Lcom/flurry/sdk/qg;)V
    .locals 0

    .prologue
    .line 70
    iput-object p1, p0, Lcom/flurry/sdk/qg;->d:Lcom/flurry/sdk/qg;

    return-void
.end method

.method public final b()Lcom/flurry/sdk/qg;
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lcom/flurry/sdk/qg;->d:Lcom/flurry/sdk/qg;

    return-object v0
.end method

.method public b(Lcom/flurry/sdk/qg;)V
    .locals 0

    .prologue
    .line 72
    iput-object p1, p0, Lcom/flurry/sdk/qg;->e:Lcom/flurry/sdk/qg;

    return-void
.end method

.method public final c()Z
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lcom/flurry/sdk/qg;->c:Ljava/lang/reflect/ParameterizedType;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final d()Ljava/lang/reflect/ParameterizedType;
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lcom/flurry/sdk/qg;->c:Ljava/lang/reflect/ParameterizedType;

    return-object v0
.end method

.method public final e()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 78
    iget-object v0, p0, Lcom/flurry/sdk/qg;->b:Ljava/lang/Class;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/flurry/sdk/qg;->c:Ljava/lang/reflect/ParameterizedType;

    if-eqz v0, :cond_0

    .line 83
    iget-object v0, p0, Lcom/flurry/sdk/qg;->c:Ljava/lang/reflect/ParameterizedType;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 85
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/qg;->b:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
