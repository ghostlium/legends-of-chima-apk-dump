.class Lcom/flurry/sdk/fm$j;
.super Ljava/util/ArrayList;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/fm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "j"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/ArrayList",
        "<TE;>;"
    }
.end annotation


# instance fields
.field private a:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 1427
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 1425
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/flurry/sdk/fm$j;->a:Z

    .line 1428
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .prologue
    .line 1431
    invoke-direct {p0, p1}, Ljava/util/ArrayList;-><init>(I)V

    .line 1425
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/flurry/sdk/fm$j;->a:Z

    .line 1432
    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TE;>;)V"
        }
    .end annotation

    .prologue
    .line 1435
    invoke-direct {p0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 1425
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/flurry/sdk/fm$j;->a:Z

    .line 1436
    return-void
.end method

.method private b()V
    .locals 1

    .prologue
    .line 1444
    iget-boolean v0, p0, Lcom/flurry/sdk/fm$j;->a:Z

    if-eqz v0, :cond_0

    .line 1445
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 1447
    :cond_0
    return-void
.end method


# virtual methods
.method public a()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 1439
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/flurry/sdk/fm$j;->a:Z

    .line 1440
    return-object p0
.end method

.method public add(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .prologue
    .line 1450
    invoke-direct {p0}, Lcom/flurry/sdk/fm$j;->b()V

    .line 1451
    invoke-super {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public addAll(ILjava/util/Collection;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Collection",
            "<+TE;>;)Z"
        }
    .end annotation

    .prologue
    .line 1470
    invoke-direct {p0}, Lcom/flurry/sdk/fm$j;->b()V

    .line 1471
    invoke-super {p0, p1, p2}, Ljava/util/ArrayList;->addAll(ILjava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public addAll(Ljava/util/Collection;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<+TE;>;)Z"
        }
    .end annotation

    .prologue
    .line 1465
    invoke-direct {p0}, Lcom/flurry/sdk/fm$j;->b()V

    .line 1466
    invoke-super {p0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public clear()V
    .locals 0

    .prologue
    .line 1485
    invoke-direct {p0}, Lcom/flurry/sdk/fm$j;->b()V

    .line 1486
    invoke-super {p0}, Ljava/util/ArrayList;->clear()V

    .line 1487
    return-void
.end method

.method public remove(I)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    .prologue
    .line 1460
    invoke-direct {p0}, Lcom/flurry/sdk/fm$j;->b()V

    .line 1461
    invoke-super {p0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 1

    .prologue
    .line 1455
    invoke-direct {p0}, Lcom/flurry/sdk/fm$j;->b()V

    .line 1456
    invoke-super {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 1475
    invoke-direct {p0}, Lcom/flurry/sdk/fm$j;->b()V

    .line 1476
    invoke-super {p0, p1}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public retainAll(Ljava/util/Collection;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 1480
    invoke-direct {p0}, Lcom/flurry/sdk/fm$j;->b()V

    .line 1481
    invoke-super {p0, p1}, Ljava/util/ArrayList;->retainAll(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method
