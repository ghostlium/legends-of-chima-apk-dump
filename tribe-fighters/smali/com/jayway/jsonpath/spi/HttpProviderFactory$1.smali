.class final Lcom/jayway/jsonpath/spi/HttpProviderFactory$1;
.super Lcom/jayway/jsonpath/spi/HttpProviderFactory;
.source "HttpProviderFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jayway/jsonpath/spi/HttpProviderFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/jayway/jsonpath/spi/HttpProviderFactory;-><init>()V

    return-void
.end method


# virtual methods
.method protected create()Lcom/jayway/jsonpath/spi/HttpProvider;
    .locals 1

    .prologue
    .line 19
    new-instance v0, Lcom/jayway/jsonpath/spi/HttpProviderFactory$1$1;

    invoke-direct {v0, p0}, Lcom/jayway/jsonpath/spi/HttpProviderFactory$1$1;-><init>(Lcom/jayway/jsonpath/spi/HttpProviderFactory$1;)V

    return-object v0
.end method
