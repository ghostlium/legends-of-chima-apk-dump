.class public Lcom/amazon/ags/html5/overlay/GameCircleAlertUserInterface;
.super Landroid/app/Activity;
.source "GameCircleAlertUserInterface.java"

# interfaces
.implements Lcom/amazon/ags/html5/javascript/domain/CloseAlertListener;


# static fields
.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 37
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GC_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-class v1, Lcom/amazon/ags/html5/overlay/GameCircleAlertUserInterface;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/ags/html5/overlay/GameCircleAlertUserInterface;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 35
    sget-object v0, Lcom/amazon/ags/html5/overlay/GameCircleAlertUserInterface;->TAG:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public closeAlert()V
    .locals 0

    .prologue
    .line 139
    invoke-virtual {p0}, Lcom/amazon/ags/html5/overlay/GameCircleAlertUserInterface;->finish()V

    .line 140
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 31
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 41
    invoke-super/range {p0 .. p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 43
    invoke-virtual/range {p0 .. p0}, Lcom/amazon/ags/html5/overlay/GameCircleAlertUserInterface;->getIntent()Landroid/content/Intent;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v28

    const-string v29, "OVERLAY_DATA_BUNDLE"

    invoke-virtual/range {v28 .. v29}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 44
    .local v10, "overlayData":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/amazon/ags/html5/overlay/GameCircleAlertUserInterface;->getIntent()Landroid/content/Intent;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v28

    const-string v29, "OVERLAY_SESSION_CLIENT_VERSION"

    invoke-virtual/range {v28 .. v29}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 45
    .local v14, "overlaySessionClientVersion":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/amazon/ags/html5/overlay/GameCircleAlertUserInterface;->getIntent()Landroid/content/Intent;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v28

    const-string v29, "OVERLAY_SESSION_CONTENT_VERSION"

    invoke-virtual/range {v28 .. v29}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 46
    .local v15, "overlaySessionContentVersion":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/amazon/ags/html5/overlay/GameCircleAlertUserInterface;->getIntent()Landroid/content/Intent;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v28

    const-string v29, "OVERLAY_SESSION_APPLICATION_NAME"

    invoke-virtual/range {v28 .. v29}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 47
    .local v13, "overlaySessionAppName":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/amazon/ags/html5/overlay/GameCircleAlertUserInterface;->getIntent()Landroid/content/Intent;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v28

    const-string v29, "OVERLAY_SESSION_LANGUAGE_CODE"

    invoke-virtual/range {v28 .. v29}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 48
    .local v21, "overlaySessionLanguageCode":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/amazon/ags/html5/overlay/GameCircleAlertUserInterface;->getIntent()Landroid/content/Intent;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v28

    const-string v29, "OVERLAY_SESSION_COUNTRY_CODE"

    invoke-virtual/range {v28 .. v29}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 49
    .local v16, "overlaySessionCountryCode":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/amazon/ags/html5/overlay/GameCircleAlertUserInterface;->getIntent()Landroid/content/Intent;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v28

    const-string v29, "OVERLAY_SESSION_DEVICE_IDENTIFIER"

    invoke-virtual/range {v28 .. v29}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 50
    .local v17, "overlaySessionDeviceId":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/amazon/ags/html5/overlay/GameCircleAlertUserInterface;->getIntent()Landroid/content/Intent;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v28

    const-string v29, "OVERLAY_SESSION_DEVICE_MANUFACTURER"

    invoke-virtual/range {v28 .. v29}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 51
    .local v18, "overlaySessionDeviceManufacturer":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/amazon/ags/html5/overlay/GameCircleAlertUserInterface;->getIntent()Landroid/content/Intent;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v28

    const-string v29, "OVERLAY_SESSION_DEVICE_MODEL"

    invoke-virtual/range {v28 .. v29}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 52
    .local v19, "overlaySessionDeviceModel":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/amazon/ags/html5/overlay/GameCircleAlertUserInterface;->getIntent()Landroid/content/Intent;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v28

    const-string v29, "OVERLAY_SESSION_DEVICE_TYPE"

    invoke-virtual/range {v28 .. v29}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 53
    .local v20, "overlaySessionDeviceType":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/amazon/ags/html5/overlay/GameCircleAlertUserInterface;->getIntent()Landroid/content/Intent;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v28

    const-string v29, "OVERLAY_SESSION_VARIATION_CACHE"

    invoke-virtual/range {v28 .. v29}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    .line 55
    .local v22, "overlaySessionVariations":Ljava/lang/String;
    invoke-static {v10}, Lcom/amazon/ags/html5/util/JSONUtils;->sanitize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    .line 58
    .local v25, "sanitizedOverlayData":Ljava/lang/String;
    :try_start_0
    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11, v10}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 59
    .local v11, "overlayDataJson":Lorg/json/JSONObject;
    const-string v28, "clientVersion"

    move-object/from16 v0, v28

    invoke-virtual {v11, v0, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 60
    const-string v28, "contentVersion"

    move-object/from16 v0, v28

    invoke-virtual {v11, v0, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 61
    const-string v28, "appName"

    move-object/from16 v0, v28

    invoke-virtual {v11, v0, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 62
    const-string v28, "languageCode"

    move-object/from16 v0, v28

    move-object/from16 v1, v21

    invoke-virtual {v11, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 63
    const-string v28, "countryCode"

    move-object/from16 v0, v28

    move-object/from16 v1, v16

    invoke-virtual {v11, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 64
    const-string v28, "deviceId"

    move-object/from16 v0, v28

    move-object/from16 v1, v17

    invoke-virtual {v11, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 65
    const-string v28, "deviceManufacturer"

    move-object/from16 v0, v28

    move-object/from16 v1, v18

    invoke-virtual {v11, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 66
    const-string v28, "deviceModel"

    move-object/from16 v0, v28

    move-object/from16 v1, v19

    invoke-virtual {v11, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 67
    const-string v28, "deviceType"

    move-object/from16 v0, v28

    move-object/from16 v1, v20

    invoke-virtual {v11, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 68
    const-string v28, "canSendMail"

    const/16 v29, 0x1

    move-object/from16 v0, v28

    move/from16 v1, v29

    invoke-virtual {v11, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 70
    new-instance v12, Lorg/json/JSONObject;

    move-object/from16 v0, v22

    invoke-direct {v12, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 71
    .local v12, "overlayExperiments":Lorg/json/JSONObject;
    const-string v28, "experiments"

    move-object/from16 v0, v28

    invoke-virtual {v11, v0, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 73
    if-eqz v11, :cond_0

    .line 74
    invoke-virtual {v11}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v25

    .line 80
    .end local v11    # "overlayDataJson":Lorg/json/JSONObject;
    .end local v12    # "overlayExperiments":Lorg/json/JSONObject;
    :cond_0
    :goto_0
    move-object/from16 v24, v25

    .line 83
    .local v24, "processedOverlayData":Ljava/lang/String;
    :try_start_1
    invoke-static {}, Lcom/amazon/ags/html5/factory/ServiceFactory;->getInstance()Lcom/amazon/ags/html5/factory/ServiceFactory;

    move-result-object v26

    .line 85
    .local v26, "serviceFactory":Lcom/amazon/ags/html5/factory/ServiceFactory;
    invoke-virtual/range {v26 .. v26}, Lcom/amazon/ags/html5/factory/ServiceFactory;->getWebViewFactory()Lcom/amazon/ags/html5/util/WebViewFactory;

    move-result-object v28

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/amazon/ags/html5/util/WebViewFactory;->newOverlayWebView(Landroid/app/Activity;)Landroid/webkit/WebView;

    move-result-object v27

    .line 86
    .local v27, "webView":Landroid/webkit/WebView;
    invoke-virtual/range {v27 .. v27}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v28

    const/16 v29, 0x1

    invoke-virtual/range {v28 .. v29}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    .line 87
    invoke-virtual/range {v27 .. v27}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v28

    const/16 v29, 0x1

    invoke-virtual/range {v28 .. v29}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    .line 88
    invoke-virtual/range {v27 .. v27}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v28

    const/16 v29, 0x0

    invoke-virtual/range {v28 .. v29}, Landroid/webkit/WebSettings;->setSupportZoom(Z)V

    .line 89
    invoke-virtual/range {v27 .. v27}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v28

    const/16 v29, 0x0

    invoke-virtual/range {v28 .. v29}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    .line 91
    const-string v28, "overlaywebview"

    invoke-virtual/range {v26 .. v28}, Lcom/amazon/ags/html5/factory/ServiceFactory;->getJavascriptInterface(Landroid/webkit/WebView;Ljava/lang/String;)Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;

    move-result-object v8

    .line 92
    .local v8, "javascriptInterface":Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;
    move-object/from16 v0, p0

    invoke-virtual {v8, v0}, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->addCloseAlertListener(Lcom/amazon/ags/html5/javascript/domain/CloseAlertListener;)V

    .line 94
    invoke-virtual/range {v26 .. v26}, Lcom/amazon/ags/html5/factory/ServiceFactory;->getJavascriptRepository()Lcom/amazon/ags/html5/javascript/JavascriptRepository;

    move-result-object v9

    .line 95
    .local v9, "javascriptRepository":Lcom/amazon/ags/html5/javascript/JavascriptRepository;
    new-instance v28, Lcom/amazon/ags/html5/overlay/GameCircleAlertUserInterface$1;

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    move-object/from16 v2, v24

    move-object/from16 v3, v26

    move-object/from16 v4, v27

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/amazon/ags/html5/overlay/GameCircleAlertUserInterface$1;-><init>(Lcom/amazon/ags/html5/overlay/GameCircleAlertUserInterface;Ljava/lang/String;Lcom/amazon/ags/html5/factory/ServiceFactory;Landroid/webkit/WebView;)V

    move-object/from16 v0, v28

    invoke-virtual {v8, v0}, Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;->addMessageHandlerReadyListener(Lcom/amazon/ags/html5/javascript/domain/MessageHandlerReadyListener;)V

    .line 117
    move-object/from16 v0, v27

    invoke-interface {v9, v0}, Lcom/amazon/ags/html5/javascript/JavascriptRepository;->loadAlertJavascript(Landroid/webkit/WebView;)V

    .line 120
    invoke-virtual/range {p0 .. p0}, Lcom/amazon/ags/html5/overlay/GameCircleAlertUserInterface;->getBaseContext()Landroid/content/Context;

    move-result-object v28

    const-string v29, "modal_alert_container"

    invoke-static/range {v28 .. v29}, Lcom/amazon/ags/html5/util/ResourceUtils;->getLayoutId(Landroid/content/Context;Ljava/lang/String;)I

    move-result v28

    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Lcom/amazon/ags/html5/overlay/GameCircleAlertUserInterface;->setContentView(I)V

    .line 121
    invoke-virtual/range {p0 .. p0}, Lcom/amazon/ags/html5/overlay/GameCircleAlertUserInterface;->getBaseContext()Landroid/content/Context;

    move-result-object v28

    const-string v29, "id"

    const-string v30, "modal_alert_container"

    invoke-static/range {v28 .. v30}, Lcom/amazon/ags/html5/util/ResourceUtils;->getIdentifier(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I

    move-result v28

    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Lcom/amazon/ags/html5/overlay/GameCircleAlertUserInterface;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout;

    .line 122
    .local v5, "container":Landroid/widget/LinearLayout;
    const/16 v28, 0x0

    invoke-virtual/range {v27 .. v28}, Landroid/webkit/WebView;->setBackgroundColor(I)V

    .line 124
    move-object/from16 v0, v27

    invoke-virtual {v5, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 126
    const-string v28, "window"

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lcom/amazon/ags/html5/overlay/GameCircleAlertUserInterface;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Landroid/view/WindowManager;

    invoke-interface/range {v28 .. v28}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v6

    .line 127
    .local v6, "display":Landroid/view/Display;
    invoke-virtual/range {v27 .. v27}, Landroid/webkit/WebView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v23

    .line 128
    .local v23, "params":Landroid/view/ViewGroup$LayoutParams;
    invoke-virtual {v6}, Landroid/view/Display;->getWidth()I

    move-result v28

    move/from16 v0, v28

    move-object/from16 v1, v23

    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 129
    invoke-virtual {v6}, Landroid/view/Display;->getHeight()I

    move-result v28

    move/from16 v0, v28

    move-object/from16 v1, v23

    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 131
    const-string v28, "hostinterface"

    move-object/from16 v0, v27

    move-object/from16 v1, v28

    invoke-virtual {v0, v8, v1}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 136
    .end local v5    # "container":Landroid/widget/LinearLayout;
    .end local v6    # "display":Landroid/view/Display;
    .end local v8    # "javascriptInterface":Lcom/amazon/ags/html5/javascript/domain/JavascriptInterface;
    .end local v9    # "javascriptRepository":Lcom/amazon/ags/html5/javascript/JavascriptRepository;
    .end local v23    # "params":Landroid/view/ViewGroup$LayoutParams;
    .end local v26    # "serviceFactory":Lcom/amazon/ags/html5/factory/ServiceFactory;
    .end local v27    # "webView":Landroid/webkit/WebView;
    :goto_1
    return-void

    .line 76
    .end local v24    # "processedOverlayData":Ljava/lang/String;
    :catch_0
    move-exception v7

    .line 77
    .local v7, "e":Ljava/lang/Exception;
    sget-object v28, Lcom/amazon/ags/html5/overlay/GameCircleAlertUserInterface;->TAG:Ljava/lang/String;

    const-string v29, "Error occurred while preparing alert initialization data"

    move-object/from16 v0, v28

    move-object/from16 v1, v29

    invoke-static {v0, v1, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_0

    .line 132
    .end local v7    # "e":Ljava/lang/Exception;
    .restart local v24    # "processedOverlayData":Ljava/lang/String;
    :catch_1
    move-exception v7

    .line 133
    .restart local v7    # "e":Ljava/lang/Exception;
    sget-object v28, Lcom/amazon/ags/html5/overlay/GameCircleAlertUserInterface;->TAG:Ljava/lang/String;

    const-string v29, "Unexpected error occurred while displaying alert.  Alert will close."

    move-object/from16 v0, v28

    move-object/from16 v1, v29

    invoke-static {v0, v1, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 134
    invoke-virtual/range {p0 .. p0}, Lcom/amazon/ags/html5/overlay/GameCircleAlertUserInterface;->finish()V

    goto :goto_1
.end method
