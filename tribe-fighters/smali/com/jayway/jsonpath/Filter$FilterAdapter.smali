.class public abstract Lcom/jayway/jsonpath/Filter$FilterAdapter;
.super Lcom/jayway/jsonpath/Filter;
.source "Filter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jayway/jsonpath/Filter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "FilterAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/jayway/jsonpath/Filter",
        "<TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 81
    .local p0, "this":Lcom/jayway/jsonpath/Filter$FilterAdapter;, "Lcom/jayway/jsonpath/Filter$FilterAdapter<TT;>;"
    invoke-direct {p0}, Lcom/jayway/jsonpath/Filter;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .line 85
    .local p0, "this":Lcom/jayway/jsonpath/Filter$FilterAdapter;, "Lcom/jayway/jsonpath/Filter$FilterAdapter<TT;>;"
    .local p1, "obj":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x0

    return v0
.end method

.method public addCriteria(Lcom/jayway/jsonpath/Criteria;)Lcom/jayway/jsonpath/Filter;
    .locals 2
    .param p1, "criteria"    # Lcom/jayway/jsonpath/Criteria;

    .prologue
    .line 90
    .local p0, "this":Lcom/jayway/jsonpath/Filter$FilterAdapter;, "Lcom/jayway/jsonpath/Filter$FilterAdapter<TT;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "can not add criteria to a FilterAdapter."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
