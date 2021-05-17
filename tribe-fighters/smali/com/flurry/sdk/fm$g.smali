.class Lcom/flurry/sdk/fm$g;
.super Lcom/flurry/sdk/fm$n;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/fm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "g"
.end annotation


# instance fields
.field private final i:I


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/fm$m;Ljava/lang/String;I)V
    .locals 3

    .prologue
    .line 860
    sget-object v0, Lcom/flurry/sdk/fm$v;->f:Lcom/flurry/sdk/fm$v;

    invoke-direct {p0, v0, p1, p2}, Lcom/flurry/sdk/fm$n;-><init>(Lcom/flurry/sdk/fm$v;Lcom/flurry/sdk/fm$m;Ljava/lang/String;)V

    .line 861
    if-gez p3, :cond_0

    .line 862
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid fixed size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 863
    :cond_0
    iput p3, p0, Lcom/flurry/sdk/fm$g;->i:I

    .line 864
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
    .line 877
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/fm$g;->c(Lcom/flurry/sdk/fm$o;Lcom/flurry/sdk/hp;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 887
    :goto_0
    return-void

    .line 878
    :cond_0
    invoke-virtual {p2}, Lcom/flurry/sdk/hp;->d()V

    .line 879
    const-string v0, "type"

    const-string v1, "fixed"

    invoke-virtual {p2, v0, v1}, Lcom/flurry/sdk/hp;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 880
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/fm$g;->d(Lcom/flurry/sdk/fm$o;Lcom/flurry/sdk/hp;)V

    .line 881
    invoke-virtual {p0}, Lcom/flurry/sdk/fm$g;->e()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 882
    const-string v0, "doc"

    invoke-virtual {p0}, Lcom/flurry/sdk/fm$g;->e()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v0, v1}, Lcom/flurry/sdk/hp;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 883
    :cond_1
    const-string v0, "size"

    iget v1, p0, Lcom/flurry/sdk/fm$g;->i:I

    invoke-virtual {p2, v0, v1}, Lcom/flurry/sdk/hp;->a(Ljava/lang/String;I)V

    .line 884
    iget-object v0, p0, Lcom/flurry/sdk/fm$g;->c:Lcom/flurry/sdk/fm$r;

    invoke-virtual {v0, p2}, Lcom/flurry/sdk/fm$r;->a(Lcom/flurry/sdk/hp;)V

    .line 885
    invoke-virtual {p0, p2}, Lcom/flurry/sdk/fm$g;->a(Lcom/flurry/sdk/hp;)V

    .line 886
    invoke-virtual {p2}, Lcom/flurry/sdk/hp;->e()V

    goto :goto_0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 867
    if-ne p1, p0, :cond_1

    .line 870
    :cond_0
    :goto_0
    return v0

    .line 868
    :cond_1
    instance-of v2, p1, Lcom/flurry/sdk/fm$g;

    if-nez v2, :cond_2

    move v0, v1

    goto :goto_0

    .line 869
    :cond_2
    check-cast p1, Lcom/flurry/sdk/fm$g;

    .line 870
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/fm$g;->c(Lcom/flurry/sdk/fm;)Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-virtual {p0, p1}, Lcom/flurry/sdk/fm$g;->a(Lcom/flurry/sdk/fm$n;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget v2, p0, Lcom/flurry/sdk/fm$g;->i:I

    iget v3, p1, Lcom/flurry/sdk/fm$g;->i:I

    if-ne v2, v3, :cond_3

    iget-object v2, p0, Lcom/flurry/sdk/fm$g;->c:Lcom/flurry/sdk/fm$r;

    iget-object v3, p1, Lcom/flurry/sdk/fm$g;->c:Lcom/flurry/sdk/fm$r;

    invoke-virtual {v2, v3}, Lcom/flurry/sdk/fm$r;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    :cond_3
    move v0, v1

    goto :goto_0
.end method

.method public l()I
    .locals 1

    .prologue
    .line 865
    iget v0, p0, Lcom/flurry/sdk/fm$g;->i:I

    return v0
.end method

.method m()I
    .locals 2

    .prologue
    .line 875
    invoke-super {p0}, Lcom/flurry/sdk/fm$n;->m()I

    move-result v0

    iget v1, p0, Lcom/flurry/sdk/fm$g;->i:I

    add-int/2addr v0, v1

    return v0
.end method
