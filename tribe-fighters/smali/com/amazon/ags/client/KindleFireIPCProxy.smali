.class public Lcom/amazon/ags/client/KindleFireIPCProxy;
.super Ljava/lang/Object;
.source "KindleFireIPCProxy.java"

# interfaces
.implements Lcom/amazon/ags/client/KindleFireProxy;


# static fields
.field private static final SERVICE_CLASS_NAME:Ljava/lang/String; = "com.amazon.ags.app.service.AmazonGamesService"

.field private static final SERVICE_PACKAGE_NAME:Ljava/lang/String; = "com.amazon.ags.app"

.field private static final TAG:Ljava/lang/String; = "KindleFireIPCProxy"


# instance fields
.field private asynchronousMessenger:Landroid/os/Messenger;

.field private callback:Lcom/amazon/ags/client/KindleFireBindingCallback;

.field private final context:Landroid/content/Context;

.field private isKindle:Ljava/lang/Boolean;

.field private isOverlaysSupported:Ljava/lang/Boolean;

.field private isUniversalSupported:Ljava/lang/Boolean;

.field private sessionId:Ljava/lang/String;

.field private status:Lcom/amazon/ags/client/KindleFireStatus;

.field private synchronousBinder:Landroid/os/IBinder;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput-object v1, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->synchronousBinder:Landroid/os/IBinder;

    .line 51
    iput-object v1, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->asynchronousMessenger:Landroid/os/Messenger;

    .line 53
    iput-object v1, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->callback:Lcom/amazon/ags/client/KindleFireBindingCallback;

    .line 56
    sget-object v0, Lcom/amazon/ags/client/KindleFireStatus;->INITIALIZING:Lcom/amazon/ags/client/KindleFireStatus;

    iput-object v0, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->status:Lcom/amazon/ags/client/KindleFireStatus;

    .line 57
    iput-object v1, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->isUniversalSupported:Ljava/lang/Boolean;

    .line 60
    iput-object v1, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->isKindle:Ljava/lang/Boolean;

    .line 62
    iput-object v1, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->isOverlaysSupported:Ljava/lang/Boolean;

    .line 65
    iput-object p1, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->context:Landroid/content/Context;

    .line 66
    return-void
.end method

.method static synthetic access$002(Lcom/amazon/ags/client/KindleFireIPCProxy;Landroid/os/Messenger;)Landroid/os/Messenger;
    .locals 0
    .param p0, "x0"    # Lcom/amazon/ags/client/KindleFireIPCProxy;
    .param p1, "x1"    # Landroid/os/Messenger;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->asynchronousMessenger:Landroid/os/Messenger;

    return-object p1
.end method

.method static synthetic access$100(Lcom/amazon/ags/client/KindleFireIPCProxy;)V
    .locals 0
    .param p0, "x0"    # Lcom/amazon/ags/client/KindleFireIPCProxy;

    .prologue
    .line 44
    invoke-direct {p0}, Lcom/amazon/ags/client/KindleFireIPCProxy;->onBindChange()V

    return-void
.end method

.method static synthetic access$202(Lcom/amazon/ags/client/KindleFireIPCProxy;Landroid/os/IBinder;)Landroid/os/IBinder;
    .locals 0
    .param p0, "x0"    # Lcom/amazon/ags/client/KindleFireIPCProxy;
    .param p1, "x1"    # Landroid/os/IBinder;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->synchronousBinder:Landroid/os/IBinder;

    return-object p1
.end method

.method static synthetic access$300(Lcom/amazon/ags/client/KindleFireIPCProxy;Lcom/amazon/ags/client/KindleFireStatus;)V
    .locals 0
    .param p0, "x0"    # Lcom/amazon/ags/client/KindleFireIPCProxy;
    .param p1, "x1"    # Lcom/amazon/ags/client/KindleFireStatus;

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lcom/amazon/ags/client/KindleFireIPCProxy;->changeStatus(Lcom/amazon/ags/client/KindleFireStatus;)V

    return-void
.end method

.method static synthetic access$400(Lcom/amazon/ags/client/KindleFireIPCProxy;)V
    .locals 0
    .param p0, "x0"    # Lcom/amazon/ags/client/KindleFireIPCProxy;

    .prologue
    .line 44
    invoke-direct {p0}, Lcom/amazon/ags/client/KindleFireIPCProxy;->onAuthorized()V

    return-void
.end method

