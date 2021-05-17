.class Lcom/flurry/sdk/gn$a;
.super Lcom/flurry/sdk/gq$a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/gn;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "a"
.end annotation


# instance fields
.field public a:Lcom/flurry/sdk/fm;


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/fm;Lcom/flurry/sdk/fm;)V
    .locals 0

    .prologue
    .line 467
    invoke-direct {p0, p1}, Lcom/flurry/sdk/gq$a;-><init>(Lcom/flurry/sdk/fm;)V

    .line 468
    iput-object p2, p0, Lcom/flurry/sdk/gn$a;->a:Lcom/flurry/sdk/fm;

    .line 469
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 471
    instance-of v1, p1, Lcom/flurry/sdk/gn$a;

    if-nez v1, :cond_1

    .line 473
    :cond_0
    :goto_0
    return v0

    .line 472
    :cond_1
    check-cast p1, Lcom/flurry/sdk/gn$a;

    .line 473
    iget-object v1, p0, Lcom/flurry/sdk/gn$a;->b:Lcom/flurry/sdk/fm;

    iget-object v2, p1, Lcom/flurry/sdk/gn$a;->b:Lcom/flurry/sdk/fm;

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lcom/flurry/sdk/gn$a;->a:Lcom/flurry/sdk/fm;

    iget-object v2, p1, Lcom/flurry/sdk/gn$a;->a:Lcom/flurry/sdk/fm;

    if-ne v1, v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 476
    invoke-super {p0}, Lcom/flurry/sdk/gq$a;->hashCode()I

    move-result v0

    iget-object v1, p0, Lcom/flurry/sdk/gn$a;->a:Lcom/flurry/sdk/fm;

    invoke-virtual {v1}, Lcom/flurry/sdk/fm;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method
