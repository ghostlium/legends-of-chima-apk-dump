.class public Lnet/minidev/json/parser/JSONParserBase$MSB;
.super Ljava/lang/Object;
.source "JSONParserBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnet/minidev/json/parser/JSONParserBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MSB"
.end annotation


# instance fields
.field b:[C

.field p:I


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 619
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 620
    new-array v0, p1, [C

    iput-object v0, p0, Lnet/minidev/json/parser/JSONParserBase$MSB;->b:[C

    .line 621
    const/4 v0, -0x1

    iput v0, p0, Lnet/minidev/json/parser/JSONParserBase$MSB;->p:I

    .line 622
    return-void
.end method


# virtual methods
.method public append(C)V
    .locals 4
    .param p1, "c"    # C

    .prologue
    const/4 v3, 0x0

    .line 625
    iget v1, p0, Lnet/minidev/json/parser/JSONParserBase$MSB;->p:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lnet/minidev/json/parser/JSONParserBase$MSB;->p:I

    .line 626
    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserBase$MSB;->b:[C

    array-length v1, v1

    iget v2, p0, Lnet/minidev/json/parser/JSONParserBase$MSB;->p:I

    if-gt v1, v2, :cond_0

    .line 627
    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserBase$MSB;->b:[C

    array-length v1, v1

    mul-int/lit8 v1, v1, 0x2

    add-int/lit8 v1, v1, 0x1

    new-array v0, v1, [C

    .line 628
    .local v0, "t":[C
    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserBase$MSB;->b:[C

    iget-object v2, p0, Lnet/minidev/json/parser/JSONParserBase$MSB;->b:[C

    array-length v2, v2

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 629
    iput-object v0, p0, Lnet/minidev/json/parser/JSONParserBase$MSB;->b:[C

    .line 631
    .end local v0    # "t":[C
    :cond_0
    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserBase$MSB;->b:[C

    iget v2, p0, Lnet/minidev/json/parser/JSONParserBase$MSB;->p:I

    aput-char p1, v1, v2

    .line 632
    return-void
.end method

.method public append(I)V
    .locals 4
    .param p1, "c"    # I

    .prologue
    const/4 v3, 0x0

    .line 635
    iget v1, p0, Lnet/minidev/json/parser/JSONParserBase$MSB;->p:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lnet/minidev/json/parser/JSONParserBase$MSB;->p:I

    .line 636
    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserBase$MSB;->b:[C

    array-length v1, v1

    iget v2, p0, Lnet/minidev/json/parser/JSONParserBase$MSB;->p:I

    if-gt v1, v2, :cond_0

    .line 637
    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserBase$MSB;->b:[C

    array-length v1, v1

    mul-int/lit8 v1, v1, 0x2

    add-int/lit8 v1, v1, 0x1

    new-array v0, v1, [C

    .line 638
    .local v0, "t":[C
    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserBase$MSB;->b:[C

    iget-object v2, p0, Lnet/minidev/json/parser/JSONParserBase$MSB;->b:[C

    array-length v2, v2

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 639
    iput-object v0, p0, Lnet/minidev/json/parser/JSONParserBase$MSB;->b:[C

    .line 641
    .end local v0    # "t":[C
    :cond_0
    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserBase$MSB;->b:[C

    iget v2, p0, Lnet/minidev/json/parser/JSONParserBase$MSB;->p:I

    int-to-char v3, p1

    aput-char v3, v1, v2

    .line 642
    return-void
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 649
    const/4 v0, -0x1

    iput v0, p0, Lnet/minidev/json/parser/JSONParserBase$MSB;->p:I

    .line 650
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 645
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserBase$MSB;->b:[C

    const/4 v2, 0x0

    iget v3, p0, Lnet/minidev/json/parser/JSONParserBase$MSB;->p:I

    add-int/lit8 v3, v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([CII)V

    return-object v0
.end method
