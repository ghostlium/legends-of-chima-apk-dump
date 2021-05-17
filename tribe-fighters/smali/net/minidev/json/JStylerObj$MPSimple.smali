.class Lnet/minidev/json/JStylerObj$MPSimple;
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
    name = "MPSimple"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lnet/minidev/json/JStylerObj$1;)V
    .locals 0
    .param p1, "x0"    # Lnet/minidev/json/JStylerObj$1;

    .prologue
    .line 44
    invoke-direct {p0}, Lnet/minidev/json/JStylerObj$MPSimple;-><init>()V

    return-void
.end method


# virtual methods
.method public mustBeProtect(Ljava/lang/String;)Z
    .locals 6
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    const/4 v4, 0x1

    .line 53
    if-nez p1, :cond_1

    .line 79
    :cond_0
    :goto_0
    return v3

    .line 55
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 56
    .local v2, "len":I
    if-nez v2, :cond_2

    move v3, v4

    .line 57
    goto :goto_0

    .line 58
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    if-eq v5, p1, :cond_3

    move v3, v4

    .line 59
    goto :goto_0

    .line 61
    :cond_3
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 62
    .local v0, "ch":C
    const/16 v5, 0x30

    if-lt v0, v5, :cond_4

    const/16 v5, 0x39

    if-le v0, v5, :cond_5

    :cond_4
    const/16 v5, 0x2d

    if-ne v0, v5, :cond_6

    :cond_5
    move v3, v4

    .line 63
    goto :goto_0

    .line 65
    :cond_6
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, v2, :cond_b

    .line 66
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 67
    invoke-static {v0}, Lnet/minidev/json/JStylerObj;->isSpace(C)Z

    move-result v5

    if-eqz v5, :cond_7

    move v3, v4

    .line 68
    goto :goto_0

    .line 69
    :cond_7
    invoke-static {v0}, Lnet/minidev/json/JStylerObj;->isSpecial(C)Z

    move-result v5

    if-eqz v5, :cond_8

    move v3, v4

    .line 70
    goto :goto_0

    .line 71
    :cond_8
    invoke-static {v0}, Lnet/minidev/json/JStylerObj;->isSpecialChar(C)Z

    move-result v5

    if-eqz v5, :cond_9

    move v3, v4

    .line 72
    goto :goto_0

    .line 73
    :cond_9
    invoke-static {v0}, Lnet/minidev/json/JStylerObj;->isUnicode(C)Z

    move-result v5

    if-eqz v5, :cond_a

    move v3, v4

    .line 74
    goto :goto_0

    .line 65
    :cond_a
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 77
    :cond_b
    invoke-static {p1}, Lnet/minidev/json/JStylerObj;->isKeyword(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    move v3, v4

    .line 78
    goto :goto_0
.end method
