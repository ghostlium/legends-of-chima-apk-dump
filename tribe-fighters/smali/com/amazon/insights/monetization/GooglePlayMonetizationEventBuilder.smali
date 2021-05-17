.class public Lcom/amazon/insights/monetization/GooglePlayMonetizationEventBuilder;
.super Lcom/amazon/insights/monetization/MonetizationEventBuilder;
.source "GooglePlayMonetizationEventBuilder.java"


# static fields
.field private static logger:Lcom/amazon/insights/core/log/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 34
    const-class v0, Lcom/amazon/insights/monetization/GooglePlayMonetizationEventBuilder;

    invoke-static {v0}, Lcom/amazon/insights/core/log/Logger;->getLogger(Ljava/lang/Class;)Lcom/amazon/insights/core/log/Logger;

    move-result-object v0

    sput-object v0, Lcom/amazon/insights/monetization/GooglePlayMonetizationEventBuilder;->logger:Lcom/amazon/insights/core/log/Logger;

    return-void
.end method

.method protected constructor <init>(Lcom/amazon/insights/EventClient;)V
    .locals 1
    .param p1, "eventClient"    # Lcom/amazon/insights/EventClient;

    .prologue
    .line 109
    invoke-direct {p0, p1}, Lcom/amazon/insights/monetization/MonetizationEventBuilder;-><init>(Lcom/amazon/insights/EventClient;)V

    .line 110
    const-string v0, "Google Play"

    invoke-virtual {p0, v0}, Lcom/amazon/insights/monetization/GooglePlayMonetizationEventBuilder;->setStore(Ljava/lang/String;)V

    .line 111
    return-void
.end method

.method public static create(Lcom/amazon/insights/EventClient;)Lcom/amazon/insights/monetization/GooglePlayMonetizationEventBuilder;
    .locals 1
    .param p0, "eventClient"    # Lcom/amazon/insights/EventClient;

    .prologue
    .line 46
    new-instance v0, Lcom/amazon/insights/monetization/GooglePlayMonetizationEventBuilder;

    invoke-direct {v0, p0}, Lcom/amazon/insights/monetization/GooglePlayMonetizationEventBuilder;-><init>(Lcom/amazon/insights/EventClient;)V

    return-object v0
.end method


# virtual methods
.method protected isValid()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 120
    invoke-virtual {p0}, Lcom/amazon/insights/monetization/GooglePlayMonetizationEventBuilder;->getProductId()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    .line 121
    sget-object v1, Lcom/amazon/insights/monetization/GooglePlayMonetizationEventBuilder;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v2, "Cannot build Google Monetization event: it is missing the product id"

    invoke-virtual {v1, v2}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V

    .line 140
    :goto_0
    return v0

    .line 125
    :cond_0
    invoke-virtual {p0}, Lcom/amazon/insights/monetization/GooglePlayMonetizationEventBuilder;->getQuantity()Ljava/lang/Integer;

    move-result-object v1

    if-nez v1, :cond_1

    .line 126
    sget-object v1, Lcom/amazon/insights/monetization/GooglePlayMonetizationEventBuilder;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v2, "Google Monetization event is not valid: it is missing the quantity"

    invoke-virtual {v1, v2}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V

    goto :goto_0

    .line 130
    :cond_1
    invoke-virtual {p0}, Lcom/amazon/insights/monetization/GooglePlayMonetizationEventBuilder;->getFormattedItemPrice()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_2

    .line 131
    sget-object v1, Lcom/amazon/insights/monetization/GooglePlayMonetizationEventBuilder;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v2, "Google Monetization event is not valid: it is missing the formatted localized price"

    invoke-virtual {v1, v2}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V

    goto :goto_0

    .line 135
    :cond_2
    invoke-virtual {p0}, Lcom/amazon/insights/monetization/GooglePlayMonetizationEventBuilder;->getTransactionId()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_3

    .line 136
    sget-object v1, Lcom/amazon/insights/monetization/GooglePlayMonetizationEventBuilder;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v2, "Google Monetization event is not valid: it is missing the transaction id"

    invoke-virtual {v1, v2}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V

    goto :goto_0

    .line 140
    :cond_3
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public withFormattedItemPrice(Ljava/lang/String;)Lcom/amazon/insights/monetization/GooglePlayMonetizationEventBuilder;
    .locals 0
    .param p1, "formattedItemPrice"    # Ljava/lang/String;

    .prologue
    .line 71
    invoke-virtual {p0, p1}, Lcom/amazon/insights/monetization/GooglePlayMonetizationEventBuilder;->setFormattedItemPrice(Ljava/lang/String;)V

    .line 72
    return-object p0
.end method

.method public withProductId(Ljava/lang/String;)Lcom/amazon/insights/monetization/GooglePlayMonetizationEventBuilder;
    .locals 0
    .param p1, "productId"    # Ljava/lang/String;

    .prologue
    .line 57
    invoke-virtual {p0, p1}, Lcom/amazon/insights/monetization/GooglePlayMonetizationEventBuilder;->setProductId(Ljava/lang/String;)V

    .line 58
    return-object p0
.end method

.method public withQuantity(I)Lcom/amazon/insights/monetization/GooglePlayMonetizationEventBuilder;
    .locals 1
    .param p1, "quantity"    # I

    .prologue
    .line 84
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/amazon/insights/monetization/GooglePlayMonetizationEventBuilder;->setQuantity(Ljava/lang/Integer;)V

    .line 85
    return-object p0
.end method

.method public withTransactionId(Ljava/lang/String;)Lcom/amazon/insights/monetization/GooglePlayMonetizationEventBuilder;
    .locals 0
    .param p1, "transactionId"    # Ljava/lang/String;

    .prologue
    .line 97
    invoke-virtual {p0, p1}, Lcom/amazon/insights/monetization/GooglePlayMonetizationEventBuilder;->setTransactionId(Ljava/lang/String;)V

    .line 98
    return-object p0
.end method
