.class public abstract Lcom/amazon/insights/monetization/MonetizationEventBuilder;
.super Ljava/lang/Object;
.source "MonetizationEventBuilder.java"


# static fields
.field static final AMAZON_STORE:Ljava/lang/String; = "Amazon"

.field static final GOOGLE_PLAY_STORE:Ljava/lang/String; = "Google Play"

.field static final PURCHASE_EVENT_CURRENCY_ATTR:Ljava/lang/String; = "_currency"

.field static final PURCHASE_EVENT_ITEM_PRICE_METRIC:Ljava/lang/String; = "_item_price"

.field static final PURCHASE_EVENT_LOCALE_ATTR:Ljava/lang/String; = "_locale"

.field static final PURCHASE_EVENT_NAME:Ljava/lang/String; = "_monetization.purchase"

.field static final PURCHASE_EVENT_PRICE_FORMATTED_ATTR:Ljava/lang/String; = "_item_price_formatted"

.field static final PURCHASE_EVENT_PRODUCT_ID_ATTR:Ljava/lang/String; = "_product_id"

.field static final PURCHASE_EVENT_QUANTITY_METRIC:Ljava/lang/String; = "_quantity"

.field static final PURCHASE_EVENT_STORE_ATTR:Ljava/lang/String; = "_store"

.field static final PURCHASE_EVENT_TRANSACTION_ID_ATTR:Ljava/lang/String; = "_transaction_id"

.field static final VIRTUAL_STORE:Ljava/lang/String; = "Virtual"

.field private static logger:Lcom/amazon/insights/core/log/Logger;


# instance fields
.field private currency:Ljava/lang/String;

.field private final eventClient:Lcom/amazon/insights/EventClient;

.field private formattedItemPrice:Ljava/lang/String;

.field private itemPrice:Ljava/lang/Double;

.field private productId:Ljava/lang/String;

.field private quantity:Ljava/lang/Integer;

.field private store:Ljava/lang/String;

.field private transactionId:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    const-class v0, Lcom/amazon/insights/monetization/MonetizationEventBuilder;

    invoke-static {v0}, Lcom/amazon/insights/core/log/Logger;->getLogger(Ljava/lang/Class;)Lcom/amazon/insights/core/log/Logger;

    move-result-object v0

    sput-object v0, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->logger:Lcom/amazon/insights/core/log/Logger;

    return-void
.end method

.method protected constructor <init>(Lcom/amazon/insights/EventClient;)V
    .locals 0
    .param p1, "eventClient"    # Lcom/amazon/insights/EventClient;

    .prologue
    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 107
    iput-object p1, p0, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->eventClient:Lcom/amazon/insights/EventClient;

    .line 108
    return-void
.end method

.method private doBaseValidation()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 238
    iget-object v1, p0, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->eventClient:Lcom/amazon/insights/EventClient;

    if-nez v1, :cond_0

    .line 239
    sget-object v1, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v2, "Cannot build Monetization event: the eventClient is null"

    invoke-virtual {v1, v2}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V

    .line 267
    :goto_0
    return v0

    .line 244
    :cond_0
    iget-object v1, p0, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->productId:Ljava/lang/String;

    invoke-static {v1}, Lcom/amazon/insights/core/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 245
    sget-object v1, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v2, "Base Monetization event is not valid: it is missing the product id"

    invoke-virtual {v1, v2}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V

    goto :goto_0

    .line 249
    :cond_1
    iget-object v1, p0, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->quantity:Ljava/lang/Integer;

    if-nez v1, :cond_2

    .line 250
    sget-object v1, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v2, "Base Monetization event is not valid: it is missing the quantity"

    invoke-virtual {v1, v2}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V

    goto :goto_0

    .line 254
    :cond_2
    iget-object v1, p0, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->store:Ljava/lang/String;

    invoke-static {v1}, Lcom/amazon/insights/core/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 255
    sget-object v1, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v2, "Base Monetization event is not valid: it is missing the store"

    invoke-virtual {v1, v2}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V

    goto :goto_0

    .line 260
    :cond_3
    iget-object v1, p0, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->currency:Ljava/lang/String;

    invoke-static {v1}, Lcom/amazon/insights/core/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4

    iget-object v1, p0, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->itemPrice:Ljava/lang/Double;

    if-nez v1, :cond_5

    .line 261
    :cond_4
    iget-object v1, p0, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->formattedItemPrice:Ljava/lang/String;

    invoke-static {v1}, Lcom/amazon/insights/core/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 262
    sget-object v1, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v2, "Base Monetization event is not valid: it requires the formatted price or the currency and price"

    invoke-virtual {v1, v2}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V

    goto :goto_0

    .line 267
    :cond_5
    const/4 v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public build()Lcom/amazon/insights/Event;
    .locals 3

    .prologue
    .line 64
    const/4 v0, 0x0

    .line 65
    .local v0, "purchaseEvent":Lcom/amazon/insights/Event;
    invoke-virtual {p0}, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->isValid()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-direct {p0}, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->doBaseValidation()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 66
    iget-object v1, p0, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->eventClient:Lcom/amazon/insights/EventClient;

    const-string v2, "_monetization.purchase"

    invoke-interface {v1, v2}, Lcom/amazon/insights/EventClient;->createEvent(Ljava/lang/String;)Lcom/amazon/insights/Event;

    move-result-object v0

    .line 68
    const-string v1, "_product_id"

    iget-object v2, p0, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->productId:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lcom/amazon/insights/Event;->addAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    const-string v1, "_store"

    iget-object v2, p0, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->store:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lcom/amazon/insights/Event;->addAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    const-string v1, "_quantity"

    iget-object v2, p0, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->quantity:Ljava/lang/Integer;

    invoke-interface {v0, v1, v2}, Lcom/amazon/insights/Event;->addMetric(Ljava/lang/String;Ljava/lang/Number;)V

    .line 72
    iget-object v1, p0, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->formattedItemPrice:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 73
    const-string v1, "_item_price_formatted"

    iget-object v2, p0, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->formattedItemPrice:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lcom/amazon/insights/Event;->addAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    :cond_0
    iget-object v1, p0, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->itemPrice:Ljava/lang/Double;

    if-eqz v1, :cond_1

    .line 77
    const-string v1, "_item_price"

    iget-object v2, p0, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->itemPrice:Ljava/lang/Double;

    invoke-interface {v0, v1, v2}, Lcom/amazon/insights/Event;->addMetric(Ljava/lang/String;Ljava/lang/Number;)V

    .line 80
    :cond_1
    iget-object v1, p0, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->transactionId:Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 81
    const-string v1, "_transaction_id"

    iget-object v2, p0, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->transactionId:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lcom/amazon/insights/Event;->addAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    :cond_2
    iget-object v1, p0, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->currency:Ljava/lang/String;

    if-eqz v1, :cond_3

    .line 85
    const-string v1, "_currency"

    iget-object v2, p0, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->currency:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lcom/amazon/insights/Event;->addAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    :cond_3
    return-object v0
