.class public Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;
.super Ljava/lang/Object;
.source "ClickableToastFactoryImpl.java"

# interfaces
.implements Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactory;
.implements Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinatorListener;


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static final TOAST_HORIZONTAL_MARGIN:F = 0.025f

.field private static final TOAST_VERTICAL_MARGIN:F = 0.03f


# instance fields
.field private volatile activity:Landroid/app/Activity;

.field private final jsRepository:Lcom/amazon/ags/html5/javascript/JavascriptRepository;

.field private localizationUtil:Lcom/amazon/ags/html5/util/LocalizationUtil;

.field private serviceHelper:Lcom/amazon/ags/html5/service/ServiceHelper;

.field private toast:Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;

.field private final uiPoster:Landroid/os/Handler;

.field private final webViewFactory:Lcom/amazon/ags/html5/util/WebViewFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 36
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GC_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-class v1, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/os/Handler;Lcom/amazon/ags/html5/util/WebViewFactory;Lcom/amazon/ags/html5/javascript/JavascriptRepository;Lcom/amazon/ags/html5/util/LocalizationUtil;)V
    .locals 8
    .param p1, "uiPoster"    # Landroid/os/Handler;
    .param p2, "webViewFactory"    # Lcom/amazon/ags/html5/util/WebViewFactory;
    .param p3, "jsRepository"    # Lcom/amazon/ags/html5/javascript/JavascriptRepository;
    .param p4, "localizationUtil"    # Lcom/amazon/ags/html5/util/LocalizationUtil;

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->serviceHelper:Lcom/amazon/ags/html5/service/ServiceHelper;

    .line 52
    invoke-static {}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->getInstance()Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->activity:Landroid/app/Activity;

    .line 53
    invoke-static {}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->getInstance()Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->addAGSClientInstanceCoordinatorListener(Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinatorListener;)V

    .line 55
    iput-object p1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->uiPoster:Landroid/os/Handler;

    .line 56
    iput-object p2, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->webViewFactory:Lcom/amazon/ags/html5/util/WebViewFactory;

    .line 57
    iput-object p3, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->jsRepository:Lcom/amazon/ags/html5/javascript/JavascriptRepository;

    .line 58
    iput-object p4, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->localizationUtil:Lcom/amazon/ags/html5/util/LocalizationUtil;

    .line 61
    new-instance v0, Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;

    iget-object v1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->activity:Landroid/app/Activity;

    sget-object v2, Lcom/amazon/ags/html5/overlay/PopUpPrefs;->INSTANCE:Lcom/amazon/ags/html5/overlay/PopUpPrefs;

    invoke-virtual {v2}, Lcom/amazon/ags/html5/overlay/PopUpPrefs;->getLocation()Lcom/amazon/ags/api/overlay/PopUpLocation;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->getToastParams(Lcom/amazon/ags/api/overlay/PopUpLocation;)Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;

    move-result-object v3

    iget-object v6, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->serviceHelper:Lcom/amazon/ags/html5/service/ServiceHelper;

    move-object v2, p1

    move-object v4, p2

    move-object v5, p3

    move-object v7, p4

    invoke-direct/range {v0 .. v7}, Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;-><init>(Landroid/app/Activity;Landroid/os/Handler;Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;Lcom/amazon/ags/html5/util/WebViewFactory;Lcom/amazon/ags/html5/javascript/JavascriptRepository;Lcom/amazon/ags/html5/service/ServiceHelper;Lcom/amazon/ags/html5/util/LocalizationUtil;)V

    iput-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->toast:Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;

    .line 62
    return-void
.end method

.method static synthetic access$000(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;)Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->toast:Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;

    return-object v0
.end method

.method static synthetic access$100(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;)Lcom/amazon/ags/html5/service/ServiceHelper;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->serviceHelper:Lcom/amazon/ags/html5/service/ServiceHelper;

    return-object v0
.end method

