.class Lcom/flurry/sdk/fm$a;
.super Lcom/flurry/sdk/fm;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/fm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "a"
.end annotation


# instance fields
.field private final f:Lcom/flurry/sdk/fm;


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/fm;)V
    .locals 1

    .prologue
    .line 756
    sget-object v0, Lcom/flurry/sdk/fm$v;->c:Lcom/flurry/sdk/fm$v;

    invoke-direct {p0, v0}, Lcom/flurry/sdk/fm;-><init>(Lcom/flurry/sdk/fm$v;)V

    .line 757
    iput-object p1, p0, Lcom/flurry/sdk/fm$a;->f:Lcom/flurry/sdk/fm;

    .line 758
    return-void
.end method


# virtual methods
.method a(Lcom/flurry/sdk/fm$o;Lcom/flurry/sdk/hp;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 772
    invoke-virtual {p2}, Lcom/flurry/sdk/hp;->d()V

    .line 773
    const-string v0, "type"

    const-string v1, "array"

    invoke-virtual {p2, v0, v1}, Lcom/flurry/sdk/hp;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 774
    const-string v0, "items"

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/hp;->a(Ljava/lang/String;)V

    .line 775
    iget-object v0, p0, Lcom/flurry/sdk/fm$a;->f:Lcom/flurry/sdk/fm;

    invoke-virtual {v0, p1, p2}, Lcom/flurry/sdk/fm;->a(Lcom/flurry/sdk/fm$o;Lcom/flurry/sdk/hp;)V

    .line 776
    iget-object v0, p0, Lcom/flurry/sdk/fm$a;->c:Lcom/flurry/sdk/fm$r;

    invoke-virtual {v0, p2}, Lcom/flurry/sdk/fm$r;->a(Lcom/flurry/sdk/hp;)V

    .line 777
    invoke-virtual {p2}, Lcom/flurry/sdk/hp;->e()V

    .line 778
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 761
    if-ne p1, p0, :cond_1

    .line 764
    :cond_0
    :goto_0
    return v0

    .line 762
    :cond_1
    instance-of v2, p1, Lcom/flurry/sdk/fm$a;

    if-nez v2, :cond_2

    move v0, v1

    goto :goto_0

    .line 763
    :cond_2
    check-cast p1, Lcom/flurry/sdk/fm$a;

    .line 764
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/fm$a;->c(Lcom/flurry/sdk/fm;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/flurry/sdk/fm$a;->f:Lcom/flurry/sdk/fm;

    iget-object v3, p1, Lcom/flurry/sdk/fm$a;->f:Lcom/flurry/sdk/fm;

    invoke-virtual {v2, v3}, Lcom/flurry/sdk/fm;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/flurry/sdk/fm$a;->c:Lcom/flurry/sdk/fm$r;

    iget-object v3, p1, Lcom/flurry/sdk/fm$a;->c:Lcom/flurry/sdk/fm$r;

    invoke-virtual {v2, v3}, Lcom/flurry/sdk/fm$r;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    :cond_3
    move v0, v1

    goto :goto_0
.end method

.method public i()Lcom/flurry/sdk/fm;
    .locals 1

    .prologue
    .line 759
    iget-object v0, p0, Lcom/flurry/sdk/fm$a;->f:Lcom/flurry/sdk/fm;

    return-object v0
.end method

.method m()I
    .locals 2

    .prologue
    .line 769
    invoke-super {p0}, Lcom/flurry/sdk/fm;->m()I

    move-result v0

    iget-object v1, p0, Lcom/flurry/sdk/fm$a;->f:Lcom/flurry/sdk/fm;

    invoke-virtual {v1}, Lcom/flurry/sdk/fm;->m()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method