.end method

.method protected getCurrency()Ljava/lang/String;
    .locals 1

    .prologue
    .line 188
    iget-object v0, p0, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->currency:Ljava/lang/String;

    return-object v0
.end method

.method protected getFormattedItemPrice()Ljava/lang/String;
    .locals 1

    .prologue
    .line 171
    iget-object v0, p0, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->formattedItemPrice:Ljava/lang/String;

    return-object v0
.end method

.method protected getItemPrice()Ljava/lang/Double;
    .locals 1

    .prologue
    .line 152
    iget-object v0, p0, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->itemPrice:Ljava/lang/Double;

    return-object v0
.end method

.method protected getProductId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 117
    iget-object v0, p0, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->productId:Ljava/lang/String;

    return-object v0
.end method

.method protected getQuantity()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 134
    iget-object v0, p0, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->quantity:Ljava/lang/Integer;

    return-object v0
.end method

.method protected getStore()Ljava/lang/String;
    .locals 1

    .prologue
    .line 205
    iget-object v0, p0, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->store:Ljava/lang/String;

    return-object v0
.end method

.method protected getTransactionId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 225
    iget-object v0, p0, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->transactionId:Ljava/lang/String;

    return-object v0
.end method

.method protected abstract isValid()Z
.end method

.method protected setCurrency(Ljava/lang/String;)V
    .locals 0
    .param p1, "currency"    # Ljava/lang/String;

    .prologue
    .line 196
    iput-object p1, p0, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->currency:Ljava/lang/String;

    .line 197
    return-void
.end method

.method protected setFormattedItemPrice(Ljava/lang/String;)V
    .locals 0
    .param p1, "formattedItemPrice"    # Ljava/lang/String;

    .prologue
    .line 179
    iput-object p1, p0, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->formattedItemPrice:Ljava/lang/String;

    .line 180
    return-void
.end method

.method protected setItemPrice(Ljava/lang/Double;)V
    .locals 0
    .param p1, "itemPrice"    # Ljava/lang/Double;

    .prologue
    .line 160
    iput-object p1, p0, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->itemPrice:Ljava/lang/Double;

    .line 161
    return-void
.end method

.method protected setProductId(Ljava/lang/String;)V
    .locals 0
    .param p1, "productId"    # Ljava/lang/String;

    .prologue
    .line 125
    iput-object p1, p0, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->productId:Ljava/lang/String;

    .line 126
    return-void
.end method

.method protected setQuantity(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "quantity"    # Ljava/lang/Integer;

    .prologue
    .line 142
    iput-object p1, p0, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->quantity:Ljava/lang/Integer;

    .line 143
    return-void
.end method

.method protected setStore(Ljava/lang/String;)V
    .locals 0
    .param p1, "store"    # Ljava/lang/String;

    .prologue
    .line 215
    iput-object p1, p0, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->store:Ljava/lang/String;

    .line 216
    return-void
.end method

.method protected setTransactionId(Ljava/lang/String;)V
    .locals 0
    .param p1, "transactionId"    # Ljava/lang/String;

    .prologue
    .line 233
    iput-object p1, p0, Lcom/amazon/insights/monetization/MonetizationEventBuilder;->transactionId:Ljava/lang/String;

    .line 234
    return-void
.end method
