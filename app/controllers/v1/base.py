from fastapi import APIRouter, Depends


def new_router(dependencies=None):
    router = APIRouter()
    router.tags = ["V1"]
    router.prefix = "/api/v1"
    # 將認證依賴項應用於所有路由
    if dependencies:
        router.dependencies = dependencies
    return router