.method static synthetic access$200()Ljava/lang/String;
    .locals 1

    .prologue
    .line 34
    sget-object v0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private getToastParams(Lcom/amazon/ags/api/overlay/PopUpLocation;)Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;
    .locals 4
    .param p1, "popUpLocation"    # Lcom/amazon/ags/api/overlay/PopUpLocation;

    .prologue
    const v1, 0x3cf5c28f    # 0.03f

    const v3, 0x3ccccccd    # 0.025f

    const/4 v2, 0x0

    .line 122
    new-instance v0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;

    invoke-direct {v0}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;-><init>()V

    .line 123
    .local v0, "params":Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;
    invoke-virtual {v0, p1}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->setPopUpLocation(Lcom/amazon/ags/api/overlay/PopUpLocation;)V

    .line 124
    invoke-virtual {v0, v1}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->setVerticalMarginLandscape(F)V

    .line 125
    invoke-virtual {v0, v1}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->setVerticalMarginPortrait(F)V

    .line 128
    sget-object v1, Lcom/amazon/ags/api/overlay/PopUpLocation;->BOTTOM_CENTER:Lcom/amazon/ags/api/overlay/PopUpLocation;

    if-eq p1, v1, :cond_0

    sget-object v1, Lcom/amazon/ags/api/overlay/PopUpLocation;->TOP_CENTER:Lcom/amazon/ags/api/overlay/PopUpLocation;

    if-eq p1, v1, :cond_0

    .line 129
    invoke-virtual {v0, v3}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->setHorizontalMarginLandscape(F)V

    .line 130
    invoke-virtual {v0, v3}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->setHorizontalMarginPortrait(F)V

    .line 135
    :goto_0
    return-object v0

    .line 132
    :cond_0
    invoke-virtual {v0, v2}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->setHorizontalMarginLandscape(F)V

    .line 133
    invoke-virtual {v0, v2}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->setHorizontalMarginPortrait(F)V

    goto :goto_0
.end method

.method private declared-synchronized refreshActivity()V
    .locals 8

    .prologue
    .line 150
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->activity:Landroid/app/Activity;

    invoke-static {}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->getInstance()Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;

    move-result-object v1

    invoke-virtual {v1}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 151
    invoke-static {}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->getInstance()Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->activity:Landroid/app/Activity;

    .line 152
    new-instance v0, Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;

    iget-object v1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->activity:Landroid/app/Activity;

    iget-object v2, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->uiPoster:Landroid/os/Handler;

    sget-object v3, Lcom/amazon/ags/html5/overlay/PopUpPrefs;->INSTANCE:Lcom/amazon/ags/html5/overlay/PopUpPrefs;

    invoke-virtual {v3}, Lcom/amazon/ags/html5/overlay/PopUpPrefs;->getLocation()Lcom/amazon/ags/api/overlay/PopUpLocation;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->getToastParams(Lcom/amazon/ags/api/overlay/PopUpLocation;)Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;

    move-result-object v3

    iget-object v4, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->webViewFactory:Lcom/amazon/ags/html5/util/WebViewFactory;

    iget-object v5, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->jsRepository:Lcom/amazon/ags/html5/javascript/JavascriptRepository;

    iget-object v6, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->serviceHelper:Lcom/amazon/ags/html5/service/ServiceHelper;

    iget-object v7, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->localizationUtil:Lcom/amazon/ags/html5/util/LocalizationUtil;

    invoke-direct/range {v0 .. v7}, Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;-><init>(Landroid/app/Activity;Landroid/os/Handler;Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;Lcom/amazon/ags/html5/util/WebViewFactory;Lcom/amazon/ags/html5/javascript/JavascriptRepository;Lcom/amazon/ags/html5/service/ServiceHelper;Lcom/amazon/ags/html5/util/LocalizationUtil;)V

    iput-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->toast:Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 154
    :cond_0
    monitor-exit p0

    return-void

    .line 150
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public dismissCurrentToast()V
    .locals 1

    .prologue
    .line 165
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->toast:Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;

    if-eqz v0, :cond_0

    .line 166
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->toast:Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;

    invoke-virtual {v0}, Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;->dismiss()V

    .line 168
    :cond_0
    return-void
.end method

.method public getClickableWebViewToast(Ljava/lang/String;)Lcom/amazon/ags/html5/overlay/toasts/ClickableToast;
    .locals 2
    .param p1, "jsonData"    # Ljava/lang/String;

    .prologue
    .line 66
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->toast:Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;

    invoke-virtual {v0, p1}, Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;->setToastData(Ljava/lang/String;)V

    .line 67
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->toast:Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;

    new-instance v1, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl$1;

    invoke-direct {v1, p0, p1}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl$1;-><init>(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;->setToastOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 117
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->toast:Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;->setClickable(Z)V

    .line 118
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->toast:Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;

    return-object v0
.end method

.method public notifyCurrentActivityChanged(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 158
    invoke-direct {p0}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->refreshActivity()V

    .line 159
    return-void
.end method

.method public setServiceHelper(Lcom/amazon/ags/html5/service/ServiceHelper;)V
    .locals 1
    .param p1, "serviceHelper"    # Lcom/amazon/ags/html5/service/ServiceHelper;

    .prologue
    .line 143
    iput-object p1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->serviceHelper:Lcom/amazon/ags/html5/service/ServiceHelper;

    .line 144
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->toast:Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;

    if-eqz v0, :cond_0

    .line 145
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactoryImpl;->toast:Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;

    invoke-virtual {v0, p1}, Lcom/amazon/ags/html5/overlay/toasts/ClickableWebViewToast;->setServiceHelper(Lcom/amazon/ags/html5/service/ServiceHelper;)V

    .line 147
    :cond_0
    return-void
.end method
