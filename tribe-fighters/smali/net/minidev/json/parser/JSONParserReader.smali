.class Lnet/minidev/json/parser/JSONParserReader;
.super Lnet/minidev/json/parser/JSONParserStream;
.source "JSONParserReader.java"


# instance fields
.field private in:Ljava/io/Reader;


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .param p1, "permissiveMode"    # I

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lnet/minidev/json/parser/JSONParserStream;-><init>(I)V

    .line 34
    return-void
.end method


# virtual methods
.method public parse(Ljava/io/Reader;)Ljava/lang/Object;
    .locals 2
    .param p1, "in"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 41
    sget-object v0, Lnet/minidev/json/parser/ContainerFactory;->FACTORY_SIMPLE:Lnet/minidev/json/parser/ContainerFactory;

    sget-object v1, Lnet/minidev/json/parser/ContentHandlerDumy;->HANDLER:Lnet/minidev/json/parser/ContentHandlerDumy;

    invoke-virtual {p0, p1, v0, v1}, Lnet/minidev/json/parser/JSONParserReader;->parse(Ljava/io/Reader;Lnet/minidev/json/parser/ContainerFactory;Lnet/minidev/json/parser/ContentHandler;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public parse(Ljava/io/Reader;Lnet/minidev/json/parser/ContainerFactory;)Ljava/lang/Object;
    .locals 1
    .param p1, "in"    # Ljava/io/Reader;
    .param p2, "containerFactory"    # Lnet/minidev/json/parser/ContainerFactory;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 49
    sget-object v0, Lnet/minidev/json/parser/ContentHandlerDumy;->HANDLER:Lnet/minidev/json/parser/ContentHandlerDumy;

    invoke-virtual {p0, p1, p2, v0}, Lnet/minidev/json/parser/JSONParserReader;->parse(Ljava/io/Reader;Lnet/minidev/json/parser/ContainerFactory;Lnet/minidev/json/parser/ContentHandler;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public parse(Ljava/io/Reader;Lnet/minidev/json/parser/ContainerFactory;Lnet/minidev/json/parser/ContentHandler;)Ljava/lang/Object;
    .locals 1
    .param p1, "in"    # Ljava/io/Reader;
    .param p2, "containerFactory"    # Lnet/minidev/json/parser/ContainerFactory;
    .param p3, "handler"    # Lnet/minidev/json/parser/ContentHandler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 58
    iput-object p1, p0, Lnet/minidev/json/parser/JSONParserReader;->in:Ljava/io/Reader;

    .line 59
    invoke-super {p0, p2, p3}, Lnet/minidev/json/parser/JSONParserStream;->parse(Lnet/minidev/json/parser/ContainerFactory;Lnet/minidev/json/parser/ContentHandler;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected read()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 63
    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserReader;->in:Ljava/io/Reader;

    invoke-virtual {v1}, Ljava/io/Reader;->read()I

    move-result v0

    .line 64
    .local v0, "i":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/16 v1, 0x1a

    :goto_0
    iput-char v1, p0, Lnet/minidev/json/parser/JSONParserReader;->c:C

    .line 65
    iget v1, p0, Lnet/minidev/json/parser/JSONParserReader;->pos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lnet/minidev/json/parser/JSONParserReader;->pos:I

    .line 67
    return-void

    .line 64
    :cond_0
    int-to-char v1, v0

    goto :goto_0
.end method

.method protected readNoEnd()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnet/minidev/json/parser/ParseException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 81
    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserReader;->in:Ljava/io/Reader;

    invoke-virtual {v1}, Ljava/io/Reader;->read()I

    move-result v0

    .line 82
    .local v0, "i":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 83
    new-instance v1, Lnet/minidev/json/parser/ParseException;

    iget v2, p0, Lnet/minidev/json/parser/JSONParserReader;->pos:I

    add-int/lit8 v2, v2, -0x1

    const/4 v3, 0x3

    const-string v4, "EOF"

    invoke-direct {v1, v2, v3, v4}, Lnet/minidev/json/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v1

    .line 84
    :cond_0
    int-to-char v1, v0

    iput-char v1, p0, Lnet/minidev/json/parser/JSONParserReader;->c:C

    .line 86
    return-void
.end method

.method protected readS()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 70
    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserReader;->sb:Lnet/minidev/json/parser/JSONParserBase$MSB;

    iget-char v2, p0, Lnet/minidev/json/parser/JSONParserReader;->c:C

    invoke-virtual {v1, v2}, Lnet/minidev/json/parser/JSONParserBase$MSB;->append(C)V

    .line 71
    iget-object v1, p0, Lnet/minidev/json/parser/JSONParserReader;->in:Ljava/io/Reader;

    invoke-virtual {v1}, Ljava/io/Reader;->read()I

    move-result v0

    .line 72
    .local v0, "i":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 73
    const/16 v1, 0x1a

    iput-char v1, p0, Lnet/minidev/json/parser/JSONParserReader;->c:C

    .line 78
    :goto_0
    return-void

    .line 75
    :cond_0
    int-to-char v1, v0

    iput-char v1, p0, Lnet/minidev/json/parser/JSONParserReader;->c:C

    .line 76
    iget v1, p0, Lnet/minidev/json/parser/JSONParserReader;->pos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lnet/minidev/json/parser/JSONParserReader;->pos:I

    goto :goto_0
.end method
