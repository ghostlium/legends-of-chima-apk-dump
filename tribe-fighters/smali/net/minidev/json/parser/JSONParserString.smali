.class Lnet/minidev/json/parser/JSONParserString;
.super Lnet/minidev/json/parser/JSONParserMemory;
.source "JSONParserString.java"


# instance fields
.field private in:Ljava/lang/String;


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .param p1, "permissiveMode"    # I

    .prologue
    .line 29
    invoke-direct {p0, p1}, Lnet/minidev/json/parser/JSONParserMemory;-><init>(I)V

    .line 30
    return-void
.end method


# virtual methods
.method protected extractString(II)V
    .locals 1
    .param p1, "beginIndex"    # I
    .param p2, "endIndex"    # I

    .prologue
    .line 59
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParserString;->in:Ljava/lang/String;

    invoke-virtual {v0, p1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lnet/minidev/json/parser/JSONParserString;->xs:Ljava/lang/String;

    .line 60
    return-void
.end method

.method protected indexOf(CI)I
    .locals 1
    .param p1, "c"    # C
    .param p2, "pos"    # I

    .prologue
    .line 63
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParserString;->in:Ljava/lang/String;

    invoke-virtual {v0, p1, p2}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    return v0
.end method

.method public parse(Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .param p1, "in"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 37
    sget-object v0, Lnet/minidev/json/parser/ContainerFactory;->FACTORY_SIMPLE:Lnet/minidev/json/parser/ContainerFactory;

    sget-object v1, Lnet/minidev/json/parser/ContentHandlerDumy;->HANDLER:Lnet/minidev/json/parser/ContentHandlerDumy;

    invoke-virtual {p0, p1, v0, v1}, Lnet/minidev/json/parser/JSONParserString;->parse(Ljava/lang/String;Lnet/minidev/json/parser/ContainerFactory;Lnet/minidev/json/parser/ContentHandler;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public parse(Ljava/lang/String;Lnet/minidev/json/parser/ContainerFactory;)Ljava/lang/Object;
    .locals 1
    .param p1, "in"    # Ljava/lang/String;
    .param p2, "containerFactory"    # Lnet/minidev/json/parser/ContainerFactory;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 45
    sget-object v0, Lnet/minidev/json/parser/ContentHandlerDumy;->HANDLER:Lnet/minidev/json/parser/ContentHandlerDumy;

    invoke-virtual {p0, p1, p2, v0}, Lnet/minidev/json/parser/JSONParserString;->parse(Ljava/lang/String;Lnet/minidev/json/parser/ContainerFactory;Lnet/minidev/json/parser/ContentHandler;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public parse(Ljava/lang/String;Lnet/minidev/json/parser/ContainerFactory;Lnet/minidev/json/parser/ContentHandler;)Ljava/lang/Object;
    .locals 1
    .param p1, "in"    # Ljava/lang/String;
    .param p2, "containerFactory"    # Lnet/minidev/json/parser/ContainerFactory;
    .param p3, "handler"    # Lnet/minidev/json/parser/ContentHandler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 53
    iput-object p1, p0, Lnet/minidev/json/parser/JSONParserString;->in:Ljava/lang/String;

    .line 54
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    iput v0, p0, Lnet/minidev/json/parser/JSONParserString;->len:I

    .line 55
    invoke-virtual {p0, p2, p3}, Lnet/minidev/json/parser/JSONParserString;->parse(Lnet/minidev/json/parser/ContainerFactory;Lnet/minidev/json/parser/ContentHandler;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected read()V
    .locals 2

    .prologue
    .line 67
    iget v0, p0, Lnet/minidev/json/parser/JSONParserString;->pos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lnet/minidev/json/parser/JSONParserString;->pos:I

    iget v1, p0, Lnet/minidev/json/parser/JSONParserString;->len:I

    if-lt v0, v1, :cond_0

    .line 68
    const/16 v0, 0x1a

    iput-char v0, p0, Lnet/minidev/json/parser/JSONParserString;->c:C

    .line 71
    :goto_0
    return-void

    .line 70
    :cond_0
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParserString;->in:Ljava/lang/String;

    iget v1, p0, Lnet/minidev/json/parser/JSONParserString;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    iput-char v0, p0, Lnet/minidev/json/parser/JSONParserString;->c:C

    goto :goto_0
.end method

.method protected readNoEnd()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 86
    iget v0, p0, Lnet/minidev/json/parser/JSONParserString;->pos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lnet/minidev/json/parser/JSONParserString;->pos:I

    iget v1, p0, Lnet/minidev/json/parser/JSONParserString;->len:I

    if-lt v0, v1, :cond_0

    .line 87
    const/16 v0, 0x1a

    iput-char v0, p0, Lnet/minidev/json/parser/JSONParserString;->c:C

    .line 88
    new-instance v0, Lnet/minidev/json/parser/ParseException;

    iget v1, p0, Lnet/minidev/json/parser/JSONParserString;->pos:I

    add-int/lit8 v1, v1, -0x1

    const/4 v2, 0x3

    const-string v3, "EOF"

    invoke-direct {v0, v1, v2, v3}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v0

    .line 90
    :cond_0
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParserString;->in:Ljava/lang/String;

    iget v1, p0, Lnet/minidev/json/parser/JSONParserString;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    iput-char v0, p0, Lnet/minidev/json/parser/JSONParserString;->c:C

    .line 91
    return-void
.end method

.method protected readS()V
    .locals 2

    .prologue
    .line 77
    iget v0, p0, Lnet/minidev/json/parser/JSONParserString;->pos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lnet/minidev/json/parser/JSONParserString;->pos:I

    iget v1, p0, Lnet/minidev/json/parser/JSONParserString;->len:I

    if-lt v0, v1, :cond_0

    .line 78
    const/16 v0, 0x1a

    iput-char v0, p0, Lnet/minidev/json/parser/JSONParserString;->c:C

    .line 81
    :goto_0
    return-void

    .line 80
    :cond_0
    iget-object v0, p0, Lnet/minidev/json/parser/JSONParserString;->in:Ljava/lang/String;

    iget v1, p0, Lnet/minidev/json/parser/JSONParserString;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    iput-char v0, p0, Lnet/minidev/json/parser/JSONParserString;->c:C

    goto :goto_0
.end method
