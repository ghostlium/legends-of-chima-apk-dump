.class public abstract Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;
.super Ljava/lang/Object;
.source "PathTokenFilter.java"


# instance fields
.field final condition:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "condition"    # Ljava/lang/String;

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;->condition:Ljava/lang/String;

    .line 31
    return-void
.end method


# virtual methods
.method public abstract filter(Ljava/lang/Object;Lcom/jayway/jsonpath/spi/JsonProvider;)Ljava/lang/Object;
.end method

.method public filter(Ljava/lang/Object;Lcom/jayway/jsonpath/spi/JsonProvider;Ljava/util/LinkedList;Z)Ljava/lang/Object;
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "jsonProvider"    # Lcom/jayway/jsonpath/spi/JsonProvider;
    .param p4, "inArrayContext"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lcom/jayway/jsonpath/spi/JsonProvider;",
            "Ljava/util/LinkedList",
            "<",
            "Lcom/jayway/jsonpath/Filter;",
            ">;Z)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 50
    .local p3, "filters":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/jayway/jsonpath/Filter;>;"
    invoke-virtual {p0, p1, p2}, Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;->filter(Ljava/lang/Object;Lcom/jayway/jsonpath/spi/JsonProvider;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method getCondition()Ljava/lang/String;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;->condition:Ljava/lang/String;

    return-object v0
.end method

.method public abstract getRef(Ljava/lang/Object;Lcom/jayway/jsonpath/spi/JsonProvider;)Ljava/lang/Object;
.end method

.method public abstract isArrayFilter()Z
.end method

.method trim(Ljava/lang/String;II)Ljava/lang/String;
    .locals 3
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "front"    # I
    .param p3, "end"    # I

    .prologue
    .line 38
    move-object v0, p1

    .line 40
    .local v0, "res":Ljava/lang/String;
    if-lez p2, :cond_0

    .line 41
    invoke-virtual {p1, p2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 43
    :cond_0
    if-lez p3, :cond_1

    .line 44
    const/4 v1, 0x0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, p3

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 46
    :cond_1
    return-object v0
.end method
