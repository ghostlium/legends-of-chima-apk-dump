.class public Lcom/jayway/jsonpath/spi/impl/JsonSmartJsonProvider;
.super Lcom/jayway/jsonpath/spi/impl/AbstractJsonProvider;
.source "JsonSmartJsonProvider.java"


# instance fields
.field private mode:Lcom/jayway/jsonpath/spi/Mode;

.field private parser:Lnet/minidev/json/parser/JSONParser;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 40
    sget-object v0, Lcom/jayway/jsonpath/spi/Mode;->SLACK:Lcom/jayway/jsonpath/spi/Mode;

    invoke-direct {p0, v0}, Lcom/jayway/jsonpath/spi/impl/JsonSmartJsonProvider;-><init>(Lcom/jayway/jsonpath/spi/Mode;)V

    .line 41
    return-void
.end method

.method public constructor <init>(Lcom/jayway/jsonpath/spi/Mode;)V
    .locals 2
    .param p1, "mode"    # Lcom/jayway/jsonpath/spi/Mode;

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/jayway/jsonpath/spi/impl/AbstractJsonProvider;-><init>()V

    .line 44
    iput-object p1, p0, Lcom/jayway/jsonpath/spi/impl/JsonSmartJsonProvider;->mode:Lcom/jayway/jsonpath/spi/Mode;

    .line 45
    new-instance v0, Lnet/minidev/json/parser/JSONParser;

    invoke-virtual {p1}, Lcom/jayway/jsonpath/spi/Mode;->intValue()I

    move-result v1

    invoke-direct {v0, v1}, Lnet/minidev/json/parser/JSONParser;-><init>(I)V

    iput-object v0, p0, Lcom/jayway/jsonpath/spi/impl/JsonSmartJsonProvider;->parser:Lnet/minidev/json/parser/JSONParser;

    .line 46
    return-void
.end method


# virtual methods
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
    .line 53
    new-instance v0, Lnet/minidev/json/JSONArray;

    invoke-direct {v0}, Lnet/minidev/json/JSONArray;-><init>()V

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
    .line 49
    new-instance v0, Lnet/minidev/json/JSONObject;

    invoke-direct {v0}, Lnet/minidev/json/JSONObject;-><init>()V

    return-object v0
.end method

.method public getMode()Lcom/jayway/jsonpath/spi/Mode;
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lcom/jayway/jsonpath/spi/impl/JsonSmartJsonProvider;->mode:Lcom/jayway/jsonpath/spi/Mode;

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
    .line 76
    :try_start_0
    iget-object v1, p0, Lcom/jayway/jsonpath/spi/impl/JsonSmartJsonProvider;->parser:Lnet/minidev/json/parser/JSONParser;

    new-instance v2, Ljava/io/InputStreamReader;

    invoke-direct {v2, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v1, v2}, Lnet/minidev/json/parser/JSONParser;->parse(Ljava/io/Reader;)Ljava/lang/Object;
    :try_end_0
    .catch Lnet/minidev/json/parser/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 77
    :catch_0
    move-exception v0

    .line 78
    .local v0, "e":Lnet/minidev/json/parser/ParseException;
    new-instance v1, Lcom/jayway/jsonpath/InvalidJsonException;

    invoke-direct {v1, v0}, Lcom/jayway/jsonpath/InvalidJsonException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public parse(Ljava/io/Reader;)Ljava/lang/Object;
    .locals 2
    .param p1, "jsonReader"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jayway/jsonpath/InvalidJsonException;
        }
    .end annotation

    .prologue
    .line 67
    :try_start_0
    iget-object v1, p0, Lcom/jayway/jsonpath/spi/impl/JsonSmartJsonProvider;->parser:Lnet/minidev/json/parser/JSONParser;

    invoke-virtual {v1, p1}, Lnet/minidev/json/parser/JSONParser;->parse(Ljava/io/Reader;)Ljava/lang/Object;
    :try_end_0
    .catch Lnet/minidev/json/parser/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 68
    :catch_0
    move-exception v0

    .line 69
    .local v0, "e":Lnet/minidev/json/parser/ParseException;
    new-instance v1, Lcom/jayway/jsonpath/InvalidJsonException;

    invoke-direct {v1, v0}, Lcom/jayway/jsonpath/InvalidJsonException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public parse(Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .param p1, "json"    # Ljava/lang/String;

    .prologue
    .line 58
    :try_start_0
    iget-object v1, p0, Lcom/jayway/jsonpath/spi/impl/JsonSmartJsonProvider;->parser:Lnet/minidev/json/parser/JSONParser;

    invoke-virtual {v1, p1}, Lnet/minidev/json/parser/JSONParser;->parse(Ljava/lang/String;)Ljava/lang/Object;
    :try_end_0
    .catch Lnet/minidev/json/parser/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 59
    :catch_0
    move-exception v0

    .line 60
    .local v0, "e":Lnet/minidev/json/parser/ParseException;
    new-instance v1, Lcom/jayway/jsonpath/InvalidJsonException;

    invoke-direct {v1, v0}, Lcom/jayway/jsonpath/InvalidJsonException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public toJson(Ljava/lang/Object;)Ljava/lang/String;
    .locals 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 85
    instance-of v0, p1, Ljava/util/Map;

    if-eqz v0, :cond_0

    .line 86
    check-cast p1, Ljava/util/Map;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-static {p1}, Lnet/minidev/json/JSONObject;->toJSONString(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    .line 88
    :goto_0
    return-object v0

    .line 87
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_0
    instance-of v0, p1, Ljava/util/List;

    if-eqz v0, :cond_1

    .line 88
    check-cast p1, Ljava/util/List;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-static {p1}, Lnet/minidev/json/JSONArray;->toJSONString(Ljava/util/List;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 90
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_1
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " can not be converted to JSON"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
