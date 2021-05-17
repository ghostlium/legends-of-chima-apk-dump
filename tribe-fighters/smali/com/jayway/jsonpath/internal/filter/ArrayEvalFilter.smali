.class public Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter;
.super Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;
.source "ArrayEvalFilter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter$1;,
        Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter$ConditionStatement;
    }
.end annotation


# static fields
.field private static final PATTERN:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    const-string v0, "(.*?)\\s?([=<>]+)\\s?(.*)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter;->PATTERN:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "condition"    # Ljava/lang/String;

    .prologue
    .line 34
    invoke-direct {p0, p1}, Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;-><init>(Ljava/lang/String;)V

    .line 35
    return-void
.end method

.method private createConditionStatement(Ljava/lang/String;)Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter$ConditionStatement;
    .locals 7
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 92
    sget-object v0, Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter;->PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v6

    .line 93
    .local v6, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v6}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 94
    const/4 v0, 0x1

    invoke-virtual {v6, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    .line 95
    .local v2, "property":Ljava/lang/String;
    const/4 v0, 0x2

    invoke-virtual {v6, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    .line 96
    .local v3, "operator":Ljava/lang/String;
    const/4 v0, 0x3

    invoke-virtual {v6, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    .line 98
    .local v4, "expected":Ljava/lang/String;
    new-instance v0, Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter$ConditionStatement;

    const/4 v5, 0x0

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter$ConditionStatement;-><init>(Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter$1;)V

    return-object v0

    .line 100
    .end local v2    # "property":Ljava/lang/String;
    .end local v3    # "operator":Ljava/lang/String;
    .end local v4    # "expected":Ljava/lang/String;
    :cond_0
    new-instance v0, Lcom/jayway/jsonpath/InvalidPathException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Invalid match "

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/jayway/jsonpath/InvalidPathException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private isMatch(Ljava/lang/Object;Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter$ConditionStatement;Lcom/jayway/jsonpath/spi/JsonProvider;)Z
    .locals 4
    .param p1, "check"    # Ljava/lang/Object;
    .param p2, "conditionStatement"    # Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter$ConditionStatement;
    .param p3, "jsonProvider"    # Lcom/jayway/jsonpath/spi/JsonProvider;

    .prologue
    const/4 v2, 0x0

    .line 73
    invoke-interface {p3, p1}, Lcom/jayway/jsonpath/spi/JsonProvider;->isMap(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 87
    :cond_0
    :goto_0
    return v2

    .line 76
    :cond_1
    invoke-interface {p3, p1}, Lcom/jayway/jsonpath/spi/JsonProvider;->toMap(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v0

    .line 78
    .local v0, "obj":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {p2}, Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter$ConditionStatement;->getField()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 82
    invoke-virtual {p2}, Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter$ConditionStatement;->getField()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 84
    .local v1, "propertyValue":Ljava/lang/Object;
    invoke-interface {p3, v1}, Lcom/jayway/jsonpath/spi/JsonProvider;->isContainer(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 87
    invoke-virtual {p2}, Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter$ConditionStatement;->getOperator()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2}, Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter$ConditionStatement;->getExpected()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/jayway/jsonpath/internal/filter/eval/ExpressionEvaluator;->eval(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    goto :goto_0
.end method


# virtual methods
.method public filter(Ljava/lang/Object;Lcom/jayway/jsonpath/spi/JsonProvider;)Ljava/lang/Object;
    .locals 8
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "jsonProvider"    # Lcom/jayway/jsonpath/spi/JsonProvider;

    .prologue
    .line 40
    invoke-interface {p2, p1}, Lcom/jayway/jsonpath/spi/JsonProvider;->toList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    .line 41
    .local v4, "src":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    invoke-interface {p2}, Lcom/jayway/jsonpath/spi/JsonProvider;->createList()Ljava/util/List;

    move-result-object v3

    .line 43
    .local v3, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    iget-object v5, p0, Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter;->condition:Ljava/lang/String;

    .line 45
    .local v5, "trimmedCondition":Ljava/lang/String;
    iget-object v6, p0, Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter;->condition:Ljava/lang/String;

    const-string v7, "[\'"

    invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 46
    const-string v6, "[\'"

    const-string v7, "."

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    .line 47
    const-string v6, "\']"

    const-string v7, ""

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    .line 50
    :cond_0
    const/4 v6, 0x5

    const/4 v7, 0x2

    invoke-virtual {p0, v5, v6, v7}, Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter;->trim(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v5

    .line 52
    invoke-direct {p0, v5}, Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter;->createConditionStatement(Ljava/lang/String;)Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter$ConditionStatement;

    move-result-object v0

    .line 54
    .local v0, "conditionStatement":Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter$ConditionStatement;
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 55
    .local v2, "item":Ljava/lang/Object;
    invoke-direct {p0, v2, v0, p2}, Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter;->isMatch(Ljava/lang/Object;Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter$ConditionStatement;Lcom/jayway/jsonpath/spi/JsonProvider;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 56
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 59
    .end local v2    # "item":Ljava/lang/Object;
    :cond_2
    return-object v3
.end method

.method public getRef(Ljava/lang/Object;Lcom/jayway/jsonpath/spi/JsonProvider;)Ljava/lang/Object;
    .locals 2
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "jsonProvider"    # Lcom/jayway/jsonpath/spi/JsonProvider;

    .prologue
    .line 64
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, ""

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public isArrayFilter()Z
    .locals 1

    .prologue
    .line 69
    const/4 v0, 0x1

    return v0
.end method
