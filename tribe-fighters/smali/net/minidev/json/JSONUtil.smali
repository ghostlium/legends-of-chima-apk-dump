.class public Lnet/minidev/json/JSONUtil;
.super Ljava/lang/Object;
.source "JSONUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getGetterName(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 40
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 41
    .local v3, "len":I
    add-int/lit8 v4, v3, 0x3

    new-array v0, v4, [C

    .line 42
    .local v0, "b":[C
    const/16 v4, 0x67

    aput-char v4, v0, v6

    .line 43
    const/4 v4, 0x1

    const/16 v5, 0x65

    aput-char v5, v0, v4

    .line 44
    const/4 v4, 0x2

    const/16 v5, 0x74

    aput-char v5, v0, v4

    .line 45
    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 46
    .local v1, "c":C
    const/16 v4, 0x61

    if-lt v1, v4, :cond_0

    const/16 v4, 0x7a

    if-gt v1, v4, :cond_0

    .line 47
    add-int/lit8 v4, v1, -0x20

    int-to-char v1, v4

    .line 48
    :cond_0
    const/4 v4, 0x3

    aput-char v1, v0, v4

    .line 49
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_0
    if-ge v2, v3, :cond_1

    .line 50
    add-int/lit8 v4, v2, 0x3

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v5

    aput-char v5, v0, v4

    .line 49
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 52
    :cond_1
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, v0}, Ljava/lang/String;-><init>([C)V

    return-object v4
.end method

.method public static getIsName(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 56
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 57
    .local v3, "len":I
    add-int/lit8 v4, v3, 0x2

    new-array v0, v4, [C

    .line 58
    .local v0, "b":[C
    const/16 v4, 0x69

    aput-char v4, v0, v6

    .line 59
    const/4 v4, 0x1

    const/16 v5, 0x73

    aput-char v5, v0, v4

    .line 60
    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 61
    .local v1, "c":C
    const/16 v4, 0x61

    if-lt v1, v4, :cond_0

    const/16 v4, 0x7a

    if-gt v1, v4, :cond_0

    .line 62
    add-int/lit8 v4, v1, -0x20

    int-to-char v1, v4

    .line 63
    :cond_0
    const/4 v4, 0x2

    aput-char v1, v0, v4

    .line 64
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_0
    if-ge v2, v3, :cond_1

    .line 65
    add-int/lit8 v4, v2, 0x2

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v5

    aput-char v5, v0, v4

    .line 64
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 67
    :cond_1
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, v0}, Ljava/lang/String;-><init>([C)V

    return-object v4
.end method

.method public static getSetterName(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 24
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 25
    .local v3, "len":I
    add-int/lit8 v4, v3, 0x3

    new-array v0, v4, [C

    .line 26
    .local v0, "b":[C
    const/16 v4, 0x73

    aput-char v4, v0, v6

    .line 27
    const/4 v4, 0x1

    const/16 v5, 0x65

    aput-char v5, v0, v4

    .line 28
    const/4 v4, 0x2

    const/16 v5, 0x74

    aput-char v5, v0, v4

    .line 29
    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 30
    .local v1, "c":C
    const/16 v4, 0x61

    if-lt v1, v4, :cond_0

    const/16 v4, 0x7a

    if-gt v1, v4, :cond_0

    .line 31
    add-int/lit8 v4, v1, -0x20

    int-to-char v1, v4

    .line 32
    :cond_0
    const/4 v4, 0x3

    aput-char v1, v0, v4

    .line 33
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_0
    if-ge v2, v3, :cond_1

    .line 34
    add-int/lit8 v4, v2, 0x3

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v5

    aput-char v5, v0, v4

    .line 33
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 36
    :cond_1
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, v0}, Ljava/lang/String;-><init>([C)V

    return-object v4
.end method
