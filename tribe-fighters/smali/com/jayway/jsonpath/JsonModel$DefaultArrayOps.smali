.class Lcom/jayway/jsonpath/JsonModel$DefaultArrayOps;
.super Ljava/lang/Object;
.source "JsonModel.java"

# interfaces
.implements Lcom/jayway/jsonpath/JsonModel$ArrayOps;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jayway/jsonpath/JsonModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DefaultArrayOps"
.end annotation


# instance fields
.field private jsonPath:Lcom/jayway/jsonpath/JsonPath;

.field final synthetic this$0:Lcom/jayway/jsonpath/JsonModel;


# direct methods
.method private constructor <init>(Lcom/jayway/jsonpath/JsonModel;Lcom/jayway/jsonpath/JsonPath;)V
    .locals 0
    .param p2, "jsonPath"    # Lcom/jayway/jsonpath/JsonPath;

    .prologue
    .line 933
    iput-object p1, p0, Lcom/jayway/jsonpath/JsonModel$DefaultArrayOps;->this$0:Lcom/jayway/jsonpath/JsonModel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 934
    iput-object p2, p0, Lcom/jayway/jsonpath/JsonModel$DefaultArrayOps;->jsonPath:Lcom/jayway/jsonpath/JsonPath;

    .line 935
    return-void
.end method

