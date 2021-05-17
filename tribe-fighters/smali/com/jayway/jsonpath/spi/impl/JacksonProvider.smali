.class public Lcom/jayway/jsonpath/spi/impl/JacksonProvider;
.super Lcom/jayway/jsonpath/spi/impl/AbstractJsonProvider;
.source "JacksonProvider.java"

# interfaces
.implements Lcom/jayway/jsonpath/spi/MappingProvider;


# instance fields
.field private objectMapper:Lorg/codehaus/jackson/map/ObjectMapper;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/jayway/jsonpath/spi/impl/AbstractJsonProvider;-><init>()V

    .line 35
    new-instance v0, Lorg/codehaus/jackson/map/ObjectMapper;

    invoke-direct {v0}, Lorg/codehaus/jackson/map/ObjectMapper;-><init>()V

    iput-object v0, p0, Lcom/jayway/jsonpath/spi/impl/JacksonProvider;->objectMapper:Lorg/codehaus/jackson/map/ObjectMapper;

    return-void
.end method


# virtual methods
.method public convertValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .param p1, "fromValue"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 100
    .local p2, "toValueType":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iget-object v0, p0, Lcom/jayway/jsonpath/spi/impl/JacksonProvider;->objectMapper:Lorg/codehaus/jackson/map/ObjectMapper;

    invoke-virtual {v0, p1, p2}, Lorg/codehaus/jackson/map/ObjectMapper;->convertValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public convertValue(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/Class;)Ljava/util/Collection;
    .locals 2
    .param p1, "fromValue"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/util/Collection",
            "<TE;>;E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/lang/Class",
            "<TE;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 106
    .local p2, "collectionType":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p3, "elementType":Ljava/lang/Class;, "Ljava/lang/Class<TE;>;"
    iget-object v1, p0, Lcom/jayway/jsonpath/spi/impl/JacksonProvider;->objectMapper:Lorg/codehaus/jackson/map/ObjectMapper;

    invoke-virtual {v1}, Lorg/codehaus/jackson/map/ObjectMapper;->getTypeFactory()Lorg/codehaus/jackson/map/type/TypeFactory;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Lorg/codehaus/jackson/map/type/TypeFactory;->constructCollectionType(Ljava/lang/Class;Ljava/lang/Class;)Lorg/codehaus/jackson/map/type/CollectionType;

    move-result-object v0

    .line 108
    .local v0, "colType":Lorg/codehaus/jackson/map/type/CollectionType;
    iget-object v1, p0, Lcom/jayway/jsonpath/spi/impl/JacksonProvider;->objectMapper:Lorg/codehaus/jackson/map/ObjectMapper;

    invoke-virtual {v1, p1, v0}, Lorg/codehaus/jackson/map/ObjectMapper;->convertValue(Ljava/lang/Object;Lorg/codehaus/jackson/type/JavaType;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Collection;

    return-object v1
.end method

.method public createList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 89
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    return-object v0
.end method

.method public createMap()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 84
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    return-object v0
.end method

.method public getMode()Lcom/jayway/jsonpath/spi/Mode;
    .locals 1

    .prologue
    .line 39
    sget-object v0, Lcom/jayway/jsonpath/spi/Mode;->STRICT:Lcom/jayway/jsonpath/spi/Mode;

    return-object v0
.end method

.method public parse(Ljava/io/InputStream;)Ljava/lang/Object;
    .locals 3
    .param p1, "jsonStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jayway/jsonpath/InvalidJsonException;
        }
    .end annotation

    .prologue
    .line 63
    :try_start_0
    iget-object v1, p0, Lcom/jayway/jsonpath/spi/impl/JacksonProvider;->objectMapper:Lorg/codehaus/jackson/map/ObjectMapper;

    const-class v2, Ljava/lang/Object;

    invoke-virtual {v1, p1, v2}, Lorg/codehaus/jackson/map/ObjectMapper;->readValue(Ljava/io/InputStream;Ljava/lang/Class;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 64
    :catch_0
    move-exception v0

    .line 65
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/jayway/jsonpath/InvalidJsonException;

    invoke-direct {v1, v0}, Lcom/jayway/jsonpath/InvalidJsonException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public parse(Ljava/io/Reader;)Ljava/lang/Object;
    .locals 3
    .param p1, "jsonReader"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jayway/jsonpath/InvalidJsonException;
        }
    .end annotation

    .prologue
    .line 54
    :try_start_0
    iget-object v1, p0, Lcom/jayway/jsonpath/spi/impl/JacksonProvider;->objectMapper:Lorg/codehaus/jackson/map/ObjectMapper;

    const-class v2, Ljava/lang/Object;

    invoke-virtual {v1, p1, v2}, Lorg/codehaus/jackson/map/ObjectMapper;->readValue(Ljava/io/Reader;Ljava/lang/Class;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 55
    :catch_0
    move-exception v0

    .line 56
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/jayway/jsonpath/InvalidJsonException;

    invoke-direct {v1, v0}, Lcom/jayway/jsonpath/InvalidJsonException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public parse(Ljava/lang/String;)Ljava/lang/Object;
    .locals 3
    .param p1, "json"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jayway/jsonpath/InvalidJsonException;
        }
    .end annotation

    .prologue
    .line 45
    :try_start_0
    iget-object v1, p0, Lcom/jayway/jsonpath/spi/impl/JacksonProvider;->objectMapper:Lorg/codehaus/jackson/map/ObjectMapper;

    const-class v2, Ljava/lang/Object;

    invoke-virtual {v1, p1, v2}, Lorg/codehaus/jackson/map/ObjectMapper;->readValue(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 46
    :catch_0
    move-exception v0

    .line 47
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/jayway/jsonpath/InvalidJsonException;

    invoke-direct {v1, v0}, Lcom/jayway/jsonpath/InvalidJsonException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public toJson(Ljava/lang/Object;)Ljava/lang/String;
    .locals 4
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 71
    new-instance v2, Ljava/io/StringWriter;

    invoke-direct {v2}, Ljava/io/StringWriter;-><init>()V

    .line 73
    .local v2, "writer":Ljava/io/StringWriter;
    :try_start_0
    iget-object v3, p0, Lcom/jayway/jsonpath/spi/impl/JacksonProvider;->objectMapper:Lorg/codehaus/jackson/map/ObjectMapper;

    invoke-virtual {v3}, Lorg/codehaus/jackson/map/ObjectMapper;->getJsonFactory()Lorg/codehaus/jackson/JsonFactory;

    move-result-object v3

    invoke-virtual {v3, v2}, Lorg/codehaus/jackson/JsonFactory;->createJsonGenerator(Ljava/io/Writer;)Lorg/codehaus/jackson/JsonGenerator;

    move-result-object v1

    .line 74
    .local v1, "jsonGenerator":Lorg/codehaus/jackson/JsonGenerator;
    iget-object v3, p0, Lcom/jayway/jsonpath/spi/impl/JacksonProvider;->objectMapper:Lorg/codehaus/jackson/map/ObjectMapper;

    invoke-virtual {v3, v1, p1}, Lorg/codehaus/jackson/map/ObjectMapper;->writeValue(Lorg/codehaus/jackson/JsonGenerator;Ljava/lang/Object;)V

    .line 75
    invoke-virtual {v2}, Ljava/io/StringWriter;->close()V

    .line 76
    invoke-virtual {v2}, Ljava/io/StringWriter;->getBuffer()Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    return-object v3

    .line 77
    .end local v1    # "jsonGenerator":Lorg/codehaus/jackson/JsonGenerator;
    :catch_0
    move-exception v0

    .line 78
    .local v0, "e":Ljava/io/IOException;
    new-instance v3, Lcom/jayway/jsonpath/InvalidJsonException;

    invoke-direct {v3}, Lcom/jayway/jsonpath/InvalidJsonException;-><init>()V

    throw v3
.end method
