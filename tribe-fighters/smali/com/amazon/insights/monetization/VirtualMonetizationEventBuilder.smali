.class public Lcom/amazon/insights/monetization/VirtualMonetizationEventBuilder;
.super Lcom/amazon/insights/monetization/MonetizationEventBuilder;
.source "VirtualMonetizationEventBuilder.java"


# static fields
.field private static logger:Lcom/amazon/insights/core/log/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    const-class v0, Lcom/amazon/insights/monetization/VirtualMonetizationEventBuilder;

    invoke-static {v0}, Lcom/amazon/insights/core/log/Logger;->getLogger(Ljava/lang/Class;)Lcom/amazon/insights/core/log/Logger;

    move-result-object v0

    sput-object v0, Lcom/amazon/insights/monetization/VirtualMonetizationEventBuilder;->logger:Lcom/amazon/insights/core/log/Logger;

    return-void
.end method

.method protected constructor <init>(Lcom/amazon/insights/EventClient;)V
    .locals 1
    .param p1, "eventClient"    # Lcom/amazon/insights/EventClient;

    .prologue
    .line 102
    invoke-direct {p0, p1}, Lcom/amazon/insights/monetization/MonetizationEventBuilder;-><init>(Lcom/amazon/insights/EventClient;)V

    .line 103
    const-string v0, "Virtual"

    invoke-virtual {p0, v0}, Lcom/amazon/insights/monetization/VirtualMonetizationEventBuilder;->setStore(Ljava/lang/String;)V

    .line 104
    return-void
.end method

.method public static create(Lcom/amazon/insights/EventClient;)Lcom/amazon/insights/monetization/VirtualMonetizationEventBuilder;
    .locals 1
    .param p0, "eventClient"    # Lcom/amazon/insights/EventClient;

    .prologue
    .line 42
    new-instance v0, Lcom/amazon/insights/monetization/VirtualMonetizationEventBuilder;

    invoke-direct {v0, p0}, Lcom/amazon/insights/monetization/VirtualMonetizationEventBuilder;-><init>(Lcom/amazon/insights/EventClient;)V

    return-object v0
.end method


# virtual methods
.method protected isValid()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 109
    invoke-virtual {p0}, Lcom/amazon/insights/monetization/VirtualMonetizationEventBuilder;->getProductId()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    .line 110
    sget-object v1, Lcom/amazon/insights/monetization/VirtualMonetizationEventBuilder;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v2, "Virtual Monetization event is not valid: it is missing the product id"

    invoke-virtual {v1, v2}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V

    .line 129
    :goto_0
    return v0

    .line 114
    :cond_0
    invoke-virtual {p0}, Lcom/amazon/insights/monetization/VirtualMonetizationEventBuilder;->getQuantity()Ljava/lang/Integer;

    move-result-object v1

    if-nez v1, :cond_1

    .line 115
    sget-object v1, Lcom/amazon/insights/monetization/VirtualMonetizationEventBuilder;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v2, "Virtual Monetization event is not valid: it is missing the quantity"

    invoke-virtual {v1, v2}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V

    goto :goto_0

    .line 119
    :cond_1
    invoke-virtual {p0}, Lcom/amazon/insights/monetization/VirtualMonetizationEventBuilder;->getItemPrice()Ljava/lang/Double;

    move-result-object v1

    if-nez v1, :cond_2

    .line 120
    sget-object v1, Lcom/amazon/insights/monetization/VirtualMonetizationEventBuilder;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v2, "Virtual Monetization event is not valid: it is missing the numerical price"

    invoke-virtual {v1, v2}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V

    goto :goto_0

    .line 124
    :cond_2
    invoke-virtual {p0}, Lcom/amazon/insights/monetization/VirtualMonetizationEventBuilder;->getCurrency()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_3

    .line 125
    sget-object v1, Lcom/amazon/insights/monetization/VirtualMonetizationEventBuilder;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v2, "Virtual Monetization event is not valid: it is missing the currency"

    invoke-virtual {v1, v2}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V

    goto :goto_0

    .line 129
    :cond_3
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public withCurrency(Ljava/lang/String;)Lcom/amazon/insights/monetization/VirtualMonetizationEventBuilder;
    .locals 0
    .param p1, "currency"    # Ljava/lang/String;

    .prologue
    .line 90
    invoke-virtual {p0, p1}, Lcom/amazon/insights/monetization/VirtualMonetizationEventBuilder;->setCurrency(Ljava/lang/String;)V

    .line 91
    return-object p0
.end method

.method public withItemPrice(D)Lcom/amazon/insights/monetization/VirtualMonetizationEventBuilder;
    .locals 1
    .param p1, "itemPrice"    # D

    .prologue
    .line 65
    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/amazon/insights/monetization/VirtualMonetizationEventBuilder;->setItemPrice(Ljava/lang/Double;)V

    .line 66
    return-object p0
.end method

.method public withProductId(Ljava/lang/String;)Lcom/amazon/insights/monetization/VirtualMonetizationEventBuilder;
    .locals 0
    .param p1, "productId"    # Ljava/lang/String;

    .prologue
    .line 53
    invoke-virtual {p0, p1}, Lcom/amazon/insights/monetization/VirtualMonetizationEventBuilder;->setProductId(Ljava/lang/String;)V

    .line 54
    return-object p0
.end method

.method public withQuantity(I)Lcom/amazon/insights/monetization/VirtualMonetizationEventBuilder;
    .locals 1
    .param p1, "quantity"    # I

    .prologue
    .line 77
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/amazon/insights/monetization/VirtualMonetizationEventBuilder;->setQuantity(Ljava/lang/Integer;)V

    .line 78
    return-object p0
.end method
