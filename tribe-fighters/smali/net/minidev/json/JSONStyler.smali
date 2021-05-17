.class public Lnet/minidev/json/JSONStyler;
.super Lnet/minidev/json/JSONStyle;
.source "JSONStyler.java"

# interfaces
.implements Lnet/minidev/json/parser/ContentHandler;


# instance fields
.field deep:I

.field indent:[Ljava/lang/String;

.field out:Ljava/lang/Appendable;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 56
    invoke-direct {p0}, Lnet/minidev/json/JSONStyle;-><init>()V

    .line 27
    const/4 v0, 0x0

    iput v0, p0, Lnet/minidev/json/JSONStyler;->deep:I

    .line 57
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "FLAG"    # I

    .prologue
    .line 32
    invoke-direct {p0, p1}, Lnet/minidev/json/JSONStyle;-><init>(I)V

    .line 27
    const/4 v0, 0x0

    iput v0, p0, Lnet/minidev/json/JSONStyler;->deep:I

    .line 33
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lnet/minidev/json/JSONStyler;->setIdentLevel(I)V

    .line 34
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "FLAG"    # I
    .param p2, "nbLevel"    # I

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lnet/minidev/json/JSONStyle;-><init>(I)V

    .line 27
    const/4 v0, 0x0

    iput v0, p0, Lnet/minidev/json/JSONStyler;->deep:I

    .line 38
    invoke-virtual {p0, p2}, Lnet/minidev/json/JSONStyler;->setIdentLevel(I)V

    .line 39
    return-void
.end method


# virtual methods
.method public endArray()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 113
    iget v0, p0, Lnet/minidev/json/JSONStyler;->deep:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lnet/minidev/json/JSONStyler;->deep:I

    .line 114
    const/4 v0, 0x0

    return v0
.end method

.method public endJSON()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 81
    return-void
.end method

.method public endObject()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 91
    iget v0, p0, Lnet/minidev/json/JSONStyler;->deep:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lnet/minidev/json/JSONStyler;->deep:I

    .line 92
    const/4 v0, 0x0

    return v0
.end method

.method public endObjectEntry()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 102
    const/4 v0, 0x0

    return v0
.end method

.method public getNewLine()Ljava/lang/String;
    .locals 2

    .prologue
    .line 64
    iget v0, p0, Lnet/minidev/json/JSONStyler;->deep:I

    if-gtz v0, :cond_0

    .line 65
    const-string v0, ""

    .line 68
    :goto_0
    return-object v0

    .line 66
    :cond_0
    iget v0, p0, Lnet/minidev/json/JSONStyler;->deep:I

    iget-object v1, p0, Lnet/minidev/json/JSONStyler;->indent:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 67
    iget-object v0, p0, Lnet/minidev/json/JSONStyler;->indent:[Ljava/lang/String;

    iget v1, p0, Lnet/minidev/json/JSONStyler;->deep:I

    aget-object v0, v0, v1

    goto :goto_0

    .line 68
    :cond_1
    iget-object v0, p0, Lnet/minidev/json/JSONStyler;->indent:[Ljava/lang/String;

    iget v1, p0, Lnet/minidev/json/JSONStyler;->deep:I

    add-int/lit8 v1, v1, -0x1

    aget-object v0, v0, v1

    goto :goto_0
.end method

.method public getStyler()Lnet/minidev/json/JSONStyler;
    .locals 0

    .prologue
    .line 72
    return-object p0
.end method

.method public indent()Z
    .locals 1

    .prologue
    .line 60
    const/4 v0, 0x1

    return v0
.end method

.method public primitive(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 119
    const/4 v0, 0x0

    return v0
.end method

.method public setIdentLevel(I)V
    .locals 4
    .param p1, "nbLevel"    # I

    .prologue
    .line 46
    new-array v1, p1, [Ljava/lang/String;

    .line 47
    .local v1, "indent":[Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "\n"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 48
    .local v2, "sb":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p1, :cond_0

    .line 49
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v0

    .line 50
    const/16 v3, 0x20

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 48
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 52
    :cond_0
    iput-object v1, p0, Lnet/minidev/json/JSONStyler;->indent:[Ljava/lang/String;

    .line 53
    return-void
.end method

.method public setOutput(Ljava/lang/Appendable;)V
    .locals 0
    .param p1, "out"    # Ljava/lang/Appendable;

    .prologue
    .line 42
    iput-object p1, p0, Lnet/minidev/json/JSONStyler;->out:Ljava/lang/Appendable;

    .line 43
    return-void
.end method

.method public startArray()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 107
    iget v0, p0, Lnet/minidev/json/JSONStyler;->deep:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lnet/minidev/json/JSONStyler;->deep:I

    .line 108
    const/4 v0, 0x0

    return v0
.end method

.method public startJSON()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 77
    return-void
.end method

.method public startObject()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 85
    iget v0, p0, Lnet/minidev/json/JSONStyler;->deep:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lnet/minidev/json/JSONStyler;->deep:I

    .line 86
    const/4 v0, 0x0

    return v0
.end method

.method public startObjectEntry(Ljava/lang/String;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 97
    const/4 v0, 0x0

    return v0
.end method
