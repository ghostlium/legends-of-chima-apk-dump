.class public Lcom/flurry/sdk/gp$k;
.super Lcom/flurry/sdk/gp$g;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/gp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "k"
.end annotation


# instance fields
.field public final B:Lcom/flurry/sdk/gp;

.field public final z:Lcom/flurry/sdk/gp;


# direct methods
.method private constructor <init>(Lcom/flurry/sdk/gp;Lcom/flurry/sdk/gp;)V
    .locals 1

    .prologue
    .line 426
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/flurry/sdk/gp$g;-><init>(Lcom/flurry/sdk/gp$1;)V

    .line 427
    iput-object p1, p0, Lcom/flurry/sdk/gp$k;->z:Lcom/flurry/sdk/gp;

    .line 428
    iput-object p2, p0, Lcom/flurry/sdk/gp$k;->B:Lcom/flurry/sdk/gp;

    .line 429
    return-void
.end method

.method synthetic constructor <init>(Lcom/flurry/sdk/gp;Lcom/flurry/sdk/gp;Lcom/flurry/sdk/gp$1;)V
    .locals 0

    .prologue
    .line 423
    invoke-direct {p0, p1, p2}, Lcom/flurry/sdk/gp$k;-><init>(Lcom/flurry/sdk/gp;Lcom/flurry/sdk/gp;)V

    return-void
.end method


# virtual methods
.method public synthetic a(Ljava/util/Map;Ljava/util/Map;)Lcom/flurry/sdk/gp;
    .locals 1

    .prologue
    .line 423
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/gp$k;->b(Ljava/util/Map;Ljava/util/Map;)Lcom/flurry/sdk/gp$k;

    move-result-object v0

    return-object v0
.end method

.method public b(Ljava/util/Map;Ljava/util/Map;)Lcom/flurry/sdk/gp$k;
    .locals 3
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
            "Lcom/flurry/sdk/gp$k;"
        }
    .end annotation

    .prologue
    .line 434
    new-instance v0, Lcom/flurry/sdk/gp$k;

    iget-object v1, p0, Lcom/flurry/sdk/gp$k;->z:Lcom/flurry/sdk/gp;

    invoke-virtual {v1, p1, p2}, Lcom/flurry/sdk/gp;->a(Ljava/util/Map;Ljava/util/Map;)Lcom/flurry/sdk/gp;

    move-result-object v1

    iget-object v2, p0, Lcom/flurry/sdk/gp$k;->B:Lcom/flurry/sdk/gp;

    invoke-virtual {v2, p1, p2}, Lcom/flurry/sdk/gp;->a(Ljava/util/Map;Ljava/util/Map;)Lcom/flurry/sdk/gp;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/flurry/sdk/gp$k;-><init>(Lcom/flurry/sdk/gp;Lcom/flurry/sdk/gp;)V

    return-object v0
.end method