.method private authorize()V
    .locals 4

    .prologue
    .line 397
    const-string v2, "KindleFireIPCProxy"

    const-string v3, "Attempting to Authorize"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 398
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v1

    .line 399
    .local v1, "msg":Landroid/os/Message;
    const/16 v2, 0x2c

    iput v2, v1, Landroid/os/Message;->what:I

    .line 400
    new-instance v2, Landroid/os/Messenger;

    new-instance v3, Lcom/amazon/ags/client/KindleFireIPCProxy$3;

    invoke-direct {v3, p0}, Lcom/amazon/ags/client/KindleFireIPCProxy$3;-><init>(Lcom/amazon/ags/client/KindleFireIPCProxy;)V

    invoke-direct {v2, v3}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    iput-object v2, v1, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    .line 428
    :try_start_0
    invoke-direct {p0, v1}, Lcom/amazon/ags/client/KindleFireIPCProxy;->sendMessage(Landroid/os/Message;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 433
    :goto_0
    return-void

    .line 429
    :catch_0
    move-exception v0

    .line 430
    .local v0, "e":Landroid/os/RemoteException;
    const-string v2, "KindleFireIPCProxy"

    const-string v3, "Unable to send Message to Service: "

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 431
    sget-object v2, Lcom/amazon/ags/client/KindleFireStatus;->CANNOT_AUTHORIZE:Lcom/amazon/ags/client/KindleFireStatus;

    invoke-direct {p0, v2}, Lcom/amazon/ags/client/KindleFireIPCProxy;->changeStatus(Lcom/amazon/ags/client/KindleFireStatus;)V

    goto :goto_0
.end method

.method private bindToAsynchronousService(Landroid/content/Context;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 268
    new-instance v0, Lcom/amazon/ags/client/KindleFireIPCProxy$1;

    invoke-direct {v0, p0}, Lcom/amazon/ags/client/KindleFireIPCProxy$1;-><init>(Lcom/amazon/ags/client/KindleFireIPCProxy;)V

    .line 282
    .local v0, "asyncConnection":Landroid/content/ServiceConnection;
    invoke-direct {p0}, Lcom/amazon/ags/client/KindleFireIPCProxy;->createBindIntent()Landroid/content/Intent;

    move-result-object v2

    .line 283
    .local v2, "intent":Landroid/content/Intent;
    const-string v4, "BindAsynchronous"

    invoke-virtual {v2, v4}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 285
    const/4 v4, 0x1

    :try_start_0
    invoke-virtual {p1, v2, v0, v4}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v1

    .line 286
    .local v1, "bound":Z
    const-string v4, "KindleFireIPCProxy"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "binding result:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 292
    .end local v1    # "bound":Z
    :goto_0
    return-void

    .line 287
    :catch_0
    move-exception v3

    .line 289
    .local v3, "se":Ljava/lang/SecurityException;
    const-string v4, "KindleFireIPCProxy"

    const-string v5, "Device has an outdated version of Amazon Game Services.  Player will be in Guest mode"

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 290
    sget-object v4, Lcom/amazon/ags/client/KindleFireStatus;->UNIVERSAL_NOT_SUPPORTED:Lcom/amazon/ags/client/KindleFireStatus;

    invoke-direct {p0, v4}, Lcom/amazon/ags/client/KindleFireIPCProxy;->changeStatus(Lcom/amazon/ags/client/KindleFireStatus;)V

    goto :goto_0
.end method

.method private bindToSynchronousService(Landroid/content/Context;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 295
    new-instance v2, Lcom/amazon/ags/client/KindleFireIPCProxy$2;

    invoke-direct {v2, p0}, Lcom/amazon/ags/client/KindleFireIPCProxy$2;-><init>(Lcom/amazon/ags/client/KindleFireIPCProxy;)V

    .line 310
    .local v2, "syncConnection":Landroid/content/ServiceConnection;
    invoke-direct {p0}, Lcom/amazon/ags/client/KindleFireIPCProxy;->createBindIntent()Landroid/content/Intent;

    move-result-object v0

    .line 311
    .local v0, "intent":Landroid/content/Intent;
    const-string v3, "BindSynchronous"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 313
    const/4 v3, 0x1

    :try_start_0
    invoke-virtual {p1, v0, v2, v3}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 319
    :goto_0
    return-void

    .line 314
    :catch_0
    move-exception v1

    .line 316
    .local v1, "se":Ljava/lang/SecurityException;
    const-string v3, "KindleFireIPCProxy"

    const-string v4, "Device has an outdated version of Amazon Game Services.  Player will be in Guest mode"

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 317
    sget-object v3, Lcom/amazon/ags/client/KindleFireStatus;->UNIVERSAL_NOT_SUPPORTED:Lcom/amazon/ags/client/KindleFireStatus;

    invoke-direct {p0, v3}, Lcom/amazon/ags/client/KindleFireIPCProxy;->changeStatus(Lcom/amazon/ags/client/KindleFireStatus;)V

    goto :goto_0
.end method

.method private changeStatus(Lcom/amazon/ags/client/KindleFireStatus;)V
    .locals 3
    .param p1, "newStatus"    # Lcom/amazon/ags/client/KindleFireStatus;

    .prologue
    .line 373
    iget-object v0, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->status:Lcom/amazon/ags/client/KindleFireStatus;

    if-eq p1, v0, :cond_0

    .line 374
    const-string v0, "KindleFireIPCProxy"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Changing Status from:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->status:Lcom/amazon/ags/client/KindleFireStatus;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " to: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 375
    iput-object p1, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->status:Lcom/amazon/ags/client/KindleFireStatus;

    .line 376
    invoke-direct {p0}, Lcom/amazon/ags/client/KindleFireIPCProxy;->notifyCaller()V

    .line 378
    :cond_0
    return-void
.end method

.method private createBindIntent()Landroid/content/Intent;
    .locals 3

    .prologue
    .line 322
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 323
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "com.amazon.ags.app"

    const-string v2, "com.amazon.ags.app.service.AmazonGamesService"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 324
    const-string v1, "CLIENT_VERSION"

    const-string v2, "1.0.0"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 325
    return-object v0
.end method

.method private initSession()Z
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 382
    const/16 v3, 0x2e

    :try_start_0
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v4

    invoke-direct {p0, v3, v4}, Lcom/amazon/ags/client/KindleFireIPCProxy;->transact(ILandroid/os/Parcel;)Landroid/os/Parcel;

    move-result-object v1

    .line 383
    .local v1, "reply":Landroid/os/Parcel;
    invoke-virtual {v1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->sessionId:Ljava/lang/String;

    .line 384
    iget-object v3, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->sessionId:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 385
    const-string v3, "KindleFireIPCProxy"

    const-string v4, "Could not obtain session"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 392
    .end local v1    # "reply":Landroid/os/Parcel;
    :goto_0
    return v2

    .line 388
    .restart local v1    # "reply":Landroid/os/Parcel;
    :cond_0
    const/4 v2, 0x1

    goto :goto_0

    .line 390
    .end local v1    # "reply":Landroid/os/Parcel;
    :catch_0
    move-exception v0

    .line 391
    .local v0, "e":Landroid/os/RemoteException;
    const-string v3, "KindleFireIPCProxy"

    const-string v4, "Could not obtain session"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private isBound()Z
    .locals 3

    .prologue
    .line 329
    iget-object v0, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->synchronousBinder:Landroid/os/IBinder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->asynchronousMessenger:Landroid/os/Messenger;

    if-nez v0, :cond_1

    .line 330
    :cond_0
    const-string v0, "KindleFireIPCProxy"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "synchronousBinder:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->synchronousBinder:Landroid/os/IBinder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " serviceMessengerClient:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->asynchronousMessenger:Landroid/os/Messenger;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 331
    const/4 v0, 0x0

    .line 334
    :goto_0
    return v0

    .line 333
    :cond_1
    const-string v0, "KindleFireIPCProxy"

    const-string v1, "Client is bound to service"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 334
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private notifyCaller()V
    .locals 2

    .prologue
    .line 363
    iget-object v0, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->callback:Lcom/amazon/ags/client/KindleFireBindingCallback;

    if-eqz v0, :cond_0

    .line 364
    iget-object v0, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->status:Lcom/amazon/ags/client/KindleFireStatus;

    sget-object v1, Lcom/amazon/ags/client/KindleFireStatus;->SERVICE_CONNECTED:Lcom/amazon/ags/client/KindleFireStatus;

    if-ne v0, v1, :cond_1

    .line 365
    iget-object v0, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->callback:Lcom/amazon/ags/client/KindleFireBindingCallback;

    invoke-interface {v0}, Lcom/amazon/ags/client/KindleFireBindingCallback;->onBound()V

    .line 370
    :cond_0
    :goto_0
    return-void

    .line 367
    :cond_1
    iget-object v0, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->callback:Lcom/amazon/ags/client/KindleFireBindingCallback;

    iget-object v1, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->status:Lcom/amazon/ags/client/KindleFireStatus;

    invoke-interface {v0, v1}, Lcom/amazon/ags/client/KindleFireBindingCallback;->onFailure(Lcom/amazon/ags/client/KindleFireStatus;)V

    goto :goto_0
.end method

.method private onAuthorized()V
    .locals 1

    .prologue
    .line 436
    invoke-virtual {p0}, Lcom/amazon/ags/client/KindleFireIPCProxy;->isRegistered()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 437
    sget-object v0, Lcom/amazon/ags/client/KindleFireStatus;->SERVICE_CONNECTED:Lcom/amazon/ags/client/KindleFireStatus;

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/KindleFireIPCProxy;->changeStatus(Lcom/amazon/ags/client/KindleFireStatus;)V

    .line 441
    :goto_0
    return-void

    .line 439
    :cond_0
    sget-object v0, Lcom/amazon/ags/client/KindleFireStatus;->NOT_REGISTERED:Lcom/amazon/ags/client/KindleFireStatus;

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/KindleFireIPCProxy;->changeStatus(Lcom/amazon/ags/client/KindleFireStatus;)V

    goto :goto_0
.end method

.method private declared-synchronized onBindChange()V
    .locals 2

    .prologue
    .line 339
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/amazon/ags/client/KindleFireIPCProxy;->isBound()Z

    move-result v0

    if-nez v0, :cond_1

    .line 340
    iget-object v0, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->status:Lcom/amazon/ags/client/KindleFireStatus;

    sget-object v1, Lcom/amazon/ags/client/KindleFireStatus;->SERVICE_CONNECTED:Lcom/amazon/ags/client/KindleFireStatus;

    if-ne v0, v1, :cond_0

    .line 341
    sget-object v0, Lcom/amazon/ags/client/KindleFireStatus;->SERVICE_DISCONNECTED:Lcom/amazon/ags/client/KindleFireStatus;

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/KindleFireIPCProxy;->changeStatus(Lcom/amazon/ags/client/KindleFireStatus;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 360
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 346
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->status:Lcom/amazon/ags/client/KindleFireStatus;

    sget-object v1, Lcom/amazon/ags/client/KindleFireStatus;->INITIALIZING:Lcom/amazon/ags/client/KindleFireStatus;

    if-ne v0, v1, :cond_0

    .line 350
    invoke-virtual {p0}, Lcom/amazon/ags/client/KindleFireIPCProxy;->isUniversalSupported()Z

    move-result v0

    if-nez v0, :cond_2

    .line 351
    sget-object v0, Lcom/amazon/ags/client/KindleFireStatus;->UNIVERSAL_NOT_SUPPORTED:Lcom/amazon/ags/client/KindleFireStatus;

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/KindleFireIPCProxy;->changeStatus(Lcom/amazon/ags/client/KindleFireStatus;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 339
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 355
    :cond_2
    :try_start_2
    invoke-direct {p0}, Lcom/amazon/ags/client/KindleFireIPCProxy;->initSession()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 356
    invoke-direct {p0}, Lcom/amazon/ags/client/KindleFireIPCProxy;->authorize()V

    goto :goto_0

    .line 358
    :cond_3
    sget-object v0, Lcom/amazon/ags/client/KindleFireStatus;->UNIVERSAL_NOT_SUPPORTED:Lcom/amazon/ags/client/KindleFireStatus;

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/KindleFireIPCProxy;->changeStatus(Lcom/amazon/ags/client/KindleFireStatus;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method private sendMessage(Landroid/os/Message;)V
    .locals 3
    .param p1, "message"    # Landroid/os/Message;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 454
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    if-nez v0, :cond_0

    .line 455
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {p1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 459
    :cond_0
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "CLIENT_VERSION"

    const-string v2, "1.0.0"

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 462
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "SESSION_ID"

    iget-object v2, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->sessionId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 463
    iget-object v0, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->asynchronousMessenger:Landroid/os/Messenger;

    if-nez v0, :cond_1

    .line 464
    const-string v0, "KindleFireIPCProxy"

    const-string v1, "Service is not bound"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 468
    :goto_0
    return-void

    .line 466
    :cond_1
    iget-object v0, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->asynchronousMessenger:Landroid/os/Messenger;

    invoke-virtual {v0, p1}, Landroid/os/Messenger;->send(Landroid/os/Message;)V

    goto :goto_0
.end method

.method private transact(ILandroid/os/Parcel;)Landroid/os/Parcel;
    .locals 3
    .param p1, "code"    # I
    .param p2, "data"    # Landroid/os/Parcel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 444
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 445
    .local v0, "reply":Landroid/os/Parcel;
    iget-object v1, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->synchronousBinder:Landroid/os/IBinder;

    if-nez v1, :cond_0

    .line 446
    const-string v1, "KindleFireIPCProxy"

    const-string v2, "transact() was called while disconnected"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 450
    :goto_0
    return-object v0

    .line 448
    :cond_0
    iget-object v1, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->synchronousBinder:Landroid/os/IBinder;

    const/4 v2, 0x0

    invoke-interface {v1, p1, p2, v0, v2}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    goto :goto_0
.end method


# virtual methods
.method public final bindToGameCircleService(Lcom/amazon/ags/client/KindleFireBindingCallback;)V
    .locals 2
    .param p1, "callback"    # Lcom/amazon/ags/client/KindleFireBindingCallback;

    .prologue
    .line 70
    iput-object p1, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->callback:Lcom/amazon/ags/client/KindleFireBindingCallback;

    .line 71
    sget-object v0, Lcom/amazon/ags/client/KindleFireStatus;->INITIALIZING:Lcom/amazon/ags/client/KindleFireStatus;

    iput-object v0, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->status:Lcom/amazon/ags/client/KindleFireStatus;

    .line 73
    invoke-virtual {p0}, Lcom/amazon/ags/client/KindleFireIPCProxy;->isKindle()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 74
    const-string v0, "KindleFireIPCProxy"

    const-string v1, "Device appears to be a Kindle Fire.  Attempting to connect to Amazon Game Services"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    iget-object v0, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->context:Landroid/content/Context;

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/KindleFireIPCProxy;->bindToAsynchronousService(Landroid/content/Context;)V

    .line 76
    iget-object v0, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->context:Landroid/content/Context;

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/KindleFireIPCProxy;->bindToSynchronousService(Landroid/content/Context;)V

    .line 81
    :goto_0
    return-void

    .line 78
    :cond_0
    const-string v0, "KindleFireIPCProxy"

    const-string v1, "Device does not appear to be a Kindle Fire."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    sget-object v0, Lcom/amazon/ags/client/KindleFireStatus;->UNIVERSAL_NOT_SUPPORTED:Lcom/amazon/ags/client/KindleFireStatus;

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/KindleFireIPCProxy;->changeStatus(Lcom/amazon/ags/client/KindleFireStatus;)V

    goto :goto_0
.end method

.method public final getStatus()Lcom/amazon/ags/client/KindleFireStatus;
    .locals 1

    .prologue
    .line 99
    iget-object v0, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->status:Lcom/amazon/ags/client/KindleFireStatus;

    return-object v0
.end method

.method public declared-synchronized isKindle()Z
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 84
    monitor-enter p0

    :try_start_0
    iget-object v3, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->isKindle:Ljava/lang/Boolean;

    if-nez v3, :cond_1

    .line 85
    invoke-direct {p0}, Lcom/amazon/ags/client/KindleFireIPCProxy;->createBindIntent()Landroid/content/Intent;

    move-result-object v0

    .line 86
    .local v0, "bindIntent":Landroid/content/Intent;
    iget-object v3, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v0, v4}, Landroid/content/pm/PackageManager;->resolveService(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v1

    .line 87
    .local v1, "resolveInfo":Landroid/content/pm/ResolveInfo;
    if-eqz v1, :cond_0

    const/4 v2, 0x1

    :cond_0
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->isKindle:Ljava/lang/Boolean;

    .line 89
    .end local v0    # "bindIntent":Landroid/content/Intent;
    .end local v1    # "resolveInfo":Landroid/content/pm/ResolveInfo;
    :cond_1
    iget-object v2, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->isKindle:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    monitor-exit p0

    return v2

    .line 84
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public isOptedIn()Z
    .locals 7

    .prologue
    const/4 v4, 0x0

    .line 127
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 129
    .local v1, "requestParcel":Landroid/os/Parcel;
    const/16 v5, 0x2a

    :try_start_0
    invoke-direct {p0, v5, v1}, Lcom/amazon/ags/client/KindleFireIPCProxy;->transact(ILandroid/os/Parcel;)Landroid/os/Parcel;

    move-result-object v3

    .line 130
    .local v3, "responseParcel":Landroid/os/Parcel;
    invoke-virtual {v3}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 131
    .local v2, "response":Ljava/lang/String;
    invoke-static {v2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v4

    .line 137
    .end local v2    # "response":Ljava/lang/String;
    .end local v3    # "responseParcel":Landroid/os/Parcel;
    :goto_0
    return v4

    .line 132
    :catch_0
    move-exception v0

    .line 133
    .local v0, "e":Landroid/os/RemoteException;
    const-string v5, "KindleFireIPCProxy"

    const-string v6, "Unable to determine whether Customer is opted in to GameCircle.  Defaulting to false."

    invoke-static {v5, v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 135
    .end local v0    # "e":Landroid/os/RemoteException;
    :catch_1
    move-exception v0

    .line 137
    .local v0, "e":Ljava/lang/Exception;
    goto :goto_0
.end method

.method public isOverlaysSupported()Z
    .locals 9

    .prologue
    const/4 v5, 0x0

    .line 244
    iget-object v6, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->isOverlaysSupported:Ljava/lang/Boolean;

    if-eqz v6, :cond_0

    .line 245
    iget-object v5, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->isOverlaysSupported:Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 262
    :goto_0
    return v1

    .line 248
    :cond_0
    invoke-virtual {p0}, Lcom/amazon/ags/client/KindleFireIPCProxy;->isKindle()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-virtual {p0}, Lcom/amazon/ags/client/KindleFireIPCProxy;->isUniversalSupported()Z

    move-result v6

    if-nez v6, :cond_2

    :cond_1
    move v1, v5

    .line 249
    goto :goto_0

    .line 252
    :cond_2
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v2

    .line 254
    .local v2, "requestParcel":Landroid/os/Parcel;
    const/16 v6, 0x2f

    :try_start_0
    invoke-direct {p0, v6, v2}, Lcom/amazon/ags/client/KindleFireIPCProxy;->transact(ILandroid/os/Parcel;)Landroid/os/Parcel;

    move-result-object v4

    .line 255
    .local v4, "responseParcel":Landroid/os/Parcel;
    invoke-virtual {v4}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v3

    .line 256
    .local v3, "response":Ljava/lang/String;
    invoke-static {v3}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v1

    .line 257
    .local v1, "isOverlaysSupported":Z
    const-string v6, "KindleFireIPCProxy"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Checking isOverlaysSupported: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 259
    .end local v1    # "isOverlaysSupported":Z
    .end local v3    # "response":Ljava/lang/String;
    .end local v4    # "responseParcel":Landroid/os/Parcel;
    :catch_0
    move-exception v0

    .line 261
    .local v0, "e":Ljava/lang/Exception;
    const-string v6, "KindleFireIPCProxy"

    const-string v7, "Unable to determine whether overlays are supported.  Defaulting to false."

    invoke-static {v6, v7, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move v1, v5

    .line 262
    goto :goto_0
.end method

.method public final isReady()Z
    .locals 2

    .prologue
    .line 94
    iget-object v0, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->status:Lcom/amazon/ags/client/KindleFireStatus;

    sget-object v1, Lcom/amazon/ags/client/KindleFireStatus;->SERVICE_CONNECTED:Lcom/amazon/ags/client/KindleFireStatus;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isRegistered()Z
    .locals 8

    .prologue
    const/4 v5, 0x0

    .line 172
    invoke-direct {p0}, Lcom/amazon/ags/client/KindleFireIPCProxy;->isBound()Z

    move-result v6

    if-nez v6, :cond_1

    .line 186
    :cond_0
    :goto_0
    return v5

    .line 175
    :cond_1
    const-string v6, "KindleFireIPCProxy"

    const-string v7, "Attempting to check is authenticated"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 177
    :try_start_0
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v4

    .line 178
    .local v4, "request":Landroid/os/Parcel;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 179
    .local v0, "bundle":Landroid/os/Bundle;
    invoke-virtual {v4, v0}, Landroid/os/Parcel;->writeBundle(Landroid/os/Bundle;)V

    .line 180
    const/4 v6, 0x3

    invoke-direct {p0, v6, v4}, Lcom/amazon/ags/client/KindleFireIPCProxy;->transact(ILandroid/os/Parcel;)Landroid/os/Parcel;

    move-result-object v2

    .line 181
    .local v2, "reply":Landroid/os/Parcel;
    invoke-virtual {v2}, Landroid/os/Parcel;->readInt()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 182
    .local v3, "replyCode":I
    const/4 v6, 0x5

    if-ne v3, v6, :cond_0

    const/4 v5, 0x1

    goto :goto_0

    .line 183
    .end local v0    # "bundle":Landroid/os/Bundle;
    .end local v2    # "reply":Landroid/os/Parcel;
    .end local v3    # "replyCode":I
    .end local v4    # "request":Landroid/os/Parcel;
    :catch_0
    move-exception v1

    .line 185
    .local v1, "e":Ljava/lang/Exception;
    const-string v6, "KindleFireIPCProxy"

    const-string v7, "Unable to determine whether device is registered. Defaulting to false."

    invoke-static {v6, v7, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public declared-synchronized isUniversalSupported()Z
    .locals 6

    .prologue
    .line 104
    monitor-enter p0

    :try_start_0
    iget-object v4, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->isUniversalSupported:Ljava/lang/Boolean;

    if-eqz v4, :cond_0

    .line 105
    iget-object v4, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->isUniversalSupported:Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v4

    .line 122
    :goto_0
    monitor-exit p0

    return v4

    .line 107
    :cond_0
    :try_start_1
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v1

    .line 109
    .local v1, "requestParcel":Landroid/os/Parcel;
    const/16 v4, 0x28

    :try_start_2
    invoke-direct {p0, v4, v1}, Lcom/amazon/ags/client/KindleFireIPCProxy;->transact(ILandroid/os/Parcel;)Landroid/os/Parcel;

    move-result-object v3

    .line 110
    .local v3, "responseParcel":Landroid/os/Parcel;
    invoke-virtual {v3}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 111
    .local v2, "response":Ljava/lang/String;
    invoke-static {v2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    iput-object v4, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->isUniversalSupported:Ljava/lang/Boolean;

    .line 112
    iget-object v4, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->isUniversalSupported:Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 113
    const-string v4, "KindleFireIPCProxy"

    const-string v5, "Device has compatible version of Amazon Game Services."

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 122
    .end local v2    # "response":Ljava/lang/String;
    .end local v3    # "responseParcel":Landroid/os/Parcel;
    :goto_1
    :try_start_3
    iget-object v4, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->isUniversalSupported:Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result v4

    goto :goto_0

    .line 115
    .restart local v2    # "response":Ljava/lang/String;
    .restart local v3    # "responseParcel":Landroid/os/Parcel;
    :cond_1
    :try_start_4
    const-string v4, "KindleFireIPCProxy"

    const-string v5, "Device has an outdated version of Amazon Game Services.  Player will be in Guest mode"

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    .line 117
    .end local v2    # "response":Ljava/lang/String;
    .end local v3    # "responseParcel":Landroid/os/Parcel;
    :catch_0
    move-exception v0

    .line 119
    .local v0, "e":Ljava/lang/Exception;
    :try_start_5
    const-string v4, "KindleFireIPCProxy"

    const-string v5, "Device has non-compatible version of Amazon Game Services.  Player will be in Guest mode"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    iput-object v4, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->isUniversalSupported:Ljava/lang/Boolean;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1

    .line 104
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "requestParcel":Landroid/os/Parcel;
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public isWhispersyncEnabled()Z
    .locals 8

    .prologue
    .line 156
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v2

    .line 158
    .local v2, "requestParcel":Landroid/os/Parcel;
    const/16 v5, 0x2b

    :try_start_0
    invoke-direct {p0, v5, v2}, Lcom/amazon/ags/client/KindleFireIPCProxy;->transact(ILandroid/os/Parcel;)Landroid/os/Parcel;

    move-result-object v4

    .line 159
    .local v4, "responseParcel":Landroid/os/Parcel;
    invoke-virtual {v4}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v3

    .line 160
    .local v3, "response":Ljava/lang/String;
    invoke-static {v3}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v1

    .line 161
    .local v1, "isWhispersyncEnabled":Z
    const-string v5, "KindleFireIPCProxy"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Checking isWhispersyncEnabled: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 166
    .end local v1    # "isWhispersyncEnabled":Z
    .end local v3    # "response":Ljava/lang/String;
    .end local v4    # "responseParcel":Landroid/os/Parcel;
    :goto_0
    return v1

    .line 163
    :catch_0
    move-exception v0

    .line 165
    .local v0, "e":Ljava/lang/Exception;
    const-string v5, "KindleFireIPCProxy"

    const-string v6, "Unable to determine whether Whispersync is enabled.  Defaulting to false."

    invoke-static {v5, v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 166
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public setOptIn(Z)V
    .locals 5
    .param p1, "optIn"    # Z

    .prologue
    .line 143
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v2

    .line 144
    .local v2, "requestParcel":Landroid/os/Parcel;
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 145
    .local v1, "requestBundle":Landroid/os/Bundle;
    const-string v3, "optIn"

    invoke-virtual {v1, v3, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 146
    invoke-virtual {v2, v1}, Landroid/os/Parcel;->writeBundle(Landroid/os/Bundle;)V

    .line 148
    const/16 v3, 0x29

    :try_start_0
    invoke-direct {p0, v3, v2}, Lcom/amazon/ags/client/KindleFireIPCProxy;->transact(ILandroid/os/Parcel;)Landroid/os/Parcel;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 152
    :goto_0
    return-void

    .line 149
    :catch_0
    move-exception v0

    .line 150
    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "KindleFireIPCProxy"

    const-string v4, "Unable to update OptIn status."

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public showOverlay(Ljava/lang/String;)V
    .locals 7
    .param p1, "overlayData"    # Ljava/lang/String;

    .prologue
    .line 220
    invoke-virtual {p0}, Lcom/amazon/ags/client/KindleFireIPCProxy;->isOverlaysSupported()Z

    move-result v5

    if-nez v5, :cond_0

    .line 221
    new-instance v5, Ljava/lang/UnsupportedOperationException;

    const-string v6, "Proxying overlay requests is not supported on this device and software version."

    invoke-direct {v5, v6}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 225
    :cond_0
    invoke-static {p1}, Lcom/amazon/ags/html5/util/JSONUtils;->sanitize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 227
    .local v4, "sanitizedOverlayData":Ljava/lang/String;
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 228
    .local v3, "overlayDataJson":Lorg/json/JSONObject;
    const-string v5, "OVERLAY_ACTION_CODE"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    .line 230
    .local v2, "overlayActionCode":I
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v1

    .line 231
    .local v1, "msg":Landroid/os/Message;
    const/16 v5, 0x30

    iput v5, v1, Landroid/os/Message;->what:I

    .line 232
    new-instance v5, Landroid/os/Bundle;

    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {v1, v5}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 233
    invoke-virtual {v1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v5

    const-string v6, "OVERLAY_ACTION_CODE"

    invoke-virtual {v5, v6, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 234
    invoke-direct {p0, v1}, Lcom/amazon/ags/client/KindleFireIPCProxy;->sendMessage(Landroid/os/Message;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1

    .line 240
    .end local v1    # "msg":Landroid/os/Message;
    .end local v2    # "overlayActionCode":I
    .end local v3    # "overlayDataJson":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 235
    :catch_0
    move-exception v0

    .line 236
    .local v0, "e":Lorg/json/JSONException;
    const-string v5, "KindleFireIPCProxy"

    const-string v6, "Error occurred while retrieve the overlay action code from the overlay data"

    invoke-static {v5, v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 237
    .end local v0    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v0

    .line 238
    .local v0, "e":Landroid/os/RemoteException;
    const-string v5, "KindleFireIPCProxy"

    const-string v6, "There was an error sending the show overlay message to the APK"

    invoke-static {v5, v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public signMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/Map;
    .locals 11
    .param p1, "verb"    # Ljava/lang/String;
    .param p2, "uri"    # Ljava/lang/String;
    .param p3, "body"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 192
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v3

    .line 193
    .local v3, "requestParcel":Landroid/os/Parcel;
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 194
    .local v2, "requestBundle":Landroid/os/Bundle;
    const-string v9, "verb"

    invoke-virtual {v2, v9, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 195
    const-string v9, "uri"

    invoke-virtual {v2, v9, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 196
    const-string v9, "body"

    invoke-virtual {v2, v9, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 197
    const-string v9, "SESSION_ID"

    iget-object v10, p0, Lcom/amazon/ags/client/KindleFireIPCProxy;->sessionId:Ljava/lang/String;

    invoke-virtual {v2, v9, v10}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 198
    invoke-virtual {v3, v2}, Landroid/os/Parcel;->writeBundle(Landroid/os/Bundle;)V

    .line 199
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 201
    .local v5, "responseMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/16 v9, 0x2d

    :try_start_0
    invoke-direct {p0, v9, v3}, Lcom/amazon/ags/client/KindleFireIPCProxy;->transact(ILandroid/os/Parcel;)Landroid/os/Parcel;

    move-result-object v6

    .line 202
    .local v6, "responseParcel":Landroid/os/Parcel;
    invoke-virtual {v6}, Landroid/os/Parcel;->readBundle()Landroid/os/Bundle;

    move-result-object v4

    .line 203
    .local v4, "responseBundle":Landroid/os/Bundle;
    const-string v9, "signature"

    invoke-virtual {v4, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 204
    .local v7, "signature":Ljava/lang/String;
    const-string v9, "nonce"

    invoke-virtual {v4, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 205
    .local v1, "nonce":Ljava/lang/String;
    const-string v9, "token"

    invoke-virtual {v4, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 206
    .local v8, "token":Ljava/lang/String;
    const-string v9, "signature"

    invoke-interface {v5, v9, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 207
    const-string v9, "nonce"

    invoke-interface {v5, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    const-string v9, "token"

    invoke-interface {v5, v9, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 214
    .end local v1    # "nonce":Ljava/lang/String;
    .end local v4    # "responseBundle":Landroid/os/Bundle;
    .end local v5    # "responseMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v6    # "responseParcel":Landroid/os/Parcel;
    .end local v7    # "signature":Ljava/lang/String;
    .end local v8    # "token":Ljava/lang/String;
    :goto_0
    return-object v5

    .line 210
    .restart local v5    # "responseMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_0
    move-exception v0

    .line 212
    .local v0, "e":Ljava/lang/Exception;
    const/4 v5, 0x0

    goto :goto_0
.end method
