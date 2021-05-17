.class public Lcom/jayway/jsonpath/JsonModel;
.super Ljava/lang/Object;
.source "JsonModel.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jayway/jsonpath/JsonModel$1;,
        Lcom/jayway/jsonpath/JsonModel$JsonSubModel;,
        Lcom/jayway/jsonpath/JsonModel$DefaultMappingModelReader;,
        Lcom/jayway/jsonpath/JsonModel$DefaultArrayOps;,
        Lcom/jayway/jsonpath/JsonModel$DefaultObjectOps;,
        Lcom/jayway/jsonpath/JsonModel$ArrayOps;,
        Lcom/jayway/jsonpath/JsonModel$ObjectOps;,
        Lcom/jayway/jsonpath/JsonModel$MappingModelReader;,
        Lcom/jayway/jsonpath/JsonModel$ListMappingModelReader;,
        Lcom/jayway/jsonpath/JsonModel$ObjectMappingModelReader;
    }
.end annotation


# static fields
.field private static final JSON_PATH_ROOT:Lcom/jayway/jsonpath/JsonPath;


# instance fields
.field private jsonObject:Ljava/lang/Object;

.field private jsonProvider:Lcom/jayway/jsonpath/spi/JsonProvider;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 42
    const-string v0, "$"

    const/4 v1, 0x0

    new-array v1, v1, [Lcom/jayway/jsonpath/Filter;

    invoke-static {v0, v1}, Lcom/jayway/jsonpath/JsonPath;->compile(Ljava/lang/String;[Lcom/jayway/jsonpath/Filter;)Lcom/jayway/jsonpath/JsonPath;

    move-result-object v0

    sput-object v0, Lcom/jayway/jsonpath/JsonModel;->JSON_PATH_ROOT:Lcom/jayway/jsonpath/JsonPath;

    return-void
.end method

.method private constructor <init>(Ljava/io/InputStream;Lcom/jayway/jsonpath/spi/JsonProvider;)V
    .locals 1
    .param p1, "jsonInputStream"    # Ljava/io/InputStream;
    .param p2, "jsonProvider"    # Lcom/jayway/jsonpath/spi/JsonProvider;

    .prologue
    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    const-string v0, "jsonInputStream can not be null"

    invoke-static {p1, v0}, Lorg/apache/commons/lang/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 84
    iput-object p2, p0, Lcom/jayway/jsonpath/JsonModel;->jsonProvider:Lcom/jayway/jsonpath/spi/JsonProvider;

    .line 85
    invoke-interface {p2, p1}, Lcom/jayway/jsonpath/spi/JsonProvider;->parse(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/jayway/jsonpath/JsonModel;->jsonObject:Ljava/lang/Object;

    .line 86
    return-void
.end method

.method private constructor <init>(Ljava/lang/Object;Lcom/jayway/jsonpath/spi/JsonProvider;)V
    .locals 2
    .param p1, "jsonObject"    # Ljava/lang/Object;
    .param p2, "jsonProvider"    # Lcom/jayway/jsonpath/spi/JsonProvider;

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    const-string v0, "json can not be null"

    invoke-static {p1, v0}, Lorg/apache/commons/lang/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 69
    invoke-interface {p2, p1}, Lcom/jayway/jsonpath/spi/JsonProvider;->isContainer(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 70
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid container object"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 72
    :cond_0
    iput-object p2, p0, Lcom/jayway/jsonpath/JsonModel;->jsonProvider:Lcom/jayway/jsonpath/spi/JsonProvider;

    .line 73
    iput-object p1, p0, Lcom/jayway/jsonpath/JsonModel;->jsonObject:Ljava/lang/Object;

    .line 74
    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/Object;Lcom/jayway/jsonpath/spi/JsonProvider;Lcom/jayway/jsonpath/JsonModel$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Lcom/jayway/jsonpath/spi/JsonProvider;
    .param p3, "x2"    # Lcom/jayway/jsonpath/JsonModel$1;

    .prologue
    .line 39
    invoke-direct {p0, p1, p2}, Lcom/jayway/jsonpath/JsonModel;-><init>(Ljava/lang/Object;Lcom/jayway/jsonpath/spi/JsonProvider;)V

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;Lcom/jayway/jsonpath/spi/JsonProvider;)V
    .locals 1
    .param p1, "jsonObject"    # Ljava/lang/String;
    .param p2, "jsonProvider"    # Lcom/jayway/jsonpath/spi/JsonProvider;

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    const-string v0, "json can not be null"

    invoke-static {p1, v0}, Lorg/apache/commons/lang/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 55
    iput-object p2, p0, Lcom/jayway/jsonpath/JsonModel;->jsonProvider:Lcom/jayway/jsonpath/spi/JsonProvider;

    .line 56
    invoke-interface {p2, p1}, Lcom/jayway/jsonpath/spi/JsonProvider;->parse(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/jayway/jsonpath/JsonModel;->jsonObject:Ljava/lang/Object;

    .line 57
    return-void
.end method

.method private constructor <init>(Ljava/net/URL;Lcom/jayway/jsonpath/spi/JsonProvider;)V
    .locals 2
    .param p1, "jsonURL"    # Ljava/net/URL;
    .param p2, "jsonProvider"    # Lcom/jayway/jsonpath/spi/JsonProvider;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 96
    const-string v1, "jsonURL can not be null"

    invoke-static {p1, v1}, Lorg/apache/commons/lang/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 98
    const/4 v0, 0x0

    .line 100
    .local v0, "jsonInputStream":Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {p1}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v0

    .line 101
    invoke-interface {p2, v0}, Lcom/jayway/jsonpath/spi/JsonProvider;->parse(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, p0, Lcom/jayway/jsonpath/JsonModel;->jsonObject:Ljava/lang/Object;

    .line 102
    iput-object p2, p0, Lcom/jayway/jsonpath/JsonModel;->jsonProvider:Lcom/jayway/jsonpath/spi/JsonProvider;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 104
    invoke-static {v0}, Lcom/jayway/jsonpath/internal/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 106
    return-void

    .line 104
    :catchall_0
    move-exception v1

    invoke-static {v0}, Lcom/jayway/jsonpath/internal/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    throw v1
.end method

.method static synthetic access$600(Lcom/jayway/jsonpath/JsonModel;Lcom/jayway/jsonpath/JsonPath;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/jayway/jsonpath/JsonModel;
    .param p1, "x1"    # Lcom/jayway/jsonpath/JsonPath;
    .param p2, "x2"    # Ljava/lang/Class;

    .prologue
    .line 39
    invoke-direct {p0, p1, p2}, Lcom/jayway/jsonpath/JsonModel;->getTargetObject(Lcom/jayway/jsonpath/JsonPath;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$700(Lcom/jayway/jsonpath/JsonModel;Lcom/jayway/jsonpath/JsonPath;Ljava/lang/Object;)V
    .locals 0
    .param p0, "x0"    # Lcom/jayway/jsonpath/JsonModel;
    .param p1, "x1"    # Lcom/jayway/jsonpath/JsonPath;
    .param p2, "x2"    # Ljava/lang/Object;

    .prologue
    .line 39
    invoke-direct {p0, p1, p2}, Lcom/jayway/jsonpath/JsonModel;->setTargetObject(Lcom/jayway/jsonpath/JsonPath;Ljava/lang/Object;)V

    return-void
.end method

.method public static create(Ljava/io/InputStream;)Lcom/jayway/jsonpath/JsonModel;
    .locals 1
    .param p0, "jsonInputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 557
    invoke-static {p0}, Lcom/jayway/jsonpath/JsonModel;->model(Ljava/io/InputStream;)Lcom/jayway/jsonpath/JsonModel;

    move-result-object v0

    return-object v0
.end method

.method public static create(Ljava/lang/Object;)Lcom/jayway/jsonpath/JsonModel;
    .locals 1
    .param p0, "jsonObject"    # Ljava/lang/Object;

    .prologue
    .line 527
    invoke-static {p0}, Lcom/jayway/jsonpath/JsonModel;->model(Ljava/lang/Object;)Lcom/jayway/jsonpath/JsonModel;

    move-result-object v0

    return-object v0
.end method

.method public static create(Ljava/lang/String;)Lcom/jayway/jsonpath/JsonModel;
    .locals 1
    .param p0, "json"    # Ljava/lang/String;

    .prologue
    .line 512
    invoke-static {p0}, Lcom/jayway/jsonpath/JsonModel;->model(Ljava/lang/String;)Lcom/jayway/jsonpath/JsonModel;

    move-result-object v0

    return-object v0
.end method

.method public static create(Ljava/net/URL;)Lcom/jayway/jsonpath/JsonModel;
    .locals 1
    .param p0, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 542
    invoke-static {p0}, Lcom/jayway/jsonpath/JsonModel;->model(Ljava/net/URL;)Lcom/jayway/jsonpath/JsonModel;

    move-result-object v0

    return-object v0
.end method

.method private getTargetObject(Lcom/jayway/jsonpath/JsonPath;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 8
    .param p1, "jsonPath"    # Lcom/jayway/jsonpath/JsonPath;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/jayway/jsonpath/JsonPath;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 567
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const-string v5, "jsonPath can not be null"

    invoke-static {p1, v5}, Lorg/apache/commons/lang/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 569
    invoke-virtual {p1}, Lcom/jayway/jsonpath/JsonPath;->isPathDefinite()Z

    move-result v5

    if-nez v5, :cond_0

    .line 570
    new-instance v5, Lcom/jayway/jsonpath/IndefinitePathException;

    invoke-virtual {p1}, Lcom/jayway/jsonpath/JsonPath;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/jayway/jsonpath/IndefinitePathException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 573
    :cond_0
    invoke-static {}, Lcom/jayway/jsonpath/spi/JsonProviderFactory;->createProvider()Lcom/jayway/jsonpath/spi/JsonProvider;

    move-result-object v1

    .line 575
    .local v1, "jsonProvider":Lcom/jayway/jsonpath/spi/JsonProvider;
    iget-object v2, p0, Lcom/jayway/jsonpath/JsonModel;->jsonObject:Ljava/lang/Object;

    .line 577
    .local v2, "modelRef":Ljava/lang/Object;
    invoke-virtual {p1}, Lcom/jayway/jsonpath/JsonPath;->getTokenizer()Lcom/jayway/jsonpath/internal/PathTokenizer;

    move-result-object v5

    invoke-virtual {v5}, Lcom/jayway/jsonpath/internal/PathTokenizer;->size()I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_1

    .line 578
    invoke-virtual {p1}, Lcom/jayway/jsonpath/JsonPath;->getTokenizer()Lcom/jayway/jsonpath/internal/PathTokenizer;

    move-result-object v5

    invoke-virtual {v5}, Lcom/jayway/jsonpath/internal/PathTokenizer;->iterator()Ljava/util/Iterator;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/jayway/jsonpath/internal/PathToken;

    .line 579
    .local v3, "onlyToken":Lcom/jayway/jsonpath/internal/PathToken;
    const-string v5, "$"

    invoke-virtual {v3}, Lcom/jayway/jsonpath/internal/PathToken;->getFragment()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 580
    invoke-virtual {p2, v2}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 595
    .end local v3    # "onlyToken":Lcom/jayway/jsonpath/internal/PathToken;
    :goto_0
    return-object v5

    .line 584
    :cond_1
    invoke-virtual {p1}, Lcom/jayway/jsonpath/JsonPath;->getTokenizer()Lcom/jayway/jsonpath/internal/PathTokenizer;

    move-result-object v5

    invoke-virtual {v5}, Lcom/jayway/jsonpath/internal/PathTokenizer;->getPathTokens()Ljava/util/LinkedList;

    move-result-object v4

    .line 588
    .local v4, "tokens":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/jayway/jsonpath/internal/PathToken;>;"
    :cond_2
    invoke-virtual {v4}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jayway/jsonpath/internal/PathToken;

    .line 589
    .local v0, "currentToken":Lcom/jayway/jsonpath/internal/PathToken;
    invoke-virtual {v0, v2, v1}, Lcom/jayway/jsonpath/internal/PathToken;->apply(Ljava/lang/Object;Lcom/jayway/jsonpath/spi/JsonProvider;)Ljava/lang/Object;

    move-result-object v2

    .line 590
    invoke-virtual {v4}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 592
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 593
    new-instance v5, Lcom/jayway/jsonpath/InvalidModelException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " does nor refer to a Map but "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/jayway/jsonpath/InvalidModelException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 595
    :cond_3
    invoke-virtual {p2, v2}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    goto :goto_0

    .line 597
    .end local v0    # "currentToken":Lcom/jayway/jsonpath/internal/PathToken;
    .end local v4    # "tokens":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/jayway/jsonpath/internal/PathToken;>;"
    .restart local v3    # "onlyToken":Lcom/jayway/jsonpath/internal/PathToken;
    :cond_4
    new-instance v5, Lcom/jayway/jsonpath/InvalidModelException;

    invoke-direct {v5}, Lcom/jayway/jsonpath/InvalidModelException;-><init>()V

    throw v5
.end method

.method public static model(Ljava/io/InputStream;)Lcom/jayway/jsonpath/JsonModel;
    .locals 2
    .param p0, "jsonInputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 552
    const-string v0, "jsonInputStream can not be null"

    invoke-static {p0, v0}, Lorg/apache/commons/lang/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 554
    new-instance v0, Lcom/jayway/jsonpath/JsonModel;

    invoke-static {}, Lcom/jayway/jsonpath/spi/JsonProviderFactory;->createProvider()Lcom/jayway/jsonpath/spi/JsonProvider;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/jayway/jsonpath/JsonModel;-><init>(Ljava/io/InputStream;Lcom/jayway/jsonpath/spi/JsonProvider;)V

    return-object v0
.end method

.method public static model(Ljava/lang/Object;)Lcom/jayway/jsonpath/JsonModel;
    .locals 2
    .param p0, "jsonObject"    # Ljava/lang/Object;

    .prologue
    .line 522
    const-string v0, "jsonObject can not be null"

    invoke-static {p0, v0}, Lorg/apache/commons/lang/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 524
    new-instance v0, Lcom/jayway/jsonpath/JsonModel;

    invoke-static {}, Lcom/jayway/jsonpath/spi/JsonProviderFactory;->createProvider()Lcom/jayway/jsonpath/spi/JsonProvider;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/jayway/jsonpath/JsonModel;-><init>(Ljava/lang/Object;Lcom/jayway/jsonpath/spi/JsonProvider;)V

    return-object v0
.end method

.method public static model(Ljava/lang/String;)Lcom/jayway/jsonpath/JsonModel;
    .locals 2
    .param p0, "json"    # Ljava/lang/String;

    .prologue
    .line 507
    const-string v0, "json can not be null or empty"

    invoke-static {p0, v0}, Lorg/apache/commons/lang/Validate;->notEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 509
    new-instance v0, Lcom/jayway/jsonpath/JsonModel;

    invoke-static {}, Lcom/jayway/jsonpath/spi/JsonProviderFactory;->createProvider()Lcom/jayway/jsonpath/spi/JsonProvider;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/jayway/jsonpath/JsonModel;-><init>(Ljava/lang/String;Lcom/jayway/jsonpath/spi/JsonProvider;)V

    return-object v0
.end method

.method public static model(Ljava/net/URL;)Lcom/jayway/jsonpath/JsonModel;
    .locals 2
    .param p0, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 537
    const-string v0, "url can not be null"

    invoke-static {p0, v0}, Lorg/apache/commons/lang/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 539
    new-instance v0, Lcom/jayway/jsonpath/JsonModel;

    invoke-static {}, Lcom/jayway/jsonpath/spi/JsonProviderFactory;->createProvider()Lcom/jayway/jsonpath/spi/JsonProvider;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/jayway/jsonpath/JsonModel;-><init>(Ljava/net/URL;Lcom/jayway/jsonpath/spi/JsonProvider;)V

    return-object v0
.end method

.method private setTargetObject(Lcom/jayway/jsonpath/JsonPath;Ljava/lang/Object;)V
    .locals 6
    .param p1, "jsonPath"    # Lcom/jayway/jsonpath/JsonPath;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    .line 601
    invoke-virtual {p1}, Lcom/jayway/jsonpath/JsonPath;->copy()Lcom/jayway/jsonpath/JsonPath;

    move-result-object v2

    .line 602
    .local v2, "setterPath":Lcom/jayway/jsonpath/JsonPath;
    invoke-virtual {v2}, Lcom/jayway/jsonpath/JsonPath;->getTokenizer()Lcom/jayway/jsonpath/internal/PathTokenizer;

    move-result-object v4

    invoke-virtual {v4}, Lcom/jayway/jsonpath/internal/PathTokenizer;->removeLastPathToken()Lcom/jayway/jsonpath/internal/PathToken;

    move-result-object v1

    .line 605
    .local v1, "pathToken":Lcom/jayway/jsonpath/internal/PathToken;
    invoke-virtual {v1}, Lcom/jayway/jsonpath/internal/PathToken;->isRootToken()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 606
    instance-of v4, p0, Lcom/jayway/jsonpath/JsonModel$JsonSubModel;

    if-eqz v4, :cond_0

    move-object v3, p0

    .line 607
    check-cast v3, Lcom/jayway/jsonpath/JsonModel$JsonSubModel;

    .line 609
    .local v3, "thisModel":Lcom/jayway/jsonpath/JsonModel$JsonSubModel;
    invoke-static {v3}, Lcom/jayway/jsonpath/JsonModel$JsonSubModel;->access$500(Lcom/jayway/jsonpath/JsonModel$JsonSubModel;)Lcom/jayway/jsonpath/JsonModel;

    move-result-object v4

    invoke-static {v3}, Lcom/jayway/jsonpath/JsonModel$JsonSubModel;->access$400(Lcom/jayway/jsonpath/JsonModel$JsonSubModel;)Lcom/jayway/jsonpath/JsonPath;

    move-result-object v5

    invoke-direct {v4, v5, p2}, Lcom/jayway/jsonpath/JsonModel;->setTargetObject(Lcom/jayway/jsonpath/JsonPath;Ljava/lang/Object;)V

    .line 621
    .end local v3    # "thisModel":Lcom/jayway/jsonpath/JsonModel$JsonSubModel;
    :goto_0
    return-void

    .line 611
    :cond_0
    iput-object p2, p0, Lcom/jayway/jsonpath/JsonModel;->jsonObject:Ljava/lang/Object;

    goto :goto_0

    .line 614
    :cond_1
    invoke-virtual {v1}, Lcom/jayway/jsonpath/internal/PathToken;->isArrayIndexToken()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 615
    invoke-virtual {v1}, Lcom/jayway/jsonpath/internal/PathToken;->getArrayIndex()I

    move-result v0

    .line 616
    .local v0, "arrayIndex":I
    invoke-virtual {p0, v2}, Lcom/jayway/jsonpath/JsonModel;->opsForArray(Lcom/jayway/jsonpath/JsonPath;)Lcom/jayway/jsonpath/JsonModel$ArrayOps;

    move-result-object v4

    invoke-interface {v4, v0, p2}, Lcom/jayway/jsonpath/JsonModel$ArrayOps;->set(ILjava/lang/Object;)Lcom/jayway/jsonpath/JsonModel$ArrayOps;

    goto :goto_0

    .line 618
    .end local v0    # "arrayIndex":I
    :cond_2
    invoke-virtual {p0, v2}, Lcom/jayway/jsonpath/JsonModel;->opsForObject(Lcom/jayway/jsonpath/JsonPath;)Lcom/jayway/jsonpath/JsonModel$ObjectOps;

    move-result-object v4

    invoke-virtual {v1}, Lcom/jayway/jsonpath/internal/PathToken;->getFragment()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5, p2}, Lcom/jayway/jsonpath/JsonModel$ObjectOps;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/jayway/jsonpath/JsonModel$ObjectOps;

    goto :goto_0
.end method


# virtual methods
.method public get(Lcom/jayway/jsonpath/JsonPath;)Ljava/lang/Object;
    .locals 1
    .param p1, "jsonPath"    # Lcom/jayway/jsonpath/JsonPath;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/jayway/jsonpath/JsonPath;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 234
    const-string v0, "jsonPath can not be null"

    invoke-static {p1, v0}, Lorg/apache/commons/lang/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 236
    iget-object v0, p0, Lcom/jayway/jsonpath/JsonModel;->jsonObject:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Lcom/jayway/jsonpath/JsonPath;->read(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public varargs get(Ljava/lang/String;[Lcom/jayway/jsonpath/Filter;)Ljava/lang/Object;
    .locals 1
    .param p1, "jsonPath"    # Ljava/lang/String;
    .param p2, "filters"    # [Lcom/jayway/jsonpath/Filter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "[",
            "Lcom/jayway/jsonpath/Filter;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 222
    invoke-static {p1, p2}, Lcom/jayway/jsonpath/JsonPath;->compile(Ljava/lang/String;[Lcom/jayway/jsonpath/Filter;)Lcom/jayway/jsonpath/JsonPath;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/jayway/jsonpath/JsonModel;->get(Lcom/jayway/jsonpath/JsonPath;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getJsonObject()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 178
    iget-object v0, p0, Lcom/jayway/jsonpath/JsonModel;->jsonObject:Ljava/lang/Object;

    return-object v0
.end method

.method public getSubModel(Lcom/jayway/jsonpath/JsonPath;)Lcom/jayway/jsonpath/JsonModel;
    .locals 6
    .param p1, "jsonPath"    # Lcom/jayway/jsonpath/JsonPath;

    .prologue
    .line 403
    const-string v0, "jsonPath can not be null"

    invoke-static {p1, v0}, Lorg/apache/commons/lang/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 405
    invoke-virtual {p1}, Lcom/jayway/jsonpath/JsonPath;->isPathDefinite()Z

    move-result v0

    const-string v2, "You can only get subModels with a definite path. Use getDetachedModel if path is not definite."

    invoke-static {v0, v2}, Lorg/apache/commons/lang/Validate;->isTrue(ZLjava/lang/String;)V

    .line 407
    iget-object v0, p0, Lcom/jayway/jsonpath/JsonModel;->jsonObject:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Lcom/jayway/jsonpath/JsonPath;->read(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 409
    .local v1, "subModel":Ljava/lang/Object;
    iget-object v0, p0, Lcom/jayway/jsonpath/JsonModel;->jsonProvider:Lcom/jayway/jsonpath/spi/JsonProvider;

    invoke-interface {v0, v1}, Lcom/jayway/jsonpath/spi/JsonProvider;->isContainer(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 410
    new-instance v2, Lcom/jayway/jsonpath/InvalidModelException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "The path "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/jayway/jsonpath/JsonPath;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " returned an invalid model "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    :goto_0
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Lcom/jayway/jsonpath/InvalidModelException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_0
    const-string v0, "null"

    goto :goto_0

    .line 413
    :cond_1
    new-instance v0, Lcom/jayway/jsonpath/JsonModel$JsonSubModel;

    iget-object v2, p0, Lcom/jayway/jsonpath/JsonModel;->jsonProvider:Lcom/jayway/jsonpath/spi/JsonProvider;

    const/4 v5, 0x0

    move-object v3, p0

    move-object v4, p1

    invoke-direct/range {v0 .. v5}, Lcom/jayway/jsonpath/JsonModel$JsonSubModel;-><init>(Ljava/lang/Object;Lcom/jayway/jsonpath/spi/JsonProvider;Lcom/jayway/jsonpath/JsonModel;Lcom/jayway/jsonpath/JsonPath;Lcom/jayway/jsonpath/JsonModel$1;)V

    return-object v0
.end method

.method public getSubModel(Ljava/lang/String;)Lcom/jayway/jsonpath/JsonModel;
    .locals 1
    .param p1, "jsonPath"    # Ljava/lang/String;

    .prologue
    .line 388
    const/4 v0, 0x0

    new-array v0, v0, [Lcom/jayway/jsonpath/Filter;

    invoke-static {p1, v0}, Lcom/jayway/jsonpath/JsonPath;->compile(Ljava/lang/String;[Lcom/jayway/jsonpath/Filter;)Lcom/jayway/jsonpath/JsonPath;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/jayway/jsonpath/JsonModel;->getSubModel(Lcom/jayway/jsonpath/JsonPath;)Lcom/jayway/jsonpath/JsonModel;

    move-result-object v0

    return-object v0
.end method

.method public getSubModelDetached(Lcom/jayway/jsonpath/JsonPath;)Lcom/jayway/jsonpath/JsonModel;
    .locals 4
    .param p1, "jsonPath"    # Lcom/jayway/jsonpath/JsonPath;

    .prologue
    .line 443
    const-string v1, "jsonPath can not be null"

    invoke-static {p1, v1}, Lorg/apache/commons/lang/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 445
    iget-object v1, p0, Lcom/jayway/jsonpath/JsonModel;->jsonObject:Ljava/lang/Object;

    invoke-virtual {p1, v1}, Lcom/jayway/jsonpath/JsonPath;->read(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 447
    .local v0, "subModel":Ljava/lang/Object;
    iget-object v1, p0, Lcom/jayway/jsonpath/JsonModel;->jsonProvider:Lcom/jayway/jsonpath/spi/JsonProvider;

    invoke-interface {v1, v0}, Lcom/jayway/jsonpath/spi/JsonProvider;->isContainer(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 448
    new-instance v2, Lcom/jayway/jsonpath/InvalidModelException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "The path "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/jayway/jsonpath/JsonPath;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " returned an invalid model "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    :goto_0
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Lcom/jayway/jsonpath/InvalidModelException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_0
    const-string v1, "null"

    goto :goto_0

    .line 451
    :cond_1
    iget-object v1, p0, Lcom/jayway/jsonpath/JsonModel;->jsonProvider:Lcom/jayway/jsonpath/spi/JsonProvider;

    invoke-interface {v1, v0}, Lcom/jayway/jsonpath/spi/JsonProvider;->clone(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 453
    new-instance v1, Lcom/jayway/jsonpath/JsonModel;

    iget-object v2, p0, Lcom/jayway/jsonpath/JsonModel;->jsonProvider:Lcom/jayway/jsonpath/spi/JsonProvider;

    invoke-direct {v1, v0, v2}, Lcom/jayway/jsonpath/JsonModel;-><init>(Ljava/lang/Object;Lcom/jayway/jsonpath/spi/JsonProvider;)V

    return-object v1
.end method

.method public varargs getSubModelDetached(Ljava/lang/String;[Lcom/jayway/jsonpath/Filter;)Lcom/jayway/jsonpath/JsonModel;
    .locals 1
    .param p1, "jsonPath"    # Ljava/lang/String;
    .param p2, "filters"    # [Lcom/jayway/jsonpath/Filter;

    .prologue
    .line 431
    invoke-static {p1, p2}, Lcom/jayway/jsonpath/JsonPath;->compile(Ljava/lang/String;[Lcom/jayway/jsonpath/Filter;)Lcom/jayway/jsonpath/JsonPath;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/jayway/jsonpath/JsonModel;->getSubModelDetached(Lcom/jayway/jsonpath/JsonPath;)Lcom/jayway/jsonpath/JsonModel;

    move-result-object v0

    return-object v0
.end method

.method public hasPath(Lcom/jayway/jsonpath/JsonPath;)Z
    .locals 3
    .param p1, "jsonPath"    # Lcom/jayway/jsonpath/JsonPath;

    .prologue
    .line 156
    invoke-virtual {p1}, Lcom/jayway/jsonpath/JsonPath;->isPathDefinite()Z

    move-result v1

    const-string v2, "hasPath can only be used for definite paths"

    invoke-static {v1, v2}, Lorg/apache/commons/lang/Validate;->isTrue(ZLjava/lang/String;)V

    .line 159
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/jayway/jsonpath/JsonModel;->get(Lcom/jayway/jsonpath/JsonPath;)Ljava/lang/Object;
    :try_end_0
    .catch Lcom/jayway/jsonpath/InvalidPathException; {:try_start_0 .. :try_end_0} :catch_0

    .line 163
    const/4 v1, 0x1

    :goto_0
    return v1

    .line 160
    :catch_0
    move-exception v0

    .line 161
    .local v0, "e":Lcom/jayway/jsonpath/InvalidPathException;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public hasPath(Ljava/lang/String;)Z
    .locals 1
    .param p1, "jsonPath"    # Ljava/lang/String;

    .prologue
    .line 143
    const/4 v0, 0x0

    new-array v0, v0, [Lcom/jayway/jsonpath/Filter;

    invoke-static {p1, v0}, Lcom/jayway/jsonpath/JsonPath;->compile(Ljava/lang/String;[Lcom/jayway/jsonpath/Filter;)Lcom/jayway/jsonpath/JsonPath;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/jayway/jsonpath/JsonModel;->hasPath(Lcom/jayway/jsonpath/JsonPath;)Z

    move-result v0

    return v0
.end method

.method public isList()Z
    .locals 2

    .prologue
    .line 114
    iget-object v0, p0, Lcom/jayway/jsonpath/JsonModel;->jsonProvider:Lcom/jayway/jsonpath/spi/JsonProvider;

    iget-object v1, p0, Lcom/jayway/jsonpath/JsonModel;->jsonObject:Ljava/lang/Object;

    invoke-interface {v0, v1}, Lcom/jayway/jsonpath/spi/JsonProvider;->isList(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isMap()Z
    .locals 2

    .prologue
    .line 123
    iget-object v0, p0, Lcom/jayway/jsonpath/JsonModel;->jsonProvider:Lcom/jayway/jsonpath/spi/JsonProvider;

    iget-object v1, p0, Lcom/jayway/jsonpath/JsonModel;->jsonObject:Ljava/lang/Object;

    invoke-interface {v0, v1}, Lcom/jayway/jsonpath/spi/JsonProvider;->isMap(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public map()Lcom/jayway/jsonpath/JsonModel$MappingModelReader;
    .locals 3

    .prologue
    .line 469
    new-instance v0, Lcom/jayway/jsonpath/JsonModel$DefaultMappingModelReader;

    iget-object v1, p0, Lcom/jayway/jsonpath/JsonModel;->jsonObject:Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/jayway/jsonpath/JsonModel$DefaultMappingModelReader;-><init>(Ljava/lang/Object;Lcom/jayway/jsonpath/JsonModel$1;)V

    return-object v0
.end method

.method public map(Lcom/jayway/jsonpath/JsonPath;)Lcom/jayway/jsonpath/JsonModel$MappingModelReader;
    .locals 3
    .param p1, "jsonPath"    # Lcom/jayway/jsonpath/JsonPath;

    .prologue
    .line 489
    const-string v0, "jsonPath can not be null"

    invoke-static {p1, v0}, Lorg/apache/commons/lang/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 491
    new-instance v0, Lcom/jayway/jsonpath/JsonModel$DefaultMappingModelReader;

    invoke-virtual {p0, p1}, Lcom/jayway/jsonpath/JsonModel;->get(Lcom/jayway/jsonpath/JsonPath;)Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/jayway/jsonpath/JsonModel$DefaultMappingModelReader;-><init>(Ljava/lang/Object;Lcom/jayway/jsonpath/JsonModel$1;)V

    return-object v0
.end method

.method public varargs map(Ljava/lang/String;[Lcom/jayway/jsonpath/Filter;)Lcom/jayway/jsonpath/JsonModel$MappingModelReader;
    .locals 1
    .param p1, "jsonPath"    # Ljava/lang/String;
    .param p2, "filters"    # [Lcom/jayway/jsonpath/Filter;

    .prologue
    .line 479
    invoke-static {p1, p2}, Lcom/jayway/jsonpath/JsonPath;->compile(Ljava/lang/String;[Lcom/jayway/jsonpath/Filter;)Lcom/jayway/jsonpath/JsonPath;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/jayway/jsonpath/JsonModel;->map(Lcom/jayway/jsonpath/JsonPath;)Lcom/jayway/jsonpath/JsonModel$MappingModelReader;

    move-result-object v0

    return-object v0
.end method

.method public opsForArray()Lcom/jayway/jsonpath/JsonModel$ArrayOps;
    .locals 2

    .prologue
    .line 252
    iget-object v0, p0, Lcom/jayway/jsonpath/JsonModel;->jsonProvider:Lcom/jayway/jsonpath/spi/JsonProvider;

    iget-object v1, p0, Lcom/jayway/jsonpath/JsonModel;->jsonObject:Ljava/lang/Object;

    invoke-interface {v0, v1}, Lcom/jayway/jsonpath/spi/JsonProvider;->isList(Ljava/lang/Object;)Z

    move-result v0

    const-string v1, "This JsonModel is not a JSON array"

    invoke-static {v0, v1}, Lorg/apache/commons/lang/Validate;->isTrue(ZLjava/lang/String;)V

    .line 253
    sget-object v0, Lcom/jayway/jsonpath/JsonModel;->JSON_PATH_ROOT:Lcom/jayway/jsonpath/JsonPath;

    invoke-virtual {p0, v0}, Lcom/jayway/jsonpath/JsonModel;->opsForArray(Lcom/jayway/jsonpath/JsonPath;)Lcom/jayway/jsonpath/JsonModel$ArrayOps;

    move-result-object v0

    return-object v0
.end method

.method public opsForArray(Lcom/jayway/jsonpath/JsonPath;)Lcom/jayway/jsonpath/JsonModel$ArrayOps;
    .locals 2
    .param p1, "jsonPath"    # Lcom/jayway/jsonpath/JsonPath;

    .prologue
    .line 279
    const-string v0, "jsonPath can not be null"

    invoke-static {p1, v0}, Lorg/apache/commons/lang/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 280
    new-instance v0, Lcom/jayway/jsonpath/JsonModel$DefaultArrayOps;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/jayway/jsonpath/JsonModel$DefaultArrayOps;-><init>(Lcom/jayway/jsonpath/JsonModel;Lcom/jayway/jsonpath/JsonPath;Lcom/jayway/jsonpath/JsonModel$1;)V

    return-object v0
.end method

.method public opsForArray(Ljava/lang/String;)Lcom/jayway/jsonpath/JsonModel$ArrayOps;
    .locals 1
    .param p1, "jsonPath"    # Ljava/lang/String;

    .prologue
    .line 266
    const/4 v0, 0x0

    new-array v0, v0, [Lcom/jayway/jsonpath/Filter;

    invoke-static {p1, v0}, Lcom/jayway/jsonpath/JsonPath;->compile(Ljava/lang/String;[Lcom/jayway/jsonpath/Filter;)Lcom/jayway/jsonpath/JsonPath;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/jayway/jsonpath/JsonModel;->opsForArray(Lcom/jayway/jsonpath/JsonPath;)Lcom/jayway/jsonpath/JsonModel$ArrayOps;

    move-result-object v0

    return-object v0
.end method

.method public opsForObject()Lcom/jayway/jsonpath/JsonModel$ObjectOps;
    .locals 1

    .prologue
    .line 290
    sget-object v0, Lcom/jayway/jsonpath/JsonModel;->JSON_PATH_ROOT:Lcom/jayway/jsonpath/JsonPath;

    invoke-virtual {p0, v0}, Lcom/jayway/jsonpath/JsonModel;->opsForObject(Lcom/jayway/jsonpath/JsonPath;)Lcom/jayway/jsonpath/JsonModel$ObjectOps;

    move-result-object v0

    return-object v0
.end method

.method public opsForObject(Lcom/jayway/jsonpath/JsonPath;)Lcom/jayway/jsonpath/JsonModel$ObjectOps;
    .locals 2
    .param p1, "jsonPath"    # Lcom/jayway/jsonpath/JsonPath;

    .prologue
    .line 316
    const-string v0, "jsonPath can not be null"

    invoke-static {p1, v0}, Lorg/apache/commons/lang/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 317
    new-instance v0, Lcom/jayway/jsonpath/JsonModel$DefaultObjectOps;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/jayway/jsonpath/JsonModel$DefaultObjectOps;-><init>(Lcom/jayway/jsonpath/JsonModel;Lcom/jayway/jsonpath/JsonPath;Lcom/jayway/jsonpath/JsonModel$1;)V

    return-object v0
.end method

.method public opsForObject(Ljava/lang/String;)Lcom/jayway/jsonpath/JsonModel$ObjectOps;
    .locals 1
    .param p1, "jsonPath"    # Ljava/lang/String;

    .prologue
    .line 303
    const/4 v0, 0x0

    new-array v0, v0, [Lcom/jayway/jsonpath/Filter;

    invoke-static {p1, v0}, Lcom/jayway/jsonpath/JsonPath;->compile(Ljava/lang/String;[Lcom/jayway/jsonpath/Filter;)Lcom/jayway/jsonpath/JsonPath;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/jayway/jsonpath/JsonModel;->opsForObject(Lcom/jayway/jsonpath/JsonPath;)Lcom/jayway/jsonpath/JsonModel$ObjectOps;

    move-result-object v0

    return-object v0
.end method

.method public print()V
    .locals 3

    .prologue
    .line 130
    invoke-virtual {p0}, Lcom/jayway/jsonpath/JsonModel;->toJson()Ljava/lang/String;

    move-result-object v0

    .line 131
    .local v0, "json":Ljava/lang/String;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {v0}, Lcom/jayway/jsonpath/internal/JsonFormatter;->prettyPrint(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 132
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .prologue
    .line 332
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/jayway/jsonpath/JsonModel;->toJson(Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toJson(Lcom/jayway/jsonpath/JsonPath;)Ljava/lang/String;
    .locals 2
    .param p1, "jsonPath"    # Lcom/jayway/jsonpath/JsonPath;

    .prologue
    .line 365
    const-string v0, "jsonPath can not be null"

    invoke-static {p1, v0}, Lorg/apache/commons/lang/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 367
    iget-object v0, p0, Lcom/jayway/jsonpath/JsonModel;->jsonProvider:Lcom/jayway/jsonpath/spi/JsonProvider;

    invoke-virtual {p0, p1}, Lcom/jayway/jsonpath/JsonModel;->get(Lcom/jayway/jsonpath/JsonPath;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/jayway/jsonpath/spi/JsonProvider;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public varargs toJson(Ljava/lang/String;[Lcom/jayway/jsonpath/Filter;)Ljava/lang/String;
    .locals 1
    .param p1, "jsonPath"    # Ljava/lang/String;
    .param p2, "filters"    # [Lcom/jayway/jsonpath/Filter;

    .prologue
    .line 356
    invoke-static {p1, p2}, Lcom/jayway/jsonpath/JsonPath;->compile(Ljava/lang/String;[Lcom/jayway/jsonpath/Filter;)Lcom/jayway/jsonpath/JsonPath;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/jayway/jsonpath/JsonModel;->toJson(Lcom/jayway/jsonpath/JsonPath;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toJson(Z)Ljava/lang/String;
    .locals 3
    .param p1, "prettyPrint"    # Z

    .prologue
    .line 343
    iget-object v1, p0, Lcom/jayway/jsonpath/JsonModel;->jsonProvider:Lcom/jayway/jsonpath/spi/JsonProvider;

    iget-object v2, p0, Lcom/jayway/jsonpath/JsonModel;->jsonObject:Ljava/lang/Object;

    invoke-interface {v1, v2}, Lcom/jayway/jsonpath/spi/JsonProvider;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 344
    .local v0, "json":Ljava/lang/String;
    if-eqz p1, :cond_0

    .line 345
    invoke-static {v0}, Lcom/jayway/jsonpath/internal/JsonFormatter;->prettyPrint(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 347
    .end local v0    # "json":Ljava/lang/String;
    :cond_0
    return-object v0
.end method
