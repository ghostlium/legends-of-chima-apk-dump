.class public Lcom/flurry/sdk/gp$p;
.super Lcom/flurry/sdk/gp$g;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/gp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "p"
.end annotation


# instance fields
.field public final B:Lcom/flurry/sdk/gp;

.field public final z:I


# direct methods
.method public constructor <init>(ILcom/flurry/sdk/gp;)V
    .locals 1

    .prologue
    .line 481
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/flurry/sdk/gp$g;-><init>(Lcom/flurry/sdk/gp$1;)V

    .line 482
    iput p1, p0, Lcom/flurry/sdk/gp$p;->z:I

    .line 483
    iput-object p2, p0, Lcom/flurry/sdk/gp$p;->B:Lcom/flurry/sdk/gp;

    .line 484
    return-void
.end method


# virtual methods
.method public synthetic a(Ljava/util/Map;Ljava/util/Map;)Lcom/flurry/sdk/gp;
    .locals 1

    .prologue
    .line 478
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/gp$p;->b(Ljava/util/Map;Ljava/util/Map;)Lcom/flurry/sdk/gp$p;

    move-result-object v0

    return-object v0
.end method

.method public b(Ljava/util/Map;Ljava/util/Map;)Lcom/flurry/sdk/gp$p;
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
            "Lcom/flurry/sdk/gp$p;"
        }
    .end annotation

    .prologue
    .line 489
    new-instance v0, Lcom/flurry/sdk/gp$p;

    iget v1, p0, Lcom/flurry/sdk/gp$p;->z:I

    iget-object v2, p0, Lcom/flurry/sdk/gp$p;->B:Lcom/flurry/sdk/gp;

    invoke-virtual {v2, p1, p2}, Lcom/flurry/sdk/gp;->a(Ljava/util/Map;Ljava/util/Map;)Lcom/flurry/sdk/gp;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/flurry/sdk/gp$p;-><init>(ILcom/flurry/sdk/gp;)V

    return-object v0
.end method
