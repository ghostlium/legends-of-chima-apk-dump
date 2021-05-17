.class public Lcom/jayway/jsonpath/internal/filter/ArrayIndexFilter;
.super Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;
.source "ArrayIndexFilter.java"


# static fields
.field private static final SINGLE_ARRAY_INDEX_PATTERN:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 27
    const-string v0, "\\[\\d+\\]"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/jayway/jsonpath/internal/filter/ArrayIndexFilter;->SINGLE_ARRAY_INDEX_PATTERN:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "condition"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;-><init>(Ljava/lang/String;)V

    .line 31
    return-void
.end method


# virtual methods
.method public filter(Ljava/lang/Object;Lcom/jayway/jsonpath/spi/JsonProvider;)Ljava/lang/Object;
    .locals 13
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "jsonProvider"    # Lcom/jayway/jsonpath/spi/JsonProvider;

    .prologue
    .line 36
    invoke-interface {p2, p1}, Lcom/jayway/jsonpath/spi/JsonProvider;->toList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    .line 37
    .local v8, "src":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    invoke-interface {p2}, Lcom/jayway/jsonpath/spi/JsonProvider;->createList()Ljava/util/List;

    move-result-object v7

    .line 39
    .local v7, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    iget-object v10, p0, Lcom/jayway/jsonpath/internal/filter/ArrayIndexFilter;->condition:Ljava/lang/String;

    const/4 v11, 0x1

    const/4 v12, 0x1

    invoke-virtual {p0, v10, v11, v12}, Lcom/jayway/jsonpath/internal/filter/ArrayIndexFilter;->trim(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v9

    .line 41
    .local v9, "trimmedCondition":Ljava/lang/String;
    const-string v10, "@.length"

    invoke-virtual {v9, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 42
    const/4 v10, 0x1

    const/4 v11, 0x1

    invoke-virtual {p0, v9, v10, v11}, Lcom/jayway/jsonpath/internal/filter/ArrayIndexFilter;->trim(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v9

    .line 43
    const-string v10, "@.length"

    const-string v11, ""

    invoke-virtual {v9, v10, v11}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v9

    .line 44
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ":"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 48
    :cond_0
    const-string v10, ":"

    invoke-virtual {v9, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 49
    const/4 v10, 0x1

    const/4 v11, 0x0

    invoke-virtual {p0, v9, v10, v11}, Lcom/jayway/jsonpath/internal/filter/ArrayIndexFilter;->trim(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v9

    .line 50
    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 51
    .local v1, "get":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_2

    .line 52
    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    invoke-interface {v7, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 56
    .end local v1    # "get":I
    .end local v2    # "i":I
    :cond_1
    const-string v10, ":"

    invoke-virtual {v9, v10}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_3

    .line 57
    const-string v10, " "

    const-string v11, ""

    invoke-virtual {v9, v10, v11}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x1

    const/4 v12, 0x1

    invoke-virtual {p0, v10, v11, v12}, Lcom/jayway/jsonpath/internal/filter/ArrayIndexFilter;->trim(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v9

    .line 58
    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 59
    .restart local v1    # "get":I
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v10

    sub-int/2addr v10, v1

    invoke-interface {v8, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    .line 75
    .end local v1    # "get":I
    .end local v7    # "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    :cond_2
    :goto_1
    return-object v7

    .line 62
    .restart local v7    # "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    :cond_3
    const-string v10, ","

    invoke-virtual {v9, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 64
    .local v5, "indexArr":[Ljava/lang/String;
    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_2

    .line 68
    array-length v10, v5

    const/4 v11, 0x1

    if-ne v10, v11, :cond_4

    .line 69
    const/4 v10, 0x0

    aget-object v10, v5, v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    invoke-interface {v8, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    goto :goto_1

    .line 72
    :cond_4
    move-object v0, v5

    .local v0, "arr$":[Ljava/lang/String;
    array-length v6, v0

    .local v6, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_2
    if-ge v3, v6, :cond_2

    aget-object v4, v0, v3

    .line 73
    .local v4, "idx":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    invoke-interface {v8, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    invoke-interface {v7, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 72
    add-int/lit8 v3, v3, 0x1

    goto :goto_2
.end method

.method public getRef(Ljava/lang/Object;Lcom/jayway/jsonpath/spi/JsonProvider;)Ljava/lang/Object;
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "jsonProvider"    # Lcom/jayway/jsonpath/spi/JsonProvider;

    .prologue
    const/4 v4, 0x1

    .line 82
    sget-object v2, Lcom/jayway/jsonpath/internal/filter/ArrayIndexFilter;->SINGLE_ARRAY_INDEX_PATTERN:Ljava/util/regex/Pattern;

    iget-object v3, p0, Lcom/jayway/jsonpath/internal/filter/ArrayIndexFilter;->condition:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/regex/Matcher;->matches()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 83
    iget-object v2, p0, Lcom/jayway/jsonpath/internal/filter/ArrayIndexFilter;->condition:Ljava/lang/String;

    invoke-virtual {p0, v2, v4, v4}, Lcom/jayway/jsonpath/internal/filter/ArrayIndexFilter;->trim(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v1

    .line 84
    .local v1, "trimmedCondition":Ljava/lang/String;
    invoke-interface {p2, p1}, Lcom/jayway/jsonpath/spi/JsonProvider;->toList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 85
    .local v0, "src":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .line 88
    .end local v0    # "src":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .end local v1    # "trimmedCondition":Ljava/lang/String;
    :cond_0
    new-instance v2, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v2}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v2
.end method

.method public isArrayFilter()Z
    .locals 1

    .prologue
    .line 94
    const/4 v0, 0x1

    return v0
.end method
