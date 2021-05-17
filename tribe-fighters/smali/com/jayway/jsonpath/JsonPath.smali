.class public Lcom/jayway/jsonpath/JsonPath;
.super Ljava/lang/Object;
.source "JsonPath.java"


# static fields
.field private static DEFINITE_PATH_PATTERN:Ljava/util/regex/Pattern;


# instance fields
.field private filters:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/jayway/jsonpath/Filter;",
            ">;"
        }
    .end annotation
.end field

.field private tokenizer:Lcom/jayway/jsonpath/internal/PathTokenizer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 100
    const-string v0, ".*(\\.\\.|\\*|\\[[\\\\/]|\\?|,|:\\s?\\]|\\[\\s?:|>|\\(|<|=|\\+).*"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/jayway/jsonpath/JsonPath;->DEFINITE_PATH_PATTERN:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;[Lcom/jayway/jsonpath/Filter;)V
    .locals 3
    .param p1, "jsonPath"    # Ljava/lang/String;
    .param p2, "filters"    # [Lcom/jayway/jsonpath/Filter;

    .prologue
    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 106
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "[^\\?\\+\\=\\-\\*\\/\\!]\\("

    invoke-virtual {p1, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 110
    :cond_0
    new-instance v1, Lcom/jayway/jsonpath/InvalidPathException;

    const-string v2, "Invalid path"

    invoke-direct {v1, v2}, Lcom/jayway/jsonpath/InvalidPathException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 113
    :cond_1
    const-string v1, "[?]"

    invoke-static {p1, v1}, Lorg/apache/commons/lang/StringUtils;->countMatches(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 114
    .local v0, "filterCountInPath":I
    array-length v1, p2

    if-ne v0, v1, :cond_2

    const/4 v1, 0x1

    :goto_0
    const-string v2, "Filters in path ([?]) does not match provided filters."

    invoke-static {v1, v2}, Lorg/apache/commons/lang/Validate;->isTrue(ZLjava/lang/String;)V

    .line 116
    new-instance v1, Lcom/jayway/jsonpath/internal/PathTokenizer;

    invoke-direct {v1, p1}, Lcom/jayway/jsonpath/internal/PathTokenizer;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/jayway/jsonpath/JsonPath;->tokenizer:Lcom/jayway/jsonpath/internal/PathTokenizer;

    .line 117
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iput-object v1, p0, Lcom/jayway/jsonpath/JsonPath;->filters:Ljava/util/LinkedList;

    .line 118
    iget-object v1, p0, Lcom/jayway/jsonpath/JsonPath;->filters:Ljava/util/LinkedList;

    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->addAll(Ljava/util/Collection;)Z

    .line 120
    return-void

    .line 114
    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static varargs compile(Ljava/lang/String;[Lcom/jayway/jsonpath/Filter;)Lcom/jayway/jsonpath/JsonPath;
    .locals 1
    .param p0, "jsonPath"    # Ljava/lang/String;
    .param p1, "filters"    # [Lcom/jayway/jsonpath/Filter;

    .prologue
    .line 290
    const-string v0, "json can not be null or empty"

    invoke-static {p0, v0}, Lorg/apache/commons/lang/Validate;->notEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 292
    new-instance v0, Lcom/jayway/jsonpath/JsonPath;

    invoke-direct {v0, p0, p1}, Lcom/jayway/jsonpath/JsonPath;-><init>(Ljava/lang/String;[Lcom/jayway/jsonpath/Filter;)V

    return-object v0
.end method

.method public static varargs read(Ljava/io/File;Ljava/lang/String;[Lcom/jayway/jsonpath/Filter;)Ljava/lang/Object;
    .locals 1
    .param p0, "jsonFile"    # Ljava/io/File;
    .param p1, "jsonPath"    # Ljava/lang/String;
    .param p2, "filters"    # [Lcom/jayway/jsonpath/Filter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/io/File;",
            "Ljava/lang/String;",
            "[",
            "Lcom/jayway/jsonpath/Filter;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 364
    const-string v0, "json file can not be null"

    invoke-static {p0, v0}, Lorg/apache/commons/lang/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 365
    const-string v0, "jsonPath can not be null or empty"

    invoke-static {p1, v0}, Lorg/apache/commons/lang/Validate;->notEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 367
    invoke-static {p1, p2}, Lcom/jayway/jsonpath/JsonPath;->compile(Ljava/lang/String;[Lcom/jayway/jsonpath/Filter;)Lcom/jayway/jsonpath/JsonPath;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/jayway/jsonpath/JsonPath;->read(Ljava/io/File;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static varargs read(Ljava/io/InputStream;Ljava/lang/String;[Lcom/jayway/jsonpath/Filter;)Ljava/lang/Object;
    .locals 1
    .param p0, "jsonInputStream"    # Ljava/io/InputStream;
    .param p1, "jsonPath"    # Ljava/lang/String;
    .param p2, "filters"    # [Lcom/jayway/jsonpath/Filter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/io/InputStream;",
            "Ljava/lang/String;",
            "[",
            "Lcom/jayway/jsonpath/Filter;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 381
    const-string v0, "json input stream can not be null"

    invoke-static {p0, v0}, Lorg/apache/commons/lang/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 382
    const-string v0, "jsonPath can not be null or empty"

    invoke-static {p1, v0}, Lorg/apache/commons/lang/Validate;->notEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 384
    invoke-static {p1, p2}, Lcom/jayway/jsonpath/JsonPath;->compile(Ljava/lang/String;[Lcom/jayway/jsonpath/Filter;)Lcom/jayway/jsonpath/JsonPath;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/jayway/jsonpath/JsonPath;->read(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static varargs read(Ljava/lang/Object;Ljava/lang/String;[Lcom/jayway/jsonpath/Filter;)Ljava/lang/Object;
    .locals 1
    .param p0, "json"    # Ljava/lang/Object;
    .param p1, "jsonPath"    # Ljava/lang/String;
    .param p2, "filters"    # [Lcom/jayway/jsonpath/Filter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "[",
            "Lcom/jayway/jsonpath/Filter;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 330
    const-string v0, "json can not be null"

    invoke-static {p0, v0}, Lorg/apache/commons/lang/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 331
    const-string v0, "jsonPath can not be null"

    invoke-static {p1, v0}, Lorg/apache/commons/lang/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 333
    invoke-static {p1, p2}, Lcom/jayway/jsonpath/JsonPath;->compile(Ljava/lang/String;[Lcom/jayway/jsonpath/Filter;)Lcom/jayway/jsonpath/JsonPath;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/jayway/jsonpath/JsonPath;->read(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static varargs read(Ljava/lang/String;Ljava/lang/String;[Lcom/jayway/jsonpath/Filter;)Ljava/lang/Object;
    .locals 1
    .param p0, "json"    # Ljava/lang/String;
    .param p1, "jsonPath"    # Ljava/lang/String;
    .param p2, "filters"    # [Lcom/jayway/jsonpath/Filter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "[",
            "Lcom/jayway/jsonpath/Filter;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 313
    const-string v0, "json can not be null or empty"

    invoke-static {p0, v0}, Lorg/apache/commons/lang/Validate;->notEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 314
    const-string v0, "jsonPath can not be null or empty"

    invoke-static {p1, v0}, Lorg/apache/commons/lang/Validate;->notEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 316
    invoke-static {p1, p2}, Lcom/jayway/jsonpath/JsonPath;->compile(Ljava/lang/String;[Lcom/jayway/jsonpath/Filter;)Lcom/jayway/jsonpath/JsonPath;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/jayway/jsonpath/JsonPath;->read(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static varargs read(Ljava/net/URL;Ljava/lang/String;[Lcom/jayway/jsonpath/Filter;)Ljava/lang/Object;
    .locals 1
    .param p0, "jsonURL"    # Ljava/net/URL;
    .param p1, "jsonPath"    # Ljava/lang/String;
    .param p2, "filters"    # [Lcom/jayway/jsonpath/Filter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/net/URL;",
            "Ljava/lang/String;",
            "[",
            "Lcom/jayway/jsonpath/Filter;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 347
    const-string v0, "json URL can not be null"

    invoke-static {p0, v0}, Lorg/apache/commons/lang/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 348
    const-string v0, "jsonPath can not be null or empty"

    invoke-static {p1, v0}, Lorg/apache/commons/lang/Validate;->notEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 350
    invoke-static {p1, p2}, Lcom/jayway/jsonpath/JsonPath;->compile(Ljava/lang/String;[Lcom/jayway/jsonpath/Filter;)Lcom/jayway/jsonpath/JsonPath;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/jayway/jsonpath/JsonPath;->read(Ljava/net/URL;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public copy()Lcom/jayway/jsonpath/JsonPath;
    .locals 4

    .prologue
    .line 128
    new-instance v1, Lcom/jayway/jsonpath/JsonPath;

    iget-object v0, p0, Lcom/jayway/jsonpath/JsonPath;->tokenizer:Lcom/jayway/jsonpath/internal/PathTokenizer;

    invoke-virtual {v0}, Lcom/jayway/jsonpath/internal/PathTokenizer;->getPath()Ljava/lang/String;

    move-result-object v2

    iget-object v0, p0, Lcom/jayway/jsonpath/JsonPath;->filters:Ljava/util/LinkedList;

    const/4 v3, 0x0

    new-array v3, v3, [Lcom/jayway/jsonpath/Filter;

    invoke-virtual {v0, v3}, Ljava/util/LinkedList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/jayway/jsonpath/Filter;

    invoke-direct {v1, v2, v0}, Lcom/jayway/jsonpath/JsonPath;-><init>(Ljava/lang/String;[Lcom/jayway/jsonpath/Filter;)V

    return-object v1
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 138
    iget-object v0, p0, Lcom/jayway/jsonpath/JsonPath;->tokenizer:Lcom/jayway/jsonpath/internal/PathTokenizer;

    invoke-virtual {v0}, Lcom/jayway/jsonpath/internal/PathTokenizer;->getPath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getTokenizer()Lcom/jayway/jsonpath/internal/PathTokenizer;
    .locals 1

    .prologue
    .line 123
    iget-object v0, p0, Lcom/jayway/jsonpath/JsonPath;->tokenizer:Lcom/jayway/jsonpath/internal/PathTokenizer;

    return-object v0
.end method

.method public isPathDefinite()Z
    .locals 4

    .prologue
    .line 162
    invoke-virtual {p0}, Lcom/jayway/jsonpath/JsonPath;->getPath()Ljava/lang/String;

    move-result-object v1

    const-string v2, "\"[^\"\\\\\\n\r]*\""

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 164
    .local v0, "preparedPath":Ljava/lang/String;
    sget-object v1, Lcom/jayway/jsonpath/JsonPath;->DEFINITE_PATH_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public read(Ljava/io/File;)Ljava/lang/Object;
    .locals 4
    .param p1, "jsonFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/io/File;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 245
    const-string v2, "json file can not be null"

    invoke-static {p1, v2}, Lorg/apache/commons/lang/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 246
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v2

    const-string v3, "json file does not exist"

    invoke-static {v2, v3}, Lorg/apache/commons/lang/Validate;->isTrue(ZLjava/lang/String;)V

    .line 248
    const/4 v0, 0x0

    .line 250
    .local v0, "fis":Ljava/io/FileInputStream;
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 251
    .end local v0    # "fis":Ljava/io/FileInputStream;
    .local v1, "fis":Ljava/io/FileInputStream;
    :try_start_1
    invoke-static {}, Lcom/jayway/jsonpath/spi/JsonProviderFactory;->createProvider()Lcom/jayway/jsonpath/spi/JsonProvider;

    move-result-object v2

    invoke-interface {v2, v1}, Lcom/jayway/jsonpath/spi/JsonProvider;->parse(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/jayway/jsonpath/JsonPath;->read(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v2

    .line 253
    invoke-static {v1}, Lcom/jayway/jsonpath/internal/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    return-object v2

    .end local v1    # "fis":Ljava/io/FileInputStream;
    .restart local v0    # "fis":Ljava/io/FileInputStream;
    :catchall_0
    move-exception v2

    :goto_0
    invoke-static {v0}, Lcom/jayway/jsonpath/internal/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    throw v2

    .end local v0    # "fis":Ljava/io/FileInputStream;
    .restart local v1    # "fis":Ljava/io/FileInputStream;
    :catchall_1
    move-exception v2

    move-object v0, v1

    .end local v1    # "fis":Ljava/io/FileInputStream;
    .restart local v0    # "fis":Ljava/io/FileInputStream;
    goto :goto_0
.end method

.method public read(Ljava/io/InputStream;)Ljava/lang/Object;
    .locals 1
    .param p1, "jsonInputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/io/InputStream;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 267
    const-string v0, "json input stream can not be null"

    invoke-static {p1, v0}, Lorg/apache/commons/lang/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 270
    :try_start_0
    invoke-static {}, Lcom/jayway/jsonpath/spi/JsonProviderFactory;->createProvider()Lcom/jayway/jsonpath/spi/JsonProvider;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/jayway/jsonpath/spi/JsonProvider;->parse(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/jayway/jsonpath/JsonPath;->read(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 272
    invoke-static {p1}, Lcom/jayway/jsonpath/internal/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    return-object v0

    :catchall_0
    move-exception v0

    invoke-static {p1}, Lcom/jayway/jsonpath/internal/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    throw v0
.end method

.method public read(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 9
    .param p1, "jsonObject"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 177
    const-string v7, "json can not be null"

    invoke-static {p1, v7}, Lorg/apache/commons/lang/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 179
    instance-of v7, p1, Ljava/util/Map;

    if-nez v7, :cond_0

    instance-of v7, p1, Ljava/util/List;

    if-nez v7, :cond_0

    .line 180
    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "Invalid container object"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 182
    :cond_0
    new-instance v0, Ljava/util/LinkedList;

    iget-object v7, p0, Lcom/jayway/jsonpath/JsonPath;->filters:Ljava/util/LinkedList;

    invoke-direct {v0, v7}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V

    .line 183
    .local v0, "contextFilters":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/jayway/jsonpath/Filter;>;"
    invoke-static {}, Lcom/jayway/jsonpath/spi/JsonProviderFactory;->createProvider()Lcom/jayway/jsonpath/spi/JsonProvider;

    move-result-object v4

    .line 185
    .local v4, "jsonProvider":Lcom/jayway/jsonpath/spi/JsonProvider;
    move-object v6, p1

    .line 187
    .local v6, "result":Ljava/lang/Object;
    const/4 v3, 0x0

    .line 189
    .local v3, "inArrayContext":Z
    iget-object v7, p0, Lcom/jayway/jsonpath/JsonPath;->tokenizer:Lcom/jayway/jsonpath/internal/PathTokenizer;

    invoke-virtual {v7}, Lcom/jayway/jsonpath/internal/PathTokenizer;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/jayway/jsonpath/internal/PathToken;

    .line 190
    .local v5, "pathToken":Lcom/jayway/jsonpath/internal/PathToken;
    invoke-virtual {v5}, Lcom/jayway/jsonpath/internal/PathToken;->getFilter()Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;

    move-result-object v1

    .line 191
    .local v1, "filter":Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;
    invoke-virtual {v1, v6, v4, v0, v3}, Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;->filter(Ljava/lang/Object;Lcom/jayway/jsonpath/spi/JsonProvider;Ljava/util/LinkedList;Z)Ljava/lang/Object;

    move-result-object v6

    .line 193
    if-nez v3, :cond_1

    .line 194
    invoke-virtual {v1}, Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;->isArrayFilter()Z

    move-result v3

    goto :goto_0

    .line 197
    .end local v1    # "filter":Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;
    .end local v5    # "pathToken":Lcom/jayway/jsonpath/internal/PathToken;
    :cond_2
    return-object v6
.end method

.method public read(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "json"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 209
    const-string v0, "json can not be null or empty"

    invoke-static {p1, v0}, Lorg/apache/commons/lang/Validate;->notEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    invoke-static {}, Lcom/jayway/jsonpath/spi/JsonProviderFactory;->createProvider()Lcom/jayway/jsonpath/spi/JsonProvider;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/jayway/jsonpath/spi/JsonProvider;->parse(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/jayway/jsonpath/JsonPath;->read(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public read(Ljava/net/URL;)Ljava/lang/Object;
    .locals 2
    .param p1, "jsonURL"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/net/URL;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 224
    const-string v1, "json URL can not be null"

    invoke-static {p1, v1}, Lorg/apache/commons/lang/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 226
    const/4 v0, 0x0

    .line 228
    .local v0, "in":Ljava/io/InputStream;
    :try_start_0
    invoke-static {}, Lcom/jayway/jsonpath/spi/HttpProviderFactory;->getProvider()Lcom/jayway/jsonpath/spi/HttpProvider;

    move-result-object v1

    invoke-interface {v1, p1}, Lcom/jayway/jsonpath/spi/HttpProvider;->get(Ljava/net/URL;)Ljava/io/InputStream;

    move-result-object v0

    .line 229
    invoke-static {}, Lcom/jayway/jsonpath/spi/JsonProviderFactory;->createProvider()Lcom/jayway/jsonpath/spi/JsonProvider;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/jayway/jsonpath/spi/JsonProvider;->parse(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/jayway/jsonpath/JsonPath;->read(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 231
    invoke-static {v0}, Lcom/jayway/jsonpath/internal/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    return-object v1

    :catchall_0
    move-exception v1

    invoke-static {v0}, Lcom/jayway/jsonpath/internal/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    throw v1
.end method
