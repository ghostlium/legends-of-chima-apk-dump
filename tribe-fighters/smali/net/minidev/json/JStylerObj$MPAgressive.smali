.class Lnet/minidev/json/JStylerObj$MPAgressive;
.super Ljava/lang/Object;
.source "JStylerObj.java"

# interfaces
.implements Lnet/minidev/json/JStylerObj$MustProtect;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnet/minidev/json/JStylerObj;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MPAgressive"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lnet/minidev/json/JStylerObj$1;)V
    .locals 0
    .param p1, "x0"    # Lnet/minidev/json/JStylerObj$1;

    .prologue
    .line 83
    invoke-direct {p0}, Lnet/minidev/json/JStylerObj$MPAgressive;-><init>()V

    return-void
.end method


# virtual methods
.method public mustBeProtect(Ljava/lang/String;)Z
    .locals 10
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const/16 v9, 0x2d

    const/16 v8, 0x39

    const/16 v7, 0x30

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 85
    if-nez p1, :cond_1

    .line 158
    :cond_0
    :goto_0
    return v4

    .line 87
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 88
    .local v2, "len":I
    if-nez v2, :cond_2

    move v4, v5

    .line 89
    goto :goto_0

    .line 91
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    if-eq v6, p1, :cond_3

    move v4, v5

    .line 92
    goto :goto_0

    .line 95
    :cond_3
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 96
    .local v0, "ch":C
    invoke-static {v0}, Lnet/minidev/json/JStylerObj;->isSpecial(C)Z

    move-result v6

    if-nez v6, :cond_4

    invoke-static {v0}, Lnet/minidev/json/JStylerObj;->isUnicode(C)Z

    move-result v6

    if-eqz v6, :cond_5

    :cond_4
    move v4, v5

    .line 97
    goto :goto_0

    .line 99
    :cond_5
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_1
    if-ge v1, v2, :cond_8

    .line 100
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 101
    invoke-static {v0}, Lnet/minidev/json/JStylerObj;->isSpecialClose(C)Z

    move-result v6

    if-nez v6, :cond_6

    invoke-static {v0}, Lnet/minidev/json/JStylerObj;->isUnicode(C)Z

    move-result v6

    if-eqz v6, :cond_7

    :cond_6
    move v4, v5

    .line 102
    goto :goto_0

    .line 99
    :cond_7
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 105
    :cond_8
    invoke-static {p1}, Lnet/minidev/json/JStylerObj;->isKeyword(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_9

    move v4, v5

    .line 106
    goto :goto_0

    .line 108
    :cond_9
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 109
    if-lt v0, v7, :cond_a

    if-le v0, v8, :cond_b

    :cond_a
    if-ne v0, v9, :cond_0

    .line 110
    :cond_b
    const/4 v3, 0x1

    .line 111
    .local v3, "p":I
    :goto_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v3, v6, :cond_c

    .line 112
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 113
    if-lt v0, v7, :cond_c

    if-le v0, v8, :cond_d

    .line 117
    :cond_c
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    if-ne v3, v6, :cond_e

    move v4, v5

    .line 118
    goto :goto_0

    .line 111
    :cond_d
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 119
    :cond_e
    const/16 v6, 0x2e

    if-ne v0, v6, :cond_f

    .line 120
    add-int/lit8 v3, v3, 0x1

    .line 121
    :goto_3
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v3, v6, :cond_f

    .line 122
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 123
    if-lt v0, v7, :cond_f

    if-le v0, v8, :cond_10

    .line 127
    :cond_f
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    if-ne v3, v6, :cond_11

    move v4, v5

    .line 128
    goto/16 :goto_0

    .line 121
    :cond_10
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 130
    :cond_11
    const/16 v6, 0x45

    if-ne v0, v6, :cond_0

    const/16 v6, 0x65

    if-ne v0, v6, :cond_0

    .line 132
    add-int/lit8 v3, v3, 0x1

    .line 133
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    if-eq v3, v6, :cond_0

    .line 135
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 136
    const/16 v6, 0x2b

    if-eq v0, v6, :cond_12

    if-ne v0, v9, :cond_13

    .line 137
    :cond_12
    add-int/lit8 v6, v0, 0x1

    int-to-char v0, v6

    .line 138
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    if-eq v3, v6, :cond_0

    .line 140
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 143
    :cond_13
    const/16 v6, 0x2b

    if-eq v0, v6, :cond_14

    if-ne v0, v9, :cond_15

    .line 144
    :cond_14
    add-int/lit8 v6, v0, 0x1

    int-to-char v0, v6

    .line 145
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    if-eq v3, v6, :cond_0

    .line 149
    :cond_15
    :goto_4
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v3, v6, :cond_16

    .line 150
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 151
    if-lt v0, v7, :cond_16

    if-le v0, v8, :cond_17

    .line 154
    :cond_16
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    if-ne v3, v6, :cond_0

    move v4, v5

    .line 155
    goto/16 :goto_0

    .line 149
    :cond_17
    add-int/lit8 v3, v3, 0x1

    goto :goto_4
.end method
