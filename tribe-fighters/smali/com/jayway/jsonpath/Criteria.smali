.class public Lcom/jayway/jsonpath/Criteria;
.super Ljava/lang/Object;
.source "Criteria.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jayway/jsonpath/Criteria$CriteriaType;
    }
.end annotation


# static fields
.field private static final NOT_SET:Ljava/lang/Object;


# instance fields
.field private final criteria:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Lcom/jayway/jsonpath/Criteria$CriteriaType;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final criteriaChain:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/jayway/jsonpath/Criteria;",
            ">;"
        }
    .end annotation
.end field

.field private isValue:Ljava/lang/Object;

.field private final key:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 49
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/jayway/jsonpath/Criteria;->NOT_SET:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/jayway/jsonpath/Criteria;->criteria:Ljava/util/LinkedHashMap;

    .line 57
    sget-object v0, Lcom/jayway/jsonpath/Criteria;->NOT_SET:Ljava/lang/Object;

    iput-object v0, p0, Lcom/jayway/jsonpath/Criteria;->isValue:Ljava/lang/Object;

    .line 61
    const-string v0, "key can not be null or empty"

    invoke-static {p1, v0}, Lorg/apache/commons/lang/Validate;->notEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/jayway/jsonpath/Criteria;->criteriaChain:Ljava/util/List;

    .line 63
    iget-object v0, p0, Lcom/jayway/jsonpath/Criteria;->criteriaChain:Ljava/util/List;

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    iput-object p1, p0, Lcom/jayway/jsonpath/Criteria;->key:Ljava/lang/String;

    .line 65
    return-void
.end method

.method private constructor <init>(Ljava/util/List;Ljava/lang/String;)V
    .locals 1
    .param p2, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/jayway/jsonpath/Criteria;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 67
    .local p1, "criteriaChain":Ljava/util/List;, "Ljava/util/List<Lcom/jayway/jsonpath/Criteria;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/jayway/jsonpath/Criteria;->criteria:Ljava/util/LinkedHashMap;

    .line 57
    sget-object v0, Lcom/jayway/jsonpath/Criteria;->NOT_SET:Ljava/lang/Object;

    iput-object v0, p0, Lcom/jayway/jsonpath/Criteria;->isValue:Ljava/lang/Object;

    .line 68
    const-string v0, "key can not be null or empty"

    invoke-static {p2, v0}, Lorg/apache/commons/lang/Validate;->notEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    iput-object p1, p0, Lcom/jayway/jsonpath/Criteria;->criteriaChain:Ljava/util/List;

    .line 70
    iget-object v0, p0, Lcom/jayway/jsonpath/Criteria;->criteriaChain:Ljava/util/List;

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 71
    iput-object p2, p0, Lcom/jayway/jsonpath/Criteria;->key:Ljava/lang/String;

    .line 72
    return-void
.end method

