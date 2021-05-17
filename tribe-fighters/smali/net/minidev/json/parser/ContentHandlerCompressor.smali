.class public Lnet/minidev/json/parser/ContentHandlerCompressor;
.super Ljava/lang/Object;
.source "ContentHandlerCompressor.java"

# interfaces
.implements Lnet/minidev/json/parser/ContentHandler;


# instance fields
.field compression:Lnet/minidev/json/JSONStyle;

.field out:Ljava/lang/Appendable;

.field pos:I

.field stack:[I


# direct methods
.method public constructor <init>(Ljava/lang/Appendable;Lnet/minidev/json/JSONStyle;)V
    .locals 1
    .param p1, "out"    # Ljava/lang/Appendable;
    .param p2, "compression"    # Lnet/minidev/json/JSONStyle;

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    const/16 v0, 0xa

    new-array v0, v0, [I

    iput-object v0, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->stack:[I

    .line 52
    iput-object p1, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->out:Ljava/lang/Appendable;

    .line 53
    iput-object p2, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->compression:Lnet/minidev/json/JSONStyle;

    .line 54
    return-void
.end method

.method private isInArray()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 48
    iget-object v1, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->stack:[I

    iget v2, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->pos:I

    aget v1, v1, v2

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isInObject()Z
    .locals 2

    .prologue
    .line 44
    iget-object v0, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->stack:[I

    iget v1, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->pos:I

    aget v0, v0, v1

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private push(I)V
    .locals 4
    .param p1, "type"    # I

    .prologue
    const/4 v3, 0x0

    .line 33
    iget v1, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->pos:I

    add-int/lit8 v1, v1, 0x2

    iput v1, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->pos:I

    .line 34
    iget v1, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->pos:I

    iget-object v2, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->stack:[I

    array-length v2, v2

    if-lt v1, v2, :cond_0

    .line 35
    iget-object v1, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->stack:[I

    array-length v1, v1

    mul-int/lit8 v1, v1, 0x2

    new-array v0, v1, [I

    .line 36
    .local v0, "tmp":[I
    iget-object v1, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->stack:[I

    iget-object v2, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->stack:[I

    array-length v2, v2

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 37
    iput-object v0, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->stack:[I

    .line 39
    .end local v0    # "tmp":[I
    :cond_0
    iget-object v1, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->stack:[I

    iget v2, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->pos:I

    aput p1, v1, v2

    .line 40
    iget-object v1, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->stack:[I

    iget v2, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->pos:I

    add-int/lit8 v2, v2, 0x1

    aput v3, v1, v2

    .line 41
    return-void
.end method


# virtual methods
.method public endArray()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 115
    iget-object v0, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->out:Ljava/lang/Appendable;

    const/16 v1, 0x5d

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 116
    iget v0, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->pos:I

    add-int/lit8 v0, v0, -0x2

    iput v0, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->pos:I

    .line 117
    const/4 v0, 0x0

    return v0
.end method

.method public endJSON()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 62
    return-void
.end method

.method public endObject()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 76
    iget-object v0, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->out:Ljava/lang/Appendable;

    const/16 v1, 0x7d

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 77
    iget v0, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->pos:I

    add-int/lit8 v0, v0, -0x2

    iput v0, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->pos:I

    .line 79
    const/4 v0, 0x0

    return v0
.end method

.method public endObjectEntry()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 101
    const/4 v0, 0x0

    return v0
.end method

.method public primitive(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x22

    .line 122
    invoke-direct {p0}, Lnet/minidev/json/parser/ContentHandlerCompressor;->isInObject()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->stack:[I

    iget v1, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->pos:I

    add-int/lit8 v1, v1, 0x1

    aget v2, v0, v1

    add-int/lit8 v3, v2, 0x1

    aput v3, v0, v1

    if-lez v2, :cond_0

    .line 123
    iget-object v0, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->out:Ljava/lang/Appendable;

    const/16 v1, 0x2c

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 125
    :cond_0
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 126
    iget-object v1, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->compression:Lnet/minidev/json/JSONStyle;

    move-object v0, p1

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Lnet/minidev/json/JSONStyle;->mustProtectValue(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 127
    iget-object v0, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->out:Ljava/lang/Appendable;

    check-cast p1, Ljava/lang/String;

    .end local p1    # "value":Ljava/lang/Object;
    invoke-interface {v0, p1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 135
    :goto_0
    const/4 v0, 0x0

    return v0

    .line 129
    .restart local p1    # "value":Ljava/lang/Object;
    :cond_1
    iget-object v0, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->out:Ljava/lang/Appendable;

    invoke-interface {v0, v4}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 130
    check-cast p1, Ljava/lang/String;

    .end local p1    # "value":Ljava/lang/Object;
    iget-object v0, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->out:Ljava/lang/Appendable;

    iget-object v1, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->compression:Lnet/minidev/json/JSONStyle;

    invoke-static {p1, v0, v1}, Lnet/minidev/json/JSONValue;->escape(Ljava/lang/String;Ljava/lang/Appendable;Lnet/minidev/json/JSONStyle;)V

    .line 131
    iget-object v0, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->out:Ljava/lang/Appendable;

    invoke-interface {v0, v4}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    goto :goto_0

    .line 134
    .restart local p1    # "value":Ljava/lang/Object;
    :cond_2
    iget-object v0, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->out:Ljava/lang/Appendable;

    iget-object v1, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->compression:Lnet/minidev/json/JSONStyle;

    invoke-static {p1, v0, v1}, Lnet/minidev/json/JSONValue;->writeJSONString(Ljava/lang/Object;Ljava/lang/Appendable;Lnet/minidev/json/JSONStyle;)V

    goto :goto_0
.end method

.method public startArray()Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 106
    invoke-direct {p0}, Lnet/minidev/json/parser/ContentHandlerCompressor;->isInArray()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->stack:[I

    iget v1, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->pos:I

    add-int/lit8 v1, v1, 0x1

    aget v2, v0, v1

    add-int/lit8 v3, v2, 0x1

    aput v3, v0, v1

    if-lez v2, :cond_0

    .line 107
    iget-object v0, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->out:Ljava/lang/Appendable;

    const/16 v1, 0x2c

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 108
    :cond_0
    iget-object v0, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->out:Ljava/lang/Appendable;

    const/16 v1, 0x5b

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 109
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lnet/minidev/json/parser/ContentHandlerCompressor;->push(I)V

    .line 110
    const/4 v0, 0x0

    return v0
.end method

.method public startJSON()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 58
    return-void
.end method

.method public startObject()Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 66
    invoke-direct {p0}, Lnet/minidev/json/parser/ContentHandlerCompressor;->isInArray()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->stack:[I

    iget v1, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->pos:I

    add-int/lit8 v1, v1, 0x1

    aget v2, v0, v1

    add-int/lit8 v3, v2, 0x1

    aput v3, v0, v1

    if-lez v2, :cond_0

    .line 67
    iget-object v0, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->out:Ljava/lang/Appendable;

    const/16 v1, 0x2c

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 68
    :cond_0
    iget-object v0, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->out:Ljava/lang/Appendable;

    const/16 v1, 0x7b

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 69
    invoke-direct {p0, v4}, Lnet/minidev/json/parser/ContentHandlerCompressor;->push(I)V

    .line 71
    return v4
.end method

.method public startObjectEntry(Ljava/lang/String;)Z
    .locals 5
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x22

    .line 84
    iget-object v0, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->stack:[I

    iget v1, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->pos:I

    add-int/lit8 v1, v1, 0x1

    aget v2, v0, v1

    add-int/lit8 v3, v2, 0x1

    aput v3, v0, v1

    if-lez v2, :cond_0

    .line 85
    iget-object v0, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->out:Ljava/lang/Appendable;

    const/16 v1, 0x2c

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 86
    :cond_0
    if-nez p1, :cond_1

    .line 87
    iget-object v0, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->out:Ljava/lang/Appendable;

    const-string v1, "null"

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 95
    :goto_0
    iget-object v0, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->out:Ljava/lang/Appendable;

    const/16 v1, 0x3a

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 96
    const/4 v0, 0x0

    return v0

    .line 88
    :cond_1
    iget-object v0, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->compression:Lnet/minidev/json/JSONStyle;

    invoke-virtual {v0, p1}, Lnet/minidev/json/JSONStyle;->mustProtectKey(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 89
    iget-object v0, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->out:Ljava/lang/Appendable;

    invoke-interface {v0, p1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_0

    .line 91
    :cond_2
    iget-object v0, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->out:Ljava/lang/Appendable;

    invoke-interface {v0, v4}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 92
    iget-object v0, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->out:Ljava/lang/Appendable;

    iget-object v1, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->compression:Lnet/minidev/json/JSONStyle;

    invoke-static {p1, v0, v1}, Lnet/minidev/json/JSONValue;->escape(Ljava/lang/String;Ljava/lang/Appendable;Lnet/minidev/json/JSONStyle;)V

    .line 93
    iget-object v0, p0, Lnet/minidev/json/parser/ContentHandlerCompressor;->out:Ljava/lang/Appendable;

    invoke-interface {v0, v4}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    goto :goto_0
.end method
