.class public Lnet/minidev/json/JSONNavi;
.super Ljava/lang/Object;
.source "JSONNavi.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final ERROR_COMPRESS:Lnet/minidev/json/JSONStyle;


# instance fields
.field private current:Ljava/lang/Object;

.field private factory:Lnet/minidev/json/parser/ContainerFactory;

.field private failure:Z

.field private failureMessage:Ljava/lang/String;

.field private missingKey:Ljava/lang/Object;

.field private path:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private readonly:Z

.field private root:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private stack:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 580
    new-instance v0, Lnet/minidev/json/JSONStyle;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lnet/minidev/json/JSONStyle;-><init>(I)V

    sput-object v0, Lnet/minidev/json/JSONNavi;->ERROR_COMPRESS:Lnet/minidev/json/JSONStyle;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 79
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    sget-object v0, Lnet/minidev/json/parser/ContainerFactory;->FACTORY_ORDERED:Lnet/minidev/json/parser/ContainerFactory;

    invoke-direct {p0, v0}, Lnet/minidev/json/JSONNavi;-><init>(Lnet/minidev/json/parser/ContainerFactory;)V

    .line 80
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "json"    # Ljava/lang/String;

    .prologue
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    const/4 v1, 0x0

    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lnet/minidev/json/JSONNavi;->stack:Ljava/util/Stack;

    .line 37
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lnet/minidev/json/JSONNavi;->path:Ljava/util/Stack;

    .line 40
    iput-boolean v1, p0, Lnet/minidev/json/JSONNavi;->failure:Z

    .line 43
    iput-boolean v1, p0, Lnet/minidev/json/JSONNavi;->readonly:Z

    .line 44
    const/4 v0, 0x0

    iput-object v0, p0, Lnet/minidev/json/JSONNavi;->missingKey:Ljava/lang/Object;

    .line 83
    invoke-static {p1}, Lnet/minidev/json/JSONValue;->parse(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lnet/minidev/json/JSONNavi;->root:Ljava/lang/Object;

    .line 84
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->root:Ljava/lang/Object;

    iput-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    .line 85
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnet/minidev/json/JSONNavi;->readonly:Z

    .line 86
    return-void
.end method

.method public constructor <init>(Lnet/minidev/json/parser/ContainerFactory;)V
    .locals 2
    .param p1, "factory"    # Lnet/minidev/json/parser/ContainerFactory;

    .prologue
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    const/4 v1, 0x0

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lnet/minidev/json/JSONNavi;->stack:Ljava/util/Stack;

    .line 37
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lnet/minidev/json/JSONNavi;->path:Ljava/util/Stack;

    .line 40
    iput-boolean v1, p0, Lnet/minidev/json/JSONNavi;->failure:Z

    .line 43
    iput-boolean v1, p0, Lnet/minidev/json/JSONNavi;->readonly:Z

    .line 44
    const/4 v0, 0x0

    iput-object v0, p0, Lnet/minidev/json/JSONNavi;->missingKey:Ljava/lang/Object;

    .line 89
    iput-object p1, p0, Lnet/minidev/json/JSONNavi;->factory:Lnet/minidev/json/parser/ContainerFactory;

    .line 90
    iput-boolean v1, p0, Lnet/minidev/json/JSONNavi;->readonly:Z

    .line 91
    return-void
.end method

.method private a(Ljava/lang/Object;)Ljava/util/List;
    .locals 0
    .param p1, "obj"    # Ljava/lang/Object;
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
    .line 488
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    check-cast p1, Ljava/util/List;

    .end local p1    # "obj":Ljava/lang/Object;
    return-object p1
.end method

.method private failure(Ljava/lang/String;Ljava/lang/Object;)Lnet/minidev/json/JSONNavi;
    .locals 3
    .param p1, "err"    # Ljava/lang/String;
    .param p2, "jPathPostfix"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ")",
            "Lnet/minidev/json/JSONNavi",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 606
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    const/4 v1, 0x1

    iput-boolean v1, p0, Lnet/minidev/json/JSONNavi;->failure:Z

    .line 607
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 608
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "Error: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 609
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 610
    const-string v1, " at "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 611
    invoke-virtual {p0}, Lnet/minidev/json/JSONNavi;->getJPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 612
    if-eqz p2, :cond_0

    .line 613
    instance-of v1, p2, Ljava/lang/Integer;

    if-eqz v1, :cond_1

    .line 614
    const/16 v1, 0x5b

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x5d

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 617
    :cond_0
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lnet/minidev/json/JSONNavi;->failureMessage:Ljava/lang/String;

    .line 618
    return-object p0

    .line 616
    :cond_1
    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method private isArray(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 469
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    if-nez p1, :cond_0

    .line 470
    const/4 v0, 0x0

    .line 471
    :goto_0
    return v0

    :cond_0
    instance-of v0, p1, Ljava/util/List;

    goto :goto_0
.end method

.method private isObject(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 478
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    if-nez p1, :cond_0

    .line 479
    const/4 v0, 0x0

    .line 480
    :goto_0
    return v0

    :cond_0
    instance-of v0, p1, Ljava/util/Map;

    goto :goto_0
.end method

.method public static newInstance()Lnet/minidev/json/JSONNavi;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lnet/minidev/json/JSONNavi",
            "<",
            "Lnet/minidev/json/JSONAwareEx;",
            ">;"
        }
    .end annotation

    .prologue
    .line 50
    new-instance v0, Lnet/minidev/json/JSONNavi;

    sget-object v1, Lnet/minidev/json/parser/ContainerFactory;->FACTORY_SIMPLE:Lnet/minidev/json/parser/ContainerFactory;

    invoke-direct {v0, v1}, Lnet/minidev/json/JSONNavi;-><init>(Lnet/minidev/json/parser/ContainerFactory;)V

    return-object v0
.end method

.method public static newInstanceArray()Lnet/minidev/json/JSONNavi;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lnet/minidev/json/JSONNavi",
            "<",
            "Lnet/minidev/json/JSONArray;",
            ">;"
        }
    .end annotation

    .prologue
    .line 73
    new-instance v0, Lnet/minidev/json/JSONNavi;

    sget-object v1, Lnet/minidev/json/parser/ContainerFactory;->FACTORY_SIMPLE:Lnet/minidev/json/parser/ContainerFactory;

    invoke-direct {v0, v1}, Lnet/minidev/json/JSONNavi;-><init>(Lnet/minidev/json/parser/ContainerFactory;)V

    .line 74
    .local v0, "o":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<Lnet/minidev/json/JSONArray;>;"
    invoke-virtual {v0}, Lnet/minidev/json/JSONNavi;->array()Lnet/minidev/json/JSONNavi;

    .line 75
    return-object v0
.end method

.method public static newInstanceObject()Lnet/minidev/json/JSONNavi;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lnet/minidev/json/JSONNavi",
            "<",
            "Lnet/minidev/json/JSONObject;",
            ">;"
        }
    .end annotation

    .prologue
    .line 64
    new-instance v0, Lnet/minidev/json/JSONNavi;

    sget-object v1, Lnet/minidev/json/parser/ContainerFactory;->FACTORY_SIMPLE:Lnet/minidev/json/parser/ContainerFactory;

    invoke-direct {v0, v1}, Lnet/minidev/json/JSONNavi;-><init>(Lnet/minidev/json/parser/ContainerFactory;)V

    .line 65
    .local v0, "o":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<Lnet/minidev/json/JSONObject;>;"
    invoke-virtual {v0}, Lnet/minidev/json/JSONNavi;->object()Lnet/minidev/json/JSONNavi;

    .line 66
    return-object v0
