.class public final Lcom/flurry/sdk/ms;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<",
        "Lcom/flurry/sdk/mr;",
        ">;"
    }
.end annotation


# instance fields
.field protected a:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Lcom/flurry/sdk/mz;",
            "Lcom/flurry/sdk/mr;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;[Ljava/lang/Class;)Lcom/flurry/sdk/mr;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/flurry/sdk/mr;"
        }
    .end annotation

    .prologue
    .line 56
    iget-object v0, p0, Lcom/flurry/sdk/ms;->a:Ljava/util/LinkedHashMap;

    if-nez v0, :cond_0

    .line 57
    const/4 v0, 0x0

    .line 59
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/ms;->a:Ljava/util/LinkedHashMap;

    new-instance v1, Lcom/flurry/sdk/mz;

    invoke-direct {v1, p1, p2}, Lcom/flurry/sdk/mz;-><init>(Ljava/lang/String;[Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/mr;

    goto :goto_0
.end method

.method public a(Ljava/lang/reflect/Method;)Lcom/flurry/sdk/mr;
    .locals 2

    .prologue
    .line 40
    iget-object v0, p0, Lcom/flurry/sdk/ms;->a:Ljava/util/LinkedHashMap;

    if-eqz v0, :cond_0

    .line 41
    iget-object v0, p0, Lcom/flurry/sdk/ms;->a:Ljava/util/LinkedHashMap;

    new-instance v1, Lcom/flurry/sdk/mz;

    invoke-direct {v1, p1}, Lcom/flurry/sdk/mz;-><init>(Ljava/lang/reflect/Method;)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/mr;

    .line 43
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public a(Lcom/flurry/sdk/mr;)V
    .locals 3

    .prologue
    .line 23
    iget-object v0, p0, Lcom/flurry/sdk/ms;->a:Ljava/util/LinkedHashMap;

    if-nez v0, :cond_0

    .line 24
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/ms;->a:Ljava/util/LinkedHashMap;

    .line 26
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/ms;->a:Ljava/util/LinkedHashMap;

    new-instance v1, Lcom/flurry/sdk/mz;

    invoke-virtual {p1}, Lcom/flurry/sdk/mr;->e()Ljava/lang/reflect/Method;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/flurry/sdk/mz;-><init>(Ljava/lang/reflect/Method;)V

    invoke-virtual {v0, v1, p1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    return-void
.end method

.method public a()Z
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/flurry/sdk/ms;->a:Ljava/util/LinkedHashMap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flurry/sdk/ms;->a:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->size()I

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public b(Ljava/lang/reflect/Method;)Lcom/flurry/sdk/mr;
    .locals 2

    .prologue
    .line 64
    iget-object v0, p0, Lcom/flurry/sdk/ms;->a:Ljava/util/LinkedHashMap;

    if-nez v0, :cond_0

    .line 65
    const/4 v0, 0x0

    .line 67
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/ms;->a:Ljava/util/LinkedHashMap;

    new-instance v1, Lcom/flurry/sdk/mz;

    invoke-direct {v1, p1}, Lcom/flurry/sdk/mz;-><init>(Ljava/lang/reflect/Method;)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/mr;

    goto :goto_0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lcom/flurry/sdk/mr;",
            ">;"
        }
    .end annotation

    .prologue
    .line 79
    iget-object v0, p0, Lcom/flurry/sdk/ms;->a:Ljava/util/LinkedHashMap;

    if-eqz v0, :cond_0

    .line 80
    iget-object v0, p0, Lcom/flurry/sdk/ms;->a:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 83
    :goto_0
    return-object v0

    .line 82
    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    .line 83
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    goto :goto_0
.end method
