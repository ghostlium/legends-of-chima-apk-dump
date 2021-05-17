.class public Lcom/flurry/sdk/oe;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final f:[Lcom/flurry/sdk/oc;


# instance fields
.field protected final a:Lcom/flurry/sdk/mw;

.field protected b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/flurry/sdk/oc;",
            ">;"
        }
    .end annotation
.end field

.field protected c:[Lcom/flurry/sdk/oc;

.field protected d:Lcom/flurry/sdk/nz;

.field protected e:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    const/4 v0, 0x0

    new-array v0, v0, [Lcom/flurry/sdk/oc;

    sput-object v0, Lcom/flurry/sdk/oe;->f:[Lcom/flurry/sdk/oc;

    return-void
.end method

.method public constructor <init>(Lcom/flurry/sdk/mw;)V
    .locals 0

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput-object p1, p0, Lcom/flurry/sdk/oe;->a:Lcom/flurry/sdk/mw;

    .line 64
    return-void
.end method


# virtual methods
.method public a()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/sdk/oc;",
            ">;"
        }
    .end annotation

    .prologue
    .line 78
    iget-object v0, p0, Lcom/flurry/sdk/oe;->b:Ljava/util/List;

    return-object v0
.end method

.method public a(Lcom/flurry/sdk/nz;)V
    .locals 0

    .prologue
    .line 97
    iput-object p1, p0, Lcom/flurry/sdk/oe;->d:Lcom/flurry/sdk/nz;

    .line 98
    return-void
.end method

.method public a(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 101
    iput-object p1, p0, Lcom/flurry/sdk/oe;->e:Ljava/lang/Object;

    .line 102
    return-void
.end method

.method public a(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/sdk/oc;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 89
    iput-object p1, p0, Lcom/flurry/sdk/oe;->b:Ljava/util/List;

    .line 90
    return-void
.end method

.method public a([Lcom/flurry/sdk/oc;)V
    .locals 0

    .prologue
    .line 93
    iput-object p1, p0, Lcom/flurry/sdk/oe;->c:[Lcom/flurry/sdk/oc;

    .line 94
    return-void
.end method

.method public b()Lcom/flurry/sdk/jl;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/flurry/sdk/jl",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 119
    iget-object v0, p0, Lcom/flurry/sdk/oe;->b:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flurry/sdk/oe;->b:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 120
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/oe;->d:Lcom/flurry/sdk/nz;

    if-nez v0, :cond_1

    .line 121
    const/4 v0, 0x0

    .line 128
    :goto_0
    return-object v0

    .line 123
    :cond_1
    sget-object v2, Lcom/flurry/sdk/oe;->f:[Lcom/flurry/sdk/oc;

    .line 128
    :goto_1
    new-instance v0, Lcom/flurry/sdk/od;

    iget-object v1, p0, Lcom/flurry/sdk/oe;->a:Lcom/flurry/sdk/mw;

    invoke-virtual {v1}, Lcom/flurry/sdk/mw;->a()Lcom/flurry/sdk/rx;

    move-result-object v1

    iget-object v3, p0, Lcom/flurry/sdk/oe;->c:[Lcom/flurry/sdk/oc;

    iget-object v4, p0, Lcom/flurry/sdk/oe;->d:Lcom/flurry/sdk/nz;

    iget-object v5, p0, Lcom/flurry/sdk/oe;->e:Ljava/lang/Object;

    invoke-direct/range {v0 .. v5}, Lcom/flurry/sdk/od;-><init>(Lcom/flurry/sdk/rx;[Lcom/flurry/sdk/oc;[Lcom/flurry/sdk/oc;Lcom/flurry/sdk/nz;Ljava/lang/Object;)V

    goto :goto_0

    .line 125
    :cond_2
    iget-object v0, p0, Lcom/flurry/sdk/oe;->b:Ljava/util/List;

    iget-object v1, p0, Lcom/flurry/sdk/oe;->b:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Lcom/flurry/sdk/oc;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flurry/sdk/oc;

    move-object v2, v0

    goto :goto_1
.end method

.method public c()Lcom/flurry/sdk/od;
    .locals 1

    .prologue
    .line 137
    iget-object v0, p0, Lcom/flurry/sdk/oe;->a:Lcom/flurry/sdk/mw;

    invoke-virtual {v0}, Lcom/flurry/sdk/mw;->b()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lcom/flurry/sdk/od;->a(Ljava/lang/Class;)Lcom/flurry/sdk/od;

    move-result-object v0

    return-object v0
.end method