.end method

.method public static newInstanceOrdered()Lnet/minidev/json/JSONNavi;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lnet/minidev/json/JSONNavi",
            "<",
            "Ljava/util/Collection",
            "<*>;>;"
        }
    .end annotation

    .prologue
    .line 57
    new-instance v0, Lnet/minidev/json/JSONNavi;

    sget-object v1, Lnet/minidev/json/parser/ContainerFactory;->FACTORY_ORDERED:Lnet/minidev/json/parser/ContainerFactory;

    invoke-direct {v0, v1}, Lnet/minidev/json/JSONNavi;-><init>(Lnet/minidev/json/parser/ContainerFactory;)V

    return-object v0
.end method

.method private o(Ljava/lang/Object;)Ljava/util/Map;
    .locals 0
    .param p1, "obj"    # Ljava/lang/Object;
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
    .line 496
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    check-cast p1, Ljava/util/Map;

    .end local p1    # "obj":Ljava/lang/Object;
    return-object p1
.end method

.method private store()V
    .locals 6

    .prologue
    .line 453
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    iget-object v3, p0, Lnet/minidev/json/JSONNavi;->stack:Ljava/util/Stack;

    invoke-virtual {v3}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v2

    .line 454
    .local v2, "parent":Ljava/lang/Object;
    invoke-direct {p0, v2}, Lnet/minidev/json/JSONNavi;->isObject(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 455
    invoke-direct {p0, v2}, Lnet/minidev/json/JSONNavi;->o(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v4

    iget-object v3, p0, Lnet/minidev/json/JSONNavi;->missingKey:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    iget-object v5, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    invoke-interface {v4, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 463
    :cond_0
    :goto_0
    return-void

    .line 456
    :cond_1
    invoke-direct {p0, v2}, Lnet/minidev/json/JSONNavi;->isArray(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 457
    iget-object v3, p0, Lnet/minidev/json/JSONNavi;->missingKey:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    move-result v0

    .line 458
    .local v0, "index":I
    invoke-direct {p0, v2}, Lnet/minidev/json/JSONNavi;->a(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 459
    .local v1, "lst":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    :goto_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-gt v3, v0, :cond_2

    .line 460
    const/4 v3, 0x0

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 461
    :cond_2
    iget-object v3, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    invoke-interface {v1, v0, v3}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method


# virtual methods
.method public varargs add([Ljava/lang/Object;)Lnet/minidev/json/JSONNavi;
    .locals 6
    .param p1, "values"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            ")",
            "Lnet/minidev/json/JSONNavi",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 213
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    invoke-virtual {p0}, Lnet/minidev/json/JSONNavi;->array()Lnet/minidev/json/JSONNavi;

    .line 214
    iget-boolean v5, p0, Lnet/minidev/json/JSONNavi;->failure:Z

    if-eqz v5, :cond_1

    .line 219
    :cond_0
    return-object p0

    .line 216
    :cond_1
    iget-object v5, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    invoke-direct {p0, v5}, Lnet/minidev/json/JSONNavi;->a(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    .line 217
    .local v3, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    move-object v0, p1

    .local v0, "arr$":[Ljava/lang/Object;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v4, v0, v1

    .line 218
    .local v4, "o":Ljava/lang/Object;
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 217
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public array()Lnet/minidev/json/JSONNavi;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lnet/minidev/json/JSONNavi",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    const/4 v1, 0x0

    .line 392
    iget-boolean v0, p0, Lnet/minidev/json/JSONNavi;->failure:Z

    if-eqz v0, :cond_1

    .line 409
    :cond_0
    :goto_0
    return-object p0

    .line 394
    :cond_1
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lnet/minidev/json/JSONNavi;->readonly:Z

    if-eqz v0, :cond_2

    .line 395
    const-string v0, "Can not create Array child in readonly"

    invoke-direct {p0, v0, v1}, Lnet/minidev/json/JSONNavi;->failure(Ljava/lang/String;Ljava/lang/Object;)Lnet/minidev/json/JSONNavi;

    .line 396
    :cond_2
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    if-eqz v0, :cond_4

    .line 397
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    invoke-direct {p0, v0}, Lnet/minidev/json/JSONNavi;->isArray(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 399
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    invoke-direct {p0, v0}, Lnet/minidev/json/JSONNavi;->isObject(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 400
    const-string v0, "can not use Object feature on Array."

    invoke-direct {p0, v0, v1}, Lnet/minidev/json/JSONNavi;->failure(Ljava/lang/String;Ljava/lang/Object;)Lnet/minidev/json/JSONNavi;

    .line 401
    :cond_3
    const-string v0, "Can not use current possition as Object"

    invoke-direct {p0, v0, v1}, Lnet/minidev/json/JSONNavi;->failure(Ljava/lang/String;Ljava/lang/Object;)Lnet/minidev/json/JSONNavi;

    .line 405
    :goto_1
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->root:Ljava/lang/Object;

    if-nez v0, :cond_5

    .line 406
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    iput-object v0, p0, Lnet/minidev/json/JSONNavi;->root:Ljava/lang/Object;

    goto :goto_0

    .line 403
    :cond_4
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->factory:Lnet/minidev/json/parser/ContainerFactory;

    invoke-interface {v0}, Lnet/minidev/json/parser/ContainerFactory;->createArrayContainer()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    goto :goto_1

    .line 408
    :cond_5
    invoke-direct {p0}, Lnet/minidev/json/JSONNavi;->store()V

    goto :goto_0
.end method

.method public asBoolean()Z
    .locals 1

    .prologue
    .line 345
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    instance-of v0, v0, Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    .line 346
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 347
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public asBooleanObj()Ljava/lang/Boolean;
    .locals 2

    .prologue
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    const/4 v0, 0x0

    .line 355
    iget-object v1, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    if-nez v1, :cond_1

    .line 359
    :cond_0
    :goto_0
    return-object v0

    .line 357
    :cond_1
    iget-object v1, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    instance-of v1, v1, Ljava/lang/Boolean;

    if-eqz v1, :cond_0

    .line 358
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public asDouble()D
    .locals 2

    .prologue
    .line 239
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    instance-of v0, v0, Ljava/lang/Number;

    if-eqz v0, :cond_0

    .line 240
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    .line 241
    :goto_0
    return-wide v0

    :cond_0
    const-wide/high16 v0, 0x7ff8000000000000L    # Double.NaN

    goto :goto_0
.end method

.method public asDoubleObj()Ljava/lang/Double;
    .locals 2

    .prologue
    .line 249
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    if-nez v0, :cond_0

    .line 250
    const/4 v0, 0x0

    .line 256
    :goto_0
    return-object v0

    .line 251
    :cond_0
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    instance-of v0, v0, Ljava/lang/Number;

    if-eqz v0, :cond_2

    .line 252
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    instance-of v0, v0, Ljava/lang/Double;

    if-eqz v0, :cond_1

    .line 253
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Double;

    goto :goto_0

    .line 254
    :cond_1
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    goto :goto_0

    .line 256
    :cond_2
    const-wide/high16 v0, 0x7ff8000000000000L    # Double.NaN

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    goto :goto_0
.end method

.method public asFloat()D
    .locals 2

    .prologue
    .line 264
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    instance-of v0, v0, Ljava/lang/Number;

    if-eqz v0, :cond_0

    .line 265
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    float-to-double v0, v0

    .line 266
    :goto_0
    return-wide v0

    :cond_0
    const-wide/high16 v0, 0x7ff8000000000000L    # Double.NaN

    goto :goto_0
.end method

.method public asFloatObj()Ljava/lang/Float;
    .locals 1

    .prologue
    .line 274
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    if-nez v0, :cond_0

    .line 275
    const/4 v0, 0x0

    .line 281
    :goto_0
    return-object v0

    .line 276
    :cond_0
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    instance-of v0, v0, Ljava/lang/Number;

    if-eqz v0, :cond_2

    .line 277
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    instance-of v0, v0, Ljava/lang/Float;

    if-eqz v0, :cond_1

    .line 278
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Float;

    goto :goto_0

    .line 279
    :cond_1
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    goto :goto_0

    .line 281
    :cond_2
    const/high16 v0, 0x7fc00000    # Float.NaN

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    goto :goto_0
.end method

.method public asInt()I
    .locals 1

    .prologue
    .line 288
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    instance-of v0, v0, Ljava/lang/Number;

    if-eqz v0, :cond_0

    .line 289
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    .line 290
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public asIntegerObj()Ljava/lang/Integer;
    .locals 6

    .prologue
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    const/4 v1, 0x0

    .line 298
    iget-object v2, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    if-nez v2, :cond_1

    .line 311
    :cond_0
    :goto_0
    return-object v1

    .line 300
    :cond_1
    iget-object v2, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    instance-of v2, v2, Ljava/lang/Number;

    if-eqz v2, :cond_0

    .line 301
    iget-object v2, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    instance-of v2, v2, Ljava/lang/Integer;

    if-eqz v2, :cond_2

    .line 302
    iget-object v1, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    goto :goto_0

    .line 303
    :cond_2
    iget-object v2, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    instance-of v2, v2, Ljava/lang/Long;

    if-eqz v2, :cond_0

    .line 304
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Long;

    .line 305
    .local v0, "l":Ljava/lang/Long;
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {v0}, Ljava/lang/Long;->intValue()I

    move-result v4

    int-to-long v4, v4

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    .line 306
    invoke-virtual {v0}, Ljava/lang/Long;->intValue()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_0
.end method

.method public asLong()J
    .locals 2

    .prologue
    .line 318
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    instance-of v0, v0, Ljava/lang/Number;

    if-eqz v0, :cond_0

    .line 319
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    .line 320
    :goto_0
    return-wide v0

    :cond_0
    const-wide/16 v0, 0x0

    goto :goto_0
.end method

.method public asLongObj()Ljava/lang/Long;
    .locals 2

    .prologue
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    const/4 v0, 0x0

    .line 328
    iget-object v1, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    if-nez v1, :cond_1

    .line 337
    :cond_0
    :goto_0
    return-object v0

    .line 330
    :cond_1
    iget-object v1, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    instance-of v1, v1, Ljava/lang/Number;

    if-eqz v1, :cond_0

    .line 331
    iget-object v1, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    instance-of v1, v1, Ljava/lang/Long;

    if-eqz v1, :cond_2

    .line 332
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Long;

    goto :goto_0

    .line 333
    :cond_2
    iget-object v1, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    instance-of v1, v1, Ljava/lang/Integer;

    if-eqz v1, :cond_0

    .line 334
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    goto :goto_0
.end method

.method public asString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 227
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    if-nez v0, :cond_0

    .line 228
    const/4 v0, 0x0

    .line 231
    :goto_0
    return-object v0

    .line 229
    :cond_0
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    instance-of v0, v0, Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 230
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    goto :goto_0

    .line 231
    :cond_1
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public at(I)Lnet/minidev/json/JSONNavi;
    .locals 4
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lnet/minidev/json/JSONNavi",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 508
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    iget-boolean v2, p0, Lnet/minidev/json/JSONNavi;->failure:Z

    if-eqz v2, :cond_0

    .line 533
    .end local p0    # "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    :goto_0
    return-object p0

    .line 510
    .restart local p0    # "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    :cond_0
    iget-object v2, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    instance-of v2, v2, Ljava/util/List;

    if-nez v2, :cond_1

    .line 511
    const-string v2, "current node is not an Array"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lnet/minidev/json/JSONNavi;->failure(Ljava/lang/String;Ljava/lang/Object;)Lnet/minidev/json/JSONNavi;

    move-result-object p0

    goto :goto_0

    .line 513
    :cond_1
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    .line 514
    .local v0, "lst":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    if-gez p1, :cond_2

    .line 515
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    add-int/2addr p1, v2

    .line 516
    if-gez p1, :cond_2

    .line 517
    const/4 p1, 0x0

    .line 519
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-lt p1, v2, :cond_4

    .line 520
    iget-boolean v2, p0, Lnet/minidev/json/JSONNavi;->readonly:Z

    if-eqz v2, :cond_3

    .line 521
    const-string v2, "Out of bound exception for index"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lnet/minidev/json/JSONNavi;->failure(Ljava/lang/String;Ljava/lang/Object;)Lnet/minidev/json/JSONNavi;

    move-result-object p0

    goto :goto_0

    .line 523
    :cond_3
    iget-object v2, p0, Lnet/minidev/json/JSONNavi;->stack:Ljava/util/Stack;

    iget-object v3, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    invoke-virtual {v2, v3}, Ljava/util/Stack;->add(Ljava/lang/Object;)Z

    .line 524
    iget-object v2, p0, Lnet/minidev/json/JSONNavi;->path:Ljava/util/Stack;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/Stack;->add(Ljava/lang/Object;)Z

    .line 525
    const/4 v2, 0x0

    iput-object v2, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    .line 526
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iput-object v2, p0, Lnet/minidev/json/JSONNavi;->missingKey:Ljava/lang/Object;

    goto :goto_0

    .line 529
    :cond_4
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 530
    .local v1, "next":Ljava/lang/Object;
    iget-object v2, p0, Lnet/minidev/json/JSONNavi;->stack:Ljava/util/Stack;

    iget-object v3, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    invoke-virtual {v2, v3}, Ljava/util/Stack;->add(Ljava/lang/Object;)Z

    .line 531
    iget-object v2, p0, Lnet/minidev/json/JSONNavi;->path:Ljava/util/Stack;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/Stack;->add(Ljava/lang/Object;)Z

    .line 532
    iput-object v1, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    goto :goto_0
.end method

.method public at(Ljava/lang/String;)Lnet/minidev/json/JSONNavi;
    .locals 3
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lnet/minidev/json/JSONNavi",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 115
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    iget-boolean v1, p0, Lnet/minidev/json/JSONNavi;->failure:Z

    if-eqz v1, :cond_0

    .line 134
    .end local p0    # "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    :goto_0
    return-object p0

    .line 117
    .restart local p0    # "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    :cond_0
    iget-object v1, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    invoke-direct {p0, v1}, Lnet/minidev/json/JSONNavi;->isObject(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 118
    invoke-virtual {p0}, Lnet/minidev/json/JSONNavi;->object()Lnet/minidev/json/JSONNavi;

    .line 119
    :cond_1
    iget-object v1, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    instance-of v1, v1, Ljava/util/Map;

    if-nez v1, :cond_2

    .line 120
    const-string v1, "current node is not an Object"

    invoke-direct {p0, v1, p1}, Lnet/minidev/json/JSONNavi;->failure(Ljava/lang/String;Ljava/lang/Object;)Lnet/minidev/json/JSONNavi;

    move-result-object p0

    goto :goto_0

    .line 121
    :cond_2
    iget-object v1, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    invoke-direct {p0, v1}, Lnet/minidev/json/JSONNavi;->o(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 122
    iget-boolean v1, p0, Lnet/minidev/json/JSONNavi;->readonly:Z

    if-eqz v1, :cond_3

    .line 123
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "current Object have no key named "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1, p1}, Lnet/minidev/json/JSONNavi;->failure(Ljava/lang/String;Ljava/lang/Object;)Lnet/minidev/json/JSONNavi;

    move-result-object p0

    goto :goto_0

    .line 124
    :cond_3
    iget-object v1, p0, Lnet/minidev/json/JSONNavi;->stack:Ljava/util/Stack;

    iget-object v2, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/util/Stack;->add(Ljava/lang/Object;)Z

    .line 125
    iget-object v1, p0, Lnet/minidev/json/JSONNavi;->path:Ljava/util/Stack;

    invoke-virtual {v1, p1}, Ljava/util/Stack;->add(Ljava/lang/Object;)Z

    .line 126
    const/4 v1, 0x0

    iput-object v1, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    .line 127
    iput-object p1, p0, Lnet/minidev/json/JSONNavi;->missingKey:Ljava/lang/Object;

    goto :goto_0

    .line 130
    :cond_4
    iget-object v1, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    invoke-direct {p0, v1}, Lnet/minidev/json/JSONNavi;->o(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 131
    .local v0, "next":Ljava/lang/Object;
    iget-object v1, p0, Lnet/minidev/json/JSONNavi;->stack:Ljava/util/Stack;

    iget-object v2, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/util/Stack;->add(Ljava/lang/Object;)Z

    .line 132
    iget-object v1, p0, Lnet/minidev/json/JSONNavi;->path:Ljava/util/Stack;

    invoke-virtual {v1, p1}, Ljava/util/Stack;->add(Ljava/lang/Object;)Z

    .line 133
    iput-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    goto :goto_0
.end method

.method public atNext()Lnet/minidev/json/JSONNavi;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lnet/minidev/json/JSONNavi",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 542
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    iget-boolean v1, p0, Lnet/minidev/json/JSONNavi;->failure:Z

    if-eqz v1, :cond_0

    .line 548
    .end local p0    # "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    .local v0, "lst":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    :goto_0
    return-object p0

    .line 544
    .end local v0    # "lst":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .restart local p0    # "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    :cond_0
    iget-object v1, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    instance-of v1, v1, Ljava/util/List;

    if-nez v1, :cond_1

    .line 545
    const-string v1, "current node is not an Array"

    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Lnet/minidev/json/JSONNavi;->failure(Ljava/lang/String;Ljava/lang/Object;)Lnet/minidev/json/JSONNavi;

    move-result-object p0

    goto :goto_0

    .line 547
    :cond_1
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    .line 548
    .restart local v0    # "lst":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {p0, v1}, Lnet/minidev/json/JSONNavi;->at(I)Lnet/minidev/json/JSONNavi;

    move-result-object p0

    goto :goto_0
.end method

.method public getCurrentObject()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 111
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    return-object v0
.end method

.method public getJPath()Ljava/lang/String;
    .locals 5

    .prologue
    .line 625
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 626
    .local v2, "sb":Ljava/lang/StringBuilder;
    iget-object v3, p0, Lnet/minidev/json/JSONNavi;->path:Ljava/util/Stack;

    invoke-virtual {v3}, Ljava/util/Stack;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 627
    .local v1, "o":Ljava/lang/Object;
    instance-of v3, v1, Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 628
    const/16 v3, 0x2f

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 630
    :cond_0
    const/16 v3, 0x5b

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x5d

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 632
    .end local v1    # "o":Ljava/lang/Object;
    :cond_1
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public getRoot()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 446
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->root:Ljava/lang/Object;

    return-object v0
.end method

.method public hasFailure()Z
    .locals 1

    .prologue
    .line 107
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    iget-boolean v0, p0, Lnet/minidev/json/JSONNavi;->failure:Z

    return v0
.end method

.method public object()Lnet/minidev/json/JSONNavi;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lnet/minidev/json/JSONNavi",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    const/4 v1, 0x0

    .line 367
    iget-boolean v0, p0, Lnet/minidev/json/JSONNavi;->failure:Z

    if-eqz v0, :cond_1

    .line 384
    :cond_0
    :goto_0
    return-object p0

    .line 369
    :cond_1
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lnet/minidev/json/JSONNavi;->readonly:Z

    if-eqz v0, :cond_2

    .line 370
    const-string v0, "Can not create Object child in readonly"

    invoke-direct {p0, v0, v1}, Lnet/minidev/json/JSONNavi;->failure(Ljava/lang/String;Ljava/lang/Object;)Lnet/minidev/json/JSONNavi;

    .line 371
    :cond_2
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    if-eqz v0, :cond_4

    .line 372
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    invoke-direct {p0, v0}, Lnet/minidev/json/JSONNavi;->isObject(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 374
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    invoke-direct {p0, v0}, Lnet/minidev/json/JSONNavi;->isArray(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 375
    const-string v0, "can not use Object feature on Array."

    invoke-direct {p0, v0, v1}, Lnet/minidev/json/JSONNavi;->failure(Ljava/lang/String;Ljava/lang/Object;)Lnet/minidev/json/JSONNavi;

    .line 376
    :cond_3
    const-string v0, "Can not use current possition as Object"

    invoke-direct {p0, v0, v1}, Lnet/minidev/json/JSONNavi;->failure(Ljava/lang/String;Ljava/lang/Object;)Lnet/minidev/json/JSONNavi;

    .line 380
    :goto_1
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->root:Ljava/lang/Object;

    if-nez v0, :cond_5

    .line 381
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    iput-object v0, p0, Lnet/minidev/json/JSONNavi;->root:Ljava/lang/Object;

    goto :goto_0

    .line 378
    :cond_4
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->factory:Lnet/minidev/json/parser/ContainerFactory;

    invoke-interface {v0}, Lnet/minidev/json/parser/ContainerFactory;->createObjectContainer()Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    goto :goto_1

    .line 383
    :cond_5
    invoke-direct {p0}, Lnet/minidev/json/JSONNavi;->store()V

    goto :goto_0
.end method

.method public root()Lnet/minidev/json/JSONNavi;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lnet/minidev/json/JSONNavi",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    const/4 v1, 0x0

    .line 97
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->root:Ljava/lang/Object;

    iput-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    .line 98
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->stack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->clear()V

    .line 99
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->path:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->clear()V

    .line 100
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnet/minidev/json/JSONNavi;->failure:Z

    .line 101
    iput-object v1, p0, Lnet/minidev/json/JSONNavi;->missingKey:Ljava/lang/Object;

    .line 102
    iput-object v1, p0, Lnet/minidev/json/JSONNavi;->failureMessage:Ljava/lang/String;

    .line 103
    return-object p0
.end method

.method public set(Ljava/lang/Boolean;)Lnet/minidev/json/JSONNavi;
    .locals 1
    .param p1, "bool"    # Ljava/lang/Boolean;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Boolean;",
            ")",
            "Lnet/minidev/json/JSONNavi",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 427
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    iget-boolean v0, p0, Lnet/minidev/json/JSONNavi;->failure:Z

    if-eqz v0, :cond_0

    .line 431
    :goto_0
    return-object p0

    .line 429
    :cond_0
    iput-object p1, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    .line 430
    invoke-direct {p0}, Lnet/minidev/json/JSONNavi;->store()V

    goto :goto_0
.end method

.method public set(Ljava/lang/Number;)Lnet/minidev/json/JSONNavi;
    .locals 1
    .param p1, "num"    # Ljava/lang/Number;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Number;",
            ")",
            "Lnet/minidev/json/JSONNavi",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 416
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    iget-boolean v0, p0, Lnet/minidev/json/JSONNavi;->failure:Z

    if-eqz v0, :cond_0

    .line 420
    :goto_0
    return-object p0

    .line 418
    :cond_0
    iput-object p1, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    .line 419
    invoke-direct {p0}, Lnet/minidev/json/JSONNavi;->store()V

    goto :goto_0
.end method

.method public set(Ljava/lang/String;)Lnet/minidev/json/JSONNavi;
    .locals 1
    .param p1, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lnet/minidev/json/JSONNavi",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 438
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    iget-boolean v0, p0, Lnet/minidev/json/JSONNavi;->failure:Z

    if-eqz v0, :cond_0

    .line 442
    :goto_0
    return-object p0

    .line 440
    :cond_0
    iput-object p1, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    .line 441
    invoke-direct {p0}, Lnet/minidev/json/JSONNavi;->store()V

    goto :goto_0
.end method

.method public set(Ljava/lang/String;D)Lnet/minidev/json/JSONNavi;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # D
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "D)",
            "Lnet/minidev/json/JSONNavi",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 189
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lnet/minidev/json/JSONNavi;->set(Ljava/lang/String;Ljava/lang/Number;)Lnet/minidev/json/JSONNavi;

    move-result-object v0

    return-object v0
.end method

.method public set(Ljava/lang/String;F)Lnet/minidev/json/JSONNavi;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "F)",
            "Lnet/minidev/json/JSONNavi",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 202
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lnet/minidev/json/JSONNavi;->set(Ljava/lang/String;Ljava/lang/Number;)Lnet/minidev/json/JSONNavi;

    move-result-object v0

    return-object v0
.end method

.method public set(Ljava/lang/String;I)Lnet/minidev/json/JSONNavi;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)",
            "Lnet/minidev/json/JSONNavi",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 176
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lnet/minidev/json/JSONNavi;->set(Ljava/lang/String;Ljava/lang/Number;)Lnet/minidev/json/JSONNavi;

    move-result-object v0

    return-object v0
.end method

.method public set(Ljava/lang/String;J)Lnet/minidev/json/JSONNavi;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "J)",
            "Lnet/minidev/json/JSONNavi",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 163
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lnet/minidev/json/JSONNavi;->set(Ljava/lang/String;Ljava/lang/Number;)Lnet/minidev/json/JSONNavi;

    move-result-object v0

    return-object v0
.end method

.method public set(Ljava/lang/String;Ljava/lang/Number;)Lnet/minidev/json/JSONNavi;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Number;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Number;",
            ")",
            "Lnet/minidev/json/JSONNavi",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 146
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    invoke-virtual {p0}, Lnet/minidev/json/JSONNavi;->object()Lnet/minidev/json/JSONNavi;

    .line 147
    iget-boolean v0, p0, Lnet/minidev/json/JSONNavi;->failure:Z

    if-eqz v0, :cond_0

    .line 150
    :goto_0
    return-object p0

    .line 149
    :cond_0
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    invoke-direct {p0, v0}, Lnet/minidev/json/JSONNavi;->o(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public set(Ljava/lang/String;Ljava/lang/String;)Lnet/minidev/json/JSONNavi;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lnet/minidev/json/JSONNavi",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 138
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    invoke-virtual {p0}, Lnet/minidev/json/JSONNavi;->object()Lnet/minidev/json/JSONNavi;

    .line 139
    iget-boolean v0, p0, Lnet/minidev/json/JSONNavi;->failure:Z

    if-eqz v0, :cond_0

    .line 142
    :goto_0
    return-object p0

    .line 141
    :cond_0
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    invoke-direct {p0, v0}, Lnet/minidev/json/JSONNavi;->o(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 586
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    iget-boolean v0, p0, Lnet/minidev/json/JSONNavi;->failure:Z

    if-eqz v0, :cond_0

    .line 587
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->failureMessage:Ljava/lang/String;

    sget-object v1, Lnet/minidev/json/JSONNavi;->ERROR_COMPRESS:Lnet/minidev/json/JSONStyle;

    invoke-static {v0, v1}, Lnet/minidev/json/JSONValue;->toJSONString(Ljava/lang/Object;Lnet/minidev/json/JSONStyle;)Ljava/lang/String;

    move-result-object v0

    .line 588
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->root:Ljava/lang/Object;

    invoke-static {v0}, Lnet/minidev/json/JSONValue;->toJSONString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public toString(Lnet/minidev/json/JSONStyle;)Ljava/lang/String;
    .locals 1
    .param p1, "compression"    # Lnet/minidev/json/JSONStyle;

    .prologue
    .line 597
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    iget-boolean v0, p0, Lnet/minidev/json/JSONNavi;->failure:Z

    if-eqz v0, :cond_0

    .line 598
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->failureMessage:Ljava/lang/String;

    invoke-static {v0, p1}, Lnet/minidev/json/JSONValue;->toJSONString(Ljava/lang/Object;Lnet/minidev/json/JSONStyle;)Ljava/lang/String;

    move-result-object v0

    .line 599
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->root:Ljava/lang/Object;

    invoke-static {v0, p1}, Lnet/minidev/json/JSONValue;->toJSONString(Ljava/lang/Object;Lnet/minidev/json/JSONStyle;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public up()Lnet/minidev/json/JSONNavi;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lnet/minidev/json/JSONNavi",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 573
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->stack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 574
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->stack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    .line 575
    iget-object v0, p0, Lnet/minidev/json/JSONNavi;->path:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    .line 577
    :cond_0
    return-object p0
.end method

.method public up(I)Lnet/minidev/json/JSONNavi;
    .locals 2
    .param p1, "level"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lnet/minidev/json/JSONNavi",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 558
    .local p0, "this":Lnet/minidev/json/JSONNavi;, "Lnet/minidev/json/JSONNavi<TT;>;"
    move v0, p1

    .end local p1    # "level":I
    .local v0, "level":I
    :goto_0
    add-int/lit8 p1, v0, -0x1

    .end local v0    # "level":I
    .restart local p1    # "level":I
    if-lez v0, :cond_0

    .line 559
    iget-object v1, p0, Lnet/minidev/json/JSONNavi;->stack:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 560
    iget-object v1, p0, Lnet/minidev/json/JSONNavi;->stack:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v1

    iput-object v1, p0, Lnet/minidev/json/JSONNavi;->current:Ljava/lang/Object;

    .line 561
    iget-object v1, p0, Lnet/minidev/json/JSONNavi;->path:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move v0, p1

    .end local p1    # "level":I
    .restart local v0    # "level":I
    goto :goto_0

    .line 565
    .end local v0    # "level":I
    .restart local p1    # "level":I
    :cond_0
    return-object p0
.end method
