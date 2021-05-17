.class public Lcom/amazon/insights/monetization/AmazonMonetizationEventBuilder;
.super Lcom/amazon/insights/monetization/MonetizationEventBuilder;
.source "AmazonMonetizationEventBuilder.java"


# static fields
.field private static logger:Lcom/amazon/insights/core/log/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 32
    const-class v0, Lcom/amazon/insights/monetization/AmazonMonetizationEventBuilder;

    invoke-static {v0}, Lcom/amazon/insights/core/log/Logger;->getLogger(Ljava/lang/Class;)Lcom/amazon/insights/core/log/Logger;

    move-result-object v0

    sput-object v0, Lcom/amazon/insights/monetization/AmazonMonetizationEventBuilder;->logger:Lcom/amazon/insights/core/log/Logger;

    return-void
.end method

.method protected constructor <init>(Lcom/amazon/insights/EventClient;)V
    .locals 1
    .param p1, "eventClient"    # Lcom/amazon/insights/EventClient;

    .prologue
    .line 91
    invoke-direct {p0, p1}, Lcom/amazon/insights/monetization/MonetizationEventBuilder;-><init>(Lcom/amazon/insights/EventClient;)V

    .line 92
    const-string v0, "Amazon"

    invoke-virtual {p0, v0}, Lcom/amazon/insights/monetization/AmazonMonetizationEventBuilder;->setStore(Ljava/lang/String;)V

    .line 93
    return-void
.end method

.method public static create(Lcom/amazon/insights/EventClient;)Lcom/amazon/insights/monetization/AmazonMonetizationEventBuilder;
    .locals 1
    .param p0, "eventClient"    # Lcom/amazon/insights/EventClient;

    .prologue
    .line 43
    new-instance v0, Lcom/amazon/insights/monetization/AmazonMonetizationEventBuilder;

    invoke-direct {v0, p0}, Lcom/amazon/insights/monetization/AmazonMonetizationEventBuilder;-><init>(Lcom/amazon/insights/EventClient;)V

    return-object v0
.end method


# virtual methods
.method protected isValid()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 98
    invoke-virtual {p0}, Lcom/amazon/insights/monetization/AmazonMonetizationEventBuilder;->getProductId()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    .line 99
    sget-object v1, Lcom/amazon/insights/monetization/AmazonMonetizationEventBuilder;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v2, "Amazon Monetization event is not valid: it is missing the product id"

    invoke-virtual {v1, v2}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V

    .line 113
    :goto_0
    return v0

    .line 103
    :cond_0
    invoke-virtual {p0}, Lcom/amazon/insights/monetization/AmazonMonetizationEventBuilder;->getQuantity()Ljava/lang/Integer;

    move-result-object v1

    if-nez v1, :cond_1

    .line 104
    sget-object v1, Lcom/amazon/insights/monetization/AmazonMonetizationEventBuilder;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v2, "Amazon Monetization event is not valid: it is missing the quantity"

    invoke-virtual {v1, v2}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V

    goto :goto_0

    .line 108
    :cond_1
    invoke-virtual {p0}, Lcom/amazon/insights/monetization/AmazonMonetizationEventBuilder;->getFormattedItemPrice()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_2

    .line 109
    sget-object v1, Lcom/amazon/insights/monetization/AmazonMonetizationEventBuilder;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v2, "Amazon Monetization event is not valid: it is missing the formatted localized price"

    invoke-virtual {v1, v2}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V

    goto :goto_0

    .line 113
    :cond_2
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public withFormattedItemPrice(Ljava/lang/String;)Lcom/amazon/insights/monetization/AmazonMonetizationEventBuilder;
    .locals 0
    .param p1, "formattedItemPrice"    # Ljava/lang/String;

    .prologue
    .line 67
    invoke-virtual {p0, p1}, Lcom/amazon/insights/monetization/AmazonMonetizationEventBuilder;->setFormattedItemPrice(Ljava/lang/String;)V

    .line 68
    return-object p0
.end method

.method public withProductId(Ljava/lang/String;)Lcom/amazon/insights/monetization/AmazonMonetizationEventBuilder;
    .locals 0
    .param p1, "productId"    # Ljava/lang/String;

    .prologue
    .line 54
    invoke-virtual {p0, p1}, Lcom/amazon/insights/monetization/AmazonMonetizationEventBuilder;->setProductId(Ljava/lang/String;)V

    .line 55
    return-object p0
.end method

.method public withQuantity(I)Lcom/amazon/insights/monetization/AmazonMonetizationEventBuilder;
    .locals 1
    .param p1, "quantity"    # I

    .prologue
    .line 80
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/amazon/insights/monetization/AmazonMonetizationEventBuilder;->setQuantity(Ljava/lang/Integer;)V

    .line 81
    return-object p0
.end method
