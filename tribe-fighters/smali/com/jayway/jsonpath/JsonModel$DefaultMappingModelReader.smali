.class Lcom/jayway/jsonpath/JsonModel$DefaultMappingModelReader;
.super Ljava/lang/Object;
.source "JsonModel.java"

# interfaces
.implements Lcom/jayway/jsonpath/JsonModel$MappingModelReader;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jayway/jsonpath/JsonModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DefaultMappingModelReader"
.end annotation


# instance fields
.field private model:Ljava/lang/Object;


# direct methods
.method private constructor <init>(Ljava/lang/Object;)V
    .locals 0
    .param p1, "model"    # Ljava/lang/Object;

    .prologue
    .line 1007
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1008
    iput-object p1, p0, Lcom/jayway/jsonpath/JsonModel$DefaultMappingModelReader;->model:Ljava/lang/Object;

    .line 1009
    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/Object;Lcom/jayway/jsonpath/JsonModel$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Lcom/jayway/jsonpath/JsonModel$1;

    .prologue
    .line 1004
    invoke-direct {p0, p1}, Lcom/jayway/jsonpath/JsonModel$DefaultMappingModelReader;-><init>(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public of(Ljava/lang/Class;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1018
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-virtual {p0, p1}, Lcom/jayway/jsonpath/JsonModel$DefaultMappingModelReader;->toListOf(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public to(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 1043
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {}, Lcom/jayway/jsonpath/spi/MappingProviderFactory;->createProvider()Lcom/jayway/jsonpath/spi/MappingProvider;

    move-result-object v0

    iget-object v1, p0, Lcom/jayway/jsonpath/JsonModel$DefaultMappingModelReader;->model:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Lcom/jayway/jsonpath/spi/MappingProvider;->convertValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public toList()Lcom/jayway/jsonpath/JsonModel$ListMappingModelReader;
    .locals 0

    .prologue
    .line 1013
    return-object p0
.end method

.method public toListOf(Ljava/lang/Class;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1023
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iget-object v0, p0, Lcom/jayway/jsonpath/JsonModel$DefaultMappingModelReader;->model:Ljava/lang/Object;

    .line 1024
    .local v0, "modelRef":Ljava/lang/Object;
    instance-of v1, v0, Ljava/util/List;

    if-nez v1, :cond_0

    .line 1025
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 1027
    .end local v0    # "modelRef":Ljava/lang/Object;
    :cond_0
    invoke-static {}, Lcom/jayway/jsonpath/spi/MappingProviderFactory;->createProvider()Lcom/jayway/jsonpath/spi/MappingProvider;

    move-result-object v1

    const-class v2, Ljava/util/List;

    invoke-interface {v1, v0, v2, p1}, Lcom/jayway/jsonpath/spi/MappingProvider;->convertValue(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/Class;)Ljava/util/Collection;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    return-object v1
.end method

.method public toSetOf(Ljava/lang/Class;)Ljava/util/Set;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Ljava/util/Set",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1032
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iget-object v0, p0, Lcom/jayway/jsonpath/JsonModel$DefaultMappingModelReader;->model:Ljava/lang/Object;

    .line 1033
    .local v0, "modelRef":Ljava/lang/Object;
    instance-of v2, v0, Ljava/util/List;

    if-nez v2, :cond_0

    .line 1034
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 1035
    .local v1, "setModel":Ljava/util/Set;
    iget-object v2, p0, Lcom/jayway/jsonpath/JsonModel$DefaultMappingModelReader;->model:Ljava/lang/Object;

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1036
    move-object v0, v1

    .line 1038
    .end local v0    # "modelRef":Ljava/lang/Object;
    .end local v1    # "setModel":Ljava/util/Set;
    :cond_0
    invoke-static {}, Lcom/jayway/jsonpath/spi/MappingProviderFactory;->createProvider()Lcom/jayway/jsonpath/spi/MappingProvider;

    move-result-object v2

    const-class v3, Ljava/util/Set;

    invoke-interface {v2, v0, v3, p1}, Lcom/jayway/jsonpath/spi/MappingProvider;->convertValue(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/Class;)Ljava/util/Collection;

    move-result-object v2

    check-cast v2, Ljava/util/Set;

    return-object v2
.end method
