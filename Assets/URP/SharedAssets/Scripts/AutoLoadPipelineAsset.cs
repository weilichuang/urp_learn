using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;

/// <summary>
/// ExecuteAlways 使脚本的实例始终执行，作为Play Mode的一部分和Editing
/// 默认情况下，MonoBehaviours仅在Play Mode下执行。
/// 方便测试项目同时有多个UniversalRenderPipelineAsset而不需要手动切换
/// </summary>
[ExecuteAlways]
public class AutoLoadPipelineAsset : MonoBehaviour
{
    [SerializeField] private UniversalRenderPipelineAsset m_PipelineAsset;
    private RenderPipelineAsset m_PreviousPipelineAsset;

    void OnEnable()
    {
        if (m_PipelineAsset && GraphicsSettings.renderPipelineAsset != m_PipelineAsset)
        {
            m_PreviousPipelineAsset = GraphicsSettings.renderPipelineAsset;
            GraphicsSettings.renderPipelineAsset = m_PipelineAsset;
        }
    }

    void OnDisable()
    {
        if (m_PreviousPipelineAsset)
        {
            GraphicsSettings.renderPipelineAsset = m_PreviousPipelineAsset;
        }
    }
}