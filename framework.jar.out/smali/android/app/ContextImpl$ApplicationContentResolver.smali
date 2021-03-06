.class final Landroid/app/ContextImpl$ApplicationContentResolver;
.super Landroid/content/ContentResolver;
.source "ContextImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/app/ContextImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ApplicationContentResolver"
.end annotation


# instance fields
.field private final mMainThread:Landroid/app/ActivityThread;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/app/ActivityThread;)V
    .locals 0
    .parameter "context"
    .parameter "mainThread"

    .prologue
    .line 1631
    invoke-direct {p0, p1}, Landroid/content/ContentResolver;-><init>(Landroid/content/Context;)V

    .line 1632
    iput-object p2, p0, Landroid/app/ContextImpl$ApplicationContentResolver;->mMainThread:Landroid/app/ActivityThread;

    .line 1633
    return-void
.end method


# virtual methods
.method protected acquireExistingProvider(Landroid/content/Context;Ljava/lang/String;)Landroid/content/IContentProvider;
    .locals 1
    .parameter "context"
    .parameter "name"

    .prologue
    .line 1642
    iget-object v0, p0, Landroid/app/ContextImpl$ApplicationContentResolver;->mMainThread:Landroid/app/ActivityThread;

    invoke-virtual {v0, p1, p2}, Landroid/app/ActivityThread;->acquireExistingProvider(Landroid/content/Context;Ljava/lang/String;)Landroid/content/IContentProvider;

    move-result-object v0

    return-object v0
.end method

.method protected acquireProvider(Landroid/content/Context;Ljava/lang/String;)Landroid/content/IContentProvider;
    .locals 1
    .parameter "context"
    .parameter "name"

    .prologue
    invoke-direct {p0, p2, p1}, Landroid/app/ContextImpl$ApplicationContentResolver;->setProviderNameDP(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object p2

    iget-object v0, p0, Landroid/app/ContextImpl$ApplicationContentResolver;->mMainThread:Landroid/app/ActivityThread;

    invoke-virtual {v0, p1, p2}, Landroid/app/ActivityThread;->acquireProvider(Landroid/content/Context;Ljava/lang/String;)Landroid/content/IContentProvider;

    move-result-object v0

    return-object v0
.end method

.method public releaseProvider(Landroid/content/IContentProvider;)Z
    .locals 1
    .parameter "provider"

    .prologue
    .line 1637
    .line 1647
    iget-object v0, p0, Landroid/app/ContextImpl$ApplicationContentResolver;->mMainThread:Landroid/app/ActivityThread;

    invoke-virtual {v0, p1}, Landroid/app/ActivityThread;->releaseProvider(Landroid/content/IContentProvider;)Z

    move-result v0

    return v0
.end method

.method private setProviderNameDP(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;
    .locals 4
    .parameter "orgName"
    .parameter "context"

    .prologue
    move-object v1, p1

    .local v1, name:Ljava/lang/String;
    invoke-static {p2}, Lcom/baidu/server/dp/DynamicPermissionManager;->getInstance(Landroid/content/Context;)Lcom/baidu/server/dp/DynamicPermissionManager;

    move-result-object v0

    .local v0, dpm:Lcom/baidu/server/dp/DynamicPermissionManager;
    invoke-virtual {v0, v1}, Lcom/baidu/server/dp/DynamicPermissionManager;->checkProviderPermissionSync(Ljava/lang/String;)I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    const-string v1, "com.baidu.dp.impostor"

    :cond_0
    return-object v1
.end method
