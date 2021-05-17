.class Lcom/jayway/jsonpath/JsonModel$DefaultObjectOps;
.super Ljava/lang/Object;
.source "JsonModel.java"

# interfaces
.implements Lcom/jayway/jsonpath/JsonModel$ObjectOps;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jayway/jsonpath/JsonModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DefaultObjectOps"
.end annotation


# instance fields
.field private jsonPath:Lcom/jayway/jsonpath/JsonPath;

.field final synthetic this$0:Lcom/jayway/jsonpath/JsonModel;


# direct methods
.method private constructor <init>(Lcom/jayway/jsonpath/JsonModel;Lcom/jayway/jsonpath/JsonPath;)V
    .locals 0
    .param p2, "jsonPath"    # Lcom/jayway/jsonpath/JsonPath;

    .prologue
    .line 847
    iput-object p1, p0, Lcom/jayway/jsonpath/JsonModel$DefaultObjectOps;->this$0:Lcom/jayway/jsonpath/JsonModel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 848
    iput-object p2, p0, Lcom/jayway/jsonpath/JsonModel$DefaultObjectOps;->jsonPath:Lcom/jayway/jsonpath/JsonPath;

    .line 849
    return-void
.end method

.method synthetic constructor <init>(Lcom/jayway/jsonpath/JsonModel;Lcom/jayway/jsonpath/JsonPath;Lcom/jayway/jsonpath/JsonModel$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/jayway/jsonpath/JsonModel;
    .param p2, "x1"    # Lcom/jayway/jsonpath/JsonPath;
    .param p3, "x2"    # Lcom/jayway/jsonpath/JsonModel$1;

    .prologue
    .line 843
    invoke-direct {p0, p1, p2}, Lcom/jayway/jsonpath/JsonModel$DefaultObjectOps;-><init>(Lcom/jayway/jsonpath/JsonModel;Lcom/jayway/jsonpath/JsonPath;)V

    return-void
.end method


# virtual methods
.method public containsKey(Ljava/lang/String;)Z
    .locals 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 858
    iget-object v0, p0, Lcom/jayway/jsonpath/JsonModel$DefaultObjectOps;->this$0:Lcom/jayway/jsonpath/JsonModel;

    iget-object v1, p0, Lcom/jayway/jsonpath/JsonModel$DefaultObjectOps;->jsonPath:Lcom/jayway/jsonpath/JsonPath;

    const-class v2, Ljava/util/Map;

    invoke-static {v0, v1, v2}, Lcom/jayway/jsonpath/JsonModel;->access$600(Lcom/jayway/jsonpath/JsonModel;Lcom/jayway/jsonpath/JsonPath;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public get(Ljava/lang/String;)Ljava/lang/Object;
    .locals 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 878
    iget-object v0, p0, Lcom/jayway/jsonpath/JsonModel$DefaultObjectOps;->this$0:Lcom/jayway/jsonpath/JsonModel;

    iget-object v1, p0, Lcom/jayway/jsonpath/JsonModel$DefaultObjectOps;->jsonPath:Lcom/jayway/jsonpath/JsonPath;

    const-class v2, Ljava/util/Map;

    invoke-static {v0, v1, v2}, Lcom/jayway/jsonpath/JsonModel;->access$600(Lcom/jayway/jsonpath/JsonModel;Lcom/jayway/jsonpath/JsonPath;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getDouble(Ljava/lang/String;)Ljava/lang/Double;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 893
    invoke-virtual {p0, p1}, Lcom/jayway/jsonpath/JsonModel$DefaultObjectOps;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/jayway/jsonpath/internal/ConvertUtils;->toDouble(Ljava/lang/Object;)Ljava/lang/Double;

    move-result-object v0

    return-object v0
.end method

.method public getInteger(Ljava/lang/String;)Ljava/lang/Integer;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 883
    invoke-virtual {p0, p1}, Lcom/jayway/jsonpath/JsonModel$DefaultObjectOps;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/jayway/jsonpath/internal/ConvertUtils;->toInt(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getLong(Ljava/lang/String;)Ljava/lang/Long;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 888
    invoke-virtual {p0, p1}, Lcom/jayway/jsonpath/JsonModel$DefaultObjectOps;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/jayway/jsonpath/internal/ConvertUtils;->toLong(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method public getString(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 898
    invoke-virtual {p0, p1}, Lcom/jayway/jsonpath/JsonModel$DefaultObjectOps;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/jayway/jsonpath/internal/ConvertUtils;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTarget()Ljava/util/Map;
    .locals 3
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
    .line 853
    iget-object v0, p0, Lcom/jayway/jsonpath/JsonModel$DefaultObjectOps;->this$0:Lcom/jayway/jsonpath/JsonModel;

    iget-object v1, p0, Lcom/jayway/jsonpath/JsonModel$DefaultObjectOps;->jsonPath:Lcom/jayway/jsonpath/JsonPath;

    const-class v2, Ljava/util/Map;

    invoke-static {v0, v1, v2}, Lcom/jayway/jsonpath/JsonModel;->access$600(Lcom/jayway/jsonpath/JsonModel;Lcom/jayway/jsonpath/JsonPath;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    return-object v0
.end method

.method public put(Ljava/lang/String;Ljava/lang/Object;)Lcom/jayway/jsonpath/JsonModel$ObjectOps;
    .locals 3
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 863
    iget-object v0, p0, Lcom/jayway/jsonpath/JsonModel$DefaultObjectOps;->this$0:Lcom/jayway/jsonpath/JsonModel;

    iget-object v1, p0, Lcom/jayway/jsonpath/JsonModel$DefaultObjectOps;->jsonPath:Lcom/jayway/jsonpath/JsonPath;

    const-class v2, Ljava/util/Map;

    invoke-static {v0, v1, v2}, Lcom/jayway/jsonpath/JsonModel;->access$600(Lcom/jayway/jsonpath/JsonModel;Lcom/jayway/jsonpath/JsonPath;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 864
    return-object p0
.end method

.method public putAll(Ljava/util/Map;)Lcom/jayway/jsonpath/JsonModel$ObjectOps;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/jayway/jsonpath/JsonModel$ObjectOps;"
        }
    .end annotation

    .prologue
    .line 903
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-object v0, p0, Lcom/jayway/jsonpath/JsonModel$DefaultObjectOps;->this$0:Lcom/jayway/jsonpath/JsonModel;

    iget-object v1, p0, Lcom/jayway/jsonpath/JsonModel$DefaultObjectOps;->jsonPath:Lcom/jayway/jsonpath/JsonPath;

    const-class v2, Ljava/util/Map;

    invoke-static {v0, v1, v2}, Lcom/jayway/jsonpath/JsonModel;->access$600(Lcom/jayway/jsonpath/JsonModel;Lcom/jayway/jsonpath/JsonPath;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 904
    return-object p0
.end method

.method public putIfAbsent(Ljava/lang/String;Ljava/lang/Object;)Lcom/jayway/jsonpath/JsonModel$ObjectOps;
    .locals 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 869
    iget-object v1, p0, Lcom/jayway/jsonpath/JsonModel$DefaultObjectOps;->this$0:Lcom/jayway/jsonpath/JsonModel;

    iget-object v2, p0, Lcom/jayway/jsonpath/JsonModel$DefaultObjectOps;->jsonPath:Lcom/jayway/jsonpath/JsonPath;

    const-class v3, Ljava/util/Map;

    invoke-static {v1, v2, v3}, Lcom/jayway/jsonpath/JsonModel;->access$600(Lcom/jayway/jsonpath/JsonModel;Lcom/jayway/jsonpath/JsonPath;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 870
    .local v0, "targetObject":Ljava/util/Map;
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 871
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 873
    :cond_0
    return-object p0
.end method

.method public remove(Ljava/lang/String;)Lcom/jayway/jsonpath/JsonModel$ObjectOps;
    .locals 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 909
    iget-object v0, p0, Lcom/jayway/jsonpath/JsonModel$DefaultObjectOps;->this$0:Lcom/jayway/jsonpath/JsonModel;

    iget-object v1, p0, Lcom/jayway/jsonpath/JsonModel$DefaultObjectOps;->jsonPath:Lcom/jayway/jsonpath/JsonPath;

    const-class v2, Ljava/util/Map;

    invoke-static {v0, v1, v2}, Lcom/jayway/jsonpath/JsonModel;->access$600(Lcom/jayway/jsonpath/JsonModel;Lcom/jayway/jsonpath/JsonPath;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 910
    return-object p0
.end method

.method public to(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 4
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
    .line 923
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iget-object v1, p0, Lcom/jayway/jsonpath/JsonModel$DefaultObjectOps;->this$0:Lcom/jayway/jsonpath/JsonModel;

    iget-object v2, p0, Lcom/jayway/jsonpath/JsonModel$DefaultObjectOps;->jsonPath:Lcom/jayway/jsonpath/JsonPath;

    const-class v3, Ljava/util/Map;

    invoke-static {v1, v2, v3}, Lcom/jayway/jsonpath/JsonModel;->access$600(Lcom/jayway/jsonpath/JsonModel;Lcom/jayway/jsonpath/JsonPath;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 924
    .local v0, "targetObject":Ljava/util/Map;
    new-instance v1, Lcom/jayway/jsonpath/JsonModel$DefaultMappingModelReader;

    const/4 v2, 0x0

    invoke-direct {v1, v0, v2}, Lcom/jayway/jsonpath/JsonModel$DefaultMappingModelReader;-><init>(Ljava/lang/Object;Lcom/jayway/jsonpath/JsonModel$1;)V

    invoke-virtual {v1, p1}, Lcom/jayway/jsonpath/JsonModel$DefaultMappingModelReader;->to(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public transform(Lcom/jayway/jsonpath/Transformer;)Lcom/jayway/jsonpath/JsonModel$ObjectOps;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/jayway/jsonpath/Transformer",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;)",
            "Lcom/jayway/jsonpath/JsonModel$ObjectOps;"
        }
    .end annotation

    .prologue
    .line 915
    .local p1, "transformer":Lcom/jayway/jsonpath/Transformer;, "Lcom/jayway/jsonpath/Transformer<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    iget-object v2, p0, Lcom/jayway/jsonpath/JsonModel$DefaultObjectOps;->this$0:Lcom/jayway/jsonpath/JsonModel;

    iget-object v3, p0, Lcom/jayway/jsonpath/JsonModel$DefaultObjectOps;->jsonPath:Lcom/jayway/jsonpath/JsonPath;

    const-class v4, Ljava/util/Map;

    invoke-static {v2, v3, v4}, Lcom/jayway/jsonpath/JsonModel;->access$600(Lcom/jayway/jsonpath/JsonModel;Lcom/jayway/jsonpath/JsonPath;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 916
    .local v0, "targetObject":Ljava/util/Map;
    invoke-interface {p1, v0}, Lcom/jayway/jsonpath/Transformer;->transform(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 917
    .local v1, "transformed":Ljava/lang/Object;
    iget-object v2, p0, Lcom/jayway/jsonpath/JsonModel$DefaultObjectOps;->this$0:Lcom/jayway/jsonpath/JsonModel;

    iget-object v3, p0, Lcom/jayway/jsonpath/JsonModel$DefaultObjectOps;->jsonPath:Lcom/jayway/jsonpath/JsonPath;

    invoke-static {v2, v3, v1}, Lcom/jayway/jsonpath/JsonModel;->access$700(Lcom/jayway/jsonpath/JsonModel;Lcom/jayway/jsonpath/JsonPath;Ljava/lang/Object;)V

    .line 918
    return-object p0
.end method
