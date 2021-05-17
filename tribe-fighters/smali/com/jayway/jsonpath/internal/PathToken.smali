.class public Lcom/jayway/jsonpath/internal/PathToken;
.super Ljava/lang/Object;
.source "PathToken.java"


# static fields
.field private static final ARRAY_INDEX_PATTERN:Ljava/util/regex/Pattern;


# instance fields
.field private fragment:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    const-string v0, "\\[(\\d+)\\]"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/jayway/jsonpath/internal/PathToken;->ARRAY_INDEX_PATTERN:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "fragment"    # Ljava/lang/String;

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lcom/jayway/jsonpath/internal/PathToken;->fragment:Ljava/lang/String;

    .line 36
    return-void
.end method


# virtual methods
.method public apply(Ljava/lang/Object;Lcom/jayway/jsonpath/spi/JsonProvider;)Ljava/lang/Object;
    .locals 1
    .param p1, "model"    # Ljava/lang/Object;
    .param p2, "jsonProvider"    # Lcom/jayway/jsonpath/spi/JsonProvider;

    .prologue
    .line 47
    iget-object v0, p0, Lcom/jayway/jsonpath/internal/PathToken;->fragment:Ljava/lang/String;

    invoke-static {v0}, Lcom/jayway/jsonpath/internal/filter/FilterFactory;->createFilter(Ljava/lang/String;)Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;->getRef(Ljava/lang/Object;Lcom/jayway/jsonpath/spi/JsonProvider;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public filter(Ljava/lang/Object;Lcom/jayway/jsonpath/spi/JsonProvider;)Ljava/lang/Object;
    .locals 1
    .param p1, "model"    # Ljava/lang/Object;
    .param p2, "jsonProvider"    # Lcom/jayway/jsonpath/spi/JsonProvider;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/jayway/jsonpath/internal/PathToken;->fragment:Ljava/lang/String;

    invoke-static {v0}, Lcom/jayway/jsonpath/internal/filter/FilterFactory;->createFilter(Ljava/lang/String;)Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;->filter(Ljava/lang/Object;Lcom/jayway/jsonpath/spi/JsonProvider;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getArrayIndex()I
    .locals 4

    .prologue
    .line 62
    sget-object v1, Lcom/jayway/jsonpath/internal/PathToken;->ARRAY_INDEX_PATTERN:Ljava/util/regex/Pattern;

    iget-object v2, p0, Lcom/jayway/jsonpath/internal/PathToken;->fragment:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 63
    .local v0, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 64
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    return v1

    .line 66
    :cond_0
    new-instance v1, Lcom/jayway/jsonpath/InvalidModelException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not get array index from fragment "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/jayway/jsonpath/internal/PathToken;->fragment:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/jayway/jsonpath/InvalidModelException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getFilter()Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/jayway/jsonpath/internal/PathToken;->fragment:Ljava/lang/String;

    invoke-static {v0}, Lcom/jayway/jsonpath/internal/filter/FilterFactory;->createFilter(Ljava/lang/String;)Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;

    move-result-object v0

    return-object v0
.end method

.method public getFragment()Ljava/lang/String;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/jayway/jsonpath/internal/PathToken;->fragment:Ljava/lang/String;

    return-object v0
.end method

.method public isArrayIndexToken()Z
    .locals 2

    .prologue
    .line 58
    sget-object v0, Lcom/jayway/jsonpath/internal/PathToken;->ARRAY_INDEX_PATTERN:Ljava/util/regex/Pattern;

    iget-object v1, p0, Lcom/jayway/jsonpath/internal/PathToken;->fragment:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    return v0
.end method

.method public isRootToken()Z
    .locals 2

    .prologue
    .line 55
    const-string v0, "$"

    iget-object v1, p0, Lcom/jayway/jsonpath/internal/PathToken;->fragment:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
