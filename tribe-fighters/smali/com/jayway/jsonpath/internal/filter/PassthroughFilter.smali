.class public Lcom/jayway/jsonpath/internal/filter/PassthroughFilter;
.super Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;
.source "PassthroughFilter.java"


# instance fields
.field private isArrayFilter:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 0
    .param p1, "condition"    # Ljava/lang/String;
    .param p2, "isArrayFilter"    # Z

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lcom/jayway/jsonpath/internal/filter/PathTokenFilter;-><init>(Ljava/lang/String;)V

    .line 29
    iput-boolean p2, p0, Lcom/jayway/jsonpath/internal/filter/PassthroughFilter;->isArrayFilter:Z

    .line 30
    return-void
.end method


# virtual methods
.method public filter(Ljava/lang/Object;Lcom/jayway/jsonpath/spi/JsonProvider;)Ljava/lang/Object;
    .locals 0
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "jsonProvider"    # Lcom/jayway/jsonpath/spi/JsonProvider;

    .prologue
    .line 33
    return-object p1
.end method

.method public getRef(Ljava/lang/Object;Lcom/jayway/jsonpath/spi/JsonProvider;)Ljava/lang/Object;
    .locals 0
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "jsonProvider"    # Lcom/jayway/jsonpath/spi/JsonProvider;

    .prologue
    .line 38
    return-object p1
.end method

.method public isArrayFilter()Z
    .locals 1

    .prologue
    .line 43
    iget-boolean v0, p0, Lcom/jayway/jsonpath/internal/filter/PassthroughFilter;->isArrayFilter:Z

    return v0
.end method
