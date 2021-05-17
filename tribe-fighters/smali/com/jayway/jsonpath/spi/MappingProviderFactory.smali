.class public abstract Lcom/jayway/jsonpath/spi/MappingProviderFactory;
.super Ljava/lang/Object;
.source "MappingProviderFactory.java"


# static fields
.field public static factory:Lcom/jayway/jsonpath/spi/MappingProviderFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    new-instance v0, Lcom/jayway/jsonpath/spi/MappingProviderFactory$1;

    invoke-direct {v0}, Lcom/jayway/jsonpath/spi/MappingProviderFactory$1;-><init>()V

    sput-object v0, Lcom/jayway/jsonpath/spi/MappingProviderFactory;->factory:Lcom/jayway/jsonpath/spi/MappingProviderFactory;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createProvider()Lcom/jayway/jsonpath/spi/MappingProvider;
    .locals 1

    .prologue
    .line 52
    sget-object v0, Lcom/jayway/jsonpath/spi/MappingProviderFactory;->factory:Lcom/jayway/jsonpath/spi/MappingProviderFactory;

    invoke-virtual {v0}, Lcom/jayway/jsonpath/spi/MappingProviderFactory;->create()Lcom/jayway/jsonpath/spi/MappingProvider;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected abstract create()Lcom/jayway/jsonpath/spi/MappingProvider;
.end method
