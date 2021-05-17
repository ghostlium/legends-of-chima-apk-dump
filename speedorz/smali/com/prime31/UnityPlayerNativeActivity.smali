.class public Lcom/prime31/UnityPlayerNativeActivity;
.super Lcom/unity3d/player/UnityPlayerNativeActivity;
.source "UnityPlayerNativeActivity.java"


# instance fields
.field private _proxyHelper:Lcom/prime31/ActivityProxyObjectHelper;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Lcom/unity3d/player/UnityPlayerNativeActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "request"    # I
    .param p2, "response"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 33
    invoke-super {p0, p1, p2, p3}, Lcom/unity3d/player/UnityPlayerNativeActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 34
    iget-object v0, p0, Lcom/prime31/UnityPlayerNativeActivity;->_proxyHelper:Lcom/prime31/ActivityProxyObjectHelper;

    invoke-virtual {v0, p1, p2, p3}, Lcom/prime31/ActivityProxyObjectHelper;->onActivityResult(IILandroid/content/Intent;)V

    .line 35
    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .prologue
    .line 89
    invoke-super {p0}, Lcom/unity3d/player/UnityPlayerNativeActivity;->onBackPressed()V

    .line 90
    iget-object v0, p0, Lcom/prime31/UnityPlayerNativeActivity;->_proxyHelper:Lcom/prime31/ActivityProxyObjectHelper;

    invoke-virtual {v0}, Lcom/prime31/ActivityProxyObjectHelper;->onBackPressed()V

    .line 91
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 115
    invoke-super {p0, p1}, Lcom/unity3d/player/UnityPlayerNativeActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 116
    iget-object v0, p0, Lcom/prime31/UnityPlayerNativeActivity;->_proxyHelper:Lcom/prime31/ActivityProxyObjectHelper;

    invoke-virtual {v0, p1}, Lcom/prime31/ActivityProxyObjectHelper;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 117
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 17
    invoke-super {p0, p1}, Lcom/unity3d/player/UnityPlayerNativeActivity;->onCreate(Landroid/os/Bundle;)V

    .line 21
    :try_start_0
    new-instance v1, Lcom/prime31/ActivityProxyObjectHelper;

    invoke-direct {v1, p0}, Lcom/prime31/ActivityProxyObjectHelper;-><init>(Landroid/app/Activity;)V

    iput-object v1, p0, Lcom/prime31/UnityPlayerNativeActivity;->_proxyHelper:Lcom/prime31/ActivityProxyObjectHelper;

    .line 22
    iget-object v1, p0, Lcom/prime31/UnityPlayerNativeActivity;->_proxyHelper:Lcom/prime31/ActivityProxyObjectHelper;

    invoke-virtual {v1, p1}, Lcom/prime31/ActivityProxyObjectHelper;->onCreate(Landroid/os/Bundle;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    :goto_0
    return-void

    .line 24
    :catch_0
    move-exception v0

    .line 26
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "Prime31"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Failed to create proxyHelper: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 57
    invoke-super {p0}, Lcom/unity3d/player/UnityPlayerNativeActivity;->onDestroy()V

    .line 58
    iget-object v0, p0, Lcom/prime31/UnityPlayerNativeActivity;->_proxyHelper:Lcom/prime31/ActivityProxyObjectHelper;

    invoke-virtual {v0}, Lcom/prime31/ActivityProxyObjectHelper;->onDestroy()V

    .line 59
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 73
    invoke-super {p0}, Lcom/unity3d/player/UnityPlayerNativeActivity;->onPause()V

    .line 74
    iget-object v0, p0, Lcom/prime31/UnityPlayerNativeActivity;->_proxyHelper:Lcom/prime31/ActivityProxyObjectHelper;

    invoke-virtual {v0}, Lcom/prime31/ActivityProxyObjectHelper;->onPause()V

    .line 75
    return-void
.end method

.method protected onRestart()V
    .locals 1

    .prologue
    .line 65
    invoke-super {p0}, Lcom/unity3d/player/UnityPlayerNativeActivity;->onRestart()V

    .line 66
    iget-object v0, p0, Lcom/prime31/UnityPlayerNativeActivity;->_proxyHelper:Lcom/prime31/ActivityProxyObjectHelper;

    invoke-virtual {v0}, Lcom/prime31/ActivityProxyObjectHelper;->onRestart()V

    .line 67
    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 107
    invoke-super {p0, p1}, Lcom/unity3d/player/UnityPlayerNativeActivity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 108
    iget-object v0, p0, Lcom/prime31/UnityPlayerNativeActivity;->_proxyHelper:Lcom/prime31/ActivityProxyObjectHelper;

    invoke-virtual {v0, p1}, Lcom/prime31/ActivityProxyObjectHelper;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 109
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 81
    invoke-super {p0}, Lcom/unity3d/player/UnityPlayerNativeActivity;->onResume()V

    .line 82
    iget-object v0, p0, Lcom/prime31/UnityPlayerNativeActivity;->_proxyHelper:Lcom/prime31/ActivityProxyObjectHelper;

    invoke-virtual {v0}, Lcom/prime31/ActivityProxyObjectHelper;->onResume()V

    .line 83
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 97
    iget-object v0, p0, Lcom/prime31/UnityPlayerNativeActivity;->_proxyHelper:Lcom/prime31/ActivityProxyObjectHelper;

    invoke-virtual {v0, p1}, Lcom/prime31/ActivityProxyObjectHelper;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 100
    invoke-super {p0, p1}, Lcom/unity3d/player/UnityPlayerNativeActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 101
    return-void
.end method

.method protected onStart()V
    .locals 1

    .prologue
    .line 41
    invoke-super {p0}, Lcom/unity3d/player/UnityPlayerNativeActivity;->onStart()V

    .line 42
    iget-object v0, p0, Lcom/prime31/UnityPlayerNativeActivity;->_proxyHelper:Lcom/prime31/ActivityProxyObjectHelper;

    invoke-virtual {v0}, Lcom/prime31/ActivityProxyObjectHelper;->onStart()V

    .line 43
    return-void
.end method

.method protected onStop()V
    .locals 1

    .prologue
    .line 49
    invoke-super {p0}, Lcom/unity3d/player/UnityPlayerNativeActivity;->onStop()V

    .line 50
    iget-object v0, p0, Lcom/prime31/UnityPlayerNativeActivity;->_proxyHelper:Lcom/prime31/ActivityProxyObjectHelper;

    invoke-virtual {v0}, Lcom/prime31/ActivityProxyObjectHelper;->onStop()V

    .line 51
    return-void
.end method
