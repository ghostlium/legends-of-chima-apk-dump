.class public abstract Lcom/jayway/jsonpath/spi/impl/AbstractJsonProvider;
.super Ljava/lang/Object;
.source "AbstractJsonProvider.java"

# interfaces
.implements Lcom/jayway/jsonpath/spi/JsonProvider;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public clone(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 31
    check-cast p1, Ljava/io/Serializable;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-static {p1}, Lorg/apache/commons/lang/SerializationUtils;->clone(Ljava/io/Serializable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getMapValue(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "map"    # Ljava/lang/Object;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 85
    invoke-virtual {p0, p1}, Lcom/jayway/jsonpath/spi/impl/AbstractJsonProvider;->toMap(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public isContainer(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 41
    invoke-virtual {p0, p1}, Lcom/jayway/jsonpath/spi/impl/AbstractJsonProvider;->isList(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/jayway/jsonpath/spi/impl/AbstractJsonProvider;->isMap(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isList(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 51
    instance-of v0, p1, Ljava/util/List;

    return v0
.end method

.method public isMap(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 95
    instance-of v0, p1, Ljava/util/Map;

    return v0
.end method

.method public toList(Ljava/lang/Object;)Ljava/util/List;
    .locals 0
    .param p1, "list"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 62
    check-cast p1, Ljava/util/List;

    .end local p1    # "list":Ljava/lang/Object;
    return-object p1
.end method

.method public toMap(Ljava/lang/Object;)Ljava/util/Map;
    .locals 0
    .param p1, "map"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 74
    check-cast p1, Ljava/util/Map;

    .end local p1    # "map":Ljava/lang/Object;
    return-object p1
.end method
