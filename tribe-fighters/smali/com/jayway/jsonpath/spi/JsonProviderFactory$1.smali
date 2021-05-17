.class final Lcom/jayway/jsonpath/spi/JsonProviderFactory$1;
.super Lcom/jayway/jsonpath/spi/JsonProviderFactory;
.source "JsonProviderFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jayway/jsonpath/spi/JsonProviderFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/jayway/jsonpath/spi/JsonProviderFactory;-><init>()V

    return-void
.end method


# virtual methods
.method protected create()Lcom/jayway/jsonpath/spi/JsonProvider;
    .locals 1

    .prologue
    .line 27
    new-instance v0, Lcom/jayway/jsonpath/spi/impl/JsonSmartJsonProvider;

    invoke-direct {v0}, Lcom/jayway/jsonpath/spi/impl/JsonSmartJsonProvider;-><init>()V

    return-object v0
.end method
