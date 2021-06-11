using UnityEngine.Rendering.Universal;

public class LowResRenderFeature : ScriptableRendererFeature
{
    private LowResPass lowResPass;

    public override void Create()
    {
        lowResPass = new LowResPass(RenderPassEvent.BeforeRenderingPostProcessing);
    }

    public override void AddRenderPasses(ScriptableRenderer renderer, ref RenderingData renderingData)
    {
        lowResPass.Setup(renderer.cameraColorTarget);
        renderer.EnqueuePass(lowResPass);
    }
}