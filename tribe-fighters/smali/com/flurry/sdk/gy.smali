.class public Lcom/flurry/sdk/gy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Map;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/gy$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Map",
        "<TK;TV;>;"
    }
.end annotation


# instance fields
.field private final a:Ljava/lang/ref/ReferenceQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/ReferenceQueue",
            "<TK;>;"
        }
    .end annotation
.end field

.field private b:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/flurry/sdk/gy",
            "<TK;TV;>.a;TV;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v0}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/gy;->a:Ljava/lang/ref/ReferenceQueue;

    .line 47
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/gy;->b:Ljava/util/Map;

    .line 50
    return-void
.end method

.method static synthetic a(Lcom/flurry/sdk/gy;)Ljava/lang/ref/ReferenceQueue;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/flurry/sdk/gy;->a:Ljava/lang/ref/ReferenceQueue;

    return-object v0
.end method

.method private declared-synchronized a()V
    .locals 2

    .prologue
    .line 136
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/flurry/sdk/gy;->a:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v0}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v0

    .line 138
    :goto_0
    if-eqz v0, :cond_0

    .line 139
    check-cast v0, Lcom/flurry/sdk/gy$a;

    .line 140
    iget-object v1, p0, Lcom/flurry/sdk/gy;->b:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    iget-object v0, p0, Lcom/flurry/sdk/gy;->a:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v0}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    goto :goto_0

    .line 143
    :cond_0
    monitor-exit p0

    return-void

    .line 136
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/flurry/sdk/gy;->b:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 54
    invoke-direct {p0}, Lcom/flurry/sdk/gy;->a()V

    .line 55
    return-void
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .locals 2

    .prologue
    .line 58
    invoke-direct {p0}, Lcom/flurry/sdk/gy;->a()V

    .line 59
    iget-object v0, p0, Lcom/flurry/sdk/gy;->b:Ljava/util/Map;

    new-instance v1, Lcom/flurry/sdk/gy$a;

    invoke-direct {v1, p0, p1}, Lcom/flurry/sdk/gy$a;-><init>(Lcom/flurry/sdk/gy;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .locals 1

    .prologue
    .line 63
    invoke-direct {p0}, Lcom/flurry/sdk/gy;->a()V

    .line 64
    iget-object v0, p0, Lcom/flurry/sdk/gy;->b:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsValue(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public entrySet()Ljava/util/Set;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 68
    invoke-direct {p0}, Lcom/flurry/sdk/gy;->a()V

    .line 69
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 70
    iget-object v0, p0, Lcom/flurry/sdk/gy;->b:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 71
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flurry/sdk/gy$a;

    invoke-virtual {v1}, Lcom/flurry/sdk/gy$a;->get()Ljava/lang/Object;

    move-result-object v1

    .line 72
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    .line 73
    new-instance v4, Lcom/flurry/sdk/gy$1;

    invoke-direct {v4, p0, v1, v0}, Lcom/flurry/sdk/gy$1;-><init>(Lcom/flurry/sdk/gy;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 84
    invoke-interface {v2, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 86
    :cond_0
    invoke-static {v2}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2

    .prologue
    .line 99
    iget-object v0, p0, Lcom/flurry/sdk/gy;->b:Ljava/util/Map;

    check-cast p1, Lcom/flurry/sdk/gy;

    iget-object v1, p1, Lcom/flurry/sdk/gy;->b:Ljava/util/Map;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .prologue
    .line 103
    invoke-direct {p0}, Lcom/flurry/sdk/gy;->a()V

    .line 104
    iget-object v0, p0, Lcom/flurry/sdk/gy;->b:Ljava/util/Map;

    new-instance v1, Lcom/flurry/sdk/gy$a;

    invoke-direct {v1, p0, p1}, Lcom/flurry/sdk/gy$a;-><init>(Lcom/flurry/sdk/gy;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 112
    invoke-direct {p0}, Lcom/flurry/sdk/gy;->a()V

    .line 113
    iget-object v0, p0, Lcom/flurry/sdk/gy;->b:Ljava/util/Map;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 116
    invoke-direct {p0}, Lcom/flurry/sdk/gy;->a()V

    .line 117
    iget-object v0, p0, Lcom/flurry/sdk/gy;->b:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public keySet()Ljava/util/Set;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<TK;>;"
        }
    .end annotation

    .prologue
    .line 90
    invoke-direct {p0}, Lcom/flurry/sdk/gy;->a()V

    .line 91
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 92
    iget-object v0, p0, Lcom/flurry/sdk/gy;->b:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/gy$a;

    .line 93
    invoke-virtual {v0}, Lcom/flurry/sdk/gy$a;->get()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 95
    :cond_0
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .prologue
    .line 107
    invoke-direct {p0}, Lcom/flurry/sdk/gy;->a()V

    .line 108
    iget-object v0, p0, Lcom/flurry/sdk/gy;->b:Ljava/util/Map;

    new-instance v1, Lcom/flurry/sdk/gy$a;

    invoke-direct {v1, p0, p1}, Lcom/flurry/sdk/gy$a;-><init>(Lcom/flurry/sdk/gy;Ljava/lang/Object;)V

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public putAll(Ljava/util/Map;)V
    .locals 1

    .prologue
    .line 120
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .prologue
    .line 123
    invoke-direct {p0}, Lcom/flurry/sdk/gy;->a()V

    .line 124
    iget-object v0, p0, Lcom/flurry/sdk/gy;->b:Ljava/util/Map;

    new-instance v1, Lcom/flurry/sdk/gy$a;

    invoke-direct {v1, p0, p1}, Lcom/flurry/sdk/gy$a;-><init>(Lcom/flurry/sdk/gy;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 127
    invoke-direct {p0}, Lcom/flurry/sdk/gy;->a()V

    .line 128
    iget-object v0, p0, Lcom/flurry/sdk/gy;->b:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public values()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 131
    invoke-direct {p0}, Lcom/flurry/sdk/gy;->a()V

    .line 132
    iget-object v0, p0, Lcom/flurry/sdk/gy;->b:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method
