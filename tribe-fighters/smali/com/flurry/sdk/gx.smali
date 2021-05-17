.class public Lcom/flurry/sdk/gx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/CharSequence;
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/CharSequence;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/flurry/sdk/gx;",
        ">;"
    }
.end annotation


# static fields
.field private static final a:[B


# instance fields
.field private b:[B

.field private c:I

.field private d:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 29
    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lcom/flurry/sdk/gx;->a:[B

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    sget-object v0, Lcom/flurry/sdk/gx;->a:[B

    iput-object v0, p0, Lcom/flurry/sdk/gx;->b:[B

    .line 36
    return-void
.end method

.method public constructor <init>(Lcom/flurry/sdk/gx;)V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    sget-object v0, Lcom/flurry/sdk/gx;->a:[B

    iput-object v0, p0, Lcom/flurry/sdk/gx;->b:[B

    .line 45
    iget v0, p1, Lcom/flurry/sdk/gx;->c:I

    iput v0, p0, Lcom/flurry/sdk/gx;->c:I

    .line 46
    iget v0, p1, Lcom/flurry/sdk/gx;->c:I

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/flurry/sdk/gx;->b:[B

    .line 47
    iget-object v0, p1, Lcom/flurry/sdk/gx;->b:[B

    iget-object v1, p0, Lcom/flurry/sdk/gx;->b:[B

    iget v2, p0, Lcom/flurry/sdk/gx;->c:I

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 48
    iget-object v0, p1, Lcom/flurry/sdk/gx;->d:Ljava/lang/String;

    iput-object v0, p0, Lcom/flurry/sdk/gx;->d:Ljava/lang/String;

    .line 49
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    sget-object v0, Lcom/flurry/sdk/gx;->a:[B

    iput-object v0, p0, Lcom/flurry/sdk/gx;->b:[B

    .line 39
    invoke-static {p1}, Lcom/flurry/sdk/gx;->a(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/gx;->b:[B

    .line 40
    iget-object v0, p0, Lcom/flurry/sdk/gx;->b:[B

    array-length v0, v0

    iput v0, p0, Lcom/flurry/sdk/gx;->c:I

    .line 41
    iput-object p1, p0, Lcom/flurry/sdk/gx;->d:Ljava/lang/String;

    .line 42
    return-void
.end method

.method public static final a(Ljava/lang/String;)[B
    .locals 1

    .prologue
    .line 141
    :try_start_0
    const-string v0, "UTF-8"

    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 146
    :goto_0
    return-object v0

    .line 142
    :catch_0
    move-exception v0

    .line 144
    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    .line 146
    const/4 v0, 0x0

    new-array v0, v0, [B

    goto :goto_0
.end method


# virtual methods
.method public a(Lcom/flurry/sdk/gx;)I
    .locals 6

    .prologue
    const/4 v1, 0x0

    .line 126
    iget-object v0, p0, Lcom/flurry/sdk/gx;->b:[B

    iget v2, p0, Lcom/flurry/sdk/gx;->c:I

    iget-object v3, p1, Lcom/flurry/sdk/gx;->b:[B

    iget v5, p1, Lcom/flurry/sdk/gx;->c:I

    move v4, v1

    invoke-static/range {v0 .. v5}, Lcom/flurry/sdk/fz;->a([BII[BII)I

    move-result v0

    return v0
.end method

.method public a(I)Lcom/flurry/sdk/gx;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 77
    iget v0, p0, Lcom/flurry/sdk/gx;->c:I

    if-ge v0, p1, :cond_0

    .line 78
    new-array v0, p1, [B

    .line 79
    iget-object v1, p0, Lcom/flurry/sdk/gx;->b:[B

    iget v2, p0, Lcom/flurry/sdk/gx;->c:I

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 80
    iput-object v0, p0, Lcom/flurry/sdk/gx;->b:[B

    .line 82
    :cond_0
    iput p1, p0, Lcom/flurry/sdk/gx;->c:I

    .line 83
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/flurry/sdk/gx;->d:Ljava/lang/String;

    .line 84
    return-object p0
.end method

.method public a()[B
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/flurry/sdk/gx;->b:[B

    return-object v0
.end method

.method public b()I
    .locals 1

    .prologue
    .line 65
    iget v0, p0, Lcom/flurry/sdk/gx;->c:I

    return v0
.end method

.method public charAt(I)C
    .locals 1

    .prologue
    .line 131
    invoke-virtual {p0}, Lcom/flurry/sdk/gx;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    return v0
.end method

.method public synthetic compareTo(Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 28
    check-cast p1, Lcom/flurry/sdk/gx;

    invoke-virtual {p0, p1}, Lcom/flurry/sdk/gx;->a(Lcom/flurry/sdk/gx;)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 6

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 105
    if-ne p1, p0, :cond_1

    move v1, v2

    .line 113
    :cond_0
    :goto_0
    return v1

    .line 106
    :cond_1
    instance-of v0, p1, Lcom/flurry/sdk/gx;

    if-eqz v0, :cond_0

    .line 107
    check-cast p1, Lcom/flurry/sdk/gx;

    .line 108
    iget v0, p0, Lcom/flurry/sdk/gx;->c:I

    iget v3, p1, Lcom/flurry/sdk/gx;->c:I

    if-ne v0, v3, :cond_0

    .line 109
    iget-object v3, p1, Lcom/flurry/sdk/gx;->b:[B

    move v0, v1

    .line 110
    :goto_1
    iget v4, p0, Lcom/flurry/sdk/gx;->c:I

    if-ge v0, v4, :cond_2

    .line 111
    iget-object v4, p0, Lcom/flurry/sdk/gx;->b:[B

    aget-byte v4, v4, v0

    aget-byte v5, v3, v0

    if-ne v4, v5, :cond_0

    .line 110
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_2
    move v1, v2

    .line 113
    goto :goto_0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 118
    move v1, v0

    .line 119
    :goto_0
    iget v2, p0, Lcom/flurry/sdk/gx;->c:I

    if-ge v0, v2, :cond_0

    .line 120
    mul-int/lit8 v1, v1, 0x1f

    iget-object v2, p0, Lcom/flurry/sdk/gx;->b:[B

    aget-byte v2, v2, v0

    add-int/2addr v1, v2

    .line 119
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 121
    :cond_0
    return v1
.end method

.method public length()I
    .locals 1

    .prologue
    .line 132
    invoke-virtual {p0}, Lcom/flurry/sdk/gx;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    return v0
.end method

.method public subSequence(II)Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 134
    invoke-virtual {p0}, Lcom/flurry/sdk/gx;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .prologue
    .line 92
    iget-object v0, p0, Lcom/flurry/sdk/gx;->d:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 94
    :try_start_0
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/flurry/sdk/gx;->b:[B

    const/4 v2, 0x0

    iget v3, p0, Lcom/flurry/sdk/gx;->c:I

    const-string v4, "UTF-8"

    invoke-direct {v0, v1, v2, v3, v4}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    iput-object v0, p0, Lcom/flurry/sdk/gx;->d:Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 100
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/flurry/sdk/gx;->d:Ljava/lang/String;

    return-object v0

    .line 95
    :catch_0
    move-exception v0

    .line 97
    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_0
.end method
