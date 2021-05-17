.class Lcom/amazon/ags/html5/overlay/GameCircleUserInterface$1;
.super Ljava/lang/Object;
.source "GameCircleUserInterface.java"

# interfaces
.implements Lcom/amazon/ags/html5/javascript/domain/MessageHandlerReadyListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;

.field final synthetic val$serviceFactory:Lcom/amazon/ags/html5/factory/ServiceFactory;

.field final synthetic val$webView:Landroid/webkit/WebView;


# direct methods
.method constructor <init>(Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;Lcom/amazon/ags/html5/factory/ServiceFactory;Landroid/webkit/WebView;)V
    .locals 0

    .prologue
    .line 59
    iput-object p1, p0, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface$1;->this$0:Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;

    iput-object p2, p0, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface$1;->val$serviceFactory:Lcom/amazon/ags/html5/factory/ServiceFactory;

    iput-object p3, p0, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface$1;->val$webView:Landroid/webkit/WebView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public messageHandlerReady()V
    .locals 20

    .prologue
    .line 61
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface$1;->this$0:Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->getIntent()Landroid/content/Intent;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v18

    const-string v19, "OVERLAY_DATA_BUNDLE"

    invoke-virtual/range {v18 .. v19}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 62
    .local v3, "overlayData":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface$1;->this$0:Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->getIntent()Landroid/content/Intent;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v18

    const-string v19, "OVERLAY_SESSION_CLIENT_VERSION"

    invoke-virtual/range {v18 .. v19}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 63
    .local v8, "overlaySessionClientVersion":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface$1;->this$0:Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->getIntent()Landroid/content/Intent;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v18

    const-string v19, "OVERLAY_SESSION_CONTENT_VERSION"

    invoke-virtual/range {v18 .. v19}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 64
    .local v9, "overlaySessionContentVersion":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface$1;->this$0:Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->getIntent()Landroid/content/Intent;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v18

    const-string v19, "OVERLAY_SESSION_APPLICATION_NAME"

    invoke-virtual/range {v18 .. v19}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 65
    .local v7, "overlaySessionAppName":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface$1;->this$0:Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->getIntent()Landroid/content/Intent;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v18

    const-string v19, "OVERLAY_SESSION_LANGUAGE_CODE"

    invoke-virtual/range {v18 .. v19}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 66
    .local v15, "overlaySessionLanguageCode":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface$1;->this$0:Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->getIntent()Landroid/content/Intent;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v18

    const-string v19, "OVERLAY_SESSION_COUNTRY_CODE"

    invoke-virtual/range {v18 .. v19}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 67
    .local v10, "overlaySessionCountryCode":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface$1;->this$0:Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->getIntent()Landroid/content/Intent;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v18

    const-string v19, "OVERLAY_SESSION_DEVICE_IDENTIFIER"

    invoke-virtual/range {v18 .. v19}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 68
    .local v11, "overlaySessionDeviceId":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface$1;->this$0:Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->getIntent()Landroid/content/Intent;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v18

    const-string v19, "OVERLAY_SESSION_DEVICE_MANUFACTURER"

    invoke-virtual/range {v18 .. v19}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 69
    .local v12, "overlaySessionDeviceManufacturer":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface$1;->this$0:Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->getIntent()Landroid/content/Intent;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v18

    const-string v19, "OVERLAY_SESSION_DEVICE_MODEL"

    invoke-virtual/range {v18 .. v19}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 70
    .local v13, "overlaySessionDeviceModel":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface$1;->this$0:Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->getIntent()Landroid/content/Intent;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v18

    const-string v19, "OVERLAY_SESSION_DEVICE_TYPE"

    invoke-virtual/range {v18 .. v19}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 71
    .local v14, "overlaySessionDeviceType":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface$1;->this$0:Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->getIntent()Landroid/content/Intent;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v18

    const-string v19, "OVERLAY_SESSION_VARIATION_CACHE"

    invoke-virtual/range {v18 .. v19}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 73
    .local v16, "overlaySessionVariations":Ljava/lang/String;
    invoke-static {v3}, Lcom/amazon/ags/html5/util/JSONUtils;->sanitize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 76
    .local v17, "sanitizedOverlayData":Ljava/lang/String;
    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    move-object/from16 v0, v17

    invoke-direct {v4, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 77
    .local v4, "overlayDataJson":Lorg/json/JSONObject;
    const-string v18, "clientVersion"

    move-object/from16 v0, v18

    invoke-virtual {v4, v0, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 78
    const-string v18, "contentVersion"

    move-object/from16 v0, v18

    invoke-virtual {v4, v0, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 79
    const-string v18, "appName"

    move-object/from16 v0, v18

    invoke-virtual {v4, v0, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 80
    const-string v18, "languageCode"

    move-object/from16 v0, v18

    invoke-virtual {v4, v0, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 81
    const-string v18, "countryCode"

    move-object/from16 v0, v18

    invoke-virtual {v4, v0, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 82
    const-string v18, "deviceId"

    move-object/from16 v0, v18

    invoke-virtual {v4, v0, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 83
    const-string v18, "deviceManufacturer"

    move-object/from16 v0, v18

    invoke-virtual {v4, v0, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 84
    const-string v18, "deviceModel"

    move-object/from16 v0, v18

    invoke-virtual {v4, v0, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 85
    const-string v18, "deviceType"

    move-object/from16 v0, v18

    invoke-virtual {v4, v0, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 86
    const-string v18, "canSendMail"

    const/16 v19, 0x1

    move-object/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v4, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 88
    new-instance v5, Lorg/json/JSONObject;

    move-object/from16 v0, v16

    invoke-direct {v5, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 89
    .local v5, "overlayExperiments":Lorg/json/JSONObject;
    const-string v18, "experiments"

    move-object/from16 v0, v18

    invoke-virtual {v4, v0, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 91
    if-eqz v4, :cond_0

    .line 92
    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v17

    .line 99
    .end local v4    # "overlayDataJson":Lorg/json/JSONObject;
    .end local v5    # "overlayExperiments":Lorg/json/JSONObject;
    :cond_0
    :goto_0
    move-object/from16 v6, v17

    .line 102
    .local v6, "overlayInputData":Ljava/lang/String;
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface$1;->val$serviceFactory:Lcom/amazon/ags/html5/factory/ServiceFactory;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/amazon/ags/html5/factory/ServiceFactory;->getUiThreadHandler()Landroid/os/Handler;

    move-result-object v18

    new-instance v19, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface$1$1;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v6}, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface$1$1;-><init>(Lcom/amazon/ags/html5/overlay/GameCircleUserInterface$1;Ljava/lang/String;)V

    invoke-virtual/range {v18 .. v19}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 116
    :goto_1
    return-void

    .line 95
    .end local v6    # "overlayInputData":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 96
    .local v2, "e":Ljava/lang/Exception;
    invoke-static {}, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->access$000()Ljava/lang/String;

    move-result-object v18

    const-string v19, "Error occurred while adding client version to overlay initialization"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-static {v0, v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 112
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v6    # "overlayInputData":Ljava/lang/String;
    :catch_1
    move-exception v2

    .line 113
    .restart local v2    # "e":Ljava/lang/Exception;
    invoke-static {}, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->access$000()Ljava/lang/String;

    move-result-object v18

    const-string v19, "Unexpected error occurred while processing overlay message.  Overlay will close."

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-static {v0, v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 114
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface$1;->this$0:Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;->finish()V

    goto :goto_1
.end method
