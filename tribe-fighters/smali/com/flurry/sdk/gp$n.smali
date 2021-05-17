.class public Lcom/flurry/sdk/gp$n;
.super Lcom/flurry/sdk/gp$g;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/gp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "n"
.end annotation


# instance fields
.field public final z:Lcom/flurry/sdk/gp;


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/gp;)V
    .locals 2

    .prologue
    .line 443
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/flurry/sdk/gp$g;-><init>(ZLcom/flurry/sdk/gp$1;)V

    .line 444
    iput-object p1, p0, Lcom/flurry/sdk/gp$n;->z:Lcom/flurry/sdk/gp;

    .line 445
    return-void
.end method


# virtual methods
.method public synthetic a(Ljava/util/Map;Ljava/util/Map;)Lcom/flurry/sdk/gp;
    .locals 1

    .prologue
    .line 440
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/gp$n;->b(Ljava/util/Map;Ljava/util/Map;)Lcom/flurry/sdk/gp$n;

    move-result-object v0

    return-object v0
.end method

.method public b(Ljava/util/Map;Ljava/util/Map;)Lcom/flurry/sdk/gp$n;
    .locals 2
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
            "Lcom/flurry/sdk/gp$n;"
        }
    .end annotation

    .prologue
    .line 450
    new-instance v0, Lcom/flurry/sdk/gp$n;

    iget-object v1, p0, Lcom/flurry/sdk/gp$n;->z:Lcom/flurry/sdk/gp;

    invoke-virtual {v1, p1, p2}, Lcom/flurry/sdk/gp;->a(Ljava/util/Map;Ljava/util/Map;)Lcom/flurry/sdk/gp;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flurry/sdk/gp$n;-><init>(Lcom/flurry/sdk/gp;)V

    return-object v0
.end method
