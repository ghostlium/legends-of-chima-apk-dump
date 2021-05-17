.class public Lcom/jayway/jsonpath/internal/JsonFormatter;
.super Ljava/lang/Object;
.source "JsonFormatter.java"


# static fields
.field private static final INDENT:Ljava/lang/String; = "   "

.field private static final NEW_LINE:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 7
    const-string v0, "line.separator"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/jayway/jsonpath/internal/JsonFormatter;->NEW_LINE:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static appendIndent(Ljava/lang/StringBuilder;I)V
    .locals 1
    .param p0, "sb"    # Ljava/lang/StringBuilder;
    .param p1, "count"    # I

    .prologue
    .line 11
    :goto_0
    if-lez p1, :cond_0

    const-string v0, "   "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 p1, p1, -0x1

    goto :goto_0

    .line 12
    :cond_0
    return-void
.end method

.method private static isEscaped(Ljava/lang/StringBuilder;I)Z
    .locals 3
    .param p0, "sb"    # Ljava/lang/StringBuilder;
    .param p1, "index"    # I

    .prologue
    .line 16
    const/4 v0, 0x0

    .line 17
    .local v0, "escaped":Z
    :goto_0
    if-lez p1, :cond_1

    add-int/lit8 p1, p1, -0x1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v1

    const/16 v2, 0x5c

    if-ne v1, v2, :cond_1

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_1
    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    .line 18
    :cond_1
    return v0
.end method

.method public static prettyPrint(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "input"    # Ljava/lang/String;

    .prologue
    .line 23
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    mul-int/lit8 v5, v5, 0x2

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 24
    .local v3, "output":Ljava/lang/StringBuilder;
    const/4 v4, 0x0

    .line 25
    .local v4, "quoteOpened":Z
    const/4 v1, 0x0

    .line 27
    .local v1, "depth":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v2, v5, :cond_5

    .line 29
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 31
    .local v0, "ch":C
    sparse-switch v0, :sswitch_data_0

    .line 76
    if-nez v4, :cond_0

    const/16 v5, 0x20

    if-eq v0, v5, :cond_1

    .line 77
    :cond_0
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 27
    :cond_1
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 35
    :sswitch_0
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 36
    if-nez v4, :cond_1

    .line 38
    sget-object v5, Lcom/jayway/jsonpath/internal/JsonFormatter;->NEW_LINE:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    add-int/lit8 v1, v1, 0x1

    invoke-static {v3, v1}, Lcom/jayway/jsonpath/internal/JsonFormatter;->appendIndent(Ljava/lang/StringBuilder;I)V

    goto :goto_1

    .line 44
    :sswitch_1
    if-eqz v4, :cond_2

    .line 45
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 48
    :cond_2
    sget-object v5, Lcom/jayway/jsonpath/internal/JsonFormatter;->NEW_LINE:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    add-int/lit8 v1, v1, -0x1

    invoke-static {v3, v1}, Lcom/jayway/jsonpath/internal/JsonFormatter;->appendIndent(Ljava/lang/StringBuilder;I)V

    .line 50
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 55
    :sswitch_2
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 56
    if-eqz v4, :cond_3

    .line 58
    invoke-static {v3, v2}, Lcom/jayway/jsonpath/internal/JsonFormatter;->isEscaped(Ljava/lang/StringBuilder;I)Z

    move-result v5

    if-nez v5, :cond_1

    .line 59
    const/4 v4, 0x0

    goto :goto_1

    .line 61
    :cond_3
    const/4 v4, 0x1

    .line 62
    goto :goto_1

    .line 64
    :sswitch_3
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 65
    if-nez v4, :cond_1

    .line 67
    sget-object v5, Lcom/jayway/jsonpath/internal/JsonFormatter;->NEW_LINE:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    invoke-static {v3, v1}, Lcom/jayway/jsonpath/internal/JsonFormatter;->appendIndent(Ljava/lang/StringBuilder;I)V

    goto :goto_1

    .line 72
    :sswitch_4
    if-eqz v4, :cond_4

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 73
    :cond_4
    const-string v5, " : "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 81
    .end local v0    # "ch":C
    :cond_5
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 31
    nop

    :sswitch_data_0
    .sparse-switch
        0x22 -> :sswitch_2
        0x27 -> :sswitch_2
        0x2c -> :sswitch_3
        0x3a -> :sswitch_4
        0x5b -> :sswitch_0
        0x5d -> :sswitch_1
        0x7b -> :sswitch_0
        0x7d -> :sswitch_1
    .end sparse-switch
.end method
