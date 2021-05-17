.class public abstract Lcom/jayway/jsonpath/spi/HttpProviderFactory;
.super Ljava/lang/Object;
.source "HttpProviderFactory.java"


# static fields
.field public static factory:Lcom/jayway/jsonpath/spi/HttpProviderFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    new-instance v0, Lcom/jayway/jsonpath/spi/HttpProviderFactory$1;

    invoke-direct {v0}, Lcom/jayway/jsonpath/spi/HttpProviderFactory$1;-><init>()V

    sput-object v0, Lcom/jayway/jsonpath/spi/HttpProviderFactory;->factory:Lcom/jayway/jsonpath/spi/HttpProviderFactory;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getProvider()Lcom/jayway/jsonpath/spi/HttpProvider;
    .locals 1

    .prologue
    .line 31
    sget-object v0, Lcom/jayway/jsonpath/spi/HttpProviderFactory;->factory:Lcom/jayway/jsonpath/spi/HttpProviderFactory;

    invoke-virtual {v0}, Lcom/jayway/jsonpath/spi/HttpProviderFactory;->create()Lcom/jayway/jsonpath/spi/HttpProvider;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected abstract create()Lcom/jayway/jsonpath/spi/HttpProvider;
.end method
