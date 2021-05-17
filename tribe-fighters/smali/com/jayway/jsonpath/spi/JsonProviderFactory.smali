.class public abstract Lcom/jayway/jsonpath/spi/JsonProviderFactory;
.super Ljava/lang/Object;
.source "JsonProviderFactory.java"


# static fields
.field public static factory:Lcom/jayway/jsonpath/spi/JsonProviderFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 24
    new-instance v0, Lcom/jayway/jsonpath/spi/JsonProviderFactory$1;

    invoke-direct {v0}, Lcom/jayway/jsonpath/spi/JsonProviderFactory$1;-><init>()V

    sput-object v0, Lcom/jayway/jsonpath/spi/JsonProviderFactory;->factory:Lcom/jayway/jsonpath/spi/JsonProviderFactory;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createProvider()Lcom/jayway/jsonpath/spi/JsonProvider;
    .locals 1

    .prologue
    .line 33
    sget-object v0, Lcom/jayway/jsonpath/spi/JsonProviderFactory;->factory:Lcom/jayway/jsonpath/spi/JsonProviderFactory;

    invoke-virtual {v0}, Lcom/jayway/jsonpath/spi/JsonProviderFactory;->create()Lcom/jayway/jsonpath/spi/JsonProvider;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected abstract create()Lcom/jayway/jsonpath/spi/JsonProvider;
.end method
