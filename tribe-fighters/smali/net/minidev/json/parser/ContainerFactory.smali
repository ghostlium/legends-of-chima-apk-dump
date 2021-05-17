.class public interface abstract Lnet/minidev/json/parser/ContainerFactory;
.super Ljava/lang/Object;
.source "ContainerFactory.java"


# static fields
.field public static final FACTORY_ORDERED:Lnet/minidev/json/parser/ContainerFactory;

.field public static final FACTORY_SIMPLE:Lnet/minidev/json/parser/ContainerFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 44
    new-instance v0, Lnet/minidev/json/parser/ContainerFactory$1;

    invoke-direct {v0}, Lnet/minidev/json/parser/ContainerFactory$1;-><init>()V

    sput-object v0, Lnet/minidev/json/parser/ContainerFactory;->FACTORY_SIMPLE:Lnet/minidev/json/parser/ContainerFactory;

    .line 57
    new-instance v0, Lnet/minidev/json/parser/ContainerFactory$2;

    invoke-direct {v0}, Lnet/minidev/json/parser/ContainerFactory$2;-><init>()V

    sput-object v0, Lnet/minidev/json/parser/ContainerFactory;->FACTORY_ORDERED:Lnet/minidev/json/parser/ContainerFactory;

    return-void
.end method


# virtual methods
.method public abstract createArrayContainer()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end method

.method public abstract createObjectContainer()Ljava/util/Map;
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
.end method