.method public static where(Ljava/lang/String;)Lcom/jayway/jsonpath/Criteria;
    .locals 1
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 258
    new-instance v0, Lcom/jayway/jsonpath/Criteria;

    invoke-direct {v0, p0}, Lcom/jayway/jsonpath/Criteria;-><init>(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public all(Ljava/util/Collection;)Lcom/jayway/jsonpath/Criteria;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)",
            "Lcom/jayway/jsonpath/Criteria;"
        }
    .end annotation

    .prologue
    .line 423
    .local p1, "c":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    const-string v0, "collection can not be null"

    invoke-static {p1, v0}, Lorg/apache/commons/lang/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 424
    iget-object v0, p0, Lcom/jayway/jsonpath/Criteria;->criteria:Ljava/util/LinkedHashMap;

    sget-object v1, Lcom/jayway/jsonpath/Criteria$CriteriaType;->ALL:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    invoke-virtual {v0, v1, p1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 425
    return-object p0
.end method

.method public varargs all([Ljava/lang/Object;)Lcom/jayway/jsonpath/Criteria;
    .locals 1
    .param p1, "o"    # [Ljava/lang/Object;

    .prologue
    .line 414
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/jayway/jsonpath/Criteria;->all(Ljava/util/Collection;)Lcom/jayway/jsonpath/Criteria;

    move-result-object v0

    return-object v0
.end method

.method public and(Ljava/lang/String;)Lcom/jayway/jsonpath/Criteria;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 268
    new-instance v0, Lcom/jayway/jsonpath/Criteria;

    iget-object v1, p0, Lcom/jayway/jsonpath/Criteria;->criteriaChain:Ljava/util/List;

    invoke-direct {v0, v1, p1}, Lcom/jayway/jsonpath/Criteria;-><init>(Ljava/util/List;Ljava/lang/String;)V

    return-object v0
.end method

.method public varargs andOperator([Lcom/jayway/jsonpath/Criteria;)Lcom/jayway/jsonpath/Criteria;
    .locals 3
    .param p1, "criteria"    # [Lcom/jayway/jsonpath/Criteria;

    .prologue
    .line 505
    iget-object v0, p0, Lcom/jayway/jsonpath/Criteria;->criteriaChain:Ljava/util/List;

    new-instance v1, Lcom/jayway/jsonpath/Criteria;

    const-string v2, "$and"

    invoke-direct {v1, v2}, Lcom/jayway/jsonpath/Criteria;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/jayway/jsonpath/Criteria;->is(Ljava/lang/Object;)Lcom/jayway/jsonpath/Criteria;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 506
    return-object p0
.end method

.method public eq(Ljava/lang/Object;)Lcom/jayway/jsonpath/Criteria;
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 296
    invoke-virtual {p0, p1}, Lcom/jayway/jsonpath/Criteria;->is(Ljava/lang/Object;)Lcom/jayway/jsonpath/Criteria;

    move-result-object v0

    return-object v0
.end method

.method public exists(Z)Lcom/jayway/jsonpath/Criteria;
    .locals 3
    .param p1, "b"    # Z

    .prologue
    .line 446
    iget-object v0, p0, Lcom/jayway/jsonpath/Criteria;->criteria:Ljava/util/LinkedHashMap;

    sget-object v1, Lcom/jayway/jsonpath/Criteria$CriteriaType;->EXISTS:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 447
    return-object p0
.end method

.method public getKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lcom/jayway/jsonpath/Criteria;->key:Ljava/lang/String;

    return-object v0
.end method

.method public gt(Ljava/lang/Object;)Lcom/jayway/jsonpath/Criteria;
    .locals 2
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 339
    iget-object v0, p0, Lcom/jayway/jsonpath/Criteria;->criteria:Ljava/util/LinkedHashMap;

    sget-object v1, Lcom/jayway/jsonpath/Criteria$CriteriaType;->GT:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    invoke-virtual {v0, v1, p1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 340
    return-object p0
.end method

.method public gte(Ljava/lang/Object;)Lcom/jayway/jsonpath/Criteria;
    .locals 2
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 350
    iget-object v0, p0, Lcom/jayway/jsonpath/Criteria;->criteria:Ljava/util/LinkedHashMap;

    sget-object v1, Lcom/jayway/jsonpath/Criteria$CriteriaType;->GTE:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    invoke-virtual {v0, v1, p1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 351
    return-object p0
.end method

.method public in(Ljava/util/Collection;)Lcom/jayway/jsonpath/Criteria;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)",
            "Lcom/jayway/jsonpath/Criteria;"
        }
    .end annotation

    .prologue
    .line 377
    .local p1, "c":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    const-string v0, "collection can not be null"

    invoke-static {p1, v0}, Lorg/apache/commons/lang/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 378
    iget-object v0, p0, Lcom/jayway/jsonpath/Criteria;->criteria:Ljava/util/LinkedHashMap;

    sget-object v1, Lcom/jayway/jsonpath/Criteria$CriteriaType;->IN:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    invoke-virtual {v0, v1, p1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 379
    return-object p0
.end method

.method public varargs in([Ljava/lang/Object;)Lcom/jayway/jsonpath/Criteria;
    .locals 4
    .param p1, "o"    # [Ljava/lang/Object;

    .prologue
    const/4 v3, 0x1

    .line 362
    array-length v0, p1

    if-le v0, v3, :cond_0

    aget-object v0, p1, v3

    instance-of v0, v0, Ljava/util/Collection;

    if-eqz v0, :cond_0

    .line 363
    new-instance v0, Lcom/jayway/jsonpath/InvalidCriteriaException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "You can only pass in one argument of type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    aget-object v2, p1, v3

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/jayway/jsonpath/InvalidCriteriaException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 366
    :cond_0
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/jayway/jsonpath/Criteria;->in(Ljava/util/Collection;)Lcom/jayway/jsonpath/Criteria;

    move-result-object v0

    return-object v0
.end method

.method public is(Ljava/lang/Object;)Lcom/jayway/jsonpath/Criteria;
    .locals 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 278
    iget-object v0, p0, Lcom/jayway/jsonpath/Criteria;->isValue:Ljava/lang/Object;

    sget-object v1, Lcom/jayway/jsonpath/Criteria;->NOT_SET:Ljava/lang/Object;

    if-eq v0, v1, :cond_0

    .line 279
    new-instance v0, Lcom/jayway/jsonpath/InvalidCriteriaException;

    const-string v1, "Multiple \'is\' values declared. You need to use \'and\' with multiple criteria"

    invoke-direct {v0, v1}, Lcom/jayway/jsonpath/InvalidCriteriaException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 282
    :cond_0
    iget-object v0, p0, Lcom/jayway/jsonpath/Criteria;->criteria:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->size()I

    move-result v0

    if-lez v0, :cond_1

    const-string v0, "$not"

    iget-object v1, p0, Lcom/jayway/jsonpath/Criteria;->criteria:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->toArray()[Ljava/lang/Object;

    move-result-object v1

    iget-object v2, p0, Lcom/jayway/jsonpath/Criteria;->criteria:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 283
    new-instance v0, Lcom/jayway/jsonpath/InvalidCriteriaException;

    const-string v1, "Invalid query: \'not\' can\'t be used with \'is\' - use \'ne\' instead."

    invoke-direct {v0, v1}, Lcom/jayway/jsonpath/InvalidCriteriaException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 285
    :cond_1
    iput-object p1, p0, Lcom/jayway/jsonpath/Criteria;->isValue:Ljava/lang/Object;

    .line 286
    return-object p0
.end method

.method public lt(Ljava/lang/Object;)Lcom/jayway/jsonpath/Criteria;
    .locals 2
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 317
    iget-object v0, p0, Lcom/jayway/jsonpath/Criteria;->criteria:Ljava/util/LinkedHashMap;

    sget-object v1, Lcom/jayway/jsonpath/Criteria$CriteriaType;->LT:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    invoke-virtual {v0, v1, p1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 318
    return-object p0
.end method

.method public lte(Ljava/lang/Object;)Lcom/jayway/jsonpath/Criteria;
    .locals 2
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 328
    iget-object v0, p0, Lcom/jayway/jsonpath/Criteria;->criteria:Ljava/util/LinkedHashMap;

    sget-object v1, Lcom/jayway/jsonpath/Criteria$CriteriaType;->LTE:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    invoke-virtual {v0, v1, p1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 329
    return-object p0
.end method

.method public matches(Ljava/util/Map;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 86
    iget-object v4, p0, Lcom/jayway/jsonpath/Criteria;->criteriaChain:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ne v4, v3, :cond_0

    .line 87
    iget-object v3, p0, Lcom/jayway/jsonpath/Criteria;->criteriaChain:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/jayway/jsonpath/Criteria;

    invoke-virtual {v2, p1}, Lcom/jayway/jsonpath/Criteria;->singleObjectApply(Ljava/util/Map;)Z

    move-result v2

    .line 94
    :goto_0
    return v2

    .line 89
    :cond_0
    iget-object v4, p0, Lcom/jayway/jsonpath/Criteria;->criteriaChain:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jayway/jsonpath/Criteria;

    .line 90
    .local v0, "c":Lcom/jayway/jsonpath/Criteria;
    invoke-virtual {v0, p1}, Lcom/jayway/jsonpath/Criteria;->singleObjectApply(Ljava/util/Map;)Z

    move-result v4

    if-nez v4, :cond_1

    goto :goto_0

    .end local v0    # "c":Lcom/jayway/jsonpath/Criteria;
    :cond_2
    move v2, v3

    .line 94
    goto :goto_0
.end method

.method public ne(Ljava/lang/Object;)Lcom/jayway/jsonpath/Criteria;
    .locals 2
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 306
    iget-object v0, p0, Lcom/jayway/jsonpath/Criteria;->criteria:Ljava/util/LinkedHashMap;

    sget-object v1, Lcom/jayway/jsonpath/Criteria$CriteriaType;->NE:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    invoke-virtual {v0, v1, p1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 307
    return-object p0
.end method

.method public nin(Ljava/util/Collection;)Lcom/jayway/jsonpath/Criteria;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)",
            "Lcom/jayway/jsonpath/Criteria;"
        }
    .end annotation

    .prologue
    .line 401
    .local p1, "c":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    const-string v0, "collection can not be null"

    invoke-static {p1, v0}, Lorg/apache/commons/lang/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 402
    iget-object v0, p0, Lcom/jayway/jsonpath/Criteria;->criteria:Ljava/util/LinkedHashMap;

    sget-object v1, Lcom/jayway/jsonpath/Criteria$CriteriaType;->NIN:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    invoke-virtual {v0, v1, p1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 403
    return-object p0
.end method

.method public varargs nin([Ljava/lang/Object;)Lcom/jayway/jsonpath/Criteria;
    .locals 1
    .param p1, "o"    # [Ljava/lang/Object;

    .prologue
    .line 390
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/jayway/jsonpath/Criteria;->nin(Ljava/util/Collection;)Lcom/jayway/jsonpath/Criteria;

    move-result-object v0

    return-object v0
.end method

.method public regex(Ljava/util/regex/Pattern;)Lcom/jayway/jsonpath/Criteria;
    .locals 2
    .param p1, "pattern"    # Ljava/util/regex/Pattern;

    .prologue
    .line 470
    const-string v0, "pattern can not be null"

    invoke-static {p1, v0}, Lorg/apache/commons/lang/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 471
    iget-object v0, p0, Lcom/jayway/jsonpath/Criteria;->criteria:Ljava/util/LinkedHashMap;

    sget-object v1, Lcom/jayway/jsonpath/Criteria$CriteriaType;->REGEX:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    invoke-virtual {v0, v1, p1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 472
    return-object p0
.end method

.method singleObjectApply(Ljava/util/Map;)Z
    .locals 21
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 103
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jayway/jsonpath/Criteria;->criteria:Ljava/util/LinkedHashMap;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .local v14, "i$":Ljava/util/Iterator;
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_21

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/jayway/jsonpath/Criteria$CriteriaType;

    .line 105
    .local v16, "key":Lcom/jayway/jsonpath/Criteria$CriteriaType;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jayway/jsonpath/Criteria;->key:Ljava/lang/String;

    move-object/from16 v17, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 106
    .local v6, "actualVal":Ljava/lang/Object;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jayway/jsonpath/Criteria;->criteria:Ljava/util/LinkedHashMap;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    .line 108
    .local v13, "expectedVal":Ljava/lang/Object;
    sget-object v17, Lcom/jayway/jsonpath/Criteria$CriteriaType;->GT:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/jayway/jsonpath/Criteria$CriteriaType;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_3

    .line 110
    if-eqz v13, :cond_0

    if-nez v6, :cond_1

    .line 111
    :cond_0
    const/16 v17, 0x0

    .line 246
    .end local v6    # "actualVal":Ljava/lang/Object;
    .end local v13    # "expectedVal":Ljava/lang/Object;
    .end local v14    # "i$":Ljava/util/Iterator;
    .end local v16    # "key":Lcom/jayway/jsonpath/Criteria$CriteriaType;
    :goto_0
    return v17

    .restart local v6    # "actualVal":Ljava/lang/Object;
    .restart local v13    # "expectedVal":Ljava/lang/Object;
    .restart local v14    # "i$":Ljava/util/Iterator;
    .restart local v16    # "key":Lcom/jayway/jsonpath/Criteria$CriteriaType;
    :cond_1
    move-object v12, v13

    .line 114
    check-cast v12, Ljava/lang/Number;

    .local v12, "expectedNumber":Ljava/lang/Number;
    move-object v5, v6

    .line 115
    check-cast v5, Ljava/lang/Number;

    .line 117
    .local v5, "actualNumber":Ljava/lang/Number;
    invoke-virtual {v5}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v17

    invoke-virtual {v12}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v19

    cmpl-double v17, v17, v19

    if-lez v17, :cond_2

    const/16 v17, 0x1

    goto :goto_0

    :cond_2
    const/16 v17, 0x0

    goto :goto_0

    .line 119
    .end local v5    # "actualNumber":Ljava/lang/Number;
    .end local v12    # "expectedNumber":Ljava/lang/Number;
    :cond_3
    sget-object v17, Lcom/jayway/jsonpath/Criteria$CriteriaType;->GTE:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/jayway/jsonpath/Criteria$CriteriaType;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_7

    .line 121
    if-eqz v13, :cond_4

    if-nez v6, :cond_5

    .line 122
    :cond_4
    const/16 v17, 0x0

    goto :goto_0

    :cond_5
    move-object v12, v13

    .line 125
    check-cast v12, Ljava/lang/Number;

    .restart local v12    # "expectedNumber":Ljava/lang/Number;
    move-object v5, v6

    .line 126
    check-cast v5, Ljava/lang/Number;

    .line 128
    .restart local v5    # "actualNumber":Ljava/lang/Number;
    invoke-virtual {v5}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v17

    invoke-virtual {v12}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v19

    cmpl-double v17, v17, v19

    if-ltz v17, :cond_6

    const/16 v17, 0x1

    goto :goto_0

    :cond_6
    const/16 v17, 0x0

    goto :goto_0

    .line 130
    .end local v5    # "actualNumber":Ljava/lang/Number;
    .end local v12    # "expectedNumber":Ljava/lang/Number;
    :cond_7
    sget-object v17, Lcom/jayway/jsonpath/Criteria$CriteriaType;->LT:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/jayway/jsonpath/Criteria$CriteriaType;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_b

    .line 132
    if-eqz v13, :cond_8

    if-nez v6, :cond_9

    .line 133
    :cond_8
    const/16 v17, 0x0

    goto :goto_0

    :cond_9
    move-object v12, v13

    .line 136
    check-cast v12, Ljava/lang/Number;

    .restart local v12    # "expectedNumber":Ljava/lang/Number;
    move-object v5, v6

    .line 137
    check-cast v5, Ljava/lang/Number;

    .line 139
    .restart local v5    # "actualNumber":Ljava/lang/Number;
    invoke-virtual {v5}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v17

    invoke-virtual {v12}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v19

    cmpg-double v17, v17, v19

    if-gez v17, :cond_a

    const/16 v17, 0x1

    goto :goto_0

    :cond_a
    const/16 v17, 0x0

    goto :goto_0

    .line 141
    .end local v5    # "actualNumber":Ljava/lang/Number;
    .end local v12    # "expectedNumber":Ljava/lang/Number;
    :cond_b
    sget-object v17, Lcom/jayway/jsonpath/Criteria$CriteriaType;->LTE:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/jayway/jsonpath/Criteria$CriteriaType;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_f

    .line 143
    if-eqz v13, :cond_c

    if-nez v6, :cond_d

    .line 144
    :cond_c
    const/16 v17, 0x0

    goto/16 :goto_0

    :cond_d
    move-object v12, v13

    .line 147
    check-cast v12, Ljava/lang/Number;

    .restart local v12    # "expectedNumber":Ljava/lang/Number;
    move-object v5, v6

    .line 148
    check-cast v5, Ljava/lang/Number;

    .line 150
    .restart local v5    # "actualNumber":Ljava/lang/Number;
    invoke-virtual {v5}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v17

    invoke-virtual {v12}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v19

    cmpg-double v17, v17, v19

    if-gtz v17, :cond_e

    const/16 v17, 0x1

    goto/16 :goto_0

    :cond_e
    const/16 v17, 0x0

    goto/16 :goto_0

    .line 152
    .end local v5    # "actualNumber":Ljava/lang/Number;
    .end local v12    # "expectedNumber":Ljava/lang/Number;
    :cond_f
    sget-object v17, Lcom/jayway/jsonpath/Criteria$CriteriaType;->NE:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/jayway/jsonpath/Criteria$CriteriaType;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_13

    .line 153
    if-nez v13, :cond_10

    if-nez v6, :cond_10

    .line 154
    const/16 v17, 0x0

    goto/16 :goto_0

    .line 156
    :cond_10
    if-nez v13, :cond_11

    .line 157
    const/16 v17, 0x1

    goto/16 :goto_0

    .line 159
    :cond_11
    invoke-virtual {v13, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_12

    const/16 v17, 0x1

    goto/16 :goto_0

    :cond_12
    const/16 v17, 0x0

    goto/16 :goto_0

    .line 162
    :cond_13
    sget-object v17, Lcom/jayway/jsonpath/Criteria$CriteriaType;->IN:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/jayway/jsonpath/Criteria$CriteriaType;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_14

    move-object v10, v13

    .line 164
    check-cast v10, Ljava/util/Collection;

    .line 166
    .local v10, "exp":Ljava/util/Collection;
    invoke-interface {v10, v6}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v17

    goto/16 :goto_0

    .line 168
    .end local v10    # "exp":Ljava/util/Collection;
    :cond_14
    sget-object v17, Lcom/jayway/jsonpath/Criteria$CriteriaType;->NIN:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/jayway/jsonpath/Criteria$CriteriaType;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_16

    move-object v10, v13

    .line 170
    check-cast v10, Ljava/util/Collection;

    .line 172
    .restart local v10    # "exp":Ljava/util/Collection;
    invoke-interface {v10, v6}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_15

    const/16 v17, 0x1

    goto/16 :goto_0

    :cond_15
    const/16 v17, 0x0

    goto/16 :goto_0

    .line 173
    .end local v10    # "exp":Ljava/util/Collection;
    :cond_16
    sget-object v17, Lcom/jayway/jsonpath/Criteria$CriteriaType;->ALL:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/jayway/jsonpath/Criteria$CriteriaType;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_17

    move-object v10, v13

    .line 175
    check-cast v10, Ljava/util/Collection;

    .restart local v10    # "exp":Ljava/util/Collection;
    move-object v2, v6

    .line 176
    check-cast v2, Ljava/util/Collection;

    .line 178
    .local v2, "act":Ljava/util/Collection;
    invoke-interface {v2, v10}, Ljava/util/Collection;->containsAll(Ljava/util/Collection;)Z

    move-result v17

    goto/16 :goto_0

    .line 180
    .end local v2    # "act":Ljava/util/Collection;
    .end local v10    # "exp":Ljava/util/Collection;
    :cond_17
    sget-object v17, Lcom/jayway/jsonpath/Criteria$CriteriaType;->SIZE:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/jayway/jsonpath/Criteria$CriteriaType;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_19

    .line 182
    check-cast v13, Ljava/lang/Integer;

    .end local v13    # "expectedVal":Ljava/lang/Object;
    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v10

    .local v10, "exp":I
    move-object v2, v6

    .line 183
    check-cast v2, Ljava/util/List;

    .line 185
    .local v2, "act":Ljava/util/List;
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v17

    move/from16 v0, v17

    if-ne v0, v10, :cond_18

    const/16 v17, 0x1

    goto/16 :goto_0

    :cond_18
    const/16 v17, 0x0

    goto/16 :goto_0

    .line 187
    .end local v2    # "act":Ljava/util/List;
    .end local v10    # "exp":I
    .restart local v13    # "expectedVal":Ljava/lang/Object;
    :cond_19
    sget-object v17, Lcom/jayway/jsonpath/Criteria$CriteriaType;->EXISTS:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/jayway/jsonpath/Criteria$CriteriaType;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_1b

    .line 189
    check-cast v13, Ljava/lang/Boolean;

    .end local v13    # "expectedVal":Ljava/lang/Object;
    invoke-virtual {v13}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v10

    .line 190
    .local v10, "exp":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jayway/jsonpath/Criteria;->key:Ljava/lang/String;

    move-object/from16 v17, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    .line 192
    .local v2, "act":Z
    if-ne v2, v10, :cond_1a

    const/16 v17, 0x1

    goto/16 :goto_0

    :cond_1a
    const/16 v17, 0x0

    goto/16 :goto_0

    .line 194
    .end local v2    # "act":Z
    .end local v10    # "exp":Z
    .restart local v13    # "expectedVal":Ljava/lang/Object;
    :cond_1b
    sget-object v17, Lcom/jayway/jsonpath/Criteria$CriteriaType;->TYPE:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/jayway/jsonpath/Criteria$CriteriaType;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_1e

    move-object v11, v13

    .line 196
    check-cast v11, Ljava/lang/Class;

    .line 197
    .local v11, "exp":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v3, 0x0

    .line 198
    .local v3, "act":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jayway/jsonpath/Criteria;->key:Ljava/lang/String;

    move-object/from16 v17, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_1c

    .line 199
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jayway/jsonpath/Criteria;->key:Ljava/lang/String;

    move-object/from16 v17, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 200
    .local v4, "actVal":Ljava/lang/Object;
    if-eqz v4, :cond_1c

    .line 201
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    .line 204
    .end local v4    # "actVal":Ljava/lang/Object;
    :cond_1c
    if-nez v3, :cond_1d

    .line 205
    const/16 v17, 0x0

    goto/16 :goto_0

    .line 207
    :cond_1d
    invoke-virtual {v3, v11}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v17

    goto/16 :goto_0

    .line 210
    .end local v3    # "act":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v11    # "exp":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_1e
    sget-object v17, Lcom/jayway/jsonpath/Criteria$CriteriaType;->REGEX:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/jayway/jsonpath/Criteria$CriteriaType;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_20

    move-object v10, v13

    .line 213
    check-cast v10, Ljava/util/regex/Pattern;

    .local v10, "exp":Ljava/util/regex/Pattern;
    move-object v2, v6

    .line 214
    check-cast v2, Ljava/lang/String;

    .line 215
    .local v2, "act":Ljava/lang/String;
    if-nez v2, :cond_1f

    .line 216
    const/16 v17, 0x0

    goto/16 :goto_0

    .line 218
    :cond_1f
    invoke-virtual {v10, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/util/regex/Matcher;->matches()Z

    move-result v17

    goto/16 :goto_0

    .line 221
    .end local v2    # "act":Ljava/lang/String;
    .end local v10    # "exp":Ljava/util/regex/Pattern;
    :cond_20
    new-instance v17, Ljava/lang/UnsupportedOperationException;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Criteria type not supported: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v16 .. v16}, Lcom/jayway/jsonpath/Criteria$CriteriaType;->name()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 224
    .end local v6    # "actualVal":Ljava/lang/Object;
    .end local v13    # "expectedVal":Ljava/lang/Object;
    .end local v16    # "key":Lcom/jayway/jsonpath/Criteria$CriteriaType;
    :cond_21
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jayway/jsonpath/Criteria;->isValue:Ljava/lang/Object;

    move-object/from16 v17, v0

    sget-object v18, Lcom/jayway/jsonpath/Criteria;->NOT_SET:Ljava/lang/Object;

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    if-eq v0, v1, :cond_28

    .line 226
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jayway/jsonpath/Criteria;->isValue:Ljava/lang/Object;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    instance-of v0, v0, Ljava/util/Collection;

    move/from16 v17, v0

    if-eqz v17, :cond_25

    .line 227
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/jayway/jsonpath/Criteria;->isValue:Ljava/lang/Object;

    check-cast v9, Ljava/util/Collection;

    .line 228
    .local v9, "cs":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/jayway/jsonpath/Criteria;>;"
    invoke-interface {v9}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .end local v14    # "i$":Ljava/util/Iterator;
    :cond_22
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_24

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/jayway/jsonpath/Criteria;

    .line 229
    .local v8, "crit":Lcom/jayway/jsonpath/Criteria;
    iget-object v0, v8, Lcom/jayway/jsonpath/Criteria;->criteriaChain:Ljava/util/List;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v15

    .local v15, "i$":Ljava/util/Iterator;
    :cond_23
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_22

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/jayway/jsonpath/Criteria;

    .line 230
    .local v7, "c":Lcom/jayway/jsonpath/Criteria;
    move-object/from16 v0, p1

    invoke-virtual {v7, v0}, Lcom/jayway/jsonpath/Criteria;->singleObjectApply(Ljava/util/Map;)Z

    move-result v17

    if-nez v17, :cond_23

    .line 231
    const/16 v17, 0x0

    goto/16 :goto_0

    .line 235
    .end local v7    # "c":Lcom/jayway/jsonpath/Criteria;
    .end local v8    # "crit":Lcom/jayway/jsonpath/Criteria;
    .end local v15    # "i$":Ljava/util/Iterator;
    :cond_24
    const/16 v17, 0x1

    goto/16 :goto_0

    .line 237
    .end local v9    # "cs":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/jayway/jsonpath/Criteria;>;"
    .restart local v14    # "i$":Ljava/util/Iterator;
    :cond_25
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jayway/jsonpath/Criteria;->isValue:Ljava/lang/Object;

    move-object/from16 v17, v0

    if-nez v17, :cond_27

    .line 238
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jayway/jsonpath/Criteria;->key:Ljava/lang/String;

    move-object/from16 v17, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    if-nez v17, :cond_26

    const/16 v17, 0x1

    goto/16 :goto_0

    :cond_26
    const/16 v17, 0x0

    goto/16 :goto_0

    .line 240
    :cond_27
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jayway/jsonpath/Criteria;->isValue:Ljava/lang/Object;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jayway/jsonpath/Criteria;->key:Ljava/lang/String;

    move-object/from16 v18, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v17

    goto/16 :goto_0

    .line 246
    :cond_28
    const/16 v17, 0x1

    goto/16 :goto_0
.end method

.method public size(I)Lcom/jayway/jsonpath/Criteria;
    .locals 3
    .param p1, "s"    # I

    .prologue
    .line 435
    iget-object v0, p0, Lcom/jayway/jsonpath/Criteria;->criteria:Ljava/util/LinkedHashMap;

    sget-object v1, Lcom/jayway/jsonpath/Criteria$CriteriaType;->SIZE:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 436
    return-object p0
.end method

.method public type(Ljava/lang/Class;)Lcom/jayway/jsonpath/Criteria;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/jayway/jsonpath/Criteria;"
        }
    .end annotation

    .prologue
    .line 457
    .local p1, "t":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v0, "type can not be null"

    invoke-static {p1, v0}, Lorg/apache/commons/lang/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 458
    iget-object v0, p0, Lcom/jayway/jsonpath/Criteria;->criteria:Ljava/util/LinkedHashMap;

    sget-object v1, Lcom/jayway/jsonpath/Criteria$CriteriaType;->TYPE:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    invoke-virtual {v0, v1, p1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 459
    return-object p0
.end method
