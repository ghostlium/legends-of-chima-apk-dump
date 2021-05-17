.class public Lnet/minidev/json/parser/FakeContainerFactory;
.super Ljava/lang/Object;
.source "FakeContainerFactory.java"

# interfaces
.implements Lnet/minidev/json/parser/ContainerFactory;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnet/minidev/json/parser/FakeContainerFactory$FackList;,
        Lnet/minidev/json/parser/FakeContainerFactory$FackMap;
    }
.end annotation


# instance fields
.field public list:Lnet/minidev/json/parser/FakeContainerFactory$FackList;

.field public map:Lnet/minidev/json/parser/FakeContainerFactory$FackMap;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    return-void
.end method


# virtual methods
.method public createArrayContainer()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 37
    iget-object v0, p0, Lnet/minidev/json/parser/FakeContainerFactory;->list:Lnet/minidev/json/parser/FakeContainerFactory$FackList;

    if-nez v0, :cond_0

    .line 38
    new-instance v0, Lnet/minidev/json/parser/FakeContainerFactory$FackList;

    invoke-direct {v0}, Lnet/minidev/json/parser/FakeContainerFactory$FackList;-><init>()V

    iput-object v0, p0, Lnet/minidev/json/parser/FakeContainerFactory;->list:Lnet/minidev/json/parser/FakeContainerFactory$FackList;

    .line 39
    :cond_0
    iget-object v0, p0, Lnet/minidev/json/parser/FakeContainerFactory;->list:Lnet/minidev/json/parser/FakeContainerFactory$FackList;

    return-object v0
.end method

.method public createObjectContainer()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 44
    iget-object v0, p0, Lnet/minidev/json/parser/FakeContainerFactory;->map:Lnet/minidev/json/parser/FakeContainerFactory$FackMap;

    if-nez v0, :cond_0

    .line 45
    new-instance v0, Lnet/minidev/json/parser/FakeContainerFactory$FackMap;

    invoke-direct {v0}, Lnet/minidev/json/parser/FakeContainerFactory$FackMap;-><init>()V

    iput-object v0, p0, Lnet/minidev/json/parser/FakeContainerFactory;->map:Lnet/minidev/json/parser/FakeContainerFactory$FackMap;

    .line 46
    :cond_0
    iget-object v0, p0, Lnet/minidev/json/parser/FakeContainerFactory;->map:Lnet/minidev/json/parser/FakeContainerFactory$FackMap;

    return-object v0
.end method
