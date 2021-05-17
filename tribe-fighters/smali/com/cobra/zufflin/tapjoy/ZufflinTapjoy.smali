.class public Lcom/cobra/zufflin/tapjoy/ZufflinTapjoy;
.super Ljava/lang/Object;
.source "ZufflinTapjoy.java"

# interfaces
.implements Lcom/tapjoy/TapjoyViewNotifier;
.implements Lcom/tapjoy/TapjoyNotifier;
.implements Lcom/tapjoy/TapjoySpendPointsNotifier;
.implements Lcom/tapjoy/TapjoyOffersNotifier;


# static fields
.field public static singleton:Lcom/cobra/zufflin/tapjoy/ZufflinTapjoy;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 14
    const/4 v0, 0x0

    sput-object v0, Lcom/cobra/zufflin/tapjoy/ZufflinTapjoy;->singleton:Lcom/cobra/zufflin/tapjoy/ZufflinTapjoy;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "appID"    # Ljava/lang/String;
    .param p2, "secretKey"    # Ljava/lang/String;

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    sput-object p0, Lcom/cobra/zufflin/tapjoy/ZufflinTapjoy;->singleton:Lcom/cobra/zufflin/tapjoy/ZufflinTapjoy;

    .line 22
    :try_start_0
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v1

    invoke-static {v1, p1, p2}, Lcom/tapjoy/TapjoyConnect;->requestTapjoyConnect(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    .line 23
    invoke-static {}, Lcom/tapjoy/TapjoyConnect;->getTapjoyConnectInstance()Lcom/tapjoy/TapjoyConnect;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/tapjoy/TapjoyConnect;->setTapjoyViewNotifier(Lcom/tapjoy/TapjoyViewNotifier;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    :goto_0
    return-void

    .line 25
    :catch_0
    move-exception v0

    .line 27
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public destroy()V
    .locals 1

    .prologue
    .line 33
    const/4 v0, 0x0

    sput-object v0, Lcom/cobra/zufflin/tapjoy/ZufflinTapjoy;->singleton:Lcom/cobra/zufflin/tapjoy/ZufflinTapjoy;

    .line 34
    return-void
.end method

.method public getOffersResponse()V
    .locals 0

    .prologue
    .line 110
    return-void
.end method

.method public getOffersResponseFailed(Ljava/lang/String;)V
    .locals 3
    .param p1, "error"    # Ljava/lang/String;

    .prologue
    .line 115
    const-string v0, "TapJoy"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Error: getOffersResponseFailed: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 116
    invoke-static {}, Lcom/tapjoy/TapjoyConnect;->getTapjoyConnectInstance()Lcom/tapjoy/TapjoyConnect;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/tapjoy/TapjoyConnect;->getTapPoints(Lcom/tapjoy/TapjoyNotifier;)V

    .line 117
    invoke-virtual {p0}, Lcom/cobra/zufflin/tapjoy/ZufflinTapjoy;->nativeAdvertClosed()V

    .line 118
    return-void
.end method

.method public getSpendPointsResponse(Ljava/lang/String;I)V
    .locals 0
    .param p1, "currencyName"    # Ljava/lang/String;
    .param p2, "pointTotal"    # I

    .prologue
    .line 99
    return-void
.end method

.method public getSpendPointsResponseFailed(Ljava/lang/String;)V
    .locals 3
    .param p1, "error"    # Ljava/lang/String;

    .prologue
    .line 104
    const-string v0, "TapJoy"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Error: getSpendPointsResponseFailed: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    return-void
.end method

.method public getUpdatePoints(Ljava/lang/String;I)V
    .locals 1
    .param p1, "currencyName"    # Ljava/lang/String;
    .param p2, "pointTotal"    # I

    .prologue
    .line 86
    invoke-virtual {p0, p2}, Lcom/cobra/zufflin/tapjoy/ZufflinTapjoy;->nativeReportCurrencyEarned(I)V

    .line 87
    invoke-static {}, Lcom/tapjoy/TapjoyConnect;->getTapjoyConnectInstance()Lcom/tapjoy/TapjoyConnect;

    move-result-object v0

    invoke-virtual {v0, p2, p0}, Lcom/tapjoy/TapjoyConnect;->spendTapPoints(ILcom/tapjoy/TapjoySpendPointsNotifier;)V

    .line 88
    return-void
.end method

.method public getUpdatePointsFailed(Ljava/lang/String;)V
    .locals 3
    .param p1, "error"    # Ljava/lang/String;

    .prologue
    .line 93
    const-string v0, "TapJoy"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Error: getUpdatePointsFailed: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    return-void
.end method

.method public native nativeAdvertClosed()V
.end method

.method public native nativeReportCurrencyEarned(I)V
.end method

.method public showAdvert()V
    .locals 0

    .prologue
    .line 55
    invoke-virtual {p0}, Lcom/cobra/zufflin/tapjoy/ZufflinTapjoy;->nativeAdvertClosed()V

    .line 56
    return-void
.end method

.method public showOfferWall()V
    .locals 2

    .prologue
    .line 40
    :try_start_0
    invoke-static {}, Lcom/tapjoy/TapjoyConnect;->getTapjoyConnectInstance()Lcom/tapjoy/TapjoyConnect;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/tapjoy/TapjoyConnect;->showOffers(Lcom/tapjoy/TapjoyOffersNotifier;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    :goto_0
    return-void

    .line 42
    :catch_0
    move-exception v0

    .line 44
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public showVideoAdvert()V
    .locals 0

    .prologue
    .line 50
    invoke-virtual {p0}, Lcom/cobra/zufflin/tapjoy/ZufflinTapjoy;->nativeAdvertClosed()V

    .line 51
    return-void
.end method

.method public viewDidClose(I)V
    .locals 1
    .param p1, "arg0"    # I

    .prologue
    .line 64
    invoke-static {}, Lcom/tapjoy/TapjoyConnect;->getTapjoyConnectInstance()Lcom/tapjoy/TapjoyConnect;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/tapjoy/TapjoyConnect;->getTapPoints(Lcom/tapjoy/TapjoyNotifier;)V

    .line 65
    invoke-virtual {p0}, Lcom/cobra/zufflin/tapjoy/ZufflinTapjoy;->nativeAdvertClosed()V

    .line 66
    return-void
.end method

.method public viewDidOpen(I)V
    .locals 0
    .param p1, "arg0"    # I

    .prologue
    .line 71
    return-void
.end method

.method public viewWillClose(I)V
    .locals 0
    .param p1, "arg0"    # I

    .prologue
    .line 76
    return-void
.end method

.method public viewWillOpen(I)V
    .locals 0
    .param p1, "arg0"    # I

    .prologue
    .line 81
    return-void
.end method