.method synthetic constructor <init>(Lcom/jayway/jsonpath/JsonModel;Lcom/jayway/jsonpath/JsonPath;Lcom/jayway/jsonpath/JsonModel$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/jayway/jsonpath/JsonModel;
    .param p2, "x1"    # Lcom/jayway/jsonpath/JsonPath;
    .param p3, "x2"    # Lcom/jayway/jsonpath/JsonModel$1;

    .prologue
    .line 929
    invoke-direct {p0, p1, p2}, Lcom/jayway/jsonpath/JsonModel$DefaultArrayOps;-><init>(Lcom/jayway/jsonpath/JsonModel;Lcom/jayway/jsonpath/JsonPath;)V

    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)Lcom/jayway/jsonpath/JsonModel$ArrayOps;
    .locals 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 944
    iget-object v0, p0, Lcom/jayway/jsonpath/JsonModel$DefaultArrayOps;->this$0:Lcom/jayway/jsonpath/JsonModel;

    iget-object v1, p0, Lcom/jayway/jsonpath/JsonModel$DefaultArrayOps;->jsonPath:Lcom/jayway/jsonpath/JsonPath;

    const-class v2, Ljava/util/List;

    invoke-static {v0, v1, v2}, Lcom/jayway/jsonpath/JsonModel;->access$600(Lcom/jayway/jsonpath/JsonModel;Lcom/jayway/jsonpath/JsonPath;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 945
    return-object p0
.end method

.method public addAll(Ljava/util/Collection;)Lcom/jayway/jsonpath/JsonModel$ArrayOps;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/jayway/jsonpath/JsonModel$ArrayOps;"
        }
    .end annotation

    .prologue
    .line 950
    .local p1, "collection":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Object;>;"
    iget-object v0, p0, Lcom/jayway/jsonpath/JsonModel$DefaultArrayOps;->this$0:Lcom/jayway/jsonpath/JsonModel;

    iget-object v1, p0, Lcom/jayway/jsonpath/JsonModel$DefaultArrayOps;->jsonPath:Lcom/jayway/jsonpath/JsonPath;

    const-class v2, Ljava/util/List;

    invoke-static {v0, v1, v2}, Lcom/jayway/jsonpath/JsonModel;->access$600(Lcom/jayway/jsonpath/JsonModel;Lcom/jayway/jsonpath/JsonPath;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 951
    return-object p0
.end method

.method public each(Lcom/jayway/jsonpath/Transformer;)Lcom/jayway/jsonpath/JsonModel$ArrayOps;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/jayway/jsonpath/Transformer",
            "<",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/jayway/jsonpath/JsonModel$ArrayOps;"
        }
    .end annotation

    .prologue
    .line 986
    .local p1, "transformer":Lcom/jayway/jsonpath/Transformer;, "Lcom/jayway/jsonpath/Transformer<Ljava/lang/Object;>;"
    iget-object v2, p0, Lcom/jayway/jsonpath/JsonModel$DefaultArrayOps;->this$0:Lcom/jayway/jsonpath/JsonModel;

    iget-object v3, p0, Lcom/jayway/jsonpath/JsonModel$DefaultArrayOps;->jsonPath:Lcom/jayway/jsonpath/JsonPath;

    const-class v4, Ljava/util/List;

    invoke-static {v2, v3, v4}, Lcom/jayway/jsonpath/JsonModel;->access$600(Lcom/jayway/jsonpath/JsonModel;Lcom/jayway/jsonpath/JsonPath;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 987
    .local v1, "targetObject":Ljava/util/List;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 988
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {p1, v2}, Lcom/jayway/jsonpath/Transformer;->transform(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 987
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 990
    :cond_0
    return-object p0
.end method

.method public getTarget()Ljava/util/List;
    .locals 3
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
    .line 939
    iget-object v0, p0, Lcom/jayway/jsonpath/JsonModel$DefaultArrayOps;->this$0:Lcom/jayway/jsonpath/JsonModel;

    iget-object v1, p0, Lcom/jayway/jsonpath/JsonModel$DefaultArrayOps;->jsonPath:Lcom/jayway/jsonpath/JsonPath;

    const-class v2, Ljava/util/List;

    invoke-static {v0, v1, v2}, Lcom/jayway/jsonpath/JsonModel;->access$600(Lcom/jayway/jsonpath/JsonModel;Lcom/jayway/jsonpath/JsonPath;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Lcom/jayway/jsonpath/JsonModel$ArrayOps;
    .locals 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 956
    iget-object v0, p0, Lcom/jayway/jsonpath/JsonModel$DefaultArrayOps;->this$0:Lcom/jayway/jsonpath/JsonModel;

    iget-object v1, p0, Lcom/jayway/jsonpath/JsonModel$DefaultArrayOps;->jsonPath:Lcom/jayway/jsonpath/JsonPath;

    const-class v2, Ljava/util/List;

    invoke-static {v0, v1, v2}, Lcom/jayway/jsonpath/JsonModel;->access$600(Lcom/jayway/jsonpath/JsonModel;Lcom/jayway/jsonpath/JsonPath;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 957
    return-object p0
.end method

.method public set(ILjava/lang/Object;)Lcom/jayway/jsonpath/JsonModel$ArrayOps;
    .locals 3
    .param p1, "index"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 967
    iget-object v0, p0, Lcom/jayway/jsonpath/JsonModel$DefaultArrayOps;->this$0:Lcom/jayway/jsonpath/JsonModel;

    iget-object v1, p0, Lcom/jayway/jsonpath/JsonModel$DefaultArrayOps;->jsonPath:Lcom/jayway/jsonpath/JsonPath;

    const-class v2, Ljava/util/List;

    invoke-static {v0, v1, v2}, Lcom/jayway/jsonpath/JsonModel;->access$600(Lcom/jayway/jsonpath/JsonModel;Lcom/jayway/jsonpath/JsonPath;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 968
    return-object p0
.end method

.method public size()I
    .locals 3

    .prologue
    .line 962
    iget-object v0, p0, Lcom/jayway/jsonpath/JsonModel$DefaultArrayOps;->this$0:Lcom/jayway/jsonpath/JsonModel;

    iget-object v1, p0, Lcom/jayway/jsonpath/JsonModel$DefaultArrayOps;->jsonPath:Lcom/jayway/jsonpath/JsonPath;

    const-class v2, Ljava/util/List;

    invoke-static {v0, v1, v2}, Lcom/jayway/jsonpath/JsonModel;->access$600(Lcom/jayway/jsonpath/JsonModel;Lcom/jayway/jsonpath/JsonPath;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public toList()Lcom/jayway/jsonpath/JsonModel$ListMappingModelReader;
    .locals 4

    .prologue
    .line 973
    new-instance v0, Lcom/jayway/jsonpath/JsonModel$DefaultMappingModelReader;

    iget-object v1, p0, Lcom/jayway/jsonpath/JsonModel$DefaultArrayOps;->this$0:Lcom/jayway/jsonpath/JsonModel;

    iget-object v2, p0, Lcom/jayway/jsonpath/JsonModel$DefaultArrayOps;->jsonPath:Lcom/jayway/jsonpath/JsonPath;

    const-class v3, Ljava/util/List;

    invoke-static {v1, v2, v3}, Lcom/jayway/jsonpath/JsonModel;->access$600(Lcom/jayway/jsonpath/JsonModel;Lcom/jayway/jsonpath/JsonPath;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/jayway/jsonpath/JsonModel$DefaultMappingModelReader;-><init>(Ljava/lang/Object;Lcom/jayway/jsonpath/JsonModel$1;)V

    return-object v0
.end method

.method public toListOf(Ljava/lang/Class;)Ljava/util/List;
    .locals 4
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
    .line 995
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v0, Lcom/jayway/jsonpath/JsonModel$DefaultMappingModelReader;

    iget-object v1, p0, Lcom/jayway/jsonpath/JsonModel$DefaultArrayOps;->this$0:Lcom/jayway/jsonpath/JsonModel;

    iget-object v2, p0, Lcom/jayway/jsonpath/JsonModel$DefaultArrayOps;->jsonPath:Lcom/jayway/jsonpath/JsonPath;

    const-class v3, Ljava/util/List;

    invoke-static {v1, v2, v3}, Lcom/jayway/jsonpath/JsonModel;->access$600(Lcom/jayway/jsonpath/JsonModel;Lcom/jayway/jsonpath/JsonPath;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/jayway/jsonpath/JsonModel$DefaultMappingModelReader;-><init>(Ljava/lang/Object;Lcom/jayway/jsonpath/JsonModel$1;)V

    invoke-virtual {v0, p1}, Lcom/jayway/jsonpath/JsonModel$DefaultMappingModelReader;->toListOf(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
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
    .line 1000
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v0, Lcom/jayway/jsonpath/JsonModel$DefaultMappingModelReader;

    iget-object v1, p0, Lcom/jayway/jsonpath/JsonModel$DefaultArrayOps;->this$0:Lcom/jayway/jsonpath/JsonModel;

    iget-object v2, p0, Lcom/jayway/jsonpath/JsonModel$DefaultArrayOps;->jsonPath:Lcom/jayway/jsonpath/JsonPath;

    const-class v3, Ljava/util/List;

    invoke-static {v1, v2, v3}, Lcom/jayway/jsonpath/JsonModel;->access$600(Lcom/jayway/jsonpath/JsonModel;Lcom/jayway/jsonpath/JsonPath;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/jayway/jsonpath/JsonModel$DefaultMappingModelReader;-><init>(Ljava/lang/Object;Lcom/jayway/jsonpath/JsonModel$1;)V

    invoke-virtual {v0, p1}, Lcom/jayway/jsonpath/JsonModel$DefaultMappingModelReader;->toSetOf(Ljava/lang/Class;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public transform(Lcom/jayway/jsonpath/Transformer;)Lcom/jayway/jsonpath/JsonModel$ArrayOps;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/jayway/jsonpath/Transformer",
            "<",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;>;)",
            "Lcom/jayway/jsonpath/JsonModel$ArrayOps;"
        }
    .end annotation

    .prologue
    .line 978
    .local p1, "transformer":Lcom/jayway/jsonpath/Transformer;, "Lcom/jayway/jsonpath/Transformer<Ljava/util/List<Ljava/lang/Object;>;>;"
    iget-object v1, p0, Lcom/jayway/jsonpath/JsonModel$DefaultArrayOps;->this$0:Lcom/jayway/jsonpath/JsonModel;

    iget-object v2, p0, Lcom/jayway/jsonpath/JsonModel$DefaultArrayOps;->jsonPath:Lcom/jayway/jsonpath/JsonPath;

    const-class v3, Ljava/util/List;

    invoke-static {v1, v2, v3}, Lcom/jayway/jsonpath/JsonModel;->access$600(Lcom/jayway/jsonpath/JsonModel;Lcom/jayway/jsonpath/JsonPath;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {p1, v1}, Lcom/jayway/jsonpath/Transformer;->transform(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 979
    .local v0, "transformed":Ljava/lang/Object;
    iget-object v1, p0, Lcom/jayway/jsonpath/JsonModel$DefaultArrayOps;->this$0:Lcom/jayway/jsonpath/JsonModel;

    iget-object v2, p0, Lcom/jayway/jsonpath/JsonModel$DefaultArrayOps;->jsonPath:Lcom/jayway/jsonpath/JsonPath;

    invoke-static {v1, v2, v0}, Lcom/jayway/jsonpath/JsonModel;->access$700(Lcom/jayway/jsonpath/JsonModel;Lcom/jayway/jsonpath/JsonPath;Ljava/lang/Object;)V

    .line 980
    return-object p0
.end method
