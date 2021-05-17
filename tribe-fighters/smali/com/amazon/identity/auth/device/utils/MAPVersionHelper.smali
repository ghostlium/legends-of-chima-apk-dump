.class public final Lcom/amazon/identity/auth/device/utils/MAPVersionHelper;
.super Ljava/lang/Object;
.source "MAPVersionHelper.java"


# static fields
.field private static final DELIMETER:Ljava/lang/String; = "\\."


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getVersionAsString([I)Ljava/lang/String;
    .locals 4
    .param p0, "version"    # [I

    .prologue
    .line 23
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 24
    .local v0, "buffer":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_0

    .line 26
    aget v2, p0, v1

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 27
    const/16 v2, 0x2e

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 24
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 30
    :cond_0
    const/4 v2, 0x0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuffer;->substring(II)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static getVersionInfo(Ljava/lang/String;)[I
    .locals 12
    .param p0, "version"    # Ljava/lang/String;

    .prologue
    .line 43
    const-string v9, "\\."

    invoke-virtual {p0, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 44
    .local v6, "splits":[Ljava/lang/String;
    array-length v9, v6

    const/4 v10, 0x1

    if-lt v9, v10, :cond_0

    .line 46
    array-length v9, v6

    new-array v8, v9, [I

    .line 48
    .local v8, "versions":[I
    const/4 v2, 0x0

    .line 49
    .local v2, "i":I
    move-object v0, v6

    .local v0, "arr$":[Ljava/lang/String;
    :try_start_0
    array-length v5, v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    move v3, v2

    .end local v2    # "i":I
    .local v3, "i":I
    :goto_0
    if-ge v4, v5, :cond_1

    :try_start_1
    aget-object v7, v0, v4
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    .line 51
    .local v7, "versionInt":Ljava/lang/String;
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "i":I
    .restart local v2    # "i":I
    :try_start_2
    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    aput v9, v8, v3
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_0

    .line 49
    add-int/lit8 v4, v4, 0x1

    move v3, v2

    .end local v2    # "i":I
    .restart local v3    # "i":I
    goto :goto_0

    .line 53
    .end local v3    # "i":I
    .end local v4    # "i$":I
    .end local v5    # "len$":I
    .end local v7    # "versionInt":Ljava/lang/String;
    .restart local v2    # "i":I
    :catch_0
    move-exception v1

    .line 54
    .local v1, "e":Ljava/lang/NumberFormatException;
    :goto_1
    new-instance v9, Ljava/security/InvalidParameterException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "getVersionInfo: version ("

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ") must be in format of X[.X.X]... - where X must be an integer"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 59
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "e":Ljava/lang/NumberFormatException;
    .end local v2    # "i":I
    .end local v8    # "versions":[I
    :cond_0
    new-instance v9, Ljava/security/InvalidParameterException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "version ("

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ") must be in format of X.X.X"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 61
    .restart local v0    # "arr$":[Ljava/lang/String;
    .restart local v3    # "i":I
    .restart local v4    # "i$":I
    .restart local v5    # "len$":I
    .restart local v8    # "versions":[I
    :cond_1
    return-object v8

    .line 53
    :catch_1
    move-exception v1

    move v2, v3

    .end local v3    # "i":I
    .restart local v2    # "i":I
    goto :goto_1
.end method
