.class public Lcom/flurry/sdk/gp$m;
.super Lcom/flurry/sdk/gp;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/gp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "m"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/gp;",
        "Ljava/lang/Iterable",
        "<",
        "Lcom/flurry/sdk/gp;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>([Lcom/flurry/sdk/gp;)V
    .locals 1

    .prologue
    .line 269
    sget-object v0, Lcom/flurry/sdk/gp$i;->c:Lcom/flurry/sdk/gp$i;

    invoke-direct {p0, v0, p1}, Lcom/flurry/sdk/gp;-><init>(Lcom/flurry/sdk/gp$i;[Lcom/flurry/sdk/gp;)V

    .line 270
    return-void
.end method

.method synthetic constructor <init>([Lcom/flurry/sdk/gp;Lcom/flurry/sdk/gp$1;)V
    .locals 0

    .prologue
    .line 267
    invoke-direct {p0, p1}, Lcom/flurry/sdk/gp$m;-><init>([Lcom/flurry/sdk/gp;)V

    return-void
.end method


# virtual methods
.method public final a()I
    .locals 2

    .prologue
    .line 324
    iget-object v0, p0, Lcom/flurry/sdk/gp$m;->b:[Lcom/flurry/sdk/gp;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/flurry/sdk/gp$m;->a([Lcom/flurry/sdk/gp;I)I

    move-result v0

    return v0
.end method

.method public synthetic a(Ljava/util/Map;Ljava/util/Map;)Lcom/flurry/sdk/gp;
    .locals 1

    .prologue
    .line 267
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/gp$m;->b(Ljava/util/Map;Ljava/util/Map;)Lcom/flurry/sdk/gp$m;

    move-result-object v0

    return-object v0
.end method

.method public b(Ljava/util/Map;Ljava/util/Map;)Lcom/flurry/sdk/gp$m;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Lcom/flurry/sdk/gp$m;",
            "Lcom/flurry/sdk/gp$m;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Lcom/flurry/sdk/gp$m;",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/sdk/gp$f;",
            ">;>;)",
            "Lcom/flurry/sdk/gp$m;"
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 304
    invoke-interface {p1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/gp$m;

    .line 305
    if-nez v0, :cond_1

    .line 306
    new-instance v6, Lcom/flurry/sdk/gp$m;

    invoke-virtual {p0}, Lcom/flurry/sdk/gp$m;->a()I

    move-result v0

    new-array v0, v0, [Lcom/flurry/sdk/gp;

    invoke-direct {v6, v0}, Lcom/flurry/sdk/gp$m;-><init>([Lcom/flurry/sdk/gp;)V

    .line 307
    invoke-interface {p1, p0, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 308
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 309
    invoke-interface {p2, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 311
    iget-object v0, p0, Lcom/flurry/sdk/gp$m;->b:[Lcom/flurry/sdk/gp;

    iget-object v2, v6, Lcom/flurry/sdk/gp$m;->b:[Lcom/flurry/sdk/gp;

    move v3, v1

    move-object v4, p1

    move-object v5, p2

    invoke-static/range {v0 .. v5}, Lcom/flurry/sdk/gp$m;->a([Lcom/flurry/sdk/gp;I[Lcom/flurry/sdk/gp;ILjava/util/Map;Ljava/util/Map;)V

    .line 313
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/gp$f;

    .line 314
    iget-object v3, v6, Lcom/flurry/sdk/gp$m;->b:[Lcom/flurry/sdk/gp;

    iget-object v4, v0, Lcom/flurry/sdk/gp$f;->a:[Lcom/flurry/sdk/gp;

    iget v0, v0, Lcom/flurry/sdk/gp$f;->b:I

    iget-object v5, v6, Lcom/flurry/sdk/gp$m;->b:[Lcom/flurry/sdk/gp;

    array-length v5, v5

    invoke-static {v3, v1, v4, v0, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0

    .line 317
    :cond_0
    invoke-interface {p2, v6}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-object v0, v6

    .line 319
    :cond_1
    return-object v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lcom/flurry/sdk/gp;",
            ">;"
        }
    .end annotation

    .prologue
    .line 281
    new-instance v0, Lcom/flurry/sdk/gp$m$1;

    invoke-direct {v0, p0}, Lcom/flurry/sdk/gp$m$1;-><init>(Lcom/flurry/sdk/gp$m;)V

    return-object v0
.end method
