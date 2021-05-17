.class public Lcom/flurry/sdk/fs$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/sdk/fw;
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/fs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/flurry/sdk/fw;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/flurry/sdk/fs$c;",
        ">;"
    }
.end annotation


# instance fields
.field private a:Lcom/flurry/sdk/fm;

.field private b:[B


# direct methods
.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 245
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/flurry/sdk/fm;)V
    .locals 0

    .prologue
    .line 238
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, p1}, Lcom/flurry/sdk/fs$c;->a(Lcom/flurry/sdk/fm;)V

    return-void
.end method


# virtual methods
.method public a(Lcom/flurry/sdk/fs$c;)I
    .locals 6

    .prologue
    const/4 v1, 0x0

    .line 272
    iget-object v0, p0, Lcom/flurry/sdk/fs$c;->b:[B

    iget-object v2, p0, Lcom/flurry/sdk/fs$c;->b:[B

    array-length v2, v2

    iget-object v3, p1, Lcom/flurry/sdk/fs$c;->b:[B

    iget-object v4, p1, Lcom/flurry/sdk/fs$c;->b:[B

    array-length v5, v4

    move v4, v1

    invoke-static/range {v0 .. v5}, Lcom/flurry/sdk/fz;->a([BII[BII)I

    move-result v0

    return v0
.end method

.method public a()Lcom/flurry/sdk/fm;
    .locals 1

    .prologue
    .line 252
    iget-object v0, p0, Lcom/flurry/sdk/fs$c;->a:Lcom/flurry/sdk/fm;

    return-object v0
.end method

.method protected a(Lcom/flurry/sdk/fm;)V
    .locals 1

    .prologue
    .line 248
    iput-object p1, p0, Lcom/flurry/sdk/fs$c;->a:Lcom/flurry/sdk/fm;

    .line 249
    invoke-virtual {p1}, Lcom/flurry/sdk/fm;->l()I

    move-result v0

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/flurry/sdk/fs$c;->b:[B

    .line 250
    return-void
.end method

.method public b()[B
    .locals 1

    .prologue
    .line 256
    iget-object v0, p0, Lcom/flurry/sdk/fs$c;->b:[B

    return-object v0
.end method

.method public synthetic compareTo(Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 234
    check-cast p1, Lcom/flurry/sdk/fs$c;

    invoke-virtual {p0, p1}, Lcom/flurry/sdk/fs$c;->a(Lcom/flurry/sdk/fs$c;)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 260
    if-ne p1, p0, :cond_1

    .line 261
    :cond_0
    :goto_0
    return v0

    :cond_1
    instance-of v1, p1, Lcom/flurry/sdk/fw;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/flurry/sdk/fs$c;->b:[B

    check-cast p1, Lcom/flurry/sdk/fw;

    invoke-interface {p1}, Lcom/flurry/sdk/fw;->b()[B

    move-result-object v2

    invoke-static {v1, v2}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    if-nez v1, :cond_0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 266
    iget-object v0, p0, Lcom/flurry/sdk/fs$c;->b:[B

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([B)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 269
    iget-object v0, p0, Lcom/flurry/sdk/fs$c;->b:[B

    invoke-static {v0}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
