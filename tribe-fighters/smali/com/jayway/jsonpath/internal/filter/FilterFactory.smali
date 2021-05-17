.class public Lcom/jayway/jsonpath/internal/filter/FilterFactory;
.super Ljava/lang/Object;
.source "FilterFactory.java"


# static fields
.field private static final ALL_ARRAY_ITEMS_FILTER:Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;

.field private static final ARRAY_QUERY_FILTER:Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;

.field private static final DOCUMENT_FILTER:Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;

.field private static final SCAN_FILTER:Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;

.field private static final WILDCARD_FILTER:Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 22
    new-instance v0, Lcom/jayway/jsonpath/internal/filter/PassthroughFilter;

    const-string v1, "$"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/jayway/jsonpath/internal/filter/PassthroughFilter;-><init>(Ljava/lang/String;Z)V

    sput-object v0, Lcom/jayway/jsonpath/internal/filter/FilterFactory;->DOCUMENT_FILTER:Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;

    .line 23
    new-instance v0, Lcom/jayway/jsonpath/internal/filter/PassthroughFilter;

    const-string v1, "[*]"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/jayway/jsonpath/internal/filter/PassthroughFilter;-><init>(Ljava/lang/String;Z)V

    sput-object v0, Lcom/jayway/jsonpath/internal/filter/FilterFactory;->ALL_ARRAY_ITEMS_FILTER:Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;

    .line 24
    new-instance v0, Lcom/jayway/jsonpath/internal/filter/WildcardFilter;

    const-string v1, "*"

    invoke-direct {v0, v1}, Lcom/jayway/jsonpath/internal/filter/WildcardFilter;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/jayway/jsonpath/internal/filter/FilterFactory;->WILDCARD_FILTER:Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;

    .line 25
    new-instance v0, Lcom/jayway/jsonpath/internal/filter/ScanFilter;

    const-string v1, ".."

    invoke-direct {v0, v1}, Lcom/jayway/jsonpath/internal/filter/ScanFilter;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/jayway/jsonpath/internal/filter/FilterFactory;->SCAN_FILTER:Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;

    .line 26
    new-instance v0, Lcom/jayway/jsonpath/internal/filter/ArrayQueryFilter;

    const-string v1, "[?]"

    invoke-direct {v0, v1}, Lcom/jayway/jsonpath/internal/filter/ArrayQueryFilter;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/jayway/jsonpath/internal/filter/FilterFactory;->ARRAY_QUERY_FILTER:Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createFilter(Ljava/lang/String;)Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;
    .locals 3
    .param p0, "pathFragment"    # Ljava/lang/String;

    .prologue
    .line 30
    sget-object v0, Lcom/jayway/jsonpath/internal/filter/FilterFactory;->DOCUMENT_FILTER:Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;

    invoke-virtual {v0}, Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;->getCondition()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 32
    sget-object v0, Lcom/jayway/jsonpath/internal/filter/FilterFactory;->DOCUMENT_FILTER:Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;

    .line 70
    :goto_0
    return-object v0

    .line 34
    :cond_0
    sget-object v0, Lcom/jayway/jsonpath/internal/filter/FilterFactory;->ALL_ARRAY_ITEMS_FILTER:Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;

    invoke-virtual {v0}, Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;->getCondition()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 36
    sget-object v0, Lcom/jayway/jsonpath/internal/filter/FilterFactory;->ALL_ARRAY_ITEMS_FILTER:Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;

    goto :goto_0

    .line 38
    :cond_1
    const-string v0, "*"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "[\'*\']"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 40
    :cond_2
    sget-object v0, Lcom/jayway/jsonpath/internal/filter/FilterFactory;->WILDCARD_FILTER:Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;

    goto :goto_0

    .line 43
    :cond_3
    sget-object v0, Lcom/jayway/jsonpath/internal/filter/FilterFactory;->SCAN_FILTER:Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;

    invoke-virtual {v0}, Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;->getCondition()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 45
    sget-object v0, Lcom/jayway/jsonpath/internal/filter/FilterFactory;->SCAN_FILTER:Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;

    goto :goto_0

    .line 47
    :cond_4
    sget-object v0, Lcom/jayway/jsonpath/internal/filter/FilterFactory;->ARRAY_QUERY_FILTER:Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;

    invoke-virtual {v0}, Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;->getCondition()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 49
    sget-object v0, Lcom/jayway/jsonpath/internal/filter/FilterFactory;->ARRAY_QUERY_FILTER:Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;

    goto :goto_0

    .line 51
    :cond_5
    const-string v0, "["

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 53
    new-instance v0, Lcom/jayway/jsonpath/internal/filter/FieldFilter;

    invoke-direct {v0, p0}, Lcom/jayway/jsonpath/internal/filter/FieldFilter;-><init>(Ljava/lang/String;)V

    goto :goto_0

    .line 55
    :cond_6
    const-string v0, "["

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 57
    const-string v0, "[?"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 58
    const-string v0, "="

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_7

    const-string v0, "<"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_7

    const-string v0, ">"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_7

    .line 60
    new-instance v0, Lcom/jayway/jsonpath/internal/filter/HasFieldFilter;

    invoke-direct {v0, p0}, Lcom/jayway/jsonpath/internal/filter/HasFieldFilter;-><init>(Ljava/lang/String;)V

    goto :goto_0

    .line 63
    :cond_7
    new-instance v0, Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter;

    invoke-direct {v0, p0}, Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter;-><init>(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 70
    :cond_8
    new-instance v0, Lcom/jayway/jsonpath/internal/filter/ArrayIndexFilter;

    invoke-direct {v0, p0}, Lcom/jayway/jsonpath/internal/filter/ArrayIndexFilter;-><init>(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 74
    :cond_9
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "can not find filter for path fragment "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
