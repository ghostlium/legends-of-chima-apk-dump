.class public Lcom/amazon/insights/monetization/CustomMonetizationEventBuilder;
.super Lcom/amazon/insights/monetization/MonetizationEventBuilder;
.source "CustomMonetizationEventBuilder.java"


# static fields
.field private static logger:Lcom/amazon/insights/core/log/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 40
    const-class v0, Lcom/amazon/insights/monetization/CustomMonetizationEventBuilder;

    invoke-static {v0}, Lcom/amazon/insights/core/log/Logger;->getLogger(Ljava/lang/Class;)Lcom/amazon/insights/core/log/Logger;

    move-result-object v0

    sput-object v0, Lcom/amazon/insights/monetization/CustomMonetizationEventBuilder;->logger:Lcom/amazon/insights/core/log/Logger;

    return-void
.end method

.method protected constructor <init>(Lcom/amazon/insights/EventClient;)V
    .locals 0
    .param p1, "eventClient"    # Lcom/amazon/insights/EventClient;

    .prologue
    .line 145
    invoke-direct {p0, p1}, Lcom/amazon/insights/monetization/MonetizationEventBuilder;-><init>(Lcom/amazon/insights/EventClient;)V

    .line 146
    return-void
.end method

.method public static create(Lcom/amazon/insights/EventClient;)Lcom/amazon/insights/monetization/CustomMonetizationEventBuilder;
    .locals 1
    .param p0, "eventClient"    # Lcom/amazon/insights/EventClient;

    .prologue
    .line 51
    new-instance v0, Lcom/amazon/insights/monetization/CustomMonetizationEventBuilder;

    invoke-direct {v0, p0}, Lcom/amazon/insights/monetization/CustomMonetizationEventBuilder;-><init>(Lcom/amazon/insights/EventClient;)V

    return-object v0
.end method


# virtual methods
.method protected isValid()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 151
    invoke-virtual {p0}, Lcom/amazon/insights/monetization/CustomMonetizationEventBuilder;->getStore()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    .line 152
    sget-object v1, Lcom/amazon/insights/monetization/CustomMonetizationEventBuilder;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v2, "Custom Monetization event is not valid: it is missing the store"

    invoke-virtual {v1, v2}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V

    .line 173
    :goto_0
    return v0

    .line 156
    :cond_0
    invoke-virtual {p0}, Lcom/amazon/insights/monetization/CustomMonetizationEventBuilder;->getProductId()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_1

    .line 157
    sget-object v1, Lcom/amazon/insights/monetization/CustomMonetizationEventBuilder;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v2, "Custom Monetization event is not valid: it is missing the product id"

    invoke-virtual {v1, v2}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V

    goto :goto_0

    .line 161
    :cond_1
    invoke-virtual {p0}, Lcom/amazon/insights/monetization/CustomMonetizationEventBuilder;->getQuantity()Ljava/lang/Integer;

    move-result-object v1

    if-nez v1, :cond_2

    .line 162
    sget-object v1, Lcom/amazon/insights/monetization/CustomMonetizationEventBuilder;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v2, "Custom Monetization event is not valid: it is missing the quantity"

    invoke-virtual {v1, v2}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V

    goto :goto_0

    .line 166
    :cond_2
    invoke-virtual {p0}, Lcom/amazon/insights/monetization/CustomMonetizationEventBuilder;->getCurrency()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    invoke-virtual {p0}, Lcom/amazon/insights/monetization/CustomMonetizationEventBuilder;->getItemPrice()Ljava/lang/Double;

    move-result-object v1

    if-nez v1, :cond_4

    .line 167
    :cond_3
    invoke-virtual {p0}, Lcom/amazon/insights/monetization/CustomMonetizationEventBuilder;->getFormattedItemPrice()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_4

    .line 168
    sget-object v1, Lcom/amazon/insights/monetization/CustomMonetizationEventBuilder;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v2, "Custom Monetization event is not valid: it requires the formatted localized price or the currency and price"

    invoke-virtual {v1, v2}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V

    goto :goto_0

    .line 173
    :cond_4
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public withCurrency(Ljava/lang/String;)Lcom/amazon/insights/monetization/CustomMonetizationEventBuilder;
    .locals 0
    .param p1, "currency"    # Ljava/lang/String;

    .prologue
    .line 122
    invoke-virtual {p0, p1}, Lcom/amazon/insights/monetization/CustomMonetizationEventBuilder;->setCurrency(Ljava/lang/String;)V

    .line 123
    return-object p0
.end method

.method public withFormattedItemPrice(Ljava/lang/String;)Lcom/amazon/insights/monetization/CustomMonetizationEventBuilder;
    .locals 0
    .param p1, "formattedItemPrice"    # Ljava/lang/String;

    .prologue
    .line 98
    invoke-virtual {p0, p1}, Lcom/amazon/insights/monetization/CustomMonetizationEventBuilder;->setFormattedItemPrice(Ljava/lang/String;)V

    .line 99
    return-object p0
.end method

.method public withItemPrice(D)Lcom/amazon/insights/monetization/CustomMonetizationEventBuilder;
    .locals 1
    .param p1, "itemPrice"    # D

    .prologue
    .line 110
    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/amazon/insights/monetization/CustomMonetizationEventBuilder;->setItemPrice(Ljava/lang/Double;)V

    .line 111
    return-object p0
.end method

.method public withProductId(Ljava/lang/String;)Lcom/amazon/insights/monetization/CustomMonetizationEventBuilder;
    .locals 0
    .param p1, "productId"    # Ljava/lang/String;

    .prologue
    .line 74
    invoke-virtual {p0, p1}, Lcom/amazon/insights/monetization/CustomMonetizationEventBuilder;->setProductId(Ljava/lang/String;)V

    .line 75
    return-object p0
.end method

.method public withQuantity(I)Lcom/amazon/insights/monetization/CustomMonetizationEventBuilder;
    .locals 1
    .param p1, "quantity"    # I

    .prologue
    .line 86
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/amazon/insights/monetization/CustomMonetizationEventBuilder;->setQuantity(Ljava/lang/Integer;)V

    .line 87
    return-object p0
.end method

.method public withStore(Ljava/lang/String;)Lcom/amazon/insights/monetization/CustomMonetizationEventBuilder;
    .locals 0
    .param p1, "store"    # Ljava/lang/String;

    .prologue
    .line 62
    invoke-virtual {p0, p1}, Lcom/amazon/insights/monetization/CustomMonetizationEventBuilder;->setStore(Ljava/lang/String;)V

    .line 63
    return-object p0
.end method

.method public withTransactionId(Ljava/lang/String;)Lcom/amazon/insights/monetization/CustomMonetizationEventBuilder;
    .locals 0
    .param p1, "transactionId"    # Ljava/lang/String;

    .prologue
    .line 134
    invoke-virtual {p0, p1}, Lcom/amazon/insights/monetization/CustomMonetizationEventBuilder;->setTransactionId(Ljava/lang/String;)V

    .line 135
    return-object p0
.end method
