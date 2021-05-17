.class public Lcom/playhaven/android/req/PurchaseTrackingRequest;
.super Lcom/playhaven/android/req/ContentRequest;
.source "PurchaseTrackingRequest.java"


# instance fields
.field private purchase:Lcom/playhaven/android/data/Purchase;


# direct methods
.method public constructor <init>(Lcom/playhaven/android/data/Purchase;)V
    .locals 1
    .param p1, "purchase"    # Lcom/playhaven/android/data/Purchase;

    .prologue
    .line 40
    invoke-virtual {p1}, Lcom/playhaven/android/data/Purchase;->getPlacementTag()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/playhaven/android/req/ContentRequest;-><init>(Ljava/lang/String;)V

    .line 41
    iput-object p1, p0, Lcom/playhaven/android/req/PurchaseTrackingRequest;->purchase:Lcom/playhaven/android/data/Purchase;

    .line 42
    return-void
.end method


# virtual methods
.method protected addNonNull(Lorg/springframework/web/util/UriComponentsBuilder;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "builder"    # Lorg/springframework/web/util/UriComponentsBuilder;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    .line 79
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    if-nez p3, :cond_0

    const-string p3, ""

    .end local p3    # "value":Ljava/lang/String;
    :cond_0
    aput-object p3, v0, v1

    invoke-virtual {p1, p2, v0}, Lorg/springframework/web/util/UriComponentsBuilder;->queryParam(Ljava/lang/String;[Ljava/lang/Object;)Lorg/springframework/web/util/UriComponentsBuilder;

    .line 80
    return-void
.end method

.method protected createUrl(Landroid/content/Context;)Lorg/springframework/web/util/UriComponentsBuilder;
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/playhaven/android/PlayHavenException;
        }
    .end annotation

    .prologue
    .line 46
    invoke-super {p0, p1}, Lcom/playhaven/android/req/ContentRequest;->createUrl(Landroid/content/Context;)Lorg/springframework/web/util/UriComponentsBuilder;

    move-result-object v0

    .line 48
    .local v0, "builder":Lorg/springframework/web/util/UriComponentsBuilder;
    iget-object v4, p0, Lcom/playhaven/android/req/PurchaseTrackingRequest;->purchase:Lcom/playhaven/android/data/Purchase;

    if-eqz v4, :cond_3

    .line 50
    const-string v4, "Using: %s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/playhaven/android/req/PurchaseTrackingRequest;->purchase:Lcom/playhaven/android/data/Purchase;

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Lcom/playhaven/android/PlayHaven;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 51
    invoke-static {p1}, Lcom/playhaven/android/PlayHaven;->getPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 53
    .local v1, "pref":Landroid/content/SharedPreferences;
    const-string v4, "product"

    iget-object v5, p0, Lcom/playhaven/android/req/PurchaseTrackingRequest;->purchase:Lcom/playhaven/android/data/Purchase;

    invoke-virtual {v5}, Lcom/playhaven/android/data/Purchase;->getSKU()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v0, v4, v5}, Lcom/playhaven/android/req/PurchaseTrackingRequest;->addNonNull(Lorg/springframework/web/util/UriComponentsBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    const-string v4, "quantity"

    iget-object v5, p0, Lcom/playhaven/android/req/PurchaseTrackingRequest;->purchase:Lcom/playhaven/android/data/Purchase;

    invoke-virtual {v5}, Lcom/playhaven/android/data/Purchase;->getQuantity()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v0, v4, v5}, Lcom/playhaven/android/req/PurchaseTrackingRequest;->addNonNull(Lorg/springframework/web/util/UriComponentsBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    const-string v4, "placement_tag"

    iget-object v5, p0, Lcom/playhaven/android/req/PurchaseTrackingRequest;->purchase:Lcom/playhaven/android/data/Purchase;

    invoke-virtual {v5}, Lcom/playhaven/android/data/Purchase;->getPlacementTag()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v0, v4, v5}, Lcom/playhaven/android/req/PurchaseTrackingRequest;->addNonNull(Lorg/springframework/web/util/UriComponentsBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    iget-object v4, p0, Lcom/playhaven/android/req/PurchaseTrackingRequest;->purchase:Lcom/playhaven/android/data/Purchase;

    invoke-virtual {v4}, Lcom/playhaven/android/data/Purchase;->getResult()Lcom/playhaven/android/data/Purchase$Result;

    move-result-object v2

    .line 57
    .local v2, "result":Lcom/playhaven/android/data/Purchase$Result;
    if-eqz v2, :cond_0

    .line 58
    const-string v4, "resolution"

    invoke-virtual {v2}, Lcom/playhaven/android/data/Purchase$Result;->getUrlValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v0, v4, v5}, Lcom/playhaven/android/req/PurchaseTrackingRequest;->addNonNull(Lorg/springframework/web/util/UriComponentsBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    :cond_0
    iget-object v4, p0, Lcom/playhaven/android/req/PurchaseTrackingRequest;->purchase:Lcom/playhaven/android/data/Purchase;

    invoke-virtual {v4}, Lcom/playhaven/android/data/Purchase;->getStore()Ljava/lang/String;

    move-result-object v3

    .line 61
    .local v3, "store":Ljava/lang/String;
    if-nez v3, :cond_1

    .line 64
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    sget-object v5, Lcom/playhaven/android/PlayHaven$Config;->AppPkg:Lcom/playhaven/android/PlayHaven$Config;

    invoke-virtual {p0, v1, v5}, Lcom/playhaven/android/req/PurchaseTrackingRequest;->getString(Landroid/content/SharedPreferences;Lcom/playhaven/android/PlayHaven$Config;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/content/pm/PackageManager;->getInstallerPackageName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 66
    :cond_1
    const-string v4, "store"

    if-nez v3, :cond_2

    const-string v3, "sideload"

    .end local v3    # "store":Ljava/lang/String;
    :cond_2
    invoke-virtual {p0, v0, v4, v3}, Lcom/playhaven/android/req/PurchaseTrackingRequest;->addNonNull(Lorg/springframework/web/util/UriComponentsBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    const-string v4, "cookie"

    iget-object v5, p0, Lcom/playhaven/android/req/PurchaseTrackingRequest;->purchase:Lcom/playhaven/android/data/Purchase;

    invoke-virtual {v5}, Lcom/playhaven/android/data/Purchase;->getCookie()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v0, v4, v5}, Lcom/playhaven/android/req/PurchaseTrackingRequest;->addNonNull(Lorg/springframework/web/util/UriComponentsBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    const-string v4, "price"

    iget-object v5, p0, Lcom/playhaven/android/req/PurchaseTrackingRequest;->purchase:Lcom/playhaven/android/data/Purchase;

    invoke-virtual {v5}, Lcom/playhaven/android/data/Purchase;->getPrice()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v0, v4, v5}, Lcom/playhaven/android/req/PurchaseTrackingRequest;->addNonNull(Lorg/springframework/web/util/UriComponentsBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    const-string v4, "price_locale"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v5

    invoke-static {v5}, Ljava/util/Currency;->getInstance(Ljava/util/Locale;)Ljava/util/Currency;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/Currency;->getCurrencyCode()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v0, v4, v5}, Lcom/playhaven/android/req/PurchaseTrackingRequest;->addNonNull(Lorg/springframework/web/util/UriComponentsBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    const-string v4, "payload"

    iget-object v5, p0, Lcom/playhaven/android/req/PurchaseTrackingRequest;->purchase:Lcom/playhaven/android/data/Purchase;

    invoke-virtual {v5}, Lcom/playhaven/android/data/Purchase;->getPayload()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v0, v4, v5}, Lcom/playhaven/android/req/PurchaseTrackingRequest;->addNonNull(Lorg/springframework/web/util/UriComponentsBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    const-string v4, "order_id"

    iget-object v5, p0, Lcom/playhaven/android/req/PurchaseTrackingRequest;->purchase:Lcom/playhaven/android/data/Purchase;

    invoke-virtual {v5}, Lcom/playhaven/android/data/Purchase;->getOrderId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v0, v4, v5}, Lcom/playhaven/android/req/PurchaseTrackingRequest;->addNonNull(Lorg/springframework/web/util/UriComponentsBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .end local v1    # "pref":Landroid/content/SharedPreferences;
    .end local v2    # "result":Lcom/playhaven/android/data/Purchase$Result;
    :cond_3
    return-object v0
.end method

.method protected getApiPath(Landroid/content/Context;)I
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 85
    invoke-virtual {p0, p1}, Lcom/playhaven/android/req/PurchaseTrackingRequest;->getCompat(Landroid/content/Context;)Lcom/playhaven/android/compat/VendorCompat;

    move-result-object v0

    sget-object v1, Lcom/playhaven/android/compat/VendorCompat$ResourceType;->string:Lcom/playhaven/android/compat/VendorCompat$ResourceType;

    const-string v2, "playhaven_request_iap_tracking"

    invoke-virtual {v0, p1, v1, v2}, Lcom/playhaven/android/compat/VendorCompat;->getResourceId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$ResourceType;Ljava/lang/String;)I

    move-result v0

    return v0
.end method
